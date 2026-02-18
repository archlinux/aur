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
pkgver=140.7.1
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
  0001-Patch-glsl-optimizer-to-build-with-glibc-2.43.patch
  0002-Fix-sandbox-to-build-with-glibc-2.43.patch
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

  # Fix build with glibc 2.43
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1999625
  patch -Np1 -i ../0001-Patch-glsl-optimizer-to-build-with-glibc-2.43.patch
  # https://bugzilla.mozilla.org/show_bug.cgi?id=2016618
  patch -Np1 -i ../0002-Fix-sandbox-to-build-with-glibc-2.43.patch

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

sha512sums=('7d867fa3c9c94903f6583be75ad4aa8d918f98f74c99c6615a0e40caf21c545a30149115214876693ef1758a320ebdccef017c484365c195e55998cce088663c'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '07f704a0556269434dce87f57500dd5521b18baea8484b584c8bc40dbb618b27531f13a5110c7fd8e4a01e8a42c1483971dc7f98c9f867f397d24e1798a2577c'
            '924294ded9cc7ae6aa2529d60e6f82914cf0c8b034ae748bb84605ce64a383a64fac41692fd6d1e2278251b53f16272d398d1ff31dbeb83df1ddc26efba0e472'
            '3a3f41c7d26664c0aeb43184b35a94d7b9b2486ca69b5e71c7b4794c33db18762a1a5396d795b3ca1d73dc1cea3013c5d0ed7ae5bf809219735ebd69cd0d3a62'
            '77b571fcbfb3d3e5e07217f25ab5051d0b693456c59f6273b84b8863f7ead7bfef81677cdaf2fb560e65aafdad008967e0479ac429a860ea90a4b7e36ecd57e4'
            '566c35ca78698939ce682c71caa03bb53388f0befdcc52c4a72565c93ad1528447d3df7a11f7d4eb5dfb6aab6dfb053050a97cb255bd20838315db5e1309989f'
            '755c3d2d9f24101d80b766e5adbf9ab0bb133e743dd9ea57ff2722d243bc4056d890bfedaeb23c506b440a82859d26c303f15e9f7e6bf9fc78a14f83de5f94aa'
            'ed0f58b8532dbc773c5c91424578ad4502fc42c1d937e4b2b1c9905212a0d74e83b5a935ed18207b73588a84791d3cf0d3740a7ccd3dc67cd8009ba03ce1d756'
            '3d9440a34f8436424eff33182c3cac0eebea8cea2724069177b3784ef875fd3c6279c6713287b6f2b86f55001e65010963f882ab095be8e42580f72ffd0fc1fe'
            '74f3504a6594fc2997a8105a285b08f09ecb1dfbb85a259a0face7f92c3feae243f55df0e7e88e1441e1aed9c761bbe75ebf740e4fb8a5eb275400a2eee53d52'
            '677269bc36fbf1bc02423e2347172129572cf53b19e29e35e645652d3b766346dcc42f3c10ee91017cd33161c03dd6740e3e51dbd1877547b37c1255bec5649f'
            'a57f888fa44531976dbe098268c06b1dc63ac3cf12a6749ca7c621c427dd8234f7ff6b3552545c2ee534d4adb56fa05082859951b0c982e8a2cbb226a8ee906e'
            '5c5da7de91d51a3755e2c4e04c391ce34ef0770b6679e7d5b1f9eeac78137b130e61d6eaf0a8d7548f6b88dd4c09a679ab431755e0a5d15ff1618ea12ee61b66'
            'f7688581dfd4fe85181107a5c843e5e1a3e2bd7d93925edef2c3b7efc16f744f50dcdeaa6353c9ee8f94223ca8b1ddbf46f04c3d2b1c6fa18a71d32b84199510'
            '25276e65bf613c0ce53902cb79dbf92522a9eac27988304820db5c255e812d7e82ffcb8e3cd5193e4a3c6e0bf614ebb6bef03811d23dcf0d5b5fd76254cbb383'
            '9bfc910c70b984589f02120a5c468b129f2aca981c9803b29dca41e8b878da46599b3cb1b35041394bbcabf8966674785aa06f4f74ed41b160fef86b118fd22d'
            'bad7fb835a82d4923dd8d490073b95f0296ed69da7d99de4af61d051c94ad11e5bf1cb1a4383127656b0d4d2a6ef57eb524c3e914682f4053859a04f078d5ff8'
            '50f1cd365fb6fbc1e8e257843dd5be2e11d52566453c6fe3f0d7b2933c38d252aa0d6d4f270861a00628ee9a1f9e7f245fbab16e4180232a0ba275ee2f793713'
            '8ad5532099c9de50b11504e88439b2a1a107a4d50e0ae058f2c0c5276c1ea06b954bf0d2fc9ff32d034b1a0a1942fd5e5d51b3e715f79902741e4f2b48c0c60e'
            '1cf211bc0ca20e38c1cde136c826e9e6b9d36e6697d9dbe92f436546a692e5b8c0a41569b4ccaf4bcbcb4366a531fec8cc236f59123425fe3cb7671e76f6ae40'
            '9bf087b648f982fcca93721b1f791c283c81f52ef2ec1acd0704a7414efa6e1b2eb2eb920e444002e2758efb178ea4c06c2e10ac3161815819698dfc35e83a83'
            '98e5584ae6f4426661c1efe6d192cb65b70900c992dcc2adc5f477adc3279b3069c637f668f967039422f9ec05d1bc281e4c43cc5dadabcfd4d17efbf7728250'
            '4241f5787fc2a85e67bfa2e0cfeb98e94220c050b9b93aabbc4b21f3504a33008e4679cb8a307af31551be4938d4826c1fb009af4d01cab41e848dcc3b8b926c'
            'b8f2dfd0258116e2bcec7945d9a9c6e5dd1720ca5707d32a749788478c59085acd2944e9f4ea69564485c782ee4184e698c0580ccccf702d2baf9e848da44bcb'
            '3e3824367b9c9bda9d39dc4a8dd5eef5f4cea9bfba71be5835568859340cc7630b99bf591b4679e6d35ba199aa0afb3c7ab2b99e3bf6a4a6ac2d2eaca4c86b92'
            '631edf225020e8c19c73245fc91745ceaea76b00682e721322e8c13b864f69d5526a1a03ea42a4d06e7bd8be24b0a5d0e931d85f6fdd107556902e727235fb04'
            '70aa0b658b9b350b614c45e9f226eb8ef14ce9099bc29ebbb75fa4b2acf17e0f345b1420e6a106fbc8b59f1c5592b7d7801f539a6fb763f8e56262e2bb6ee559'
            '8b32d82e026600dcf241c494baa865456c584aceb7dc0e10484ba170be22f23e53e6bde906c25aedb9a10387ea9b9a13d334e959734365a7443340212eb9679e'
            'cb30889c2e237c08868947591fb58e9e97ec16dffd0377946637600493b96692950ea386c72521109bfe7ad00982cf2cc3de7577b943908c6b73994076849a6e'
            'ba008b41673f1e2be82bc748c693b792310c934222424e0db953d8cc6afdcc5ab5075630decfb62087ea46e623531d925c323d5e1a01a7f0937c2c4e888ff3cb'
            '6a01f25a5414214d75bb15ce6f7c994d9b74ecf0ade8388892d750fe7de6a7c923a7d64656bd247103b5c59910c2b859d713cab35d214468175308b541533416'
            '434303fde53f07db7554c17d4da720dee96aedc70080f7930a39f3e06dd2644c5d674d6f567c8bf69c0734cef2b00a4a8f6f7479be04a8b6729de2e72054c464'
            '391b1d8e707b3c93c3cca4012cad7ab951370342b90e309b269601dfc51805631a6bd2a2b46bd93b448289dd627ff2ac05fed6acb75d3bea36e6f373222421ff'
            'ab67fef6df087ae9646a7030d1ffcccb02b38f9451c233e29668117a2f21280c76382613ea5622566c6b2d7c7f74479a503a285feecb3e67069edbbd9f45b899'
            'e8f761236aa099d07819b8ff77b75df1b5316d2a97c99a537047464dd7e03dd24f1df3fb533b52515a2aa6e173122072e30b8696801d2321c6da6dd85b327f1c'
            'af3d7ed34831c09e4d5b14cd2d15353ec2f0f4a51994bbb83470c618c6002c5c8d4aa288501154e78361a7476d6976d0ea3e5e283ec1bef0856fa2adf6e17241'
            '5c8587dc1b647b6810de64fc625ba2d49471e9fede930e32bbf8b50357a50bc4f42b6be5c50f0995898f647a1cc3c1c0703643fc984558465941e9ad938e9eed'
            '39f4c4ec960681857ece8154054580e7323254900bd5ad400ff58e3179bc2cdfe0ad8a3e7b7b1c3aab19c488659a545479b7d988669006ce2c3b1162e9022c9f'
            'dc9c3766fc08d29eb3657cccb3aea9f0491118b0d708463e1aebe9a65a4657726e7bae98a90ff3e988a68cf6a9b999ff50c7bc7e0c587eb56bb967e7d08a9c25'
            'fc9252327586647f030806d13a850ab51ebf45c248fab8d4b0a2cae1d58e244b13fd7a1763aa1965d477ee15e416e22086e1a48adb4de80a9f7c8b65d18aef6c'
            'fce604680098242642f19ecc97fb4f0b91acf5197f2e86091502faaa6a28a3fc66a136ac31e0f3a05c154391a1dad21c2fa87a95d528d6d10bd097cee3973510'
            '23def56b0eb653a2fd444d529fa22bae169aac30375079f99aede80e5b24f0ac31e39ad5c74622c3209b540d95cf07e3354703982ad91be53eb7269fc676599a'
            '72858045b20a1dd6da1b3db7966631ae1b91afca5bd797154a99e55354b5e2aea46f8a0337ed569d7fc61b555c431e3b16a3fb245ecd0b680e86f8b9db63fd49'
            'ecfb58b3fbb3709567d6f72e0a346eb5622b9493c40aa44800bb50737062c0a7826c7687475eea3c606081c4a653b396bfa53ef039371d3de3dd8934a0508751'
            '9929e989062073fe0626f83dcdaa15450e91f2fbb71bf43679d2bc0e7e99084cebcdc045469cfe873fadfb542e4d72efd66f2560b8fd16efe32a359ba2ba4650'
            'd35e93f8fa5182b7c4714652876dce74fd65ed4f165533adb69ffdc47a8628211971b6ce004cb456d6d7463e198afa97a412ba6b0e8c136313f4a7b3761464ed'
            '5cde86e48a2ab885f44929aaecf1c91c78b7a64ddaa00d2ec39eafaa390807bb036ce9d223756a490837224e548d1f9f7e78f8093d4a651b1f825c7ea96cc1dd'
            '7c32f5f05bb9a3933b22b8f33209ffddd29c029db12d51041e9c12e09251ed28b102d5e6bc1be372fa0645f5644ddffc84627d94721c2e4784610277deffa270'
            '9ebc10edb755895b52bee01cc729a9187471c4d85221bc0bff43babd3c3c444a5544ec993c2bf4aca32cc62eb3d60b76f01fb46a57613c770187c727680c4d21'
            '9b2fc2f3e196ee1b24ac69d8d90bb5b5eac8e112446b52238cdfd58eb12793b7e1aae8bc3d9d815160048acbe2940b8c960dcfc0cc061cd6a19d1b7803d6ab86'
            '97cbbfc639122839c41e8a96a383b33b2ee63c9a7390ac15c8e47f454ce460a98459cd1aeedb90968c9febc584721855d438f96ab33dd668e9bc3e1d3d6b78ce'
            '9776b909a9af4e954ec370b68a257114667f7caf20d48acbc22ca3a5fd76fed8236823b6e2df9c6da999ffab1b4ebac17a0ec30e2802c57f66991f8ba7b4cd07'
            '9ef8ea200f9d651dd169513db0665c56bd14e5215fcb661d54b813e14a5575c61a3997462afb4ca317c429a2f2f39e5a56187f2eda0b9ac4352428cb93195a24'
            '36e2f7a0411470e5aed949c788f745b8abd90a4883a1a44f7f61a6bde2c4cfed98ddb3a9cd25964d874aea2f68533fab766796e6e7c322137eb43ea2529d2c5c'
            '64357116934b2685e23e00d9a39f678e15cefaf5368b67a0206ea6ea12678c975b636fab1fa9b6510d54a621fad6b6b58348e661ee2a6e93d387bd02ebc49810'
            'f95e4586baa898a59f9f81bc0017196813654b684da1bde9ed7e708ddd0492c0cead625c00bd083b5b09d7540891ecafd1f3ce3d40512513e92dc83091d5851b'
            '69a8bb307a125274b45e0ba41aa446d08d877e0dd3365f681fb563816c028323c40116524eb67e3b774517301cd06dbd4a9249ad39e519cad342ca75615ceb64'
            '29126ffd2a69bfa7b01aa58c8d8f5f5ba17ed3d028d7959758c55a2a60266b3ae3909129dd25a9cbcaa45c0efb6fd998495e6df5726f03e63d8cbf18229336b5'
            'f665b85146291019301e8f4a47a6d249500405b5e13a132e7b54addba6cde74b4f70aa8a7f6a2516b4860ac5a44b7dae1704dde2999b1e141718f28f3fdf9fff'
            'e45ced7bb51f38724918e8a627bb564f0fcd40d2f1984fc4aeaec166663f3668bedb594257d979aba5957f3ba36bef77ab49f302147493a917f5afc406a2d427'
            'dc20a7281c1796b1b5613d884aa0e8a0fe6328da69cf21862568895646a77148fb57d6d4523513dd035f8125d83a96e3a4eca19e535356f68267f167a4aa9d52'
            '0603e6a881e1cc077d66b0c7e1b6264e83fc92dd17d2a04379cfc5cfede5383d2be64a5596454149bba693126acc31f553b58f25b5a26ff1dfee8b58febfb46f'
            '0d16309ee6ac8354abdd9e054fe178151d49ee3c9180ec4edbfdb06febff2ed99817e3f7b12beb62525a3fc5c5f40f441a2d64d4583100379c55aab3ba099dcb'
            '77202009a117fec5b82ce81666da5b96dd893900a28ffbb8d1794d849da0c4969423378634381b44e18f466597b4a908f06b01bceaadcf7b4e0fa902c670aebd'
            'cb2389f674d021a18d4fe5e03a732801b0b239b04a083fd481f9ed8a2c705a5369505cb3e5ced0924c83c3b346304ed4011b73b705b44b747489e7fc34d9bcaa'
            'f56822c6dd33402d0475b2b4c79b7095409f05b785fd7c0d782b029e9059b446c70c7c0df59272a085e0fc1fa913ef797791b2def0fcb02e56548c6c6620f445'
            'eb0f5f60e1166409748fea50f8678357419b2f55d64cdd9dbbb4f4b4ca6e085b7c5004314ed3679dfd020098c0b6ac379d759eefc37d5587bc1adba699459b10'
            '9cb59e84eddf5f58b08ecf0320b34cf9e95b4572ef38c8ca5ffad8ba727c97e1027b5b250f16ec8b9a3a577c806ddeb67e88fc9e07c63ac1d74aedb218f13db3'
            '5757979ef058877742020c96173527fefc01ac55d2a08c772b2b3823cbfbf46549747620dcbee4577f32118f5bf1c67beed8a98c81b4bcbeda62c96ca5ad84c6'
            'cecb9d60d676a8af5bf4c7d0d144230fc4966bed1df70abd7344455625e932604f4bb5241b4e9579c45d254a71285e872bfcf8502679f70264f0bc2a063ac3b6'
            '7d2a6f413f3ad5e3c115aaaa9532a4a0c3eaf6a37297c47a466820a6ded1968b4360659b7692ae7d3c588c2b72b9702f6f1ecaf372dd12234399fecea34de2a7'
            '5d45af5dffb1d59d33fe3be64caf95bacfccbc61cf42ddd695d4aa90b3d3d78b61eba4b977df6efdea8c7f6775a02dfe31e292ea1f3b81b3bb9d546c05ef4f59'
            'd2ce6f8c10ae56184f5764f280bebcc2a43f951b76a519d02a45bfb4b705d19984dc298e8c48d92cd4b5b235f9aedb84b302e2d8301d97ceba7abe27e6cfd5d5'
            '00d1db81cb0e84817942b74aeccebf794cbec62efc5eb5f76b67fd651d81d66b137dc33ec650538ac1c86bce3802c68f3d45d552f0492f9648b410f2e6c9edf9'
            'fef5af8dd656da0b49d7a0a1d8b4f363f994311525cd6153da7c1418e1ce9c55aa310265a0025e189ff35e654458b4b501c776d062d17a6ffd27029a49ee481b'
            'fe7705808ccbb1eea17f011347ef9ec9a32369fefd7aa9594f13c9d6e7607fc4ae8cdc49f26ad052916dde6a7922082a64a3d1ece4285181858b5a7359241519'
            '356ad320439056680778ba243fb4253ed4795dd33958f5dbb0f0016847be3ae22623cc598877de8a84229e61b91eab240d800d7d2c96c753d7020d6e4829fa52'
            'e3d956f0f5b0e4171707d5bb9f3c59ebf67d9f969bcb4a812c66a0b43d78f2cfc03a96f41f6ee7f12407b4807e9b240a31564cae386e34ed92064bfddab6cfc4'
            'b9af99997656f176eeec81d986e34f146b629a18de4f6dded2d0d0d742e62d75a73a7301740c6d28aa282d0bdc8ebd8d4956567f433d32fa8e0c318eee59e025'
            'dff3613d6daa59cfc82ae62233b3defe0d6cc02e7f1bf867e59d1675fa17bc55ca4d289422551745eb0ae3cd31f100d9a703c2d1614bfd15881bd44d6cbe4138'
            '2b5ce065a1be860c8f8cf734d6de9891a89dde4dabefbaca9bd5a703c800455b08e3b27e39a0a6b1db0577e5e1c5965742a4501e2038a9af2ee35e69032011ae'
            'b49eec1fe6c48d11e5419858de814205d43beacda4110022fe4773d76047247f989df2c130b6cd517786dcf69410c3422a0bb9614d09b63a86071fc9abdec351'
            'c932f35443b8b633ff388c1160b00d035cf891e32711c51e2297376cc7b45ec8dbebfce050b79596065d6f865674f70fa681352ada4438fd42ff36c3dee91c54'
            'e8b42db2a02ecf41086c32717917569ca321a2d7af5315d1c60c0a996036eb717cc9b8bdfce15630af965851f1ab017cdfa09c8d2e062f2277627b6a932f17c1'
            '24ca9bc2717b982604898b3f20a835772dbac0c6c30a2f5bfc27ae639546f7dcd681e18e438d377a2826c3e0b6ded94cfa588b00bfabb0f4616f4ba40ad39012'
            'f4b1a8816f0ca3d8c60871797157747bd014f2a1d982a3ca810faa1903a9b66b721b6dc4a2f940604e8f7c0d067b108017b0bf2586a26e1a6c3ad186ab178386'
            '09cf998f1e8b0187be0764142500eca2b71ca3c9ef12efe049271686c350988b814c871acbc56880c0eb0c2738ad1a9af88ee4ae0ab97e0f60038efe9de079ba'
            '13f86c12d8014c9ff1f81068e2518e168cab0b461e196924ad0b84a5834fb95318ede38d83a4f2a46007bea2194c34dc313bcfb01d23cd02cc8a62a28635b761'
            '41ae060bb492ee861be23b64b9923cb17ee2b7525d5c0aadeddd953890d27b3340130ec86c1273a85c50634e6618e227b075870b74439c84ed2392351647f042'
            'd7b3e4f6e59dbebf0351aa767bc203727e4ed935325584087ac9645ff6bd64e0a58551bf7d9d3bbd88ed413eed0087520bef9aedac511f66b874255ed41787d8'
            'd0d0ecd8fea251f75721afb0775bd0a49d692d5c644f7709e00d970f65f167c98db17194436b01354711272ccc9a967d49e2b64cd2b0c55c7c2896122e0841b1'
            'c8a0231f1c35d3a6083548cc2e3ab8ae2898dbe145200292e31d284afe6b1ef2d1cf10ed6d7e44e612f81414067daef76bd53eb29db755700c9b73893a07a9d0'
            '4ac9650e6113513a55efe76463aa521c43ef0a6a3a9b87f2fdc6fb79c0b6de0142cc444ec6d51b4e5a7575c3941297aea442c876ad8b84abb4cc6a76a0190a4f'
            'b28f40c7d04d6db68d72fbe368ac38ab4de2cca4f4af275476440698d6b0b512847cc410376905716082d5fb4c65fb97308319dc7609991cda28bbfb00191218'
            '8cee058180c0acded751d0bc9a1cd97991d577d1683021b7a942a8de4f089f42ffe2bd659933e908dffae8dbb4b31397ab51605a918d416abbc7b43b48d2c5ff'
            '80d27639d8b2b5eee7fdc7c22175dd2e51f13bc431c0b6682e1fef9c366da2b6d5b3522403168d853127d6156f9d1387d4fb80b4a334b6797a8bef2183a1b6fc'
            '7e14cdfbad379086a4e4bd522d3c6c40ea34c716df44d199c04f88cf0a772310a4547865ff3daca28468bb4df8bd2ff855cb54b1ee89b3f6f3f87c660897b338'
            '0a67eb295dfe1defdfb6cdfad09f02ec536bb967136e94993a41faee7453126382837fe6f87f9cf296eb826dbb3a0b4dc2dbae6c74d694df18eb681439069967'
            '7287046302dc803f87d6b2bcb1fd4f258291f391127e22b301b1facfa2c9fbfd03300ffd582cd30d41fdd2242c8cfdcda7a6123c353c6707150df9782e0dacb8'
            '1c250ebfccc27b7988db17b2daf0c47e61a09166cd8fea5e09a0107bbec84cd212263504c33c1b12b6d2d4cd9e0ef8ad4b0cea92cb228e7f53cd1bf56e0e2e37'
            'c7a8bb1f9c73f3f8e134fcd1cc79a476dd546bb7e6704d025f7c014ad0c6efcf373ccc3a84e5986913f221fb99265e8866a312ca152359ee2bdc8ed038fd5ef0'
            'f690b033e11437dc149ed5ef618a0b91471f6d47b89fe978d6dace3ca63493b2ad2221695714f053dc1d6e55a9bb48d125b58f1ff21deb1c454e613981797e47'
            '42f2658a7b130dcb917ae887673019d438fc59d0ee7dd273853fbd846bfdb47fa872d07bac16b4b8d512c2f411d149782131e8f32a8883593e9b6cbd7cd66469'
            '8b4683a7a1518293bebff1ee1a4648dd828152569535d2a82f815ee0a0379bd7e485785c690633889ca03827c15b5ca59c0cc9779af138c8a06e9d57c333e10d')


# vim:set sw=2 et:
