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
pkgver=140.7.0
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
  5fcff175718cd308bc6d6f2996de14eb8a93e2a2.patch
  23efd75219786d71acff0b4e7c1b0de297b84c4e.patch
  b68b1f93a6e31188486458f32fbe37811257604f.patch
  d4b3eb4f76e81f18c53863b1d55ee146d6ec7d10.patch
  dbf9702ed87ea5c88c2a1ee615998532ac8f10cc.patch
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

  # Fix building with python 3.14
  patch -Np1 -i ../5fcff175718cd308bc6d6f2996de14eb8a93e2a2.patch
  patch -Np1 -i ../23efd75219786d71acff0b4e7c1b0de297b84c4e.patch
  patch -Np1 -i ../b68b1f93a6e31188486458f32fbe37811257604f.patch
  patch -Np1 -i ../d4b3eb4f76e81f18c53863b1d55ee146d6ec7d10.patch
  patch -Np1 -i ../dbf9702ed87ea5c88c2a1ee615998532ac8f10cc.patch

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

sha512sums=('7781b1e203130c1cdf2a0c2ecb05a9cfa824c75d467e7faca78b66bd5568c821324112aecb774883d9f447af7fa4ade36488ff1017255af5510c8f641990e472'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '07f704a0556269434dce87f57500dd5521b18baea8484b584c8bc40dbb618b27531f13a5110c7fd8e4a01e8a42c1483971dc7f98c9f867f397d24e1798a2577c'
            '924294ded9cc7ae6aa2529d60e6f82914cf0c8b034ae748bb84605ce64a383a64fac41692fd6d1e2278251b53f16272d398d1ff31dbeb83df1ddc26efba0e472'
            '3a3f41c7d26664c0aeb43184b35a94d7b9b2486ca69b5e71c7b4794c33db18762a1a5396d795b3ca1d73dc1cea3013c5d0ed7ae5bf809219735ebd69cd0d3a62'
            '77b571fcbfb3d3e5e07217f25ab5051d0b693456c59f6273b84b8863f7ead7bfef81677cdaf2fb560e65aafdad008967e0479ac429a860ea90a4b7e36ecd57e4'
            '566c35ca78698939ce682c71caa03bb53388f0befdcc52c4a72565c93ad1528447d3df7a11f7d4eb5dfb6aab6dfb053050a97cb255bd20838315db5e1309989f'
            'cb68683eef11ae6bbc375bfc53e57fa1f9953c459d2ab79685f0a47fe29c8fb3fe7792ebbb439521d00017a161be529dec92dd08f9535b71cc5e943fd507df09'
            'c90f612f3a57a955329d29b8ab55f4852b6b4e657e73befae8ce5e39eb572f0f81f48e04cfacb194b62ecfa7f1d6f92c24c7ad0923b526eb537ad9735d13929f'
            '754ecb771cae60f4efa67ff38dc1348b689d62b07f3a2d26d2bc0898cafd402e1de4ec63703e9ee4da0febd95c1cd659a0d4483ceee9d8f0e0710cfa07b4d195'
            '61cc9ae8629fcea4710975d66efd24c9b86a27fcdd1dbd583f506ef549135b53a2121594a0ec4d4635bb1cb547bdd9082e6da0d8579048a7ff8400d9c4342f1e'
            'c2849d6b0f89c779ea85ecf523c31f5cc59b337134de07be2f72767e0d11d416285d176bfe34cf6d3e835ba281253bcadff66524825ec27afe4740065b176683'
            '60b0abddf4c949289757649453fad6e837ba868aba233f0566b4369fbfa13f099f4d163c1dd546caebb84c961e8d2955970b0f95dd3b14c77b2a3812813362bb'
            'a4ef547603e595678b8c0a132dbb1fae1ba00313ad42be0a5a4f8f2c5d55683153b0c3cb3bbf02058f7f92b5b8ccbe71dd1e95c3a4ee3f58827b1cab94a8df8f'
            'b4a0d41caec68dc79459db7fc90bded736de443b5d7b3dbf33b994bd66bc6a2c6a7537633978e3bf35fa2d2046eda0d4ea5f41fb544137b28614dddef80434b5'
            'b91de2ac2e5fe1321b1cb19d2aaac2a4e06931518c9fecc1de45520f2f3d05eefd0520f2986329ea7495cfd756caa0f10193cc2be242280d81c8b58660683571'
            '3c97ff0ee2db8002625c276bc09b2c255f5f4d7c88f260a0311734029ee26d41686d1b2b0e60e4e94c66a62cf752fd3c6d7d8ba4f58dbd136d9e64355674f525'
            '4d367884387ab6cdab5f5a2dc701272f0a803c2c323a680567a310abbd75e0bb4dcab45ce9e7703c2067fd4325c0d2c2e9129cbc55774730dbe91bbc84526d55'
            '52501b4e9783fa51e3eafb2d9ad71861ee147411db80e14e86864ad6332a5dee2c7ab0c6b593ee2e1496f826d732205aecd4718526004a16a2ffbbe7cbc8e509'
            '968f5ec69ca56bc24e9947c6212fccf18427c4ebdad7362bb1a4aeeb4b40dc3cb93c87b1191a01d0633154e78b50aa9c6ad94ddcbbbbb2c3c8e52b7a150242e6'
            'be06a27a59fa24fc4a5e59a3cdfeef5204415444d5ce8cfbcc1eed1482c325ac74be4e85889170e91bfdc0935ea382c3b221c5ac1cc4bc2d9af6bc16f634ef3b'
            'a30f349cb9971928315cf210bd383a155af16656274248e5c2ce31bce99c4602af1b4fd3502aa5b193816f04a2d2a13cea7cfef8cbc00f6aa09f1f092b113ba9'
            'dd9cf3ff4268ceb3d4eb1e70f03e069226613281fad743f5a548f69a3ccd4ab85fde4adadf430f7e640512ef0f5b6c5d79e9da9a81f4bf7b63f2858b29ffbe38'
            '19c2c3e453670ffc48fdac22c6147f685d7b42689e6d3a0021d63662311acfd92157c0b08bac299900eab0624e4cf88d2dcec24db6d979a743ecd30c82cf730d'
            '8e2154f024cc495bf08d972bfb7ba7c2778f5061204d62f82812f0f66183cbe9314af7e04dc497d25011594af845e1bed8cd614671cfe0d075150c279c0116b7'
            '50aed965d8ad8004027ec76c8aeb665ab2bc87ec0e113154dd3157a9e42f664b4e42e96087e0776d7a14a6054368fe1c342e7fc28a1c182b750f1e78f6f5636f'
            '90cf11e2ce18833437a8dd31549ba2772b401ea6bd86dbf9b55ec4e22de075f729f129db42f629580f3c5e5452c8ce3dc6a02435d30f50744136727fa4512a25'
            '040f3c07ae267e7acaff9707dc657934e1da38724c5eda766ddba2939022781a5143751f273cef35170b767d36c675a605a73012ae2c608f497d66dc8e2e54d8'
            '9667b18a8a59154958a5baa8ba057b5045973da3aee87bc8a46220c87870c407a4a2e5a59af095434d3c86dcb3c2f587d011716ca1c2bd2130a92f8559375819'
            'bfd2e72dbcaf91a9d8c4c1d0b608e2abc0b90134f1ac1069c4ae16120b87547b774f4cb5d558808285c7624c20628f5eb34e57054905721afc05ffdf81a9d1b7'
            '97fc7bc855f529fbde25e88554323c7c4556aa003a2bb76b968dc6c26585b599072370bf3997f63b5c502015fdec96862016c127200034dae4a6f76d738c29ad'
            '5d2de8ed0b0b1b3987a8de144c43336d1d075b2536cba2c220e3279a37bfbcaf06f2466fb77362461ea8baace33546c4c5bb9c1bd7891ca2eb254e813ab6e0fa'
            '2223a468d26b05ed5f6eab51d6e4c6efd019cd5aa454366190643aecbd60f20c02814e5a77208828174080f81fd7985b88be7a83a3542e6285cba6651ff18992'
            '6c14e0d575fbc9dfb2f7788c218e29e4a0594fbef4b98d18f12e83513b0971ded43d8de0e187b2cc0d548bd89e96b7b4a259b765fbee78eec9665b4eef630ff5'
            '5995944de6932ed3f27edf094e3ce7d3fd80bab8c55af55365d8d110a910e29db62fde712fcba6d931518f5208472406cd4143f80ab982039cb94e63efb37e7b'
            'fe84c82032473c7d75de960a924244b866f1a48f509f15008654b6692bb990d34f9dc6daf305c1f284a1e29b227749f4510653bff16f4b537f6d5d5cf5b7fe43'
            'eedc1856b445491a565119ecd374017248bf653e5bae4a43f3667203bdd16de5101e72ea686fe3a5e9dd8e42a36e1e1015767a5b1b6086a1541eeaedc01bbc16'
            'cc811eb5490d0d652b0717cbb2cab8b4c03167de395b0cf06dcf6adbea4b4fec11cd1a86ad4129236751cb830347521c18d3561129cf4f1a55ad6e9473013ee5'
            'b60497abd7ac84a64ecc16f6bfefde4f23d021debe182be25c88e887813a5ac603da2abc637145784b0c8a814ba5dc6404aa5e5efe4b0e251302ca22918de4b6'
            '2a789c8fc0fa2ecca05a3dcab8cf4eddad9129f191483e61b675a603aa97629701d2144acf7632fddae425326309cbae8625d89ad5d2ece47e37b67a2e7b136f'
            'e14428c5756a70d19f7d4da6d0c4af86e14330b86cfaea30bf4453f49f89ca3a981ffcda975951f704f24c57941fafe8e1565c2807365d095ef106d168d7aba7'
            '2e17621c4e101535bd70507296587eae2c4515938b419495a412ed13405e9955d846c2216b1acf89064c4c99d575b1cf8d621f701df80ba53b468cf2ea1126d8'
            'f9a7b4e5d3171c29bae2982ae4cda439c8fb2f6627aace4fd01194ccf46e4100e4a9bf84409898d342832769bbae69e84aad415ce9bf0e4160f0ce05212d06d7'
            '4ee2990bc25214907be3597b19c3f3b9090980472f69d7c6e1e7e4cd2057c4cc3a2704245e4473c61e2b62e9da7ec8d93af9ca9008448dead746224a4bd027e6'
            '812059d14e53f2b8f61032dd0f9bf23cdf69cbf0bd7bf1376e0d73e9199dcca28ab47423d64f0e3567e2e8d1f483a11f21d07270caaff1403f0ebca04f1e6d5c'
            '4d535454b7016736e626097482ebeb64faaefcb75de377055a890156d545aeaa7ac13ae9d55acb217939156dd19fcbfb2e18511a12af4f1b1cbeb07865de6a5e'
            '0d66b0072916e80bf2a3833763ea0dce690be7ee5107710574831c84467dd68332d89cba6ff21699c34bf1c1d4dbc6b78cf3fa3bad48710df57f18f74cfc9641'
            '93f82591d31efa4274da882d9824a7c6994f38768d822fce4bf7003fc136d2a2258d4aed33a26d52aeeff80773105519dc6b78b8e9d0025f4e79012edbbbc100'
            '45a164ad4249d65018de56016a52e028296fb9273aab6a458be6d335c9e6e24cb9155cb803da788eb0abc2a59d4824dcd888747c219c470dfa7586e3e27a4301'
            '97ae30b463eec86b19556a94132d95ec0edba42a4e0dbf3925db5335b259553b9484cedf7be6d0bd6fbc8df53e349aefbf0ca1edb57182aeca8d711bc42fd463'
            'dc2df9f2d4b5ae5fd8ea3ec4e3b46be2bbc396ed7093371b87e022fb78c0ca5b41eb50e02c51a99d7cb9773610af509af6e8cc700e258033a9343a4e44d721b4'
            '34da8be96a698f3a389a4465716b1e8361a22f23433918c5518342d636aefdfe856fb20249b53b11c1418511e8fc6fa59ac7965dd43252768a6af485735c2c5e'
            '7dff36b7c9e729ea050f929977599bc569a179bfa71db27c2de0a8482c4bb403dd93ad12e6fc96b789ed8887c1985664802e355daed2eda3227e23fe43cedfb8'
            'e8e6919f73568e5eb16dfceffa8597e3c852f168fa8c30e6aafef5b05d8ede97026b1cc2db902a1fe2f5013de9d268dbddf984595fbc58c8c68593c5565d33d4'
            'ad07685bcfc29f65b9d067957803b11a161e2f86f5248a5de73afccc39f6a0911c74421e6c1c07c8ff7c36da71111f91e9f2dc290ab759ac69fe5184c5b73c78'
            'd0996501370270148ed152bca1fc06cac0fa9d9e2c388554337c643d775d77684556218f413dbca36ce9631a1feadf47190a85ebff8741985c9d802a8926593f'
            'fe3889efb69ddb821c6f8a77afc0327a0fdc6459daa16348dc03bcafc31c820a959c6ad8835be735bcd5bd16ecc1886d5d91bc8ade9e1d1dfaefcf6fc8254e2f'
            'c783e4a2148520ca4fd6b9d13c64807e0786f4d10ae78a86f3c7d00ba4f16759027d8843537ac60da2bdb5dca52eaf8789c57b735caae505fe28d757fefadb9a'
            'ae0a8a24b92969c44e8fb96ca0e2b59f43e0d4175dba1b38ae8002a0a869840151db0db195f9de2172a61f93d9729c074536f8b922c0ea6b19c819aeffd0be20'
            '5b495ba0affffd6ac94943c3464a17fb42b3c397d2c7e4aba37fee41bcd5f7c2ca41c975c493443f13e761db981dfa7a829fd95fc5fd7f763d4061b7513c5d3f'
            'd0f4e5da9dde96ec270af6feb35b9a0178f3364ae9713de13839d6dcd56d85b12359b9884fdebaa4a734162d068df074274010a21db5eb0bdef6790e407caf12'
            '26e68e65f33564390e6174c112fd5e9826bb2802aad9b7969e32be833a15cf1f6c12368bd0fe6c791a8837067f8757e60bf2521d73175f2f0e7f8932394fa0a4'
            'be61d7c2563744ca9d7615996ba3e8df37bae3d75b6a659784fcf0f6e7e6f160beeece2959c6e989369344dec2469e16a4d63a93aacd52cc1df9b850b6512e69'
            'f7b946f9e4578c31eb7d6e235f0f9d60bd4116c64ead1873d0596efd0ce3d738a5df26317f8a6f963273355cdad96376817158e95d63a05a9ec661c10d10edb4'
            '4b153df63a585b0a1cdbf84aa99699b83310668e40c6f1b0426d0bc746933a21cf23009af7b1b21423e014d4ba18bf225c5b1a7925c41e13a1386a48e271f91e'
            '6200db4a78172a5ce1d0d7bdd06e2f6c294b0c31b7eaad6bed26abb171bcc7db93af7d99ddf1801e3f052010354adbdfb962743aea21481c28353ccbe231dda8'
            '00a65c7858ff5161377125b0cf14ad30227c8b0091aee8e3046c7e5ae9f8e81651701bd0bd7d7c724dacb15898099e3895641675210d2cf66f1f689af273b3a6'
            '9999f106196225a561b1f53778419eb238e7e9ddcfe43bb80d9a529b50fbd270646df7b249eff98864d15a94eeeaee5052deb2e36191b4d06dc7eadd17c8ca14'
            '2b02eb3bc354eaad490b640e1f2b97bd7bd8140d3988c73ab531e73b69b867ec288b151f296d263d056d34020601eead29334cfd77c575d425e0bf305387c250'
            '760e2367836f3f1678d528925556c04b69ab57e30c0f4cecd439e7efeb9b9d7ef6eacee7976ed584daa0b4149513c7b10c9a405c11ad1d771d4db639dc08cf5d'
            '5245f02005ee0ce19c2812655e16879f7d12034cde1507c89da63ea1b00d7302ca322ac01d9d28ee832b7f02b72e8547056c3ee71fb457895d6a7abf47c7c164'
            '3dc84fb47f93df1ff73842ab7cfae11e4a677516dc9a04b40851e5efc3505d2cf3c9c3d6b55e904e793b89a0f30261ca3e6092080affcff80ae897312462b877'
            'd615f001d33db2606584eb4b01a68b42ece02e750b3e8641090ad20f2206fbb44712b099a3544461e4b80e78a20d582f97cee970c3e64ae1f014a96a7934d01d'
            'ddb31b764d9279f6dc113c9b8d8a82b770744b5458d98b6e824b18133f91bda0f392d578e5cc52a0c9431e960bd0ddda35b2460a924ae9dc156615783665691d'
            '2a771ce4a11dcd37891383122b43f2fb4731ef30a807c600b09a8528f8a922963ea74df651412e5e9a1e37309208a446dce2b2fe220b11e149ca136790f6bf88'
            '3481022dea1a263b34c8707f2efd5fc5683f736e9d074c8e67656d7536960dc23e674c66d8bd1706eaca50c2fa067f3f53f44a9097741a820a5170a2769a95c6'
            '1d38eed6b7aa5b6f3155048461779102bd89f864922fe779e3997377b782e5aee9ff943dc190c227c800664bece884fcf3f25facb6634a86ba504c39f7b34d4c'
            '1e55006925c7fc7d65f1f160cbc0b10b01f9b3815723e699491055308f4489e144f5527d8a8345a8494efef33cb23b738d409de7179e24fe0721ad27085b6c33'
            '9df67697180ed1b0d116a7e77015544847f80783ad3fede637c86d07e407a03572a8f8b639ae1c854550fd671aa8e3d56329e816c1efab30ccc4c1da4b4b31c6'
            '299ca9891484ad85b6380ae833fd0666aadec7e72f70d98597e444b7319565156ab5af4d8ebb4815d0e4f19962dae5c04c09bd383eb7e1664b3619459c83106b'
            'aa1f604616de6018aa2cc791e4a61ea0f771f3a99d8ca54fe597ca741e3a5922704c274398bd14e7d5fb397d87cbc7fc767c5e1b99a7be7e680b3d2344485ccb'
            'e4ba99738b70534cb73213a521d4406f400ab81df7234b80eac47734a5e8c967ec3304a6befb88ff66a7b0edefc0bb84a567ab3511d216f5bf8b3924c0b1aa8a'
            '848e6422fb128fa326684dda05b0e10100578b6b611350551ecd36dedec186f5e96f198b22d8e5d813122514905b51e02c10565786a22d9016a47eee5c141c94'
            '0a3e635ad7fa076f7aebe66b6c9f22136e133fbfed05ec10a2117d022574db0d5b505c75c28d6ac5de3cf1d37114871932587bc08fba9bf3140f946887bfa498'
            'f56e66ec4da2ceac23c7baca298a0bb9f23be5fe99dda2ddde5a9ffe4c1aaa8525afa0c043ba1fea4024997a82e14f6d14545e3f96d7b4b3e78040f8a8ed6648'
            '9a65fef122e1791c88fa3743dde2b65a4dabb1574edde694c604d8ef354299a6ae0668ea0c07d61719de43c2e3ff4f52adb013c048e86a4e388493856a688671'
            'bbff16ace695b3923a9ebb7966eee71a1f571366ea9904ffc196f15e58d878c38409ffd7c2c20dd69a7c50835f583119dd3146bb5b8ffa912baec47be7d9d27d'
            'ba4894ca993711f1877ff59f7f724decb47f6cb6f5d51dbb9f6c1130bb3980df35db0e13f3a6328f93724c2229712e24839adb6e6d58101824cd7055c8585f96'
            '7f90030a7d74e7108ace5dcfff3c6b2da5b330fd9c71b20f1af168affc3806c2e20960d9b19230e6365ee76869e1cb5c357c665a7e9d609dc217faa492be5240'
            '74b3bc761ca7ef6a016b0c53f2e6ac9be730ffe241d4210b95f70b95056a000dfedbc37dcd9cbfcdf351f073d4f6504cb3607058da5b9ac7a5a3ec59ca1264ba'
            '3b04c0b1f04264b4448991767ea66bcde73f002e1a5fb1027fde6afe6557ae4f9729806abd54ae59b5052cbb8631d8ce3cb3e6e7a7724c0644178b52fd04302b'
            '1ffd5eae1930626c513d39a669f7751ada65e9e0c95e3ca3911eb018c01806bbc2f1dc536fa7ef01d96fe8d0548d8f8317b23ce8e612e1459041f4c2535edaae'
            '00dbb25f6614e3f938e03f5b39116a704243a710d285cee3e2e9393437a60ba52c5ad367de00beb4f96eba6db4a2860948c761829d91c88a20266a5d4322f790'
            'c5f5c09b536e87071a82e91b609036357da6e87dcdf8a80ce2ba1b677c9864752920341ff9dafc714678c3e6c1a75f20fc99bfee28434f0192d71e9391915dbb'
            '8bbb5ce2532f97e5732e873f348ba273b5654a5177e22bc882e91d490c82ed9058f0a181390546126f29869b721b59a0f7da6e01e8cec7588302e39e037eae68'
            '82b53455a1a4300c83da7cfee0c5692a63b06c9b05c5294345dfea651f013534221c1b254c1f7ce0053ebf590c83e50319491b26a4d35a32fbc8534c887a3fa7'
            'a4c42261541713625b29291ae752f838182d0bf72dadf98953286dd53c7d9c44254fb81f6797d512cea20b8cfee15e3ff9891d57509c74ea22623e62e8b17b41'
            'd94042e0c7a845cbfccf6a030e84f162c6037d7e2f6dda46c38c62058eea9895338243b1d62af4e3c82b89fc230d00b32a42531689fc28da3372304399e2f273'
            '53d2f77ebb06505feada90405a50f15ffb4b2331cbc93e181b0966e2de48c360daa2dbd55024bb0459f8fc8f7109d4d2a99be50fa94e999ae9acf4bb51c9fbba'
            '280550c83af3753e27b241c98e2337798f13e2348018ef0e12be805592d86af93ea0a8373f15eb44bbe68120dd421bae409f2b77364d1d922bb2bd78262921d3'
            '3e22a84eb5cc70bfa07cd99f92319047357604dd46ef04aa57e143da72a5839af2bba03ec4aa99ef34f0edb80b58edd437bd75cfb8601aeadc16f1cdacdf0ef3'
            '2c6bfb8ab3bba19e2bbb5c48c48ce2632e07d6f8f2cc11a163d5a4217bb3980650897d05cad6a71816a795ec62cba7e6526f848b50e06f4d2e7e9ced766fc803'
            '16cbfb24cd05139d7691374560b5dbe8efcfb65cf9497a536326dfcaa5199eb1977849b19063aa17034327ab63b9d2062248320fa7b5d917445c117627737ea0')


# vim:set sw=2 et:
