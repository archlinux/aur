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
pkgver=153.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org, Extended Support Release"
arch=(x86_64)
license=(MPL-2.0)
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
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libgcc
  libpulse
  libstdc++
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
)
source=(
  https://archive.mozilla.org/pub/firefox/releases/${pkgver}esr/source/firefox-${pkgver}esr.source.tar.xz{,.asc}
  $pkgname.desktop
  identity-icons-brand.svg
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

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

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
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# Branding
ac_add_options --enable-official-branding
ac_add_options --enable-update-channel=esr
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
ac_add_options --with-app-name=$pkgname
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=$pkgname

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

  local appdir="$pkgdir/usr/lib/$pkgname"
  touch "$appdir/is-packaged-app"

  install -Dvm644 /dev/stdin "$appdir/browser/defaults/preferences/vendor.js" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);

// Enable GNOME Shell search provider
pref("browser.gnome-search-provider.enabled", true);
END

  install -Dvm644 /dev/stdin "$appdir/distribution/distribution.ini" <<END
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
  if [[ -e $appdir/libnss3.so ]]; then
    ln -sfv ../libnssckbi.so -t "$appdir"
  fi

  # Register GNOME search provider
  install -Dvm644 /dev/stdin "$pkgdir/usr/share/gnome-shell/search-providers/$pkgname.search-provider.ini" <<END
[Shell Search Provider]
DesktopId=$pkgname.desktop
BusName=org.mozilla.${pkgname//-/_}.SearchProvider
ObjectPath=/org/mozilla/${pkgname//-/_}/SearchProvider
Version=2
END
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

sha512sums=('3ea7956ef2fdcaa86430ef922f04484cbb1a3faf447e035107159fcd5ecd8d0a0e4507a332fc3d7b66e4308c38733bd0624affd7629447b89c655a9ea0fb0936'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '70231d78e5801bf7bdd342a6be84ca4df7223d2d8614be6dc90619998080e394ce9cb422a81293d61527b1f8e012ea297cdad2beadd181c2d27623453d353f31'
            '8962e22a14970bec90f360aa520281e80d07479558edb2f152f5e35af890ae6e9bdfbbaf7400b8deffef82ae1062910e2e62c2c72d81ac24f3d022fd23ff0d8e'
            'a0c6e12bac662a7459c66b399eb5f2e4894c4cd819a04de1342a591f052d760cc30fda7ff36637a81fe0a04aca797cb6064aba38a94158baaa8d033683f0dade'
            'c7b422f6ff31e5da5f7fbdd69b37cbc05b530bdf88712c0f0c17210256144942ce431cb73f93a4dba9457c3d484c492482bf1ee90e3fd06e81feec305a38a740'
            'b247375bfdd89d60d6724d787bd053e05fd18b222af5d0fa7f441cc30e5984c48429d7b74fef306dc1803a87c4a5fa1b9588667e9de67a84b2bc2c2234716b87'
            'ceac3d52e9274fe856eaba4160bf264b866d0ffcf5f4e85199d6d72a70b8a1849dc6828cc26cb963cf7e89fe37e4686c1855faea93f338a1c24731439bddfb3a'
            '47bd123aefeb2b309a1f07f19bf0181a46b2ecb577ca72e9aa24d28b53ab6f6e79c43d8ea01c200731fb85f6aabbe468b8cbd0fa3b02a03dce804287e9541074'
            '3b701b9a7110c4b6c6bee717c7bdcb5db532c33cd57cef6e94e0c8d46ada664618f4ae46f78eb26ba70f63e69eb7207fd2564ffd9f682e70d4c6346c79c0163f'
            '086857ef4f5798dd399a793d0661a9ca8400b7d9392b1d2f0109b08ea8a1eaf779f0c707f93b12e252a91e1ced542cb1c199c2f3afa19611474e19a536606573'
            '54bb3c1167fc5e4d3255b2c5197e14150ffc1f43784a5e7538c4c97bed69a303e548ae9917d4827105bdb41a3c06e2755f3053b8e9cd72e726c2ba8f74024189'
            'ff9fbee3f39cf3bfa275f46287325bae1f8f0120e5037f0424947d3bc5adefeec57ebf93ee0458056f876973a02dd7b530e63039b837ae619b1765658b5f37ab'
            '9c301737d2afa18ca2630037afecb976b4c90279567e3da13cfea442f8e1693868993d5c9668d698cbccf9609f8a28844f799c54be27b19358d45b4dc912cf15'
            'e296b748ad6fe2b42165b2512e1c3f975db51a06330476567a096c73924c5d1945389f13b7e6bab10bdfc45aed46ade338294dddad83cc11d5ae3e9f3876a065'
            'bcb6192581ecf0b1a106be0f2dcdfcda395c457fce4b1f8701a90de430ab3b893a7f2e46081d8db42f128837ee20ed28cba51196ff425a20308d9c30c1442dcb'
            'c229fe878764f76cbb87e478fdd4798bb9c5f58605f0386440bc4e706dc6893e1e37542e78529c5a22dfca01d8376c83f4ce185dc4f1cdb22a4b0cb7c80ed036'
            '225792ce7aa89c211bcf1b2f48e4c3471ca299f874585b945fd8946d041f526cdd0037547a1f6aec8cb9f46af773163246cca2ae18895521375cd3589f297e25'
            '7a0a0e7bfaa8292c603c3043098e9773178137385899978ac0976305e39a9fbeabf223515fe4f292c8eec9acce14d1c6684ce6b88641623080c747e4ca8076da'
            '70dc454501f7359640c0c20e4ed8bf4be965d9cd6d634861debc143c96f8a56cef4e4424c65a8ccdb322c21ada80d1181cdd4fb5d10710a06a4f4b5ed46d3d87'
            '4ae0b35f7d3eb7702a2b17b605f5f38c120675f8fd93db06a178ee9facf6e7cfbdf71a1f77d66754d6d6013c91b627e2db54b46b157696613500342a685518fa'
            'ae38ffa54e9f25d28e2afdc76b33479f51b92b61c780a93e1eca3f52725e8892ffab7585490f70f0ba6983ccd2fefd63da85c009d90df3c8b1a8e4e689f2c710'
            '091ee2dbe3a5d3c3b19fabcac4d1ce3f7dae765a31b173ba15c5a5feb6ba6e27cf8117e63ab6d27fa0eb14bddf7e01beb2441e4c222082a22a301d9bbec69cf2'
            'be86dae605f81fdeaf1d6ae0ee2de10075abc9ce5f6f1220068941b5e554b0ea7b33a28a9c4d08082e980fea8b8ac71da068008d5f5f760e2135e5dbdb58c384'
            '2290eeca1189fa92c243b3e2e8907d911d2ee3eec69b95feb220f301800f8df90d7c3fc962fb5b5c6550f7e7a4231273302fdb22864616a9b69dd2b604f3261a'
            'fc9dcb1a108e33447d526d7b2d8c8087f48a46fa14fe9abe18d94874f18e2d1947d2df53020ac64151dd455bb42f608e04f9523dd27b63c67cbc2f2083054a7f'
            'e6de27cc3b9c8693786796475922b3ffa58d85d90cc9bb1829ef0d335b8eef2b54160266fabc5195a4e14692d672f4a9f7966c15c74f6ae7ab0d61db830febc6'
            '1b908184dc7e9983dae778d21ebee6d19f3a4176444c578cd5e7ce198291a7f79d905a9d7cfba46e72932a9f352566a702f572a0b4216f0157ededff284783a8'
            '91372fa363cdc6a0a6ccdb047d014d1d2cbb7d2b048593ced76741f9e54f23383389b550cc114cabd73af8155297d83d7d51e433635e65ed8c114552b495da8b'
            'f483c7ab2a6aea502f423c4e6d94c4bda842b9c39543fd83e8d11bbaeb07b6333951af06e345c6c9a290ee6f95ff72f1e48518cafa434b2c53f0c3b587973498'
            '3b797cf598f00b1581f5d6950e2db859711dba5510444e520a1d5bd7e0b2b138ad18c3426e0ef9f0803751e2508e7390fe83e367ace93e049c2fbb4c183af3c5'
            'b73084c48f0e459a9badcd755c599402ca5fa8f24928e50c835142969061a0fae5ca2a5d616a2a884e507b06ecdff06ca6b7c4f0ef8e9c4fb352f0ff3e4449e5'
            '64be18968119702dbb0734ef1f085a46222ccb96b6899bcdaeab223a8d6b67846931aeef0bc60595f362f40831a8db1349c185ce6ec532733bce8bb60d818c1d'
            'df48ae9dde7320822adfb9e3b06600333967a75c7ddd6eed7929161d05eb0d2d59ac089a3e8de6a3b46bbaf680191a0959c11b6e6459cebfbddef6adc1ecba81'
            '8adb7ad2c1fa70738b29de4f91b3dc9aa299781ce19089480bc5ee16955e840c6599fc203337f16a7abe74c1093f4a8efca86a021e0c05f2a601cccc55e3490d'
            '458aefb2c44d6ae36fa706f061a6ff46b93b072e29d435d8aab9369bc5546b1ed852c0faf3565fb7868dffc02f434b9f8fa4b2a9f2e6cd7c5042544bb6b40924'
            '27c1191e35ee6626de9ba8fe2e34597ca3a5e67970e1de85473727ac74089b86cc9ed94418e2f04ad67de7e3dbd9bf321ccab0a8eee7d238b45eefb8f64a723b'
            'e51851f656834b2facddc6142d94f10c0814446c4734c9e9fde781351434a68608eff2f81c53f56872396b17a3b5b403059966c45af0d05c8a76316e16f55197'
            '22282c9b25f5f9292b97c89b09c86febaff5e0132795eafadabf9ac765ce4cb6e4beda06f7a1ceee551e36a1b0d74819c1716eeedbc10f0cbfd8dfbfc7116461'
            'f0351ef5675b56b139e6a88ed58d775cee0eb2286efa611b0c91be46cd186396b7046b61c518a9a24d4d802ac0440c3794eb5d15f1adcddeddad932cfed1f888'
            'efb9b0ca3d269ccd721f00e7a3711f78bb1d564861b0b736c62eeb6059d97351a4856fcbb3bb27aac69ad5e26b1be8483bf760c639e3f4431393b309abdf7389'
            '84dd48a0e62a3b63c8b09826478ad5eceafa11cdda33e955789b13f8594fb49f01247d4815f31b26274a75f4fec9435805fd9d0e0e5b21e91de8074cba586bd3'
            'f155fe03eabd436ad09d8e756970566b8564cbc394968c29fc3347fd12ea30fca5aa14f2d85caa9fa1cdbf082865b4a9172cb2467a3c3f3d840a7f04d04346e3'
            '0288251404f710e3fa1165c434833cdc17b885265b6171d3c25a47bc61310a53219385a9b67d009572b578064fcbeb475e7f8e2f4571d8547c22de7d8dc0fe64'
            '75834a0d80a001189884e7d47ef256aab87f99a93cb20f9b4a2eea77ec7c573a36f633f81a2079f001d93a75bdaa1fded945c897ccba23098fe0c6593f60be89'
            'f7927e2cc6ed67e4b0523273c1dee99b3bfe7b4563da011bc62b5bcdb933a92c86b401f3995519a8f95848aee3d9d6ebd7c9385936ac79b8a1890c0a9181434d'
            'bde32ceffca94dcfdf117b3bbcebf3aa42d61076fe7a2f55c0b8271bc87781854179ed59e62068a3300b5f35cd6add72006a290ec1905f08474cd65184ca9498'
            '007491f34fca36a3b8083a9e3816ef2de31e3cf8846136b49ee856a1fc49ce8234b0adddc55ceb6ccab3517ed9d0d8a4cf1ca33f42c60b18fed41200c0d077a8'
            '1f2cab75660f6392e7473bae1fd0a6e71fe61fc2d13510401e2c9257074691f47e86fa156ceb8aa51cf874b2fd6f54b30e2cad0cdd083da3873e3f26efec573e'
            '01f01fd0040c95166c602f6820a247cb1379c02157b4a155da910b0a1f5de5b0ca1849ff6f871e50a9926de1ba24550b5563a97d6a9a585a5d67e39e66d203e8'
            '6320858c8303d00a06ac6a4a53814d53b7750c8c06a0f47811eeff3fd77bd33c842dc2dc8085773d9ce29ca70ca821b5e7db4bb0e5208993e1580d2ca7e5968e'
            '5f387c75035351231f76b4a5269143ef2cd7783d58a5fa96260deaa2ecbd5a4b213bc56fe70d857a5fdbdec12370e9901ebb3be74a3cb9df37bf879eb4590081'
            '8dbc37a9af954dcc57f6f30065dedaf6e4bfa632dfee3e15e083ad2b900316a41cdf700096ebae0f83c7f776689315ad643eff43b8450ee6a4e19d37fe660511'
            '19ab97e9f26dbe9514eaae6ceb56a74a60747e74ae2d322b8eb20bdbba46e38f7654c055be2a7dfda239e928cb4e6a53ef20cff11c15b15d751d63652b1af1e1'
            'd2f16c6d55ad0be0b4244eb53df506a8bd592b3ddb57563081eebefd046569ed492105a7a9108fabe8ed3ed899e99ebecce4943b6e188b85a1e0a8f4aa99661e'
            'aa864e65d2d5f89a42c52ae4d74a3b8b714a06829a75ded1d546a7e7da5ae635c9d1b2306a0c598d3d9812fb8e8e03d21acc172601828f675e650d7f03290150'
            'fdf9c424954cc526019da09a65d2be718d1f3d24125c2bce4784fa07abfd1eb6d8f9cb6212112c03b51f3d4cc775951d1e3b25f10c0e3d03f9b43f73a4f14873'
            'c05c970d879fb9e035f723b70fdf4bcc8082c3cba5a882faf27d6a4050079948563dc8837d548823158c8954b44764f9168b3b50bcbd6e4a521a3d941ec6e186'
            '221b154050c37f2a8f702f963f9a5bef67ea3cde6d19b51d170012f58e2b7ec58f189289e22905085fad8592afad14eb93fd7a0349cb4ce1770067150af3962d'
            '41af0327681585388021f4e0e7d1657b51988d3b1fd1995d6f72f391e405803d082d36272777d4652914eb7d0cf7c8fd4b3334ce80ad32af72dc205af50f3a15'
            'a8eb6f282304c56affca8dfc9779753d3fa221f90541e74f1b76505dd2119b0bb0961387529e088c66a64c3045daba204d2f806fc5989b1c56e5231c41fd72b1'
            '03aa2ec7e99f2a334b105cb0608dae7b3d6ef91a1ade5fb0375fba7a20eeb217bd5e90f00659b680662ade4517b3ac53b29e7b069050926dcad2c3be673c0298'
            'd696d99da2dcebe519099eaab1f99df7515363d809a060a9c250a1ec6148cf3eece90a94405315ec6b618b4b8f6ac00fc176aa321f24643819b3d3ce137400d0'
            '43b096824496113c008f2b49ab366ed38edfeaa1ea5279a03c26e827fddd7a1281712e3ea5c884710d0099793d764bc48d688fa4463c61872c2cfe09dde63cb6'
            '900f78e478bfd6af1830232b96f29a7f2473786f79cf44b4cc38c85e68439add7093a11436145d3a24468311944beafbae53e796ab1181ae8ccdd92740524551'
            '7b7a98f00e4abd4851ef019afe91c93d198ca33f26c8a8b689d9967086efb85396b728f09dd22c7d3fe2ad32ac9894ca66a115902f44acd06a91cc8623295161'
            '7c8e610c40f56e0e99d7faabe6b6fdc8a30a401aa13bff16426a1e6b11cf6b762f043f847adf3fd276c4af07dbea15c170f09b75f1a7fc250974d4d1e30a4af7'
            '2c41f6cb9c07d5b931834717cefd1be4b3a28d1dd5bf28ac0db77331eab1ca78eb30efcade1ff79b0e449fd8a984b7a2aef6e01ec2daff034225d3f55de44e79'
            '61ebcbfc533c7333d63c57621a1da9f6b603fec6f8e1e42059a2e3d5f583b860330cd94b8164b7d2d914fcb83dd0e60f75072007bed91290099bb8aee0c3517f'
            'a34a76e1e037a61cf61398a30d07e4017725e41b9cb02f3e159238ad8daf1d5669a113b4d7e8cf3b774c95bfe0cc150af94b8c8474d6a36169002e7d99227086'
            '314c9baa2c6ae13dc70521735d0d2432184167aac7c50e030df940206fcced21d3744471c7051fcbc3e552ca8f8244e40c28633afcd98e8ec0404663c4b4682b'
            '13ecc473c858a104974c645ca005dafc91fffee7fbad7395c5251834d91a07eece122ec969b4f68b76a20e514f1f2ea44ee3a104f2d808db93fe694cac4abc3b'
            '74cc78961d98a772b0ec67d8619ead1d911e9a8f4545443ee93534addf9f4a7c4e5b224991a8cd36f3363bd46f8717b8a95a482ed2291b63eade03d390735a18'
            'bfe3abfab456ed66c9ec6b9432db0dcfccbfc07f008e1997f7d0a78e49e49ace2919c4874da927e0a999ab4ce638ff0fe383444f2344fd0e489f2b6814f955e1'
            '9d11e03b47e0cae4a5389e0799421dd8c9ac48be9defdb2a80dd328cc3c8972dcbb78c785a88743c79b7877975b90c3431fcdf5b280dba77da5a762774d7d32d'
            '56cca0ffc295f71723ae719d2d4d03d1c69441446eaf6b34ea32cdef10b65df9325e92cd3f8bf8b7891d0e02a750a369ba219a0d99e81dda66878d698e54758e'
            '0484f8b7300e8b61974b0ca9f84d1384c5260fc8f5cf0166a12e52504fd3a48221aef6db35c3d0c8476b9094927c11c20c4fa9435935d150c48ae41093f55d5f'
            'c1982161bd1bd600a5252926a67abab35b6a323472f36c1d6130e96891de27142ba188867bb663195f7de9dde33eb1e00d55827633956250401759a0aca8402e'
            'abbf6b995fc5f60cdc945f6905e1ae3ced732bfb704ede5e8e6b64fa6d267ac48554f3e2a3b10fc2e1a6e238ffef29e55c551a29020842c963656b8edd82696e'
            '20bb0b987ebf861733df926ad46b0939e349823f06fb257ce48359824baa8982ce5e2d9c5b02e4001594a01f08ef3711888711ff3ec4f24efad510ca9ad4fb24'
            '9cfb42c34091dc577c118269602a1c696313e47bef61610fa09457924b476c9df9ae48296e465902bac3b2739bedec696e8683aaebfe1ba0605ab8dde3d4143f'
            '30eadf049cbf861d0853fa373daec44c2279718df2a15e7ad02e6c53e333daf5cfe69e6d9a7721d311eea546b4660a4066422f7f68a76f01c5063a5789a25a40'
            '8d7effb3d7ec795b3f0e453640486bd84a1bb8f1833f9f5ced59ed62afd968b4b9406c76244baab9766b1401df7848394291b8f02fd06cff551ad47b6464602e'
            '0830fa8da1e83decd6b0946419efec6ad12a560e31277f022e863db270e83030856b040ed825e0d95518504dcd5bba03fad6d7eeb77897a2d4c29913f9744853'
            'b6281a940c9a725a33e618ba05cbf3ca9e463f4aea43bfae916da34d830ccf64f8f14adde31cf395754c98e3a1ecb3759c34cddb045efcafb88d0c37f0c91ea9'
            '9d0f90fb72febc69cc7d8f1fa693f7cb5185f2afa6ea3d957b034b3936014b9cddf9aaf99f0d7a05d4cefb989e77edf13a5973460a618e100c87725e299f8c95'
            '6ab3028bbdfc224cc1c79d1544321aa59823d37d842dc47a18c00e4425bbb9076a56392480a535dfbe25895abcd964a05f8ae4dd43f6e4cca026f89fe6c9f234'
            'e5034cb52d24cc2cc4259be0538f9640d39ff2076afdec1227cf653c549274b24339fd3b4aaab483e2c4195d9257c05b337c0929f94b886d0414d8acdb20e30b'
            '73d8aa01b6a6c1d58dff717880b7dc88fa008bb148dd24c83ebf125fb3eb784af9089204d02c14f142b8fe37b1517306e4850eaf59e245785ac0fd3bf64acbdc'
            '409ccb2f52c57ebc93ddc07275df20407af43301818e93359f3b625baba0f476996549fdada7d7994d86615d6553a72b9cfa7f19554520f6ad7b2212cb1a623a'
            'c37302a3185bcb45716fd5a22251d56c21eb29f41a000d721472ec9faa216a0a86d5ba3a741306a084f80a97cd6f45e7f28df2be20d53ac15b37c6b72a7605bf'
            '832529105e339b2c0903373ab14879328056d0063c2a8bde24ebcd0da0a4d4297f29189197a6b1c947a72579fbe581e8bcc525c984dd2896877ac2a27c2e0ade'
            '2c092c8b640eba2e14f2f3653b4fd8e0ad6649af0f48d8a6b99d6991727af2e01a6613167cc4788c34fde546c5e0aba671bcb734da49d0d574b385220d0027c8'
            'fd617c27b0d080f7c337d6701cfe070dd583250ba0bd31ac351161552f12bb4b202dc8ff45ef52f116a1af2f75c32c9917878ae130111075e26e15b991e9104c'
            '920b285d03a44e5810d54148e30cb0f6b505dffcae55f3243f082b4af5a6394358087303ac24f80c41e58b27ebd69b887a08920a681c9278c8eb67bd13c7e43f'
            '1ebd1abe4b7264d17b6ac67606b48e86333abfcf3178704bd46e120f5807809411f3c4a569cbc4ffea30b3209fa0545c1beda98789f88478e4c15d4e2bebcb8c'
            '7f827219adaacb72ee971bb4389e00bcc4dca2a02be59921a7344ed71548997a0cf123b79420dafd1e95c49f11ff8a44fb4d19731e3a89b04703df4078a9c8df'
            '038920fa14ff7127a0997d445612cdb7071ff02b32a6fdf8a3b2d342551eb652f2eceff08921bf5226f3e76ebdea0aef6ad34be0c0d924b8dd58d71f1c988465')


# vim:set sw=2 et:
