# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Contributor: Luna Jernberg <droidbittin@gmail.com>
# Contributor: Jonathon Fernyhough <jonathon+m2x+dev>
# Contributor: Figue <ffigue@gmail.com>
# Contributor: Dct Mei <dctxmei@yandex.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgbase=firefox-esr
pkgname=(firefox-esr)
pkgver=128.8.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org, Extended Support Release"
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://www.mozilla.org/en-US/firefox/enterprise/"
depends=(
  alsa-lib
  at-spi2-core
  bash
  cairo
  dbus
  ffmpeg
  fontconfig
  freetype2
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libpulse
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxrandr
  libxss
  libxt
  mime-types
  nspr
  nss
  pango
  ttf-font
)
makedepends=(
  cbindgen
  clang
  diffutils
  dump_syms
  imake
  inetutils
  jack
  lld
  llvm
  mesa
  nasm
  nodejs
  python
  rust
  unzip
  wasi-compiler-rt
  wasi-libc
  wasi-libc++
  wasi-libc++abi
  xorg-server-xvfb
  yasm
  zip
)
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)
options=(
  !debug
  !emptydirs
  !lto
  !makeflags
  !strip
)
source=(
  https://archive.mozilla.org/pub/firefox/releases/${pkgver}esr/source/firefox-${pkgver}esr.source.tar.xz{,.asc}
  $pkgname.desktop identity-icons-brand.svg
)
validpgpkeys=(
  # Mozilla Software Releases <release@mozilla.com>
  # https://blog.mozilla.org/security/2023/05/11/updated-gpg-key-for-signing-firefox-releases/
  14F26682D0916CDD81E37B6D61B7B526D98F0353
)

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM

prepare() {
  mkdir -p mozbuild
  cd firefox-$pkgver

  echo "${noextract[@]}"

  echo -n "$_google_api_key" >google-api-key

  cat >../mozconfig <<END
ac_add_options --enable-application=browser
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-linker=lld
ac_add_options --disable-elf-hack
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# Branding
ac_add_options --enable-official-branding
ac_add_options --enable-update-channel=release
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
ac_add_options --with-app-name=$pkgname
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=$pkgname
export MOZ_APP_PROFILE="mozilla/firefox-esr"

# Keys
ac_add_options --with-google-location-service-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-google-safebrowsing-api-keyfile=${PWD@Q}/google-api-key

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

# Features
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --enable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-tests
END
}

build() {
  cd firefox-$pkgver

  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
  export MOZ_NOSPAM=1

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  # Breaks compilation since https://bugzilla.mozilla.org/show_bug.cgi?id=1896066
  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  # LTO needs more open files
  ulimit -n 4096

  # Do 3-tier PGO
  echo "Building instrumented browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END
  ./mach build --priority normal

  echo "Profiling instrumented browser..."
  ./mach package
  LLVM_PROFDATA=llvm-profdata \
    JARLOG_FILE="$PWD/jarlog" \
    xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" \
    ./mach python build/pgo/profileserver.py

  stat -c "Profile data found (%s bytes)" merged.profdata
  test -s merged.profdata

  stat -c "Jar log found (%s bytes)" jarlog
  test -s jarlog

  echo "Removing instrumented browser..."
  ./mach clobber objdir

  echo "Building optimized browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
  ./mach build --priority normal

  echo "Building symbol archive..."
  ./mach buildsymbols
}

package_firefox-esr() {
  cd firefox-$pkgver
  DESTDIR="$pkgdir" ./mach install

  local vendorjs="$pkgdir/usr/lib/$pkgname/browser/defaults/preferences/vendor.js"
  install -Dvm644 /dev/stdin "$vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);
END

  local distini="$pkgdir/usr/lib/$pkgname/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$distini" <<END
[Global]
id=archlinux
version=1.0
about=Mozilla Firefox ESR for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$pkgname
app.partner.archlinux=archlinux
END

  local i theme=official
  for i in 16 22 24 32 48 64 128 256; do
    install -Dvm644 browser/branding/$theme/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done
  install -Dvm644 browser/branding/$theme/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$pkgname.png"
  install -Dvm644 browser/branding/$theme/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/$pkgname.png"
  install -Dvm644 browser/branding/$theme/content/about-logo.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dvm644 ../identity-icons-brand.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$pkgname-symbolic.svg"

  install -Dvm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/sh
exec /usr/lib/$pkgname/firefox-esr "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/lib/$pkgname/firefox-bin"

  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$pkgname/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi
}

_package_i18n() {
  pkgdesc="$2 language pack for Firefox ESR"
  depends=("firefox-esr>=$pkgver")
  install -Dm644 firefox-esr-i18n-$pkgver-$1.xpi \
    "$pkgdir/usr/lib/firefox-esr/extensions/langpack-$1@firefox.mozilla.org.xpi"
}

_languages=(
  'ach    "Acholi"'
  'af     "Afrikaans"'
  'an     "Aragonese"'
  'ar     "Arabic"'
  'ast    "Asturian"'
  'az     "Azerbaijani"'
  'be     "Belarusian"'
  'bg     "Bulgarian"'
  'bn     "Bengali"'
  'br     "Breton"'
  'bs     "Bosnian"'
  'ca-valencia "Catalan (Valencian)"'
  'ca     "Catalan"'
  'cak    "Maya Kaqchikel"'
  'cs     "Czech"'
  'cy     "Welsh"'
  'da     "Danish"'
  'de     "German"'
  'dsb    "Lower Sorbian"'
  'el     "Greek"'
  'en-CA  "English (Canadian)"'
  'en-GB  "English (British)"'
  'en-US  "English (US)"'
  'eo     "Esperanto"'
  'es-AR  "Spanish (Argentina)"'
  'es-CL  "Spanish (Chile)"'
  'es-ES  "Spanish (Spain)"'
  'es-MX  "Spanish (Mexico)"'
  'et     "Estonian"'
  'eu     "Basque"'
  'fa     "Persian"'
  'ff     "Fulah"'
  'fi     "Finnish"'
  'fr     "French"'
  'fy-NL  "Frisian"'
  'ga-IE  "Irish"'
  'gd     "Gaelic (Scotland)"'
  'gl     "Galician"'
  'gn     "Guarani"'
  'gu-IN  "Gujarati (India)"'
  'he     "Hebrew"'
  'hi-IN  "Hindi (India)"'
  'hr     "Croatian"'
  'hsb    "Upper Sorbian"'
  'hu     "Hungarian"'
  'hy-AM  "Armenian"'
  'ia     "Interlingua"'
  'id     "Indonesian"'
  'is     "Icelandic"'
  'it     "Italian"'
  'ja     "Japanese"'
  'ka     "Georgian"'
  'kab    "Kabyle"'
  'kk     "Kazakh"'
  'km     "Khmer"'
  'kn     "Kannada"'
  'ko     "Korean"'
  'lij    "Ligurian"'
  'lt     "Lithuanian"'
  'lv     "Latvian"'
  'mk     "Macedonian"'
  'mr     "Marathi"'
  'ms     "Malay"'
  'my     "Burmese"'
  'nb-NO  "Norwegian (Bokmål)"'
  'ne-NP  "Nepali"'
  'nl     "Dutch"'
  'nn-NO  "Norwegian (Nynorsk)"'
  'oc     "Occitan"'
  'pa-IN  "Punjabi (India)"'
  'pl     "Polish"'
  'pt-BR  "Portuguese (Brazilian)"'
  'pt-PT  "Portuguese (Portugal)"'
  'rm     "Romansh"'
  'ro     "Romanian"'
  'ru     "Russian"'
  'si     "Sinhala"'
  'sk     "Slovak"'
  'sl     "Slovenian"'
  'son    "Songhai"'
  'sq     "Albanian"'
  'sr     "Serbian"'
  'sv-SE  "Swedish"'
  'ta     "Tamil"'
  'te     "Telugu"'
  'th     "Thai"'
  'tl     "Tagalog"'
  'tr     "Turkish"'
  'trs    "Chicahuaxtla Triqui"'
  'uk     "Ukrainian"'
  'ur     "Urdu"'
  'uz     "Uzbek"'
  'vi     "Vietnamese"'
  'xh     "Xhosa"'
  'zh-CN  "Chinese (Simplified)"'
  'zh-TW  "Chinese (Traditional)"'
)
_url=https://archive.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}esr/linux-x86_64/xpi

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=firefox-esr-i18n-${_locale,,}

  pkgname+=($_pkgname)
  source+=("firefox-esr-i18n-$pkgver-$_locale.xpi::$_url/$_locale.xpi")
  eval "package_$_pkgname() {
    _package_i18n $_lang
  }"
done

# Don't extract languages
noextract=()
for _src in "${source[@]%%::*}"; do
    case "$_src" in
      *.xpi) noextract+=("$_src") ;;
    esac
done

sha512sums=('7c0ef22bc14d4fa248cbae14d629174c9c967f891f4525f609760595f5a108aedf7dd804d1b63b97ec268613fa98378f4742a9b6ab562454351cf21175fdb802'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '9c83a7af02edaa4d44ca6db318fa537a722486994954f4342fdcd0ccf16643643f9664edd162bc537a2fc8becff6c11d858a20c61300f5a84cb7651b9b6eb591'
            '0a2e9b81e66044089c4f0c9220ccf83fe0275314e53a625064add25217c2e25df1ba87c81ab6538c3c00bf480d398b576cea7c49c40a144d5b2a5e423282c38a'
            'c8d4a18e722554880c45cdd148326683197dedced079c2fc62e4607199dd445431ba6f8a1029bc41eea81e1d48926d813b13500318086f92502e6b3d7b44a02a'
            '9bf5fbf3a7a66abb8ce40563c6f6fe1e05b549a7dc10800743593d765e4964cda5b0b246ae8519c82971f4a503c0a108291d2255c02604b862f083514c807667'
            '728d7106dbeca8c708d61ba462c0943562d4ec040391b2c0e84eae80a627333a763d3942ca57aee063b13e8227286d003ad2ed8075f80d01a66bba024a3590d8'
            '8818e48fdf38b29cad492efb2234616bf812dec832370c1ec500814a58a0ccb6130af8318aeb6e62de5a8d54f66b1dec07017e1ef669493542e94a082cb5ade6'
            '59b451e36dbfa3032357122699c8780182177489ffd0e507ae33a62dc9b18d9cb096f217f0dfc6e42eda64b82aafd3b468ad13e4b1779d87eb23b3881908339f'
            'bd939c3803399ec905921409530e913b032b59994aa48bfe3671220ca4fd7e54f643e603a77dccd0de8c38e6e94736944777940bf8776df9a00498b88649601f'
            '102e797510c3656f538982ceec66c66da657712be891bac3fcfae2d1f291965f5f4e8b8bb093cbccc3166a2565df616482274b3295cdcf253de482110f8d7d2c'
            '57a35d172c314e0bc2a502d76955db9ea97295a286658eefab7ca2c53cbdb1124b4b56b024779c5f6872403b6477b1e057848c2f0906d4bc3da9dfdc05de4a55'
            'c84f3530247bafc85e57048cbcf4117b95e5352a6ec291726a1f0cabe0bf45cd0eee36e0f83446202e952af342629f18b36186840987859c9e533b6181c8dfb6'
            '1060baba510d2a4ab267fa9b8289c398aa861693f5a2311876fda670496d3a7223a30e3a072850860489df6645e431f2c05e59c55d5886b860c1653ed5bc4b21'
            'f39a1744078d8200224cf93e27a453a6deeb1b4f1faa771bfcf5254f72d83d5031f4d8e0c10f487eeda5f8dbc43e829220debdaed4eb7099994474987ae26c59'
            'b4fcc7e08bd1b0558183dad02b40bb940f51ae81ba6ebe1a0d34ccacbe0932ae3c956ab14946ae90c3fc93bf6ad548f0a5b8400f62b5a7878036a5b4d11f4bc7'
            'bd0c2435cee1ec028156caf3e4db8e36b7e5ba4f8ef7b66593e8b41af4d026c248a54fe53c18f458e394402294fb90bb65878dc2bb4c69c417f71f3bcda8c4a6'
            '1e43f9e37f408aab76220d706176148c71a90dc5b0fc43efd4a7ede57bcccb35468abbc04a0d4c84ec03a1cbcb2e3e0b1e0c9890393e2577581f4b28d39e7cf9'
            '7182ebf9af62683479d2550068a30246907978816012a8296fda0054722c7772bd3c574834f975a35efb74284a20fbc5fb43728de4725755725b8611fb999630'
            '5f570e799dead4fe447dd98e5cb923a8f779af475ba6ca78e5d3a08ba9e76c3a0a25f2b8eca9ae8bd0909800fa46a60a829ae5d4f551ec21a0caba9bdfbd6b4f'
            '4a32a6fdaa72fea630e8df45803ff9ba2789d9b8765263b867c4233d4d0f4073c9bfa7a4850486d101b31bfb245fd8cfbbc2b5bf56a3fe7b893644f350b96181'
            'e4d7295abecdf1a82d81c0b00d42b8f34d12faaf69dbce6988349e44e6b55a1a62129b076c5bdbea1cd40f049b7ffb9425e4773bea3b735884ba47870c0f96a8'
            '4cc102144f8db85b10ccf15e6a41eb5e2f6132713a7c735b5a3844ca791f8562ac6fbdf112088c0a4395c68654b86c8d639cc2987a77f4c2c1f67c8e1482c8af'
            '5807c1847cb912edb5114f097faa600e6b49c2c88f98e0a03c51d3f4927e5794d43a8c3a3633101db86d0287a56fd43aa9ac2d2e516d5dc97ff47c00f223cfe5'
            'a4bf4c2138590d7a4c42ac02a96a285d4837e6333cf071f1986866646be159f599ca4e85b3456bee46dedc84e269b22c3675477c2fd96cc4e710362f10ee32df'
            '57526199a573c5a90850241c6e2341dce4626233105682777044d564dd520d22872555f68ff02467070324323f41a22dbe541d04d5cc036bb2765fa3016307bc'
            'c7ea88316bd386180e21005dbfdaeffea03fc4db9853005a27156ca0de56e8c0b35517a73e8ec2c16e453087c787873c3da9983c8a175c44f915250da66a2d6f'
            'c66df43545891cce1355f4f3c6c9e306ab097cf29a7411bae13fc6ae9a0a1aef63449793b04b503cd3f556cf8abfddd5671decdc0e1e6f748b926ea297b0fc14'
            'b0a5221e9084a7443c692560a31224fc3213f98708719b47cea5022799700739330f3dae4e0ea9f236440d8cd9fecf537ebe13b5f46319df00998ed7b408acad'
            '5d6169d6185022a7da95ef65e8896876248f62c22e683fd5f62176ebacd7e183e7cdd82ba6acb2adb0925d7e513560e096df8945a6fcb170bdb6766c2b34389e'
            '8f52250009a57668f4d7bc289049606cae31d982b6430ac5471c5434feb49aba178291b0e7358ad577234c25d4e6b014572db9574c00eab96edf3311f00ee5a7'
            '27fb92551a83cd76b9b62d7a3fab4821cfa3f5d9646056352ec5c13d117b54275b719486ce9462167e25342cb98a8554aec44493cb0ee6ca0ced3ded412a88ff'
            '2422860ff2c1c1fe68b4be3c7269543b47ff3dca98faaae938bc71b06a164a1a4e60db3e8a71d14c35cd35cd8ec7c04ee63ff0d963826d19faa5e9f9358a52d6'
            '101fa01455b50a587295cd89cbb57981deb5bfe4ba310c36f79b58fdc09cd7e807aa87408dc44847288acf569215a12a526f71e8d44c4b8297c20742e2cca502'
            '8a1f4237017e53dd668ed34058c23efd9760c0150b1e0e77963aca059857e6dc2271c3fa6860767836d0a253f41c172593eb05f2589d0334d6697366616021e9'
            '43481978ad664f64c94f7b8025db5f6774a3a17cbb85b7bc151d76b524e1192961ed4f31dc2114b622ab34ecf8ef10fc5dfdda8cdd3f545550af34c9c14c0ab3'
            '0ceacfe870f4113998c8e8c33c892c138cc00ed5e922ba6aab934dedfb922c5ba073df062d30620b59cda51f1b139ff6a8a56eb3d3aa365d58221e3101b1cef1'
            'a1a6bf808b656ee8dc729395e9e4aef29511aca584c070166434e143dcd4e1c108e5835af3ff4723e3dea30b594ab03da75b12625ea1e70a159fc51a21b2e5c3'
            'c4ffbdf2545de35b1d0a5f44361b94c0b7e0adfbf7ce294deda9919c70d564a4dcf0fb2a3d764f834956c294b9a4fb579a938b854e8fc27b7c7097e6afb9264f'
            '8d88e3d6fce2aac35f912b019a9cb01fc4119d133fafe66e4568b07255fad70d2814a87d270acd87bf0dd180edd8f9efe1168e0c9d16bf5f97392c5f834657e9'
            'c9ba870f76098917af4f03128087f9bd00dd0437305cc86f4c98e90904fb5277c05cafa173c6351b2f7f6bea4c5e33224dcb9bf27275b111922df51fbe0be339'
            'e3c068a288007f715703f10608a5d7f9f0d3da8d7f932363bcebf9314adb9427ef53d607d6f1cc9709d95b8320a87f19d2903e68bc6dc6d4f0267135e782bf21'
            'af5e8b778cc8416f4de163131226526905b2ad22ec4aeaeeb0bf002ed8bdf0d5436592f09d1fe8d1e1ee9ad231eddcc673ea9c41efd649b2c229808c86971383'
            '84fe919f6bef1173e19686eb823f84a404589f1e106f6e8ab3c3f079fd6e15a8eeef225146c57b902859666636a1d6182bf68f56b17781074b72e3b9d8d5ecdc'
            '2ef9409b8769f024cc93c0f241916c36e7c198ad02538e5569bdc03b7379de917195af89150737b953e583e0c9b67a040b158976c2666271c99fbfc49206ae2c'
            'f1709d85ea173b830dca4add22d44cd9b025a1afc2bb356b2bcb1e9afd3dd47185b66d4b3029291bc3ed3bcf9c4ca6f28567b597b23387db80b3b22038ece3be'
            '0e34ac6de2e24fd2a14740531109dd1901ebcba43dae2ac868e0feaa0d65138cbf49d488f0124a0ada71a7943135315d8bf49da12357345f29c1099ae2f2262c'
            '37a82f50a35b5c85ee71c956756a27af02864057ffb47491fe9abac6d0a3e7fb2dacd6dd11150a9a708109be2f1d034b790bb236257b62abf6957e4bd070c046'
            'c7a6d448d4ac34871a0ab99437511c98addee77e740f45b17b93cc49f188695425b6324ead7d1c2b6194ed910f87dc541ba7087e8368e3dead6a0d79ff3e8ac1'
            '46ec285a073f357d002290a1eb6c478c4447801bceb0e32dc6d7c16b5ba22831d4f579be35fad48866c26e0e0b45ae8193a1c90d05f37ede597dc37f5c13b513'
            '92d177faeb6230e5f1250f50bc4dadfca30ce99dbe04b5f7d90b0475cbba1055744c36783ead11c577ee950421b6890c511b517e1fc5f83748dbca57d9e41e84'
            '3e9df23dae68fb8a58ec1c42c6f9969702c8b1994367132e0d6b9a8bde2700a694811ba10b3a6dc8de7c4fdc4555e3b4e9f48f16599f63c5f5bfb492f1c20c85'
            'c06e28375b99a726866432366a0811af8d6d3cd7b46f138583ba9b25c4d3e24bc08b1e2c2c1a4d72031fcea2491753ae3cd1441431be9b6c47a0544a4f537822'
            '336396859d20838c765eda6132823b1259338ff34944047500c5cd7b745495547e61163872b8e7e45a18d779c4f513651f9cc8f8d0b024f69959e160fd56b218'
            'bb9ca46192148ce9e09b74fd43a1f358054af35cf1b3d218bcff348efd83fa6229f6a346c79827ee6361d19d8c25050322cdc22243b7227897528015fb540b2f'
            '80336745cc05c5fdce35ef1f018fe1e80a69177ccec2b84b7c3ff7737d283dfdf4e0663f2e42961c9eb407456f91ef3af421412c574c1d96d3704dc9516668d6'
            'fb8bd922aa1ccedbe7e18dc8f9442cc8ceb2e8f80b73178fcdb0704bfa8051dbb02083e22707c94fe8598cd51394c4fc95a82f474029c2b6aa04c1457d434b30'
            '7beb4e7a49814bc9cac279388cb610c5f264b0b9513b8655504413bf47bf5f3624ebb3464e6320b77a4c255a05920c7b68cf4f1b9fba3e04ca39dfbbce2434ca'
            '7922afa4909d978bdf4f5ac5191a6e8e46325fa59e3f1d4569ce2dfb94ac35e46675512b964bf860c7a2357b8d9e6014cd8238bebc8a7c93300a76491b5fe119'
            'ea3f4d06a59bc21d7504aec8850053e1bdfa9d55d32ce942b33983d7587cead5cf130ddb68ea667a803fa0f532ef6432292a8de46044f3a3020a9a1a4449f9a6'
            'fb6f39cfe651dad3bb1b496a5d8241aafb01bf8374e0043bc9044b44165d4ccfd3d1a88a319f489d5cb503c199e0178a2636da8101418abf2455c8b953b23a17'
            '4405712a59250fa59df9725e66c4d999b9e5f7ff111e190123fc5de86c4db1267aa608a88179c1b95f24006003ee25eca46ab772f7d560052bb05771f4ce5fdb'
            '439821357afdbe08dca3019c920a08af39c0dc5b98a7d625d7f097ef993b755efe7cd520869ee4b3471575895fce2632c5f7cc957cab9704277168da768f502e'
            'de2b1e82470695dc6c0f870d5699a0869fbe716fa101665b561b8e0c12853da1829dc74818b92e54d436d30216973b01f2e36a1c1c26f59c0ea78cd0d4cf7da2'
            '018b1b7a53a5a8525c677201a81a39ab0945b49297bd4564fcb6f08be0c998f753f9738db04de8d5fee186e3a03062820d9344631d0f9fe669a760f39e32861b'
            '8c1a8c0ba9d7b49b25b8ad8607a394a3fd577f4111212e3315dc6519f8f9f87d6ef472b1cf0281e839c3f70315284884d34d7fd13bfad295784a27b460b41e58'
            '0dfda234a31ac875697e52d48fae0eff70036ce7619c9299c4e865bbc1bcaf33e268048ce6ae73b7a18666dc122467e49828047e30a0c2d4f86264b3f43fc20e'
            '353b974d884e86e1d5fb250f9784360a856bd487dda469f4110928f25c9c0b7a7a24c7cb63baff6a77b0cb03544a7c2eaece77c18faa5d3cebad397acd4bd68f'
            '0dfb6c53f65c1d2dd362066c5a68501f8339585b2e72528163035e71ff35a5137343e90129a339e0bd156c4e2a3d93f3423bc7c18041a4bdf765bf0d7a46197b'
            '56dad2127fbb2638595f1122efe88e6e0a347910ceebd4fb84f054fdcfbacc82108931de015baaf4008293d0d5e0e7f9fe7f8812b7a43f6cd3e9e2e8ec67592a'
            '0727ddf2cb964d8ea0d13ef79aa79f5025cf927bbb08d2fb71441510e7bccc42b5cc2e955beb96776682333485e6f484b4df383cf1246581fb6f54d206e4562a'
            'd0ba06d17071e6b3620b48b1b93279e6475d06663a394a8d8fc05c20ce93e514aa4795b0f568bc41c63eda0787d06a619584ca6b3baa369dfb9b881bd7b9af2f'
            'a1aaeb03d26998bc5e7795f8566ede5a7a9602b3cbf13ddca7f23bedd36ac2618577d10ae981b922e07e0e233eb517ec37149552d33494a5fc4e086e04ecefcc'
            '1e41dfb87019c3874f7d89c9c2fe9e08c6221d24680af837d60705bdc329d755c970ce610bd9b18e7ff78588fcac141e0981bf017598cf19085df8e0baad6c84'
            '16b38e45de670e8986790e6a5d224a9091feeacf13bc3dcad4355fa028bbd6ad87d61709740ddbf3dcf9aeb1dfb8d764eb6d149224b1f27aae87682fee24153d'
            '93c14151760b34d3adbf777787a24d755c41efba18c3f1e0ffed6f3800b64395d626eaf7aa31419bf65e80bcde853bc59dd58c472fd5cdb8c3c57b516c01e330'
            'dd570731b4b1f340dac97e7341d5096630c8b56f3fd03f9d7fa060a32ba85ca98dfe6ecd87c13bf55683fdece851990614805507e3beffaecfaee2d39ea44647'
            'aa8a752eef238e41f1336a63bb3e2b7a7f00007a1f4ed5b92994888b88ec0299362230d4e007ce390ab53d61bfb00bd47693805ef304a9c71abeea109bd5e587'
            '6b33c093f231b89c87553d7c705875f052295e5f9568c1120a4b09decc2eba9f86e7a4f3d3cf27bb5f4f0faaf06eefb49af668036c0cfcbd98aafa4979ed3927'
            '4e56dc5f8e34f926b47e4e10da885a5f467818f106b026d94fdade8aab899b1a7b1919828a55295f6270bbbffd29a3646944b02d2c2492f2284b2375a9d43dfd'
            'b5c1b477d74eac0d61c46610db78df721598c40e8d276b80c5eaaca5ffec55c6bf33c0f49767e588043953546e68b487d5eeb3c438fa9718b7d2b7dcdeb2d1dd'
            'dead12871f39fb04ace0291d6f71c8db02e925a2331478b57783ef6143b9c2f87aa2cc9334e6751bc0eef599af7ed571ecf43912006317e32d39ba6e18c8a22c'
            '24c2ae07874176f033832fe0ac831ce1183c9bcaa8ba458cf587c4b9643a7afed081f6a5bba5ca6917f60449f3f3e814dfb70d664add41905ae7587405f64bf7'
            'e59902a0cdf0d3b6c1aaad23452150f9c4d8eb6d5bd3b69bbfe17f24e82695f0d85de76d4d86cd28954cd57d31ef4b9ffa01f03899963f6185c5007125b91c9b'
            '9772ae0bf1d932f394c90455e903b85997334d9b9c857871d0c4f5ed53bdfaa350ace1a753d498e074ca2ce56a55519d1f3b92d4705d5f2e1b718624366d5c77'
            '9f8fcd5c8a9b7bdf69e393d8bdfc1890e489773a37ba8fa97639cbc139efca0cf3014ca6aab4ddc5df209bedac98c3bb3d27d546f2ad06de1b5a28f9e52a7251'
            '4ca9755184e098325a357aa48985f4ba9551692087a8a01eaab9f99a5793a3cf6b43c2430b05c84fd665c8f11f934ac0fb345b22d64ae9febba4f033722c595c'
            'ee53458cf0425bef92d34978a32afb0337e1a6e3ee4c823ae87a24b0ef95ec003973ecdf0af3f40f312d524ee206894eff8b7c0749a4af278cb75c936b2ed6c2'
            'c26fc605d691591f6ef8f06ae7d01c8015b7900c400736ec63f3c1b05ff926872195618249d0b778e6808137158fc531e4d40579d7f44d331915aa56d429caf3'
            'bf8f87e415c37e2d352729afb7a7091c5ceb6947a90d0a8050e6673197943d77461f05c611b58e14edc71d40c2fde21aeff355dce6841431f2a160e69e291114'
            '7b3c82d9ffed9865cb6e4c69abd5038342ccf1e40de31ce9f44394935aa8e5ceb51a346a28f6b048629f9a2ed348361af2dedf2b9ccb9128f46ae4e04b859699'
            '6dd902cc4b71e6a20995d9ed2e6dc7e48d5c98a8f8ce8a0d21221e8ea59d174fce9b8f1a8a5b2483bd1e60d04c64f5270084220a8790448462f5ff6cd92128f4'
            'aa2cbcaf068229880037ef9b4045759a3faebbb2975ddee886df1797713494fb9972f96905588fb0488b44045f16bf0bcd4c44eceb4640d60957a09b481e9871'
            'ade0079b3135cfb1d1e53b81933732774a83fb91c46a664527a8e16f1e5547e9565a53eb86ee4c8fb77a298005b237130e061f996b6cba84b9f1d5deb55cfcfa'
            'f704914f549f7adc38ae00978dc942c9ee15e806377b3261ab72f396a12d7d0b973e67d54457cdaa12b27ce532b4275066526c218b48e239ed2c512a4b5f5c77'
            'ea8b23feaeed2b80d3c30184f521fc987c8bfb9a2fd59ed6ca44f33ece37277b0e9df44dfb384fe72ea678ad5bcab9515b3cd179caca9426c54ecf4766f76123'
            'fa3755d2ff811200afab42c1d6b8f14fab2b0a1b33fa85d2090f1707587e38fbbd7ca28cb9c7b3d4bc59019acba838039e41d30f76c5e1af089f6ec442d25bba'
            '197e2a3217d90f38347daedffe7f6a070f4da38c5540587f49b7892ec4ef944cfcde3e61881e3b3011f64e40628c7e7cf609bd81cf570c6fc9cf03f02b1f1138')


# vim:set sw=2 et:
