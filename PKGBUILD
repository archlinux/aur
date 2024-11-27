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
pkgver=128.5.0
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

sha512sums=('ff20f18f92c5e9cd1d9eaf7c38cec61bcab2dca8dd2817519b712bc1f760b5c6e290212acf3289152764e5130e01626950b7ecd9327b2c587b24a246591afd67'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            'dc50d88ca036a4098e9b7e69bbb381761fef3cfdad692173b061385a906b10ded763fb73f173f18fb3b5d78bc4ddd8fd42823156d65fe7e218ff2f8385bdbc19'
            'afffb4fd3146ec2545f603750b9cbd897e80c55e2df207f7b3fe9e6b10a008c41934a611e9508b41d4e63c97622ebf12fbb224eda0a74e91202bcbcede620432'
            '8c974391d5d94c01f5ee2b01d6eaf8da06c2dc9c4ef942819192b5b18e805086afa10337c24c312254477571a5c4150ee165da4cc916c80190fb989800cd2d63'
            '761ad7c80494c443bdd3c76d479a9744b11687d51a7bc6562d2d95114dfb099185b925a1d4a9c52e36c1ed44217c1dbf390d30626e7366dd1b423c9d435e1322'
            'c638049b7c1db50a80728341f918ad3f70740e423db2010789ff952a873e1f0b5f6dbbfc7f37da7bdcfb2e6fbc46c5e966b702e75503acdcb4263148bb336ace'
            '4cf52a65a3d0a9a0cff24823ef9a1b858e0bfe508a57ea46b3b46f41d12710bd0ac661d5fe2be0ef1c17f853438828dd1004f0e2ac16d8cbf6bc5c69c356cb6a'
            '782355f6a7a93e840fb906485f49b7bdafdfeaf2d81fd743d5a05ec49f85ebc6a37ce53ac8f1e068ec4ea07786b807b2837a892e8efe78c1f137b9f807228d63'
            '5bac62823bcc93c1d64ee925852359de2ec7c930f0bc33b81749c0b64477194447f54772d08102eb3eb9b07c76273c0bf18e6281c53f4ff7dc842f9aa7a7f6eb'
            '6fe68221b1b1dc87d3fa35042563d3050a73897843229b70f35f12584d955fe0bd410e18de424a6080f43e2c449b1b2fb37ef7ff356f185d6c717eace7270c25'
            '5de65ca1fbe41f554be41822e46471168ca64e96259cbb63a66d52391e3f98788df5968990e1030db84016df93366070e70a5af5c9b4177372c64fb0264b85ff'
            'd3076534c9e0f897eeb9b49eccbc186521edfddebf6da036e0e56b64e20f104031aa4b38135f72f5b41096c9eb567c8fc09764fd4ad20691a38d2a58f5df62e9'
            '7f99ac56b2a443cdca4655ebc66272eed5abf41bfa952e9a89456c038b226bb715bb6f2302cf249abf8bd3fdebcf93017faee6aa0f3ff2aaff6a644f9d1a60c8'
            '35b7d35a29a18df59a5709b708f12ee7e1e32c8805b646e5afde5613dca3a60e776cfe2693541ddd508c7106e0e16460bac4cae77b7768a2d5938356a86c39f9'
            '57cc700cbb36bcca90cf7bcd65a9f73a6f887f7f88cb380ffe0bae520df622168ae6b3f8cb1cb596b1a3c56c98eff19d2e02e17df71552f3844613fdece1e60c'
            '0cf1e0c3a7784a76cdb73c486b80938c823c07263f944f04cdcab356d9b55bae1f3112c98cfd296b7a0129260e7a11133982537947e9feb670a68e6b9b3e0e22'
            '93f8fff7e76c7f1b7c116474690870c413058ff2d166bfd1e9377e86f529d06abd4b0c6b0df4d104718b38b84ebf945b0865055eb33f3ec5e92ba5d1597943a6'
            'de3cc4c85f0507e66a2c8eeec1aa6b7e69dc3f3ec5c51a205fd6bec152a8299c68b147807aa18a6cda17187d004bf4a9cbd8d38c0d71cec5f4825a0fddbc1a74'
            '6f27c2935bbbdfec7247399397bd99b48582106abbd20b5b3227357e713001bcb9946e9a34b914a8fd5486b451c12792771776b8034159fc34a86df9160cd5bd'
            'ae9c5c5e1272d36803a807191a1e30ec2b53520b267d8b7e5664983f4b56aae541586a23202c881eb81a0f3e30d734e6c340d42e57c72083c750daf064c3e0f3'
            'e8ad03e664e000f89ab53ad626f3afe0589090de0c887470db74a9e951c3c1968e23f1d2db613d6c974af6bd93b308798410e2f429e81372803bd44ccd1fd357'
            'a040bee5db23230253f6b045890a89683cbfd0d20d919465af8fac6fca7084acd05ccd5bcbe888f5e9adcae4906409b5741970b642052e9de96601a2f41c6b65'
            '9323d497c6d5c479d5617e1634ea8436ca1e6dbc4d828da577abdbd95b1ac2c93e4abe656dce47052948be3432be7650a153fc9bf9d9b78377835fc2be481629'
            '7a78b398305f3d58abb42bc67d9fa928001e70e9c3a1df6d9266c6e121f0d8c8408f048f835222b7d176d0afe93bdadd423c89167e031179aaa002e063f77e75'
            'f4cfc0c0ca1dd6a9270644d23b514c8f030b6ff9478023179f53195b1b94512fc71882b4cfdb557634c12fbb533282d38997cb022ac4f31a19e8be0fccb42b0e'
            '7e24898d23bc73a261f6a28181e500d150f2e869700e1776ba1d97e8799d96498f241b362a0cc073ab1d7115cf238a1472cbfa07216d607465fa739783fac424'
            'f990fdbb8d5e09681286966c11a10404169d46887d144596dd1f032c61efc29ca8e9e89802b257d60821ff4adcb3e6902e5d0705d0adb57b26f6733e8cb35159'
            '5b336ee371315f8d80b672a7154b2b13fc35b261f228a787c9cfb5dc136ec5bbc01ff655eeb167f4dcf3f082a082d7f135798361a9e2a32fad271c08f7a1081c'
            '50251175c84c1007dfb0f707bd87895840fb016ed0667b26d4b80f9f4be8c050998585e0839ea6b8a6aa8fda5afc8389502fbdf08b61ff2afbd820daf672f118'
            'f12d1e29d2929b6f09c657f49da09a260b5ffdd93ae72130460bb00a84a76915f2a79e9fb2f14bcd7dffc1f83d4e6d5c44f1e6a2149623db2265c734cc024c9a'
            '76f0ad1d9f88149d532626ee25ce6683212b07d8bfbe6080bfd708a98c645455eddd4fdbe143885f978f9301ca45d425e2379dab14c698d635931a17f6787a40'
            'a0998cea78cb0a9d96aa787ab47dcba165e9dda9cee45cf725d23dfdfa284da43e7aff532fafb704ea256fe6e3271d75ead5358e694890b8595f4b13fedcfbac'
            '7cc4522dcded7a265cd94843fb1ad2a94fadc3e809b6c18cb84982ed5bab0f08a95ae297a9439898fe01678938cc6b25c7d4e28250ac48e8238c0f56e0fdc154'
            'f7ed2173f46ea36c585d4476d762cc5e0107d7e8771a35568dba8a1193b89ba7fb7ab73cae558225a3ac462a0ac8c00f42369432d44ee2dae89a4929eaa32a4d'
            '14f3f955864c12cc43548a89bf82f2b65b6445527b1d7a2595ae76e78429fb4b579ce23248ce746ed8902ea995e57ff0089cbda1f2c4f07a0c41aa0e8ee94465'
            '34d8b89c5ae76052b5da47138b2542e2670e47c2ad461ee767c45dd8a285ad583277968443021a8fbcd71fe9edd81adc9cf02b896540d50fcac7f79f580b93c1'
            '4afa5c43861c85516d0d063c28b8b4da43bf59da499a920af294664dd6bc632f5a3e790c11737fb9996c3db15cbda407d48a98f34ff813dfae23dc002ba719df'
            'ffaa8aa89d94c697fce066f2837555030d19994b48d6112471ae2230dffc686cfe8e8fdbb548ad7d992db75c6040fac9415f9e949984457ce4d0f79616675e5b'
            '9bb4630a633044c4a8b0558dc6ad7b92874ce164a188e3b5903e7382e9a04a7b2a87facb48e4039bba21ea79ffd0689821ea4c6ee4f45bad8b9d90a55b0bf9eb'
            '9937bed8830d0ef8bc2c72f3e2b08e90a16c72f4851ec7ef16b889d7c0426221ad6b246b0ad09ef4721ab6590a5d0fec497b9789d6234c1155d53aa6daecd7b8'
            'f5a5cacc030014af8fab494c0c2e5bfe99421759759cd134ff90ad9e914824dc273f381f6e24a48326f75c5adf6cc3127812116dc9f75fed2df3b026fb73365f'
            '1ca9ec1981e329de91c1f3c6c62e8e7c3ee171fd481f9bc25c1ef87a8dd0cdadf58a9f64236c57bb7d3f2d2ba98a53d0cf2e6162dafe0ed4f7f4f1f3e2d5350b'
            'd9ec94d27accf295212ca682b55ab21adfb7cd3d8137db0fad6cfc98a41bd88519dbd4e1a30bc36feae675985dbc1dc7ec2cd82325c368f6d35c766aa33d3339'
            'e8ab29952f4924a7350c4d15c0c91d69b7e1b41daa92b09bb3cde955263229cec2ab0ed196ab3eaeec7aed88c17e6b1add4411e1de9eaf1f3a863289b276ca6e'
            'fc354d9eaf2689dfdd87a8f3ddeae41c6b0e58ed179d591345281ee0626735173ee7d25fe6bceeb7eaba5881473e951993f4932feaa736c2283026ccbe7be8d7'
            '5d9f67f42ee0af60554c1b60af890ac75af740fc9cb8c04c3d1c4574e124c9500e1bb56c22159dd04d3e1984e443cb14c096b4c26d4604abddc6ed978e422448'
            '184a86cfa3a9d7debf10da804f5f1d42fb3c67fe9c264031c8e67ca8ea869b08c3bb890f9baeb4d6bdad67a59ee98a7517e6ea0ad5d10b3c753481847f0dc074'
            'fe8162d18b117b12da18ca1f6802fca8835aad6d0186de5809442538ad77d27dec095c4bfd79ee9fe49bf263eb91bd54c5b67e9899a3ef620bcc7b382db05c3e'
            '8d95b6e694da654202f73fd6d8190fac795885eca3e370ec8e0bf77c36d3c9fe44e2f5a8308c6952908af8ac60ab5e672935b6134d31ceba53abdcf792fcc10a'
            'fe9b9d1ed7f21eb4ef64c82d7014b851789416a2b0d3080c79a9d5b7215e1bc62462fb1a1da6689576f7f7d4fc05cb5a782598ca0533b42f91020ed60b180e31'
            '2d4c6be8cb0251d0465cb533dcc5229204e84cc10d3e6057c8811b9422f79c0a3a90896a7054dcb36861bc6e6c759d6c79570da63ee7439c4e13ece745d36a18'
            'ef823acc34c30ddb7006a87cea14f359c967ef3cb17d4e790c6fad6e730f7dfedd7541cd61619e78633156a8e79d2b551afc684792ad4c1308afae84b700933d'
            '7b7feede040960fe92cca9e106cdd8cb2ec0a0463d679cdf0820a963b397c57d9cea95de58104aecc39f626d77d1e058d9d6d05c6a8040fdeb5807ade3ed1779'
            '31a394af645cf4d8a191038879151c1a10309b55a884869f84136e7df439d18868d00ffc73a90522336705cb2fa9d0621ee3883041690408ea5ca48f08cd5ac7'
            '9fd6a0578992e99f9f2dbc95e90c17339e70d2338d6511090fbb2610a4070522759e4df71aaf0740d3afde9b187ea8ba4e113126cf8cf435c3d1f80456becd92'
            '1cf5c2e58687e673e9b546ad99807123a635c9789c0f15fa200890fd6aa7ce7c5b5de58b58f5be47afc311c8d0da9446f5d6d6eb2b34dc1731012c7604698369'
            '69c6d300c8cf4f364e7291ed25d5e5a6282b3f58f71c0dd9c92635f12a22aa98b6f82eea13d18aaf9934d513acd2958e6b3055ee77440b678b58b49410eca7a1'
            '2631b071eaec053452429d4fac20055844bc6474fd713091bb6a1791b15f34838646858e4d1cfa6c4278c53c4d83a0ebbd717944c97c3afecfa14ac71c712b62'
            'defa6796636ab668274210af2e68da9c6c66537affb67531b9c43c5b731d0c13e47977ee4bc59eb808584c95a533349b2e0939020d02c0b686d1669f575422be'
            '2d15dc9a2c80f7d59d376538ffaddb111b418ce131d93f0728503ab8e322af40ae34b767d1f8689e0460b8bba406be9e500e76c4c19531fab752d5dad0bf0ac5'
            '0ca54d0b8ea73c5e68747b3375dcd82a1f3c45edbecf18d4d9f0b5648085c4b5486c8e64c2b2a518b9236016af7f83de66cab8e5dc6aa964bd4f66440b8953a2'
            '311c2de485d4b5f1282bab5913efdd34c0c7413671a503d381e97fb894bf724947396d03627a05d37b5a0d66c2ba770cb789ec28200a8856802186218b2e6c82'
            '70cdd38beb8d6d0149f5ff5aa4d2763aaa0b7c4a1c7d61a5c8a80cc45920d204dcb4c53ed22342cea9e4f5d5f60d733cfde971f76bfe5c17e187ea3d983a37bb'
            '06197be4751a09836947ddb13948d8173242fbfb76d0dc288a46a73541b7e30236bbc84fe9eed9ff80424e71b57985f8ca5244a7323615f83ccd01752b721ac4'
            'c6aeb649945f210373b30367ac2ef01a82fa70b549129d42e1edf93d19ecc2c8c27b928c6ade0722ee9e47f065b8f2cf8f99258dfa88b02fa45d73b72efd6ee2'
            '6c933a8fe7853e09ff6f76ef0f6a639f1244815cce1e53cbe274811022a1c59ccafff3b4690635810a2b1d790019a70c73dc6c27e314e7d0e2489fc4ab494133'
            '5c7e8c336037e639d8eb337dfc63676881857101aa75ba381563319c345e6d40c394d2d36725aa010a5baba281eaeec2c3fd583faff2f8e47f6d386f8659a837'
            '88c895dc9e21c50f7495ebe6b7addc30e0da1b9d4dc61310b50d5196a7b6f632875f031a6afc3bf11c084813c006fc8022377edd0b440e4557f515a738dbb8a8'
            'd5c0b34eaaa23170891119114490e1b503e263ba6b673cb48d4a6d9ffa2cb1f8cab244cc3e6cd24ce12a0f44287299a5e5a65ca784a67fadb64d9b51699cff3b'
            '959864657193cbc1247167f636ce5a5315eaf18534f9d3f4ff2e0412bbbd36157dcc3a48de65ba033580105c7119c3799cab60b03fb6689d4a7a9a04d96c558e'
            '760b19d9105a054f99e73a2d71d1b3ff835f23a1b45224461e0e05e2529170c964f079784d217e4dbf7492c48d9139876627ba1dc6d0ed119fbf04517eab61d4'
            'c308bebe509a0f0c238c514b34f3da3bbfa452917e6c780abeafe2f6c7b6ae3c48ef303e49b0b2d7a357c167dccd4a66fa6ae5a2871a283dfaabd5ebbec1b74f'
            '62bbb15b35648558d5be6cb8ae49cb1c8882ac36ad77742e509222bbc5e9153ea0059c36cc09903424bd5c5408b4f3cd41949919a077f56ba8cbf9a69e775317'
            '84f88d3cc17f1ec3911ae18c24de56ff0f9c50b3fb0e3e4a28c00ed55f99cb44ad79718183d2913a5f571ae55a87baca33657eca6ec256588f2ed31d0bda413b'
            '2976576c37eba17a7650ab413fb5e5b76eb1a2432a10703a4c7dea3df29cd2ee79e2565da09b7e56ba9245582e256d0fb344a69242fd0e6bc8f3df65bfe6ea40'
            '62dc43f4d8365a54aebe223050c4044ef17eef6841bc6704ecb1b926a4488f3ce84454163e8585c5f73faaedf4055184dddf49c343f8b687ad58fb5b01e0f504'
            '1424411b51b2730432a1626d9f9cc7eb68a109de411f59e4e2297d8e0d1ef394b0db29b7cbce7a1bd7bf02b63b54f430aa75497bfbbcc8cab49db17f5c8e669f'
            '7c743ca9a9399d412d004015f1c97e6ba52a0233bf29f720d049f0b8a2d9bc23f99d1e2609620c02a98e4c3c3c016b91b32c7501a8dcebdcbcf3ba55c6a89ac3'
            '9580d7473cb510b625ad0275d86240c526bbd36fe0a41082550938212e3bf332c0a9de0f950bd174a1773da82c675985e39c0d8fcb7aeb7a7be51dbdc481e22b'
            'dd399931b3196ec09090897499e12992bb02b83a6a5b536e6ac6712ee5480f14d0b13d5d473c8e55e40d2622879b424b30986f59b616a27b801dc990ad57bce7'
            'e885898840f5350fb646a5e4250fa5ef72e91c0a2e4f121722f1fb81f8b28a4b107bfc4c248f8375b0ef3e95e867db333fb35a3de684774235e0fd87e6c2c7f4'
            '3ec3d75e1ba3fa337f0abc319ebc8bb98e60e34af0f535bb74db3b81b57b8dfcae858520c2c60f391c2aec34fd22e6fb51b6826111af44661665ad86eb8a0415'
            '817d6b062dc8476ca4ea38cedf188c87375bdaa90f5085c4e2698d3b77d362b27d7b37aace130fe2382b7ceb0df1f69e81b9540d7d187b94419d5edc7b36877e'
            '0df74db69cc6956318b9501317ae12fa0437a36d2d30e2421a426e5b9cb3ab11998a003a3f7e8027d0e78cdcd4b43aad33020bdad3cdc1324e554b6e67d143eb'
            '12a3068265e0b1b431d56dd668abc2aaf792bd09be42a64db05196675297dfa6e8d5da7dfb37ac31e254bfe207a301e20f32b24f6a76e946dece19127345818e'
            'd0c9355ca3226438849d740174039c1f714c8a6480e47e75d887a8c2aafa12b38d788701e947aeaebaf07fb83182451aaaab7d35b1d0b89a1fe14debb1f9a0af'
            'cb2e2212b3bab0e7fd7f29d9cc07120ccec61ccb98e237fb52489fa3ecb1dad7f0eff6bb5ec519d861f0c55e12e7bd90eb0b87bb216df4b08957cf87cf1c39ac'
            '4453462dcf124af65ae02c96720fa9286f80fc95cee2e67a4db849606b93b620b5b9561efa3fe7613baee57160341e7cb0dc795077ccf0d1be036f54aaedecd1'
            '032c5c2f2f4fe4f04448a16f446fa20d70674dfb2009b0565decdb2299326cd4955c9492a166d4dc125020f4b12b84fe91b2604836961a85a52886853defa2ab'
            'adf3813f9ec52e77d4932be94b1e41294765ef21c5cf6a0d0194b4a1dfa0f6e07f0ee8e6d111a03f06353a1f96c0b37037a1b4f55d36bab4d5d5617b6b80a297'
            '9fb88f63fd0497acbbb88b6f58a2553d213bcac41ddac028dcd9c4e0add84dbe6d45f4daea8b8ec191689a841eb56cd7f907c3e0e1e790161196fc302b1035b8'
            '431adcd4f09704c367147d89b1a2a1d94cad27ebcef29a6fe3b7dbdaff05714581db803c617d8d474dd904010085dc0310b13ffc93dd723837c22ded6695b049'
            '3a324ccc8333173005da7fbee426c1a2e0783ba9391f79af6e796d4fddcec9fb3ed96c6b11453699e1ba77be7337550a4050a3953f2dfcf1062b533978a31cd0'
            '554db3cf392915557fccfcee615f3c258a11cadb1f7bd9983639ccd3415787c883786bd3e854f3ea7cba12c50aebb8a9df6cdf0f3722a5842a3a64bbb2e22395'
            '7e81bd25510900c2ecc5976e931eb3e2fa7b3aa4dc7a7bb464686961e2c5fd2773d7f4b37b3ae657a092af0bc3983b1db625f3a0fc4d7b900ecbf17ae4a969e9'
            '891fbf921523da76afbafe2c308aecead7839b8be1b9fce964f3e6e2604bc7454743dcf11e0ee28fba982ea9004c6afa8c4a5d044c0a0a74cf48735661ca4e7d'
            '7a3edc3ccae0d2a47facc2e43a78c77cd4ba34ad086502c4b5897cd3e2b22a8b0a0faad14b52015611eabb31b656fbfc1a1132622bf3cb135f97ef4285061a53')


# vim:set sw=2 et:
