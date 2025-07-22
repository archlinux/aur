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
pkgver=140.1.0
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

sha512sums=('1b5caff9b381cd449c40d148542501f7a31a7151a3f2f888e789c9743af8ee1d1eddbd970f8c0054902d1e1d739221db0cfcf1dc6ab704bb83bbb7b7b6a20055'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '0ce9e3713195761fb2da955153dd9af6d20c044364a2c39fe388aac3dc8cf28b74c06b669336a796946acff363c9b1442644243073a7df9e015a8a7707c28948'
            '7a0855e365b4dcf837c60f8ace69b7945ca32bf8ac90faf45acc17560ae0f566937d823ff0595eb2b5798420327f2c3c39479ed053c35f5845de8746600db88e'
            'ea1db196d681671660b6c8fef22f7fd62a3f9df12392f8f0af069c723a1705f83b8e554b62d21f4e0462dff2c2bc398ff68b92ccd307695cfe586094648f10e2'
            '2a49d19fcc7e034ee43ef2af1377f34658427522f6c4eeaacac4ad4857e922fbb26390f3e27134feffbd1bca18b8f2e076bf725a08bba6bf33c8cfcbcbd3215d'
            'ee8b4ef0d6bebb3b6d28ca9f2da36fd6e790cc91795c76db26c2b33775200b0a7b139a9847f261cce2db74e1d94c976ecf617c30e20c6dd59681bf590765f447'
            '156ff4a908acd054b6a4606bd3bf5731fd7963aaa5e8c726fb01eb6d76f83da15c6a01bf7f13ff0a289d27f9741f1492624049c9e9cb3eb3ecb98f0a634c93b4'
            '2d47401d16e4953e3addcbeab571b11bf8b465759d473a0e31ad251a2203e30c35b08d9c75c1b638a69a8495865e94d2d9b3c2db5c0e695230c7ea6189329812'
            'e2184c659628bacf190dac29b63803b31ab5bb7c43ddf5ddd3c2fc8fa02cdc9a65b4e699eb281ab902d5d9cff9ecdea6579ac2b2d4469c8c5cb1a5fbccae21cb'
            'e83a38a8e40c601d0c031832cb27b274346202ed45935c18d92512fcec8eab30fd7fe3ff0dc19252a68d726de76c8e3df57264d432fce2af86ee14d80fe2633a'
            'e5695eeac187d9765da5ed2a0e30c7217149075aa6bd0e57a1c27b35fba9906ee8030830c1aa0fe8bef220e9fbdbcf62824e030501418339e5fc6e6cadad468b'
            '7e9b95428c3e4785e5c49ac7408aa624e285b6c0e40881eec57108c6ef27beecc00bd1eee8e58cdf88d6cb2127329b3a264eaa9e02e27565a15f579633ba8287'
            '4853eae7cd818240091083d205dc68c7f0a918ac10c75773875884dcf605634ec5db7150a1628ba4465e945ab25843e7273084f97d19d0ddd04c0eeb69ba13fc'
            '8578d9254c182407389bc63a2fba7d5e87732aea0344f3fbccdf262607670373d6cc79fd41b2db65d1527b1e52e7914a9e4de8959b90e9341456c422faa1a5c3'
            '6e017221e7172d8fcae1698e55b870941033d4b512e276251e9b5ffff478b17af4692fe1ade71cc8c515c88fa5fdb782d8b0ffece029bea142efeb0919ee14c4'
            'bde349a8df465a475d9208c0594c93aadda369ce81e3cda5b5f515e3a28ba76955d1b03d7173ce03d4608effe2a19f1752298b4d17afdc0de8ec78a4a4042679'
            'bc6eb9cd0dda6f03b526e442a017bcb43b9ddfd7a1ee017b80025db6d3ad4d5f362343fc8ff901aff51778957d1d6614ad7626155efed227ac454b51c5aa25a7'
            'a46d82da5646f9989ce5eeb7aaa7757c89f44715f52fe31f45a882612f6014f21c7609a54c7e8fa1f3715ff529e8ffaf5ceff823d4e294b978591fd2044e759b'
            '552bb81d6ce7f0fbb1d86fbe6f3c3a01b7e5bbad80f3553684c918137e734593ac0fb48221d69d3c2dcb08115e0f9203778c047b2f16a0b64f0a2e96c83dc9b6'
            '59a67c95e6e6c78f259c234ce0906777333b466dad216dc724b480130427e6a0e3ebb502c49890321263df53cc72733b63815a12ac53a9d49c7cbf96ec5e436a'
            'f631a3bcfd77166a648e5230514f4f811436684d0629922382b73bafe90ca0a90be31cea57a2d9693b626c1387aca92f41e37481aa961dfa2add2bfb818af455'
            '3f6529dffc7ea92d2f82ae1214234fd767a5ccacb2b3fdfe16b05ee4599499ff1bd809dcb31ea008e8f6f4915a784cd739375adb66da5d2a54514d4ca67bbb4f'
            '5359aa8c9109b59618cdfce33429b2c7fbf041d03883ce0662da1934c90e9185928a64aca7554b6f75a631ee66e60e52160017e7c6299506c15f5a872e050702'
            '48a0646138eeb05eb0b8191bfc2ab88b026069892ca97f18b078c3e2a328c8d22298cbea06a8f491311e7804d373019398081feccb95127c5123a77ad5127cc9'
            '5aa4dac78a41a3a05b6ba02937f9fe6409d70565ebacf65e3124aa675e4f40b84b8b8dea79b9c31b382ab5d68f4064c64097e4e5fd7f68534c03c2d1c8a64c2c'
            '432d978b9c70aa198bfa45cd1e3c88b84a6b7c4c86ea6fabecc3d2c39851e82887c2d75f9066a4a1625bf50120a53a40bfc71da8a3bac85614c439229df58e2f'
            'feff343b9eda69ae8347a9484700fd3876ff6abffce5ccbe12194502641c5095eae573282b9ce1ee061d8f907aaa912d0504e5a1a00b0e0a184ee17927395904'
            'bce97df157279c4a546f24baa447e23c834e7ff408065e2a730569aa6be3af9d858bffd792c59ae9924778663c78b46b0c724c0392194794dac0ddea891a8eae'
            'e6d2754f9eda1074a0cbaac674f60e4a0731567aa0a6f237f66ce03677aabd9f09a0af6c43d1be0e4ba65d45d7fc6b0e913e382032c72950ad2a2e9bf415bba6'
            '426f1d9d762410ab6245cd333bc99fd79121c1aef514cbd51da462383e0658a222d07e5879fd44503a9853827340ebff9f3669bb001c03f96462addd83f86d8b'
            'cc1d241a5927ae25d986f608cb680657acf585ebee4544359f550e7c8b61d9173842ec385a0a15b6f9df84ceda7d7a0b5e20b2282f2432deb1b699bff6e3c792'
            '7ee7c23908beeda91efda2204a403f19b5320a1f915daba09891891b697cadb3a91ee03746ee0fd5211780f16eb4b25d80d93bd09f5347caa108bad2fafa5b91'
            'a834e6d583851bbff529d713b9e4f0a5cbee29b9fa59879f401f698d88832e515f60325437da580413d8e1b7fef12f89e153474f1a0eb1a2380a6f1eacca6cef'
            '0c52ac466bc1c5e6bdf0dffcaabb1bf7ba916a9a5ce175315c830f489165cc51f63fe5ff5bae91d45c632d0ad1e8a07e72438e54e37cbe05a314a06c618fb36c'
            'aac18eeddf571598364577a10d319a1716d03bb2758cc5fae001f1bcd4efe6219fd5fc372bf3430e0e8b051a18ea919c3ef5dd75b0c5a1bcc271c8a0f779ccce'
            'f0610699c84d9a8dc71528532a59abc3aeac66b3ae079eb1debe413230d791d1391937abd2d59c625f3ec7ca19cd1ff1d8ef040d6ae752bbe4b3750c1cdbe702'
            '66a410595253e66f58807391eadc45da1349e62f1a3df066f530e374c675e47751b2c66499677e388fcc03f75508e8f54f763d48c880f0459cc2b8b4f399e955'
            '45db5db3a5160be16be74de1dc3ee60a53ab8b98fad3f9bd9673e574d34bfd390dcf8cb5f68436584fc42cc5d35195a216c76a9b97fd8eaede6ec7ff99f39a99'
            'd37d105e838254928ef6df9787ee2975510078017f552b21d0733ced4ec14a05fb7f11685197c350c45ad5bf67f97334c9c2c75223e54177c1db9857b55d28fb'
            '1a3b537de661983355b4921cbcd702bfd96884de6eff83ed9dd75a21b0b71fa11fbd5f1c27da1dff3f4f5d8a98c3173b2f0958cf0ff560eda1cf6baf8b33ed9d'
            '06c61a85e1e9449d8d9750ce5bb7c6281030a5ccadd0567abbbf50b047c01d85782022e990d14420cd443a7c01b3263fbda740cebfdfc9a6cb34cbd65f951af1'
            '2e064aef7f56f52a172a19c1406dc192e6d8cfbb602ed931b406cbceec5d27ca59c8a4f0791eadfe350673078c6a93e61e7e92676f27c487a4e552516e3c33f3'
            '041e00ac273e0f99ab6441f3326bf67b1da0fcebd6b6eb41bd938ad24d418bfac1a7a333df7a413d0568ae4e25169c9ebc34b53c74271ece9ea4439da45a4c3e'
            'dfba1ecc77922d0822aa3a6d5a5048d4bd468b4ac39b6542a21c74d9d6bb1be6857bd2c9580e108e6cbc9665df44f5e515eed33aa39b83c769d554a5b1cc21cf'
            'eb0a2489e9fda885d48af61d3d8588d56a304e13185636f8f44443c21dd67f227edee80e46fe6efcfb1a07a13eaec921d9571b34308b2534c51e3f0fd75432aa'
            '4862f4bf6ef42bbc172eba3148755abe1f66a2d426f9d01fcd8c59c3b93c6f8e5fe3f70be5453dc7d39c2b320b5e89de0fd878538ccff28992f7cb4fb8fac54b'
            'c9948d3ff3e395b3604da204ddb0ca5e40f2d210b15113811a8ab07886efa0adb276485c004baea019f6aa9c2efa6f4e52c845deb8c353098e22e6349c745f70'
            '7c6817849b0a1d0aee6ddbefcafcd87d98359a12f944bef8dec9b5283f00e6d3968b148ba37e7c9971a7f0359e6b88c31088f5f747bf267732dae9d079608367'
            '104ab63800bf90da667cd03695218deeeb23e5805741b604e3ff124545037a3069080b50b4aaecc127ae3c6f627ee4a47d1480032a28fe79f1b6f86802e1fb1c'
            '0bdbaccde1772544ce2b9000e47b6c238e68d59940c229ff586707f1b035603a76a434153c39c5f85b08a04ca53441cb68441ba042c9761ee8ff4318afb91e37'
            '3ccdd9259cedc3493e7188238c2305940cdcdb7b5c1b6bde6c95210455ca8da1a9bc53a0f4bd9aee890f92306a601975d2a1668b557fd827cdc6f25270cd31d0'
            '3301a7c3f02f8f64ada43c4bb57f116879453399c23752b9562e2b4c7b475dcb58f29e36ed767e9b791d57bea5d0c96892b7d289c0f4c838b8a4d37e27160208'
            'e83a56356e5cc27aea184b53a0ea3a4bac43ddc98ad15e81d68658aedacc17e55cc83947f2658acea06f767923958a7510d58c607e8aa3ebba8066596c04ea5a'
            'f997c61769e20bba2f9cac9597787087e604cd538f36af78a349abf5fdc69e923aa44d11e6898cd0b3b0f3074c982c0a5c0ea43d5de2ea4a1f3b4f8d160d828f'
            'd0cabf90f86625152265588d13708c3cb304c435e1b385024ecf79a52cc629cbc76828fdbd987db9e481012aa6790b94db50d8660c8aa2ce7c9f9255511192b8'
            'a3eff14ad93188aa972f47c26bc85429d78af94fa751c74dc856c12e9b252bcfad778ccb8394a01b3bca25bffa390c0b04318a9c9b8f4587aaa1ace5b9830fa8'
            'e02de38aea7550424b852246dd45a7eb1b27f578d03f1802df62cfa4231dd63df921ec5ff8617f8acd301639a8ca8eec501ee44435fd4bb4105160ccdaf7ecf8'
            'f86389827abe5d484d081ee74633c4d7e4d1cf88b25a7b3f0427f3cd2c0983d0f21ec6353d6c7927346ad3c7f69e2159b42406612de4a3419888521de77187cd'
            '8c74cb7fe2aca909a565396b1e5b064f50e29cf64758652271c0d60057dd86002d545e1fe2916ecea4d13d9db9e5d00f57eedbfb023fe47a17782fab5c05da1f'
            '7bdc7a27cf2d4e29418e234359feb3f08e6624a56a7ad6b06a80e8f5bfe601d76919a1c1eda18de5434812680d336ef2bd587a0dca642e1e61a843762d7065bd'
            '152e48271ef17602b97b97d7c7e08ebfdfa5a3975126e78a0f5f7232c8b26d8108aa37b10b6b1a3a512774cc543ee5c45cd5fe93e5e2717d787b9f898e232a84'
            '48d9c5ccf1a3653b4567e1dc5008bca9f6f777d58413a78702104ce576005744174bc59f0e68dc32d46915ae231295dc608ae6c648caccbd2b772f81d350e087'
            'fe67dfbc4fa78f20fcf05175a9bb0b81eed73132a7d414bfd2707933b2e2b8bc9432717e909e8b7b18644b1db532e6ae7439fb22c4696ce9cfca53d8b773d218'
            'a7b85293f4a3d551c79fa65d37330402adc1695e2b78a8ec82250e3e2644b1641c618020a80a1c637e93273336c16a695dcbd42de95d5ee3ad345fbfafdf53a8'
            '80e980b8f40a9343609ccbbb3387c22e9a5f74458894fb87c5120f459aa15ca0e688029ccf63a4d523ee143477f9fd509f1109d7b08f285ea2f411423707dae7'
            '7998beb3e1ac9553842ddd8ad19187929d404a386f2b4f07dfe77e8cad6fed637773bd63fa4d2b05da11e6594f6ad0a94629a4bf6c4cc5383ceef5035e74c1b8'
            'f9e2793521241de964a47fd868a850de3563d334b6b5fe09cf1e34261060582dc4395be21146bb9f3b6bca4ca084803816cbb4235239c61ee04917f9d27c7397'
            '1750074974810b03dbf9e68f66495078084de09b675b54e856db14b62320a28a081203972c21707904eec0b515a0fae0a667c26c3f5de9b1312d9e3d18759f4b'
            '3959f232e0f22eeb26c4c2a10b602dbd982223b21310165e31f67e6a66f5a14cb6b3c2e7546d7ff53204bba99e953ff98cbea8fc44e85909c9b5d429adcd4ab3'
            '9f5a903d675cd6b90aefbc943b7550a209c0397a39eac8180631841657e2d4a127b718e884c0a4972ad12fe7391adef8bac1e0fc0eb3e81913a432cfcdabfb88'
            '8908a4e1cf3112f565b4ba309c7d7093ec598a0e7e3985a927a044a0aec2bf2b0f07bfc78c00fd8cfb4d2825c173aaa9e696c58d9e6b6427f966b4eac55b5121'
            '0fa6eb6ab877b163d882ec7c80ea31ae446b398e46d7c91c081d7de7a207982013aef701729278f357714fe01089c3c1b7e788b7c6a23bd143f8ee479f76f686'
            '0b6281f58baf9916164bd97f05d2e38a98e3cfd66050633dcc3b77dd7a6a2d58cffcb04333f9913b8b33ef12db851e846fc4a0d00a88264dec5aed2772ec6424'
            '537820bdd1ce698139cdbbcbfe7bc385acc7fd4f452ff22b75eaf0549cc978689a659ed5066a3747d18ac92d55a8e3a2cb019a5cf1e4c333592906f0ebbfe1de'
            'ce1bde0f307c6ea5c4a22bdc72408604deaed1b765738d02c8bd21cf1a7943c68631270804cdda2414e049f2d4eb47f9b698f0c733ada91c04ef2fb99f4ded37'
            '664f41484fad973e14608b1393dd4624ea41372067521c9d3d3ddb107506c772c9042155a6d0e33cd6077f17529121b3ccac43c6f18274ca25615a347167075d'
            '7479c5077785d2bf4a3f3d49f53aa5166ca9a967f444d8e427b413e831deda027d66deb18a7bacdc458cc7f8cdd5d9adeef5ef3ba9dc9cbca9fee5c76a88a7b6'
            '13ea97c24026c0bfde1de2959a157942afc12abae3ca24cd4df167e97f58b41f4a7c8c41b307c64870ddda5be6ca4ab5724f7c6aa5e2fc9397af0b7b28e49b0c'
            '950175b90a6d5c200c18da3c319816403c94650eac887261fb94f70752ae85ca79ef25bb575934a1e84dc8844ea10eacfcd10dfef164221b8fb82b9e3bf24ef7'
            '4d597faa8e575152d04f8e75db98ac9dc4c4cad9a8544c055c9ab4a265b2bf76c82a2f31fde7d3e66f228b1addc36304dfa2ba85fd29ec1f52436d8787188c37'
            'efd1218760d2e7c8a8c991d2bec3bab374cc8e9a2c5b908e3cf28494db65c799e01b4ab1d584e93b0a4b438ce4884d6661b51c91a9218395987ec4de65c62c0c'
            '3d1f996dbd798b0e35326f76d348ada1678eec5b4d674ad3ad398ea8dc344dcbd677329d94d4d822593bd5396122da44032e7f27ec261dce1c38acc7484a7797'
            '8b4d346e0dab8354cc22657abde542e3a1c3a95ef744af4df8b31b7633d3eca0776cf33a08f901d98cb787defd6e2d2c58bfb63f15a382dce5e8276514172d89'
            'a36527bf66d51e0a88358858aef9ea5af69f71a7172260388bad899abc7198139445691e31367ce7dda53eab5da91c1fabf351872c1fcaf5d27ba798721aff5d'
            'c94fe3e569b94bda010b23c58bdd8663428dd7da47a63b321da0ad40145ed967d0f7b370500e0ab01abda75523fde2ca0420ca993934ce784df90f1035c2299d'
            'a5977fb9a024314ade712e49816189f0bf261991ec0ffe0b44c00dcd8ad87d11c3300520d70e77d3810080d6361a4768b9bda9217d1cec373ca0eb75a949ec93'
            '4cb34ab4824cfe88b97bb434c3cdbb04e31658233b39f16d2bcd35b7ff014ef2a61735372b7311317afd8ba208c23cee037c6f44c362362b309c042e8096b838'
            '8e418ba16df8eb14293e954e887d7324893d05b2dc8e1668ab7f20564adc4a848c71965317bfbfc0fb7b980bb00c2bfa22b0d6b00f2c606e125d2cd09a1e2f88'
            '6da52c1fd1409d36661d7e8713dc4a81d45b7ac8822ce8ec1da18929ff8e3ce764e7c04c27d6e18a4d9f1a1316e09d0c497b1ca91e49a236c4384b6933b4ddfb'
            '9e9a983b828d332ac8c45d749e73fa35748fac9257d1d5d05025da5b025b5a9b648837770b1c4b47669b9a2f6bfd796be87ea6f00db8df8c0fb60dad2cdc2af5'
            '39c72dfdd154cf5bb4aa6b9df9194726eee294c77b4a55a4a0fdf705778c4bbd37a2c97e5b1ea08b6da06125936ecbe65c65dc936c5452a85066b6b1fd615bd8'
            'e405913c46ca9b9d1472184e7e259be6b7cb8780d1d936cc272e51326f4a6027cc601de89c2f5f292b307e9da63e2b6051fedc2012f6fbadbf85727f6b6e166a'
            '7d4920746b17e1dfdb6044cde608ec5fff1b4fc800b701ef1ab1194a48558194f57e2fd8e0884af3173b764c945aabd7a2e92683efda5e44eee1131184b5ffa5'
            'e73465d9023d584f9e5bb8f58a8f269e4b8ef50faa9c31e92d9e3bfe008c5c432fea975f849e8e4ae57510402c5396dc8043ec0a3be4c9438d1d1109e76f8b47'
            'eccf6ea1fffc0f3bf616b570580c22dbaede54c7f08e2f46616311828a8c2dda2d1463b543ad59feab087ed4d1608e8cefd55bd66bc9ec98006b5886713faba6'
            'b3f4fcb1ee205a244be8f55acff00968b9352473996b4c5125d1d3a4f61539725866add0d6c00e2393a969981234fb6edef5e0dc2068011f6a3e97145d9da9dc'
            '1fa0a210313de22854c5ec193abc5b39a35226c0dc7518d1629dca31de82ae2a330aa58a726726fd632814fd436fd583733d0b7f97b7ae9a52a8ce9eb82b380b')


# vim:set sw=2 et:
