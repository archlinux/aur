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
pkgver=128.5.1
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

sha512sums=('476d71ff45a7178301081191d1b4c47fb21b42618f12191605f95ad48603b84a9150cb5c96f668751a43c8f6a4a43ecf337d38007d8e2b546f006faead2d66d5'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            'd23f41f394d94092d1025849cab7586d9ed2269021bb813b3b61825e6e8cff0a5c5b7e736e8aad33666102d824c2f0676ab8b2fa157333ecbf114a529b418793'
            'f6a909680f11c5d2d1bf0c7c6e68997b1aa906d78ed922ad4706212dd4492e8e37cd13bf3044c2dda132797936671d80ab4f7371f7987500f2c100b28416d80d'
            '477cdfbd161e7ce0af5d02c1e14b886cec3d00e237f696a6e6bf95c1d6fdb2568a86837b140293420bb39407991d5457151265c6e99fcd5ccbdf46b3f62523d4'
            '99163df1eca04285eb438035f7d4edb795e253f3605b60232d7704a26371e7b9a702e12eb65f4f4efe0236272c47745b63ea540ac39dd8ad90f3a002139254d6'
            '18da8af84b2e37e978511aa7cda1ec43a8beec16b9bc125bfd5d40b529a993b3d9a48d5735cd8228239131757510a7b184a4b7e4b037a237c56b8e65979a9071'
            'ea68c09bd1bf5fef8377e1f0052239d8075f9e33f2e5b7589a8af7bce9afbd1c2df36b7ec3e41d820ed15888088db4a6d078df0cb70354810723c6afdc83b880'
            '5950366c11ee2d243b235ede9f315e0ba7373f78c78280d3f056a635034fae6335097e1fec3a37a74690eef925ca434d3e8c088693a1b54d615772ba517ea7b7'
            '47c9a71903fe0049f0c7446a59f62b00388b21e15b6c6df6121d5eb93cca6d3556462ff140f2ca55e782141f0995c4dbfc7bf4eccb91aa2b01d87285353acc2c'
            '5b050603798468f5560b185287fcd7d4e2ba8654da67f9452f37e417ec9847f8b3482c204950ece73ad01f88fb04ee3db3a92842ae2a1001bfe63925c88ae062'
            'cdb16862f11961f670f0e49e25aea732ad90a5edf9cf64ef3429b38586b6738f2102627561489ba0acb0567d3eba97111886ae8514836bc17945d664401e8bfe'
            'a2eaa29d9bac149b69c495fe397b466ad87f04044cd3557719e19db859936d422040f366eded0381266dc8f97571c95f6500e4c28a3d89b400187e79aff39b7f'
            'a3113e64e8bc72bb0c8657488d64ea7798bf32b784542fb2fdaf5987a27166028c9571c577d12100f7d56721faa31810be17bbfc9ae34499e0335e955ceb58d7'
            'f307a31f530efd782eac8b1baa03d6ea27c792680ea122ebcb0f403afd512664ec20eb2a9876c4d4703fbf1c14ab4d5aeaf632907acf776a95b1731df4bc4b41'
            'fdbe468bdd9a9689864f1b43ce46396fc912f8ee4cd535e262203779b0fd27addd6f82ae846b30a3ea81baa8252d2116450dacbd3e9a2ced95d6cdecfd9bf1b2'
            'f2251e0715d697039c6659c44cd95d22cc06db7c79782e4795861a6dca01e629edbb3f7d74942923a178aae47f6099858e9fcf384f28d0c59e9e8e7fbf835fca'
            'd62b405959f9f8d3b30091157ad0ced7ce0689680932622a78f5221b5ce99f08411d906ec4ab5cc39d2b59a92a93dfbc5802e7008727decb05c253ce4a10165f'
            'a859c79265f008c3fa28b9af00e1c821a39a75dc90379564307ae54c8b8fab4b32b53efb93f19d60242c46497cb24c811d2d964825e49ffd0ec33f91eeb9794d'
            '92ad010d88ec7376b42aac784846d149c664bbef395df0fb2cf2c3d4510c67d89d30c5f82e39a2aefce74fabfdfed1aa7e7617dd0e3de735acd588bf262e8054'
            'cebdc87e7ec655b67092f55fac1994b1aacb69161a2c8f15e85c74744350e7ad08381d4822766139c8812d16da777d2cc305f1573aa3883cb8e78af8440a0f18'
            '767b267430723d1c9d5743b11ca55ac98847854ff669160b0c117d68807a973485917bae16c3820b75dcaa66debc7de0448903f193bbfa292702d3b53c8cdeb9'
            '1dd05ff8969e7eb24dc88e20eb1a574e5fc6f19dcb62cbdf34a518bdf65cdf481667c02a117675381a4674dde9639f3ce3b06a546717649aeb85ded8ac05e453'
            '950b77eced8fa60d108bf1682bd257eb1407322cfd9d6e290551c478c44477355ce04d2c4d1f3bb09b17b0ebe5cd10f584fefe01e4d24c5c873462d1392a09c6'
            '915ad1d66ce5c2fdd1a1949b451d86da0607fb131efc4ab0d63214ee49a2a947f74fdf4a2b814f49f8b8d136946b6a87a9457f9aaa025df885477108f72fe2a1'
            '4e3361dcbaed00d8d89d32fe214212e650e4f8f7e906fd78005a37027be161c1e6e1220c15aeec45279241e5d761abf18656bb66bd8a24733fb9ec000ac8fa47'
            '641b1e5a17fca3e576aca23b3aaef47663502a160d786d6428c1f63d74fd725a6c4324c7d40d994c28e40f4cbc15dd1be9b1e7c3225f6be01d6b655f4420f3f8'
            'f648dd7124230452526a49cd72da69ec3e5c0a9e92acbc8358dd440ae3d453504eb6759bf7bbf38c2d8cc9385ee0a328c954dbdb06f2542f346ab6ef52150395'
            'dae331159d0e0e7c1b5fb68f2f214edab83ce679facd0d40b7fc0a534b7a56630df902735098946516d9d9eb1801d40b978b7955532ba337ba692a11c572d5ba'
            '495341eba70df8af88235c31fc558335e3a0b0322d01d33c009709ce88f7f6e12f75f8e354a7f466d51b7238dae9cccf52a1642cb6bd38f4007ee270e64f1b4a'
            '35a90a5b0c13ba1f47ffa4b63af322487c2d5fe5beb4e1a4ceb29bd1cb0d0737b260cc4585f69538f13a6a2d8acd6e747794d48d3f076d93bc1ab865ccc23e42'
            '63a408b7bb65cb5d178569ebb7b3f4af7b8991a6363735cdea31b5a9a3948127b5be6b126925d7cbe8735032a1baba1d96b64a4900ac500b6f23506007013e22'
            '22a63b77305eff83f3fcdefe2af77735a3027c71174b01b968e9c72f3424c0a7f4def5b7c9521d0695ba7b82b346a4af8b966df8c5d6ef0ce31ec61414589757'
            'bfff0f3606e625aca267f469bee309bbfd80b8ec9dc658134cd0a8674739de4ce66e094827eec717d478bff493b1e30134d5bd1227eae685985515febdf747cb'
            '50bb30edac747a61c6fba8eded51a1f346bbc4305f9c0f579ba7c5f373c75d1d5cabf0216f897ab26c687a885e8ae9b30a20f563fab4619d4f128a8e676fb338'
            '671a6e53ea6b966b7e86f680663b0d4117a019da99c3884c8ab57520e879b691b4f9037a5d9688a0fb25b2d113bfacbafc61ccbbd4e74c393c58dbc21cb86c32'
            'a236ad89e5da98764c726d92a1f4825dd85881a903ce6e2d636484ffd8e7877c758216ee1b7485343d26806d69603f53e5d861a505577da8c13f75aa02325c3f'
            'c6bdc34a29c71a9ac38a8f97d8ad9d79669be19f4f8b2e9d8ea6afbd4b3718d3920b4777fedb184cbf11a524baa640fc662cb1b658c18fbcf25012d5c1fe53cd'
            'f753776bdc6fb898dffc96667eec7cdbec9d97869e4fd9103a67e795b64e60dd87cb20c28aac7eb76e3e861003074c7902fc23f7b9daca126aaff729f66d36a9'
            'da3914990401b466c71ff7ba4fd046d42335bcd8503baaa7ea2f585fc2136b0416d4889c07fec675785a771f0c1196c9fd6a5c94f67cd17a56c215ddc8a50840'
            'f501bcc83f52dc4262ca5ab3f0df142b083ebd8787a7a1f82058e88e16279b7f9a47da731c8d4ea74c903b256541162437facf40c7bcf01556edac1b2f1a94cf'
            'f2b923b2350643dbd70c42a134fc764079aa8116c37fbdd0a1e1bd0a4c85ae57c16a0a92f41fdfadb5271e1a6c4eceab1cf23588b966afca5fd274d47387e3df'
            'e37270be9ce1ccb4a875459deccb2f34348ec0423967617c35086fdf99cf8685858f900a376c43799dd8135703fefb9bf9b786945435e90c6399a887ec600a17'
            'c4d0f132065eefec539003fbdbc22b1d0a6ff5138514c2dda13f04782b5932b5766baeec5ee742f0ba6471215f9969f8630238427f2275c505533fb3ec438fbe'
            'f6cd693e488d3efa6e58c557dca647649792f01877a7b6f1d71582cacc3623cb8b373b8f80707c735ab3bedf77ad46cad029fb28af22485cdf12078885d65a31'
            '393e70c5df40d8338b48b0ffa58c93db817142914d853240671a0fd2ddfe029a8247711f2b82bc16fec84ab3214fe31ae467991684c23905a72804ec6bfd0dfd'
            '7ac405ab6f6592e97e79ec40102d49e5b9f7fa3a0c47a0949b1d19f61d7593512f047f791d4a8287af8d91d173faf34b57e0b4a4f7d3547179137d34f8376763'
            'c03afe92932adbbeb467741c7b78b2b170e910309f43acc63ff0807157fc4dde35ce23ca5ce150dbe91454d2ce97d2805d9ad7d9a7c321c55dfff73311ccc508'
            '252568cfefce1926d7c0d80529fbcd8ea5e7ffba61ec7c2d332ca0b863c417ba9094bf3fe1f79e48f525cd606701439b8192049ca3fc486adcf15aa83b028840'
            '343498935cb3c87cd210f6173f38a94e1a2d9fda388047aeb6e14806d02082834cff1f21c3d0c68ff87217549d83b6d374d9970cf76f65994255472380c8f353'
            '6383e4ff82d387549dc88651bb3719487ba0db10d39641dabe460f0bff724f0cc1173049c50508fcecb2eb2510d8f4fce184f7c51f984aa2c8e3ef51b337f60e'
            '7db2420af7fba7b74bb6bfcdebaa16ab39cad13abad827210a9693d0f9f6b0bf099b34eca10848f3d3cfd059fde19de49e27fe05c4ba52bdf793c2cedff0bfe6'
            'c44f6de971e2a6258f06903b4e295f99f0d8024fa3156da90d42ad21318db8a840ab9e9fee11aeb22fba2c2b296c04d01f21b97f2be783b59300825912edf296'
            'bd4d87deacc22cfd7ec081be15e1753e4ee0c07b6a36d27ee005d1b4d4f87e761b274794f4ab3a9bf16d68c14167eb512209a2029c050bd7c7af91860140b98b'
            'd478589ac8d52257ffdceddfb9196593eb2b1b5394671cf695a3fda2848ea3516396e659191b1aea2e85e7b5ef310307a8902bca170f82bdf97761237bb464a9'
            'c5d9d51d6f13f21f2e04acf1a6965cdf75e0674e7228ccd0b9f083e97c8f1c03f67757b1866ec7803dccdd769d2c28776d638a2de1c38e759236e1cfd4a3c6df'
            '10ffa99edc8716a3c5b510e6d18fdf1d90d7ce0d549b10e88c1c34a3fd37cf418c00295db88c244d143cb3d88e5b41c586f2ea440372b77f53168bf797ee1627'
            '139c1bd07be3a3433ff4da4f9a8831290b07fbb9026394275ed29b26a6582813460646e390869115699e3efe2e19acf6c9af49ea0a1d9d6bfa2923f155fbe940'
            '732854a80f6062f620d5ac280d5ee3bcd199b4eccc4c78061866768c212a9009d6f34c735075ff26466eef77e1992d212e7c5e85babf5d44a7c7c229ea174947'
            '26354350784f51192e8115531d1c05e4afcf52371c4cf5dbe1b09e15fac13ecfda552a831cd516a875a26ec4e149c5e0e388506bac3b4959a5a1f37159e82be4'
            'a5e9874a902de629bba988268af9387ca772c5ccab6d44f25edf4239f5a5e38a1e0586c036f70d7a2e8a2462c194330f6d0ff35c4f4d41e536042683c93d2c06'
            'c0d65741e9a434f65ed07698f97c146dc300c1f180b8eb0920428a7489de2ea75007e068558cfde3e9368df59c469c7e4e0b87f492fa00b7b952040c04a7a83e'
            'a07f2cb22063e3d761d0f157fff3f18f535206d8047291d06be48c4c4ca4c6b7990751a45c82167a3d74741e3ac3619a3a23ae3ca902bdc235b0d17eb4d546f7'
            '0e6ccbe5113720d1b10fca7ea4c249eaf552d6156fd8da28e7f39d5d5e8fdb0290baee01888e2e9eed13673c52aadcfefaa4b1a601f26d23e9a8b960ab36b5fe'
            'a6f5d0a639d7da48f8bb688b0d519a4042a4ad0a6aa76c101caf5ac5c111caaeebb917e710ff3edb929d569f638d4a7fd963c5a32b6249462b4c98932803b3ca'
            'e1c84dd2c8f44d251689096cda602534ee7d8e8cc865e6aa5ff3ec5d0e0028ea7675193102d1acb2c8ca06f823faf9707b7d03cd43f78eef701f7ef2ca7cba31'
            '4a78f13573782ee8eb657fe1791ef7e5e2e683c77b708812699fe9f9bf54513a4e98a9e5583443dc024f54128a196a7722e75b6d6e5c90c025592fbd8b0c57e1'
            '6ade6baf8f8bacc87512130e1d4ea9195430f8cf297f36e2872d19b4b9dad4e55b1c458fba19d7d256d39b136085bddb416570dc231dca3d0d627f844f88964d'
            '415debdd1844f2b393c16754efdaa1c75c4dd6e7294fd46b0f977fe914a7ef6addfdc7a7693ef651abb1260b6c469c710177bfa990676816295fcb124a9b3316'
            'f0c523af5a30296d60672a9783c0c4958e0b17e2a27e501f8fb56e1209b58aa558e6efb4024ca48e036a1add0e644b168d3f4f8f1f790f9cfe9dda7e2dce278d'
            '4de45c46e14b6f45012f5f5690bd8664b1e447cbc4e1127c10027dbc86b56ef60ab9e21dc966b9a023b4b4e679248a504413226c7f85006afe762bbad1da9ff0'
            'c178b4e09fa4b1076d966b250c57921b12c61d1306b68031e545c8026e3fcf9cca52ead2d43702105214ff63d05203831c50aa0eec893c8893995d38d12cb037'
            '8f3cc2f38071177a890eee921015dd9f5db8938fcd6c985caf5f052e9eaf59fc0c4dc7d0f50b1e8c423e7ad5829e1c297ec94e476c41726bc6e67b8554133c00'
            '0e2f457faa1eabc15c512bff2ef85173504972fd0d6ef00a4756aaab199334cb3ab05bb08830e7d3967572ecbd4be0824ffd770f6c9e314b6c58e212609d4dd2'
            '406e6687f5da1d2eeea14b5c1c6ef3b1681a48179e804f298a57dea43dc1df2efce3563ddc9cbc35c9e3fdeb0881e97e6d51f330ede7af2f1e62827431e3a345'
            '1ed743b168886b0657fc0ffc0dc931d288f6459943b2e5c7779a754a8cadf695653a8f0b601ff10cb9d552f7109bac4430c810e2b53dbf0167f3369060509c83'
            '27cdc62ec4fbbd806be77b51ced5de94395b03dfa5dcb7ddc64f7d68dc3f0302de0278e7ecd87b98cfbb08ed8470ebb472c714c5d32c77fe7ecc0633c64666ce'
            '9098f6f112605f69734952206078f1769a6ccb299a9680dd7fb37be268355b6f32652290501bbbe8e5c8ef5bf09fe5d9036574e953b1e422931b762512399290'
            '91e0a3b2822fe6d9ac9e0d2ab71e4ea774d1b3c685076128eb004bc13ee4ed96ca72f36481ab138d892134b6c8aac564afa49daf859cbf8801cd62d0a97a4484'
            '486fee6fdac257b15a10d647588b79967f4482d412438f906ba0a4b9cde67dd2142704b60dc6d748394da2c9802df781c7a2ed633eff87555ae668e021558356'
            'e31bd61810c1e7dc3db7d6a75fcc4a671f68ccc2dc44bf076ef577a164c07abefb88247abda604f9d707db1b9c909a067f1cd65b87c57beff60c16907e4d0856'
            'c89d4ba1292450b0cd4696233b8a74263e2fb0e2ac261d481585473c1ca76105bd89355748a73be92e4052807502679cf1d1281b74ae35a4e201d68b0a56dbfe'
            'f490f152fcdc33b32d52a62c3886837c3ecfb889a9cc081382fa4abf97e497d2b0bcc4f773adc26eadaaf159e6591a60d5fd68b96880dece3f82ab7688a7d654'
            '7cd7d3d54f0b1dc8a0f9efca5c4ebb2c42527f13cea70794fe9db1b43d92eb0d85d09157964243d0e621b6af2e281a71a90080979d4e05a1a9de3beaeb3a628d'
            '7e9de909bc6ef6836bb4e5959c5d27add903185a23dff905947f1cdfe42a860cb2abd93dc23a02a711f3f41741071b84ea229eb91aa38236ca7038124938bb72'
            '0f8a0396b1d110d64ea84c1914ece4cbba101e5a299e449a11e123b5f6266973af3498c685a45c73127340e027b62be97b41620e8b33e8d7f467363acc1fa1eb'
            'bb42652dc06b6e5ec97782acc225039159c71835bbf5b0b57e43e37d74f631f2143d841c09095caf66ae6383c61e5408f9354bf44f4d3cb2c5727b66c2369abd'
            '5107b097255a97e851562936b73b897ae7d5f011bb97135326b245f85d1d90c1dc68e4c22207e901e3ba44b52f591056c50d6185c43bf72d02d688e097b9db6d'
            '905361ee3e739ebd0443c9865a55d143d1d4500491cad9cd686469bce202c845cf6810ba3e5bc085d283b93010fcd6c375e085547f0371861e459db631efdb00'
            '705fc314f1aebb880baa422bd3e7be2b4ded545f6745819643d55d6dc71d931eaf7a07a85a01ed22860f0ba57ad4ee2d248b968ee40541780607e80050b00d47'
            '6be45660fd383f8ad356fbaba4a77067ea3db3b6d9ba0dbf319694ca30f085956cd32b3fe2a9f4423e536c341c1c9e644e4e93b9edb9855783cd6dc4730d4d41'
            '9ea74032a76c7796db6e16a5dde1aae9112c5a12d626a8ac8dce60081c4d1e0a4ef94a9d586ca2599e8cfaca49226a195c3f2474771db813e7588888dc409412'
            '1d9c01424e7119b78b53b8836fb8c649a31992a24d80b55273cf558e2c9947fc55f2510f6a5242d25a4dd4ec77fc39780972dc7ca94852af9e6a2854244d9152'
            'da036dec083a885f3bedfc9dca9648474634699979bd08ed5b1fc56ffecb0cc7e0b7e5f3ddc15658367c19e322abf31f510fe38244e81528978c434c92372886'
            '88c4361a4e235a55fbc35470109de473e7ba5f448d2ba529ae30c428f6b9a2f950c6cdcacb06eecdca28411c90a430772a085b13028e0fbb48b01edf387684ef'
            '9a80f686b3b9108fd63b37196845b4ab0c3ad3d177962f3de51db6b9b126b99ab4d6295fc07908d550ca6a020134d3139f424ba4d8dec794f39202cb93f8e949'
            'd82fb4e9eecd1037d7ecc9660d656da9e7d679a8fdb850d5c4109d0c8ab20fe5dba0325d91efcf4025b1453d6c39e0036c20d18314ff6ce0d4a918c4be0b79c2'
            '44da6850818affc80e9257150d6fd001b50f238f2e40b61298329540cdaad94b6431c5a3d522f921a8f9b1393591ec90ceef654c7403d01f0deaf3cf0c77ab56')


# vim:set sw=2 et:
