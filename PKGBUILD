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
pkgver=140.6.0
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

sha512sums=('ed66657bd4b2d94791892261d7c0c0d950b4f630d12ab28a777d93393427451a9aa125e5a01ee15f2ac0ff378d0be074a08583dcffd35609112ba4e6f9ada798'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '325b967a684f5aaee8c6df5db6ce1315500f57f80123b8b1876b37fc4c416204cc0443fae65730be474c8068705f3090be83c97644cb693311883bc3aeb80c69'
            '1dbe7c2f6623250dbbdb5e846d78311132d0d0e083c103255ba6790a649d7c719f8256b40eb70c3be0e279c15e15f820e0e9087ef6f32c2ba6d49e08cf705ddd'
            '281fe9f3491d0445e51bc37f6a4e8a69c6cdb44aa8ef5a264c9e1435cd474e380163b38b0745de1fa5d810deffea53ffd95242d0d03c4a536d471fdc8e6e5b7b'
            '1bc3862c4261a046aa5cc30a57fbc23d04f06fac82a5975f218bf4fa509f6600c4d310f31e37c77874badfd5815cbade21b3713123100e2a0addbb53fc3e97f7'
            'da43d8b07fc219336918aacb9ead52cb95c5d48aca565c6b8c68c22193d7176583e9b01acea699315126839f6beb057fa8ca3229d9cb3839e663be4e32050ff4'
            'e635f09f5cbfe847dcdaa0bbd76ebba50ca7528df777eaf90629d1d72dfb1b9652467ba1f632ca9eb4ffac4773658f624b0cc2e12bb2288de8f4f335d12afc39'
            '24aaf3f3906f9fe4999c6db9118666872845799faec277b2a3eb08a050324dde891ca738e2b0a2ffe7c8382c97945a92912b70f0597b585981ce3932a0cb3c23'
            '96c1bb882a7e64151be1eaeb1199846c87170b12f31166ab6cd4ff7c83753dd56667583bc831713dda132e04b20429191ec8ed2544fa1293d8028e0a15dd2827'
            'e4c536ba3ab528eb635688d6b01013abbadf9d409dc144273188d6dd2715599181f615abd63c91987454ec3d7c5192ee0eabe151ab8872ab4120247da9cb78cc'
            'b698403c519c25c57c97444f3d95d2902c83380ae16f750e43d123256726bbbbac4a2525f858d3a7b2a45c4a66fac7ade9ce7ec1210dd4ed87acc0708af5ac3f'
            'ab5b68a7ec0263a3fb76628f00ecfbfb2b95830cc984d1a2abe4cf5f43f1d0ac92d9eb59043aea76bc4744891ca43b2b04b82054cd43fac7e770d0a326d3d4fb'
            '55be8686f4c9e514ba95ea6505c520a0cfe50b5aec1e56b564b06ff3dc100adc3b4a55dcf4b01b913291fe7d1ed254e7b859e97ceca3c25769b341fbe4cc56e2'
            '0fd9160b08489312c7194ada5e829fe54a6b29c8553420dcfbbc4c164ddc859ed916c289af2d57010f404eadef4eec0dc1200bff01341dca74d460327980a201'
            '007d93fa6a7845a3b41f20a1902e1b0720608609d3e63c490dbcd519495e033665b40d0b7d3fedd901011ce2b8226733459b0fc5d0abe8210908fa5a0b31165d'
            'bc48e1bb1afe6caa4034845de3612febe36322579ee49edbbca723e64efc314860d11d45a59da52f5c7189945b295d21dc0a87b030b23ee49ff109210b56ea87'
            'b077711270082ff67c92e8fc0f0b4cde770bbb5bf9a06ced5fccf9b97dc4a0e5435c7ad1c7aedd931075b44a1a1a85717af242828774917652ca40ea29fb4a27'
            '1ca5895d6f7e07b753cead9c2c630dc18fe90e985cfb1d9ac1b8587226d2b2d099e5bc210f4a441266b2b8fd3502f9d6f7af0fd7dd0220d2d14cf16b3c94c60a'
            '940f215281a2b4653c6abaec195c21ba277ac5f35e448822cef1902cf989c00ea9f52f023a95b33f2ec1318b2b17a58ab6bcdfe60301adfaa5d0570b730ab387'
            '0a1d140213ff95e0d6a35772f3ffb3c8314a852b2f806f4d517d9ee1dad1e65648685e0e4aca896d3bc91265f89e64a749ba79d2d5db3facfc7ba011d9509db8'
            '00e70b869f9a4b787e741ff1591a4d3ba3eeef856e38f475d53eb8bf43a32284d757f5db430a88cd9166700a4bde7c2efd112399050f41eb161363233a38eeb3'
            'a77708add8bec6cf971178b19ebcbcf4b53f1f2fc98ebc41334fc625ba1bb4e4c596a0e258cd513e7490f5151b4beeaf7fe50015e7471b0d29bbb26a4940a2dc'
            '8a9208844e57b9c7b4f2b07dc6781e1d2652cd63688b9a5da25d544b6e0876b70ea5b58d5712fa7bfc271c72883bc178ae2d70c460e9b5066288b9160a02ea30'
            '159306310095c328eb50174da29ccc75e5ce92c207a78403c61d1a5bfbb20c31848271feaf046722c03aecc269ae08b6cd1bf808726d6acc8446c423f2be6c88'
            '878b90f7eb9a506695e32ad8daf6164dc909e6c4640ac01bbf13cce78ad02002717dc8872b320c1500c9627f9f9233327ecbb96a00326662256c640c144bb559'
            '43aa1e098dc7db1e6993b75b38e17de707c1c6db4818683f8ae43022d541abf32fe743b87c39b71e7355f01b93deb3323b8e657df3b9f4eaf583bdb64213f8ed'
            '11d4c2576b7dd01eb7959b141fb999e18b9c0eb1fa026c0bb0a3644e3524efe77994358aaf5239619a7296a94d9334587b00b07c29e256915b025976a9aa0532'
            'a8e6f33e129d7d95063615a77f9777026554ae057567b3c4566c172217838d58f2ccdadd44173ab62be218084bddb050c3e1ae5c157dd4d209827bfc6773cc3e'
            '5a4cb84a417ad1a0d0fd90d1b468a506b9145f6deb9457e20e16f41ec493a86bdb34cdb6ae5292a79597966856f23114b3302ab425e270fa46609fd09a175354'
            'a180923c86f0ebe45f5150b365395a6ff261e38c768ea5746fe3259eeff41810b654ca09a3bc3d5c47b84a99a6b3100d39bfbd70dc19f192fc43d7e022ed64b0'
            '18f1a999ead8c4768349a62f0f162f969c7f5e64af5ca9e2bd7b840766d93f120dfcbad0fc33b71bbc3c643ed79924158336f929e7f0a6807ed4a32764a51c00'
            'd963f112e95bb1f1baff64ae4d836b2af54d1f5df96f6d5a3a351549bb3398ad26620eb32686d5bb92cb91c6f852e35cf1dc2f357b745200b5681f4fe079cee1'
            '479669f1e818e420aeba866e38bd5b813914a5066229fdc29d471322fbea69e41fe3c8428e4e633a219ee9c4bcaf87f6acf7dac48e6b459ffe403888adebd7c9'
            '70780894b0092ed07da49c2691502bb81ee0dc9e1dcf84dcb22aab3df3a4125f1de0667eccfe748b6564e367b994a39d0f9471167fc8c8def7026d8bbe4df9e8'
            'bf4d5e2922431f63e859665627c76db19b4e0b7d103c35664b1443964a247c57b0537172e14e00f084e160bc9ddefc8cde10205954d850017968be93648d9a37'
            '872c32ed554fc9e659937bfa7bb7945e03e5d41aa451d936ad93315295a65f54a9313ee8f92f42edb24982c3052d3df5be6320029a0394138bec77a96d13068c'
            '5ad3bf646861ea9ab2174ddacb418259abeeeeb62bea159f93ef35d21a93aacc75a7112ca3572e03ec6406b7d065db2fcf841b58a6e7a90e85a47d41091fad1b'
            'd1dc1ae468959467baad86abf2f930eb0860fd4f180512b30be205f68021b4460dbce4719f8e999dc1ea7c2b58c754b1a9d16d8f8d44bfbe4d270d621ed74bcc'
            'f046c92f0fdf3d5a0f41bbe0e749807c3af28f5cbaab1fec83c7627d888594863e2bbfa14e376021ec796ac598ce5a7fdb85b5568560267d9eb162f531e9cbf0'
            '064e4b97d63e5c9699d0ff1de058354a949c19348f81aba951d37a07c4007fca99182254a6ef53b5d488010beae261517f04a42f05a849e7aea9380ad4e15de4'
            'b6e6b15210dc0be5c9d3b914a679cc43a281dbfd9ae44be141d61be38593fbe07b9358bd94b0285a352d914e561cd3b51dbc21098e760868edb78f36464d2f0f'
            '8fdc596381b0c90d77b3e3a280958027e5640ebaf0f66bcde20d9eb9e5a7795079d100d8f32633f273d608fd296dcdb6b9a4b88a17f69339a41916a81d3c088b'
            '4e2a1c9e859c25a174ad91e4c73860352724093072a3dc86c85c60e9b9df8aa6a605117f8a2375302c80ba05b860412d46a8c0bf2624b713d2d28c749ce69150'
            'cfac8882954f35cf57c150efb076a9a1980b6df3b65331c41d6b5af665b0e1459d871d75d57a7cd25e8ea39f4fdb303bc7eef1974b12e8fbeb3066cd8e6e54e5'
            '625a45f1a122320497aa27dc69deffffb6da1e1f2a164fec2b34ffcfce15e94b481fa34c99caa0e5ddea68ad6d7520d8e67c5a31285e89d8692ae5437e2d0fd6'
            '8a1e915098a42b5c15fbb2705026a96b2afede35dc6f99b36bccbbae4cd13420682f3fba4c98d6ff021034ae1f514bf00923c22582498ec68289ba57194a6b20'
            'e1035ee56191d63ac95c445f324ace7741c22fd19eefd52a9f9a975a282ebbadf99f7675455ab171bb86ce710b955ed0c5de1dd8cb42b548b2fffb7bf3412bd0'
            '7fbfeee050beb8f5e5f20fed3faeb219ed3160e31fd868be1485929bc494b3c0a63bd5c8a8d6fcbe1a209cd42f47bf8ceddfe6c6a70c834e6f02ade4f7aaf9dd'
            '5d0b0e71046fc979043378255047403392c790b5d2ccf5bac8fcfedefb1f45d14c3552ce67dc850d31eef2563a234186581e53217ddc63609d8482066c5a64f8'
            'ba42345bbeaa89b64a3a3d4ae1ff5e5336c0932d36f79048ffb35a8e27dee06f96e62e14ff908ddca47d33a6388e18de54a6853155df98a1c8ab900143d5af19'
            '6fec19107f01da97bc4d9a4c67534397169b13d6b1dc2a5ba64a47b2a5c06d1d314a4630dc1af21d2f26afbed3aff44921dcbd96e08de8312d79232a7f58f2d2'
            'bd2f65723cd0f5697674e157ccebad24d104e3005f6a84880430d4f247b70a2cce636af43e0fb37db725e66a6f3ae3ae86899a52743687ca6776ce3d978d3b54'
            '866a5caea48a1dd27c40d91c50741ac87a20edc13a6220d264ed78e986eb03a2fa913b48724b0a4447cb70bf2c5b99ece6dddcb005be9dce2f62cb09d8ac3512'
            '5c14183c630e0676b148ff5ca5d8f03fd8e8cdc4c15f24e7aa48fa81832d453e3727e35594f309a5674c1fc52b8c2d36b22744bacd29f528a5515d1acf01c18e'
            '2bfc1188f5d415c459e67610d5d548031779598402084b7a10937bf031359e28b786b8f481da96044de67f8cc31f45a268925baaaf020be86280603982c7b15b'
            '94d2b42cdd962b066084d73346a23fd2730cdd3cec714923340caa88ae07e3c2c2f17411d3265e69adcbc5bf51f59452d0aeafff15a075068bb09d91685a1766'
            '7e2378b6ea004c6a4196127e12bf8643edb73782acbb6b113a85bf76637c1d1f1ac8601d5dcd34aa59ba34fca43424d7d63b1fc7a940f34c89081c3527f619be'
            'c41474525dd6d2e223cda8483dee0c1901e86917b4a11f4566c4b2addc22a72362b22bc2c02bbaf6300f41e8a1039d4c127e6623148ac3e5c59b0d26dd734b6f'
            'a9578f37f54a1780558c5bb8e28b5b2ea411c46e9d902c43a1be6bbc223fc3d59747ba2ee86085801f93271cce666008733f7162881554fbd8159700e76d663d'
            '02e233d89506f646de826f2a2aa17665875f38beb6e1a0eab2b6ff3f46c4629872668e99938738548ddcd7ca636ae46466f0909d87128d22afbd49fad467a0fc'
            '4142d507a25fa908a0f8db19b63c57a324ed21586538587992fcab56013da0314a34dba05387caa04404f1689d2063915f4ae773fbb714b589c5d21378d5348e'
            'd2d3d0efc0d2a6c10e8f5da006ec57dcea135a2d43489053cd112f5197a179f90546fedc75fb6b2d8c4342e5267b050c82a6c32e2b26dd3261b3a5a99eeee4bb'
            '96c7606eb711206a7c7d0f495aed81a358e23e0df5f3bb92ad5df93fca3d42ea3c0a89ee9fe85db2a3d86cc6565b29e20193ca560d48d992d345f19ac1149992'
            'e653e0794a3ead76dd103881bc9bebcb03441229a2bc395ac1ae48dcca96fb7f7e60481434fd5aa9f0a0f68991e9e3be64c26c99ce23a2846bf3560933d3b9eb'
            '577c4b250d3d4f9814c01ff5e8387af3ae56b8ce6ed121902593eaf800f1c44b20ca80d3fcef38a71047309578a35476b64a8f135b2d3ecf60330f14401a291d'
            '67727112aee7a8fe837eda864fdd62ecd3628f2b375ed9fe4d58803d097a3f33790541330bff70af379143be694369e665620b344739abdbd81d8e3840850a72'
            '6162b766e2b732f0d5b571ff691794ad78f64fc2f3f7ab393182ac5dfe8a79ce9221d81fa66372564e87e3430b0b32fcc5fdbdb9c561aefd486e466814410d16'
            '611d4213e26966978d87fbd377ca85bf62ff338927e47049b66411f463bfe8dd9a40f8cd379b76217fd27785b35be8a1c9385e51af5eae8b913dca0114602d97'
            '8f52fb0130a6a36c6179c1922677a41211045afb181ba43ee393d98f0753902d78b088b6bdfc2f984aa752f24b901db1e6613f077a75ae16633f5918e3186bc1'
            '6cfdcb5af955784d65530b280c176dd21f624b9831fba88a488a882c50206657aee195e261b4aa640639345301e34f8d650289dafeeeea6b9a089d2cda30cff9'
            '467b941397cd65f1fa633ccebf6f7ac52667584f015acaa4863f5121e726393fccde78046e2daddfa104cc098d8e9b380df4f938695325873c6eaae078c1e6bf'
            '593e5faded835c1790072fffb13c3c44a63fc7ce8678224751ac321f72fe4f354f0db1d1e23b8179cbe4576ab968cfd5238885e779773d16b6c3d9159aa4f56d'
            'bd9e7706646a720a0239a67112ac1f3ded6977778e4dfdcdbf2225df705d6069dbf33ba7637d7a61be477bc15e95ad7021b7d2c2671aeafa0d92b0b9f54d6ff7'
            'd1684c310d57446c6e58f40ae2de31c88c875f8288837f28ee9af1c4a68f79730a9f93ba316300a8c8081f8e53a84bf91ddcb21f6246c48ae098abb187e644d3'
            'c31804efb4e230e87187c53f977ff62b2be1c2a7f9e97368324bd335d919853090dbb03ce8b65b870ab6512192bf53d911ae6972ffbfed3929972dcc23a24e0c'
            'c98996d47cf3002847eddbcfe05cd46dd47190f2ff38cef3c4ca56a4f4571a272e3aeae676b5bf498c22dfcdba2389d8d96405592a143646e5cb388dd6808bb8'
            '93c4422d081c99065eb5f9b64e120b776da13133df697ca2361ce65ccb422331a52b87093ebe9b312aa33f3e7f4f40a1351b1b55938d878e13fa6d828a8b323c'
            'b2056e77eeb82d9bf97be65fefcaa538d6ad9d9ef8dd8d7ca1579b50f1d730aa7a5b6a0d4159bcbce37f68bfd8e7e8556465edb8325b9233226fdfa531b6519b'
            '8f9cbfba18bb23705ef7b4dd88c6d312f523bdfcc3379a577ea333a96d55fde55d8be76a2b4dc29c80820704e81a6ea7373997aab7db3907848da37487bde6b9'
            '64a8b42c8ad1c5421e69cf7922efe615d8e710f31d6a4163c4ee821c35d610984ee0ae7a91db598d590599e3c4488da91ac84447055993e24f0a23bcd6616a8f'
            'fc941061711a2e81be3989e0117c8a6f529f94da0b467c10361f8ae14979ddb6e4bc1c44f01b7c7d41f09a864bc79632aa5eba837abe1025586bd34fe5943a29'
            '37408442a10262816e7b489c1f8f62a3ee527d738b3483ca2475a836999fb1d0f6f29568d5e6326fdc60e4ebc5212409de95fcdaa2647ca5839c8fb128dfed7b'
            '05dde12c266736b56d7788255815eea4ea5206bc083ec9a782c24004da17fa3e27378c9c2ef6bea0691e8ca997edd1b60d13fd470f7ea4ca97c755a967f34222'
            '524ece8d548002132921e8a764f5705f7438a081fd0a2590dc9bb9de4778af8e3e05018d4ba21c928aa8b3cc27a7439eb8455a584f36a25e066aa6e8389b731e'
            '87e5ce182efe37d528c8b3e4171c5a259fec5aa3ef8ace167d526216d87ea6bc9dcf570f0a19bfb21dccaa4cd9c0ed213667c39b6a0aae8b169b3a3cc4b416e4'
            '3bdaec9499972c8fac71c6b0706c29af18a6c04d5035b06408252906e799c2daf00093c7fd1bf81f2189b3d4d2323cccb59141b9658ba4f0423f13f1e67bb3f8'
            '5679fee8cf51779428e2a0fdda2fafbaa83f8d44f0fb77cb981ed1cfea1455637a3b0e3fe0d7bbfea76a9857aeb387d051a1dddd54482b63993bb3de0c606051'
            '8aca069fe2f94cb643a21acbe325fb7826a14e7c7f22b677e2f6bc4ba5cb03163451dc06bc1a740d10a2612de7a9478d3133b8788d0f3c288f6eb9f87783a750'
            '66997e21ead845f401366522237a08b611c7c13278ce4e538bf34c5188feb866394cd2e608e8f844e2b20f15266dbafede68982f55e97ad634802f684c30fb04'
            'f9cc848bcbc8b77563c7359cb1660b88e9ff25575ca89ef249bfeb5b2c613f917dfa895b7e4ecb2e4b9b0c8d99cbef1a325008b4761e44224434f274180d70de'
            '3ff48809b272d5f529c7c96e9e238938d0b4ff369204c0d37c8dddf34ae8e5e1591bf24a63fad01303c8b7bccca70bfb03cfe56036426864cedff4f2ab64b5f6'
            '62f16ed2d599c9e997771db32b230e3cb5b45365f737ca787e6a16a6a002d6488ca0f575ae54bf2b0f8548941f042fdc79e2e4cb3f8deb007b754d1c2acb4f9e'
            'a7f0efe469871a06e0176565f799078f10b61a3364672eed01a2df520bd0d5c27e0d6f86476cba8bb9077fbca0f5909a1770e3d8763980ae66f45f282a4fc64a'
            'b0983b9e47c7ef44c5611a084ae1a63699708c30e57a86ead62f98cfaebf84246d2b2a72c9c2af806769b9ab885a736a7efb054aeaf3e3b20e6d88a163143af8'
            '8f50649c72259fc5b5399f72fada263e4e9b925cbac09215897f160c7b2e4f978e45adc7a354104f494967be41efa9b85c81a36f4307a9c79cfecdef2431fa79'
            'e4ae028b1eb5a7400f512bfd053cb6cd55f6fdc79e5da5ea6f9f12e4078278579faee8bc9d359ce267bab460639443d0fe1d8c9a4f86cddb1de48ebb8fb20597'
            'b444ae7db7c1853653367ddf885e739cbfcc4beeb39745b0c5175d9daf14f3e892ae2e86fa0f0a54a4729cbd8139d37161173abdb7335d76c729c97a65f776f7')


# vim:set sw=2 et:
