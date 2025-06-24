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
pkgver=140.0
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

sha512sums=('12e40b81627ac4b44d43edb94aa1cd2a6c50bb49503e3b1b6f80259eed197ecb5847a0f0520ad204340dfe0ab7b5a4aa1ced2bc21ee0258471e8fdb121f6aaf4'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '5c9d48ea9bc3e331e2a5872cf939cf65c3d61e8a1eb5c5f077c6cfe54d49d793f99a3373a9ab720f650b4fefc2440144e1bd3cd2e84975438e81620e401bc4e3'
            'e3b48fd0585ee8e26c5c0fd947d6c369b23e7a76c1081685fe64e9ab9b63c0bc14e05f527e1b62e74547d80631a702239946e3dcb95cc22fb26e108085a8041a'
            '4cf05b91f5c8f252eafeee1b04fd13c52b4b7681421e2c89fac7f7064ca75aaaec8dae8cd042370561cb912dd74e2a194801bb458b27cf1ea919b14ec08f9c97'
            '6fe876a5f44309c6ce28fa043037c1d7eff4704d0226a54a5b07b375b828a19b9a73db2113b325c84112412dfe0c1441bab2f45161d2e166eb3cb0ef259be5d6'
            'f0834223ed48a091e9c6c925a439f9a35212f2c6ff17bb89fcc415d2a338625002e9bd39b4d01b19e3560235dfed12da291848263c58b1f883dcc5a198b3071e'
            'd8a9fdbfa280b687b990b23baeb4f5c4e21867f441b139410a28d2570c2a917b1610f6a277762c62fec5f281f2678a49e2944c90f7c270336d88da64650d2d03'
            '0f8ead87e7eb0d237dc914b39f2cd90368addc747fcc2b993509d4b32b7dc04f418489ab101832f1335e31c7da00f6b17b8e42e5f681e2e0f5262d45174c53cb'
            '9124529fa1bc5a88c7e11ffec32409e860017cc190e8f33b615d5478eb980688ae6808e37988ee5834b1a5c2cff594247b3d4a7919a83b6ef8d9fe0a49a6ab6b'
            'fe6438f77ee6a55ec4bae65d98505cf5bbafdfc4528722b97cd6775ed515fdab9ac2d010999ece9a1982b889b5b192212b1a53e027e8dc8ecd7912e1cd9ac969'
            '25f5e68b87e5e8c3e1ab9a0a91611d74f62a353c04681e3452202e4da2c50f7352cfd01460fdd6fba6d06e032ccffe4d029d57c7ad0e26ac9dd8b0fcd26be1b8'
            '93e339bd550813a9f6f958ff16851a42e00213e006bb0797b551fd8d81d82fa54f6d407c1ce82399663087b1abee2466229519e64da1f13fa263f7b78dcd6b24'
            'd3034baa5d2ebc26c0e6f1bc48878feb88094543a03ac2188c1d07b1dfa00c27a9688bd64eb5643c1b08550df7c1c350be864e57288d3716000253c841821bdc'
            '77ccf68fdf07c18c70ade179fffdf1c3648365df6b0f833720bab3b23bc099dc7fff8ae6316e5b33f361239804b6766b37a0cb52ac6f410179bea90945f99ddc'
            'eb39e681bc62ef4b81272fc834f3a48a4c965d745ac813931b3576ab1a11ae6a49b32ffdadff2621391a0010530dd01a9cf2a37a0e59341dd9b94dbdc1491910'
            '1362fcdfe8552ec8561dc6dbb697969fdbfb94ebcd76671b53bd198f1a0fc9c46e4ddd6c9dad46cf59bb75a28eacf0c89436e86fb16fde7ae5f2e995b9af104c'
            'f49265a3f894e348a65aef4ed9009666218f51da71b5cfff8c2e28be4bec444128ec707793c631e69d4186006be02b8320d889278cb446164536fdb81a837b97'
            '0db1e9bac556dad2847a55dcf2bbcfe855831d58701874bf95255f6041c5c85041c67e741f135d853d054d2b33befd23d482ae5ab9f181ef4787bcf91a31c43a'
            'e9afc77dbc869df5910876d8c5d93188ece4d3de172e43a97ce29e89bc9dde234dcb0d0e2b4cd7a7d075b7d535780ac932fb631810df4fc747a0da91136e3237'
            'e86bff7d352a4d05ab499b20fc9e210d7154c949e43d1bcae638b8bc76aae915223808ce01734a1e5f943b1e7a929d7a8c690c2debc25cba9fff760b6541e194'
            '30dc9cee2779625008b7951b54c75a1d1e7e3f0b9d3f6fc58489e7b0f66ba638f8ea467dd9bf909ee3491d01e2c4d88ed55f0d6800165e2dc47a8ce1aa31daa6'
            '719bfe702d9178e80d62e74a04fe27e2ac2076a631c8b2f2ce9794225e1327305cccd51d18ba9b77cff1a932f650758f5c47c77956939f14d79100347d76fafc'
            '6e91d2868ac4beb76cabfdc07f831fc9746e3d72ab584af2ec6143e5b1db31d8575f23b7cafa77e058f3f2ba2dea11f8396c06fe626eca865eeb99183508a725'
            'ca23a9e54c912438a6be55a22054277eda342ea002a13d44face2fa21e9d6a477253c16e3485d9389c86a1549eca1a5321267fb2ef1729bc8d1654a45664c669'
            '8d029b0a60c02dbcc348da58b6580a9030148c8eeae371db7dc48faec8d2309dea75fa0afe115451f8a5634393500022fa918fc809341949baa52e621873548b'
            '5d8e749c32b5fb8671903a3270f022f28b4610ad224d50b643ad7991cddd5a82053ad4275a0ecac1cf8ebe37028af946f6b66291f639838bb8b7b077accc9e32'
            '625073a822403ea6001e1120b8cfec319aff7d1543a68f028445bd51194e70f8e90cf7b67d7bfb70c5e6280f9a659481a9a61f32bc7b42f1f6abc6ff3a8f62ae'
            '847853f0c66d2c89b5d3da9e08c70944bc87ef6b0025ca950a88d93bf6ec51f066010013b2ba294d9b9b358628cf44fcebd452a0016dd600b38d141e40b7657c'
            '4338309f363cf2ff96a0d4c2570d13a210203b1f1c713c6a0950e3bdbb0b7d704105e14131cde394fb62bf06723faa2facdf2cfdd4415b716011558bfbd41871'
            '4a47c5af402ae5e68ad3fe9832bd057deebb0b44996ebdb4f69d923646c52a563e189a43bfb48d7eda5c8b99a509ada2797f95fec5bdd4f73d0493dca32fd9f5'
            'f26dad2297d1fabb6a859ec4a057f9a618a05627a53c9d15bc5f5c6e9d74feae1a624fa4f8431af18e3bcb61dfb40fe2eafe44ee7380a38fd6d285a06bcd20b5'
            '33a1aeb1b456f504d54bee2fa7bac57073951c271bcbb0541bf6915407191d53bbfd40423828a7157e9a3e72711ca40ae3319c21c0d4a9d158031c3004a9cacd'
            '7192b8d695831fd45d313adcdf71de5b441242438eab6dbd1a55a2ee21e4e086aaf30fa481250cca3f98e3f423b80d0acd983c0c9c5a165827574246ba33a68c'
            '0e0179dfa1c29f8032a9565dc8afbfcfcdfd216d2d08bbd9e2a5fa74b7296c66d076f368729fec62bf46726ad6146f824155706231104fc93b090d763858eb85'
            '9a5c0978ba325161bd2df8e94928a64d4a85c26edcdeb2f0267ad3a05c706dd993c0d5c68cfed396ccdb7a97a862a807e9dc00ee750346b7cf12e456ae770007'
            'e7ca7e9b2ebc51d0ec29b990ba6a7259214cb6f7f2c2536ff3bacf0accb2a554766dafe962c67df726e790f73c08319be28c14e0c53bc7599e9d3124a251c711'
            '261d963ef1237a2bffe46d35b1c8ab25d49976dd97cef5d7fbd066d1ba677e02eaf8cb77fcb47ba642e6ad8eb02a2f02a5a60a980768a7a67fd17f444e3650a7'
            '8379189c966c09a59ec6851defe293c68de163ca384b50e1dc873ce19fff3f028dc75d9b5df8de3054990129194a01cab128fe6c8f3aee1dc01526319e6374ad'
            '58e1367c3ab3054bf36fb46cfae31cd13c16cf4f529903dbc3e9c275abcc85820271b2483f0e2640e7b7b304893eedfada1adc47e6f70bb2a05eb26bc5e8bb76'
            '2bbcac9d8714284d3d654dbaeeb985d10a499d41b9ad1040cae8c3f9bb36b323b0419fe7bdbea72ed0aaea0909c02b5ddaea4e58b6c3c2b7afd26d54866b20db'
            '01b85899648d6418203cdeb13ed04c77ccd070d0b3becab7d83d6ca165f896870e2117b8ee0da3c90cb05466dcb1daa61642db4750c24f62f472ad2e57fe0c53'
            'b8797981a16fb1129d9fe40f956bb933128eca45efe3280ad0a426606133cf20478e426a7e5d974ea2fbff17ebbb5eae82c84870c4997f45d7cfd3e5cf8ae264'
            'a5e29b35ca44b1fb7a7b346154359538d570fc90f49a95170af95c1bb718db99155d52994327990cc868deeea599349033557144b20e0764b911acd33cd683d4'
            'ef38319f5fcc5a065e509c96374ec9c37bc7c7316963e3892f1a85c08336003144b1468c1950ce3c3cf157757c36a870c79bf185ad3ec2958dcb9f230b76029b'
            '8be4310426367526cf61676067ad369733f3ac1b35b50739485438d485c567923c5245e3986457afd35410061ff96060ff094a7d767259714df7ee75cad572ff'
            '14d908b2b7cc565a6b7e94565d2010d01db71670f111218733288dfbcd3f27becd5372a42a4dde245fa044e47d8f95159183af3cf5eb0ca77d122a459c6f768d'
            'a1040567e688286c6b85ea1f40e13c6319ec465866797019b1cac02da6db60c3c35c87e2d0620743d9d063b856a5046d9876e20d0957742942d7aeeb0d836e35'
            '3e96d0b5cd95efafbcbfba03e738ada275ef6964a247a803ed1edd969c5eed8763ec5fdf5188c6a17886666210e64dd6c99fb6455c777946669ee79b2a66685e'
            '09664a28b55685df0ecfc45a057452100ff5b7ef5ad5ab95122a1fd3200eac1d41c78fa2bbf158c4c9bc0b519ba24a02e48bd858966688745d1f53682b8130ea'
            'cbfec0552552856ac041ef80821d2aa45bd852da88598b901be87481ff3e0df83c5198b50fee8ad7506814162831bb686f4a854507126602c95bc3c837135f12'
            'b4abdefb4a0af0c0e15bf7a0e0a9f240eb97c2b63fe595b6ec848d1f8603cff5e9364f2888671bf511c561190fd2bc54f21a78d84978868f55ccfe69cdf01f94'
            '9810f7d122c6e8f084125fbec8132f97840bd0d8e54f4e433ca86f7a37ada483951e03783db52835ea1fa09824a9610988d57966adf6cb72a4dfaacd0b823764'
            '38b5d80051a509bfd16b9e12ea5a788acf4a01080d857e3a3aa7dac327a6bef11fe1a345a4201b873277b2b29186b484751f5a0b8bab9dec2311e81278d6f488'
            '17ac670545503ab233906a449127a7cb3a01e4aee5d5695219db1d6f5593c5a87ad897fa718386bb13002e1ff1b369a4b638ade42fa488124d0fa1f6c9cfb45e'
            '7d1196d0cac963fc97d6f0e7c22f9ee36c46acdd36f2dfcb8c8f67145816c787e456d1f001c6e7341ce65cdb88a9ec4bb694b4f3bfa58684d730159c9bd81d88'
            'b0b03a70e5de93879a08ad2c9b15b226138b069a0720762790a0f13e1d386c315ca7fe21d4131c49f0ff8ed46dd30adf105ff2d0c610129aa2ff94a622c184b2'
            'a4bdd19c98d8cdc8e917e06c29778de5261659b0439dd15822c7512490dfcf49c0545b2bbc37079ed589fa2bd022a3317fbcc915f9ed40909bf9a0211e7ad59f'
            'a48f6da1bc04c56b8c3e2afb3f9f0860fb073ef8fdb2ead5430361f7df4e670570ac5b8692ab278a45e6268010e6f23b00fd096f881acf449e3513f8cc14f7c9'
            '8b91969abdfddc785778cde8c9d2f4a423be6da9c50d4a208201efa87101c18dd9f8230ee5b288ddaa8cf15ac2a3d3547d8f2342bd287f59558f712eb72e5128'
            'c7cb05236a4807a4094a9f73c7b8428161d7c790e7827dfa81817069453e2edf7ea0e78287adb9e39696284b85004ad85d13582b28d0476ba83993057982fa65'
            'b15484e38cd80f39d5023c289a2bb9b46cedd7aeb747f9e6219f5fde2f1b5eaafc79badc089fe8e2fba3c233d7fc2acedd021eaca82a24575a5905ac5bd5ec21'
            '11e2328d61a13c9d0ff3ef0d3ae9a53f23f434a1c28e18c4b4d4ee3512f2f23e81a00ca5e46103a74204fd5864a55fb7675c0792a884fff1512e6e4b0e5398a9'
            'dd12bb9973de4b1c086449c0cd672c11e4ef7f9a95d39480b662623fe12f819c7301215082a7a1ee87ebe9aeb9a1f22fe22c80185672f0bbc3a2483f3fd796da'
            'd9fc8cefb20b985bfbc6095dc1986c3de1c1cf2dce3af413fb1b6a3606fd259404da414fed1f05e365ce81d0c3b5e44f00f187c6aedcf4d8f956d20598fe3f9c'
            '2f4e30914d30e94fda788bdcda2817330466da831795c6028070a07d6e9bd4a666c0a4aa957db1bac651fb347c74bb148d553f2f7cbb34e63306e6b8836cfda6'
            '60fcc13d3f870fd28f212f0801547998562877efcaa2fc5747e413941f546393ab4565016e4d9abc2b04a7aab6b2a7a4bb8a76b65498d673431022f56edf6f0c'
            'd6a096583afafc26d8210e2bab0ca1ab5b31aecc4949fb311f2e51c3cc99494605af8a6a56af2ea09b3bc218935ffc98a3de759ebde6d65467ef16fc728211bc'
            'bb49774cdd60c0e110e5e482018fd307a4cb2578dc94d967c45074246020cc3bd6d7812a5c0300f70ee2122141f83a8f75ee767322f64a18f929dba3be23609a'
            '8211f1befe0c2beda4a7ddcada762f1a14ceeedc3e3a2b252c8c759c182353c9d8df744c236591b6f9e19623bc553af312694980d6c079e5a908c7a619e9643e'
            'cbacc1e38e1e2528ab4b58e5fad119725080addd716a1d317409dbe9ab32dc2d81b98811fc74d3d4007988926e6e0f5c78aad799dc057cc031d94741a6b8f8b1'
            '512610db9cad8678600aa06f008fa686ab62c1f24d5d30db6234a3decd4d24b82e742f689e8b7619ef09a3d274850e2d6de8cc44770d5aaf5970e51d4da5e403'
            '3fbb8e791b6b09f2486c2db41622fbc771d557a588581d3c957037e83ebcfd46cb99957db440c14294a3962fbacd1e7cf6832400953022fa60063f27f14e43e0'
            '42c122c7824ba80bdc96412d058ab68a6d6b910f2ffdead036bf03f0814823ec4c86d2d53c2f5e2d5e2f52ec31ae564c43750eeea6ddfba3e48d62fe2f64a21e'
            '16f1767b5cb129592ea2036e4833ccd61c06753e479a213a4859c7d8c25d9f7aba7d8cd2e58c4c1d2cd50a6f2fe0b98d36b12cbc7ba5488cef9c97ece02adb85'
            '354a63ce546fff3956fd5c42be9609a3656694c230ad626808d54d2231793707d8d7836bc3db99be5404a53aa4ea2cdb4147c9e67fa2f4ca4444f92540015e79'
            'ef6c1c2f10b1e4bf722c71404884dc8b87c87bec31e53bfd9130e35085abaf0687756243598e533318ceb8af27ce240eab0c90198da06094c4af0cb78fbd0de0'
            'e4a68f148393843bcd6cdcf9348907a6f020ee7d9fdaa95b4827769151e68fa70ae4d42171be1f05213c77ebd43833f63ce413b690ecb8bfd06d9c31c7b21635'
            '25e2800c989e24f79d6ebe05dc3c766f3cb1be109d1d08ffc57ad628f8cf741bf9661e817fd0ec34b0935184e40f7da4e74561c98295485cf9418201f238f4df'
            '638d3891ef354de0f40cc4ea79705ba19d1568f9d76a34579d37f2143f27592d4a4e8de6920c0c6c48401a8f460ae4408b1882a9f42b523214f7d1c6bd453ec0'
            '636be71d996e6f3d713cc75228a8e7d207e2d2061bd7614c1fad6f1da1ad0b319180945d380036696965f08b5c826629816ab0eab9f4061818f37e4402bf6a97'
            'd5c9f0c8c538959889f1e28829a56227aa56e8162f9c305775c3985ae08ffb059a9818b4c71e7d9e29d33c2580af1e6385b6817a0473af6587e86d1c4147c866'
            '8502a162c9a0fae989ad95a8f0a8a1847160fff7aacca2c1e0870df7c282c9cf28aec93ccd5f6f76929ee05298e62d514eaf44786d1cfd25e6db20e57d1407bc'
            '9ade3d053c15f5a045e1b8586534373a93115303a68461a18133b07d398919f71037adf49ab7c64c821edcf319ca5bacdb510b924e8d0459e130faac273e6239'
            '3e0983b90c7b72d871182af45d24c948e5a3a5840444f543a0d577274e621d23de2bd015f95f448a258135a2f794575df02c662d84bb74d8abc6586f35597df2'
            'a78f6b3daa70dfc37cca6852148b760cbfa85f4f9e6b87c70743f7a7e6bdaa02014e6465cbf0673445d222b782378f379d8131be3a2ed57c5ab4fe3766950a37'
            'b748860a6c1b85710c07abf7dc9cd56aed72c033d7f04064bc980027b50b984f2404e779946ebaf9b9283e6243cc5b9ed0f340d2cb1aabd91f79c7f5f14ba8ac'
            'b1f519f62e5a193ed2befa6da338458a5e816159f043d8869b1f61ec5cf54df82135419576f06157b625554c520c3896856ce22570b4136ed939f31ff0d70d39'
            '6a312b2e34ba4ac80973930590c96f1425234198ddadca47274a206049fd9dc8893259e353f568ec795d4d343f2bac8c66c233bbd6a59d9d9f90c5246c62f64a'
            'da4a8b1c4a8bae405a3ebbaffae54f304965e7d24d8c48a02bdf19d56c6e95db8e4d177e7eb45170a33b3e71dc12d048c13c1d7809fc6b021e61b349ce4a55d2'
            '33393f247bbfffb8fc92c4fd289ca97c2755458da2ec6af70853e61690b7a0545224f230dc367f4230005b1bade70cbc84ae65c7bbba567dfd3b1959d73b1dec'
            '4c0869f0e67102f1b04acf090d7a9bbe405d73befdfc76c72f876e388da88d11ba257d6866280ffc5f4ed16e0526a8ceeb5f9dfbe2059882cd0f89da8007a7b9'
            'a3e41a1138dc1e65360411069c51a30893cc99ada2f5f3915bc7aa000ea3d27aea4afa6edac6a58bda078e8544200111c7ec3ea697d67e534139d54b0ce79044'
            'b44d2d348a66572e7523d183d6ab29210ad3d9df7653e7b7436ac3eed0fbb0fedaceb873da75a82957549d16b96cab1604da60e51a94d8f106ed9571a17f5c91'
            'e60f1e1efdba6486b54d6e99a1be955b139db0865ebfc4bd600fdde4bb012b8ccfbd1a058f7cef782961d9ad634ea9e1595e6679b7b4935d900dd7aa829b62a5'
            '685d7d896685029e95a9c821e16aa3e5cf7045912ab04fb3f2eccc87d33f5fb532103e47a130a44c4a906db05fe21eb07e1ca52de6271b103a146da0cfccc5e5'
            '489f292dd62c241751b2240e668c560ae7e6710567739a8cdd8aea65ecc1fb0161c2ba778e4805a46e1aae4ad5103519891c18e76f6dc2b54fad3de983c33ab6'
            'e2644d7ed483256379566a7491e269d02cef3a2d11935937ed7ef98f93e3e0dd4be5278ace6b520567ceda250485a995e561511478ee1479f1e9f77a84f38e68')


# vim:set sw=2 et:
