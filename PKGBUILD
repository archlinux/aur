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
pkgver=128.5.2
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

sha512sums=('1e5b6bfe63279acc8b7350c08f2767620f01b979057f50ab1952331b6efc05124f7c9530a7cc793b0f3616344334a2903fe5712bbb45418e936684d294c5530a'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '05f806acfeb4af169d6e0204c0cec9559bd51052ec9a10cd9badf3bf8fa18406dd3a66d2784725b9b13597f1fd3d287dbb71e3b6ced86b80478519554b9b0834'
            'ba3261cb8debccccfb6734bad534bba439bb440d8ae5b61b49e344e8180bb2de37629abc2e0f2845d43cd8cc553ce7129bcd5328b297343e3e49f095c5e79ba4'
            'a705ba07184a283a085bfd5df5210e56e6b3cd4001968aa3cbe0f3b68eef3b7053622082eab0d81faa4c426320173a565811241ae8f35fe80ca9aec4a5c0eaee'
            '7fe231bdb7e14a69e62fb56b0e0cdc319c334c04f6c97143a48c04f9c58364b6a964b185cc5d80ca9a8c677e07efcb9ea9d8820a23daccba94b74b2e0a6cd979'
            'e243c3797695969d60b9c7a943631c89fdbbe9c826a261a934cc85be0d5c7a897164c2ff53d09fe3318586e1b097b6f423eab343d5819d38044f660429736d3e'
            'e69876dfd060afbeab8a378b1a545bf1e1b372eb50fa538203f0258e7aac2a9b164e5d9bc268979e4000c0e3064e990be89243fc15c285efaadc2dff674b31c8'
            '8acb6a28595c807a24c13515ddc073a8b337df36a876fc18a05e07003d72c3954ecbf02e51e774ea9ca907f930267ebeb2a921616e14344ba9372770eee982cc'
            'ea24ab172acf4c3385434222eb1438e7322cc13ca1cded2aa0f172354a4c0e9093d6a23fa65106c8800dcce8789a85d304774e37f4bef470408ba7d4a57c7a3e'
            '7614146b520b6348d8595618661b6e0a7ed47a5ae0cca3b14a26bdd6e53176fe87323074c20282545e0d5e06f74d84582d4a8b361e8f474918e4a8630f94c918'
            'fd760377d055f8c75ec1fc5ae5e2717befe02c79f3ab4abae936ec103a50f42c2313479ac65505f4b28520edbd0f4d58f8f68eaaa0e7f77ec4e14e928eb6a051'
            '51c69a11653e66356968e7bafe0178a8e440583cc63b168379bb8134ee2227ab152aabf1d972d8ad815a485620fdc23ded022c8a168be1f4c280145059c3f0e1'
            '49c9030e5727ba742888e0e75809f08bb2803bfccf9f5d07bd5832f2fdceac9808892b293875ac1d083ee49d61a1880a5211993790cff02ef410782fa8b35f54'
            'ba74165540bce14b484b1657c55043ddb9d79e9b65f1c023645ddd841a0e33fb0c2f7d34e3b3e3426581744d8f29f90e65a3ead05c4e8696815dbf61b9f6f2db'
            '3a74c1a16374603d1a45fdde1d68834f95e282f200bc6260657107b2041f9bb64e58eec01610cf873b5a7e2bd1a8ab6268b9e3bbd413a62f2d97fb5dae388c9b'
            'daa5ae949d1b2b09a97360ad79435942806071b42076d7dc5471cbae604903776c7efcde7e8fd0fd0f387c294f96fb3c41393801497ab72c775deaa9caee6c9c'
            '4af5ded6cf63b5ad1cae3b94a01159ba937484efbecaba068f9b4939842d43f75027b040e33eaa59b78de6b82c9027dce44d0dd218f44730d11ccee442044aa2'
            '6174bc54a9e42198707517613381f0177420c32fbfd771b40ee9578a346d4f6832c29501911ff49869dbd8b7a08699d3e95f05d319f86ff54fba0f6e965cd9a2'
            '408d717eb032e97080c0d0510e7fa7276ea3b197e02bb283f386fe99da46765e9ffd642d4e666cdfdbbda14fcd1db0a9895db4956562f0510d5d9df97f231bca'
            '952d2b0b110bbb1a81512bf00cfd3a9f2f7e90962b231e1e0fc700b04e9d89fbf094dfc8e15bde494b428374d03651ea62de8f251f4b9519b535a34a63d42213'
            '43a1c75ec14921ec93c995a8454e8240f6ae12e6e026e4d8b67699d407f270b03733d3c2fe6c29e40427121f4379f9559e2581c843b155ddefadb994853f6d37'
            'de1b3af4a19b61c21a706261edf22c276f2169b8bfe0be09cd8bd91a703494223ad0d4c52fb2cfe0d7fff697135ed310a02c7794a6591dfcd33746cc8c386f42'
            'bb79ed2b18b2c0ca12936dfc7ea81fd73d2b04c92af0428bb1b01923ae477e9134fb4a4a1b2b76a2706a6968b53795cb29532809c4e969b75abea667f092d6e7'
            '14ae06c25b0d7bb26baf4231191d69c39fb933b19382512c056c1f6dddcc03b119016e19d8dc50d0984b001e97dfd7018a1a01d3915b4c4a571e179be9560b8b'
            'df734bb09351dcaf99579a203cdc4ada9d9e7e07fab69aef9c7037cd5dced5d76b8df9cd5a4a7e4f9f7bde06ff7b47c08e405919f230557bbd14eeada340612d'
            'ef4ff9f9677cc857450f5a3e0de52f04a001a7ee0913ddc21609ec6d88ba398ed8bde26ca34532f467b700b5b71cc4b1d12b26db24b0229c0a8e7d7db0b03d30'
            '322875d12d81eec75f2e9e990ea7cc2962c62265760bd413218c8e860aaa8b943320f715dfd5e3bc2b13f205463af93c4bee85dfadf48702709c15bfa116f100'
            '778b7fab6e86f39b5d1c11ba2810581fda08122daf40ffeb092446691046655edbce08b1603c322d624878549163e7296b261539bf374d56708f6b13427cf496'
            '69a97606fe5f6acbc1c773a36a6eb62ab2aa038a9001c88f71c92038a68f36c9ffde14229141560e3d09fb79820b34138c40d0b5f8b75d88e33090c413bb305f'
            '19e4ffc520e3b53ec1123d6ef4c453d6cae9f273743006cb795f4fba2a698afa56d52f31e112cf4762c4bae29c77183b78e7b6333114b3954cf6a71e4cb072ad'
            'eff3dc50005ee1e84b6d3aa7243b83410bac530b99fe0dd644aa5064a3b0f7aada246f531f189264044679314468013020823e7c64e3f8eee671ad3c1d634b63'
            'cb44715e0391fa73be2343722744976bb2d4d0894fff8509ba030a60bad5d85fc559c447815fcad33c7b7b1ba617c986c3804926c75764134eb5e98fe9c4b8f7'
            'ced8b0185d4e2f805ddd8d1f0b43896285adfcd58befee3b4ceb164a0d68e4e9d3b4ac930ffc00195bfea8aff5abec840bae817840a7127e97f22c68fcead8c6'
            '22977bd7228c86896a39b2ae5b97513c163403d7261d8517192af45c73acb3ef89b5b4a3183975e5a41f6cea5b57b88ec065f08bd6b6dc7c010bbc7fe756fcc0'
            'f828996ee4d2d1b85bcfd7d9f378294eacf55bb29b54c98ad1348697c0635af2a4ca1b562e833a2bcfd6e9e8a81de1610592a740f69827153023d3612a9b1c7e'
            'cba2ae04d9ee6923dc943714710f30724f15a9b6703bcd09021461495c5932b2a040dadd8d951bdb16211c2f2b554396fa49ce71957c703f2832facab13c8f98'
            '61c8608177936a294978cbe33259ceb2677ab2d2520885446174777ea6c04033dc9e48480956a427aa14a71ef030beaeddf5ee2b275bc2d1e67265f8fd71b715'
            'e8b8843100a304ca575c95534037d18380505405a60263a4c7b4c4cc038c4c4665e0162342706516aa5f88b2a43f803cd74cba3d4a6e428f83e2c73b5d9459bd'
            '23f8bcf9d80d2a375e8d3740ff9adc4fbf5658c3115e45ba16ff16a6865724663a115863504a6a0b57106014fbe9a1bf977e0bba3bd757aa7096093c7d874b27'
            '9113e02bb561c4b6041c8de1534d0b5cdb23efe8a1d75a10010012e1d585f44c30597d5b5f598be5d593f09cb836ecea1f4e9e259c0ef55caa2fc7e515ee63d9'
            '4c1bebc98c62e077f2fe478017b3a85a05fdb6c2279aa5cc42c3136e0c51a3d5538ceaa66591936c3704cc5266c66b849200935743fc7f26ebf05066f705a2b6'
            'ef57e53372cbf6b1cbb8a42c6f66601881e60ed96edcc25e547a8dcdec5dd0e4b26645c1c5020b0cc77d1f832dededb52728952cd6186ee2f6758a1b7f6fd847'
            '94ed939262c983db1db014c0a8878ee672f1a44db3eee5fc650cfcde054132752481d8ccb9a2ae29991fb9947aa1bf47023109ba58a6585b5472974b9c971b49'
            '2404eabf40009be91b46a91427ab2a818ff114e526c870a8a49fd0ad496e73b10dcafe6974d066650e449631bb9674556188beba02181a9bc3f84f2c4432efde'
            '04f2c22b8481628412b5b705dd6e5d3d403ae76ab30fea92e5ec20d7aaf3600932ed9da03a96c8acb8d36e7daa88381f5bd01ae5636bf709f91510e5d0d2eff8'
            '4fa3e236c4e3713a34f5dd6011b0be32134dc5706ce28ac05b3a255d1714fae9b7d13e183df962627f1c1497a0b7583aec8da3c48444e7f0f75ff5e62a329fbc'
            '109c91356d91a8c77f7de02b022880e31c5b6046a74872b6dcbf656ee7bb3dcfa864f63fb1d4feb564f90ab9a4097a278eb94d4f3f4430dd6256a9e6d3b53d94'
            'c7de844c91c9c3d03b01266f09196914621239e2b5a4151221317142e08d89b168c1f0525cb2998fc0ef1e533804d0a1676eabdcdf1b529783f2bb28bfbb179c'
            'f12ed6032341e4c17c490c194ea128508add6c278646f4567ade4ab4a61f9d82fe7fabf7238a7fa3596d581a63cc47a882b01ab9be0a5d70e38d9bc2684124a4'
            '454ff5af4e00f3dbae7808a0872560b4809e2c955559a22927d5eb3596ce9f43542968a04434720f2d6a6e848749789c12d5594c2be809def9350d7695e33c7c'
            'b626f9b41335ac65abb59d4936ecc4c8aad832578e1b9f23ccd9837c44616312849956f736bb32dc7cfdc0bcad56d386cd20c1aef5df510aecac60ba9561fe23'
            '600e1c4be080d67569e901d3e577fc30785df07d5e835e7d346f1d0312c1d42327adc3167c5fb9c6c3ee36606305df5c1e92f33a84fd03a3467546772ba557fc'
            '69ad0bf9cde79eefc316b71a05323e98cd62c9455e1851c330ab198bbd1b5a2bf6ae7347deaf2c89df674c1dd910eb7c1577c0205f1e1192b62773f17fc7d076'
            'cfde7144e598903d06e350328cee1e76bfad624699e041f42b2e9e5593cc52b5f9893e93046f3ec1a3d83b33b608dcce4c672e3018ed673aab216ae00c9ff3c7'
            '8449c1e33880eb564f4e59464bdf3127642b210c0ca4ef55acafdd2af5ee12a3bff356d686aac8dbf9b95959a4b72df7b123e1e799f081a2ee6719bcd78a3916'
            '3dde318091aebb7f3aa4f84bd083198987a42e83abfb3cf4357e45ce586741fce7cf237600c6d076aeda781ae276e4fb961b4f3cfef7890746e9d2214ee512c8'
            'abf30e07882e3e1c67dd9a3767e44462f5205fc8670becb64ce9d2d927e396dfff48dd4280e5dc0c432a97136d7f15f79dd2c47ce149b421c89a4e39d4c8376f'
            '800677b0dfc98a0e6d4cb2d1a3ec69cf694bda6a1b0d02aba319ab5ad010304795ef24225be18a4eb2a9da6ad885b26f37bb799356fdb24ffac78e2c30f9b618'
            '098c125946da32aff673dcd42b48a2bec981067102461121e7d0dac090c43428bfc7cbe4052dd6be03d5851b530b01501a40bd6c8c8b29073aa438ab798d8018'
            'c0d466364f947562dd7f4984d8fbebda24e13f9cc452dee25b6088c59b969ba8408e42cfb209c7352ef6b45342452a81e0caf79ace7434911253c01cc79a791b'
            '52cc52d62e3eef4cbf2e43efce506e9c1143c82d1386c567d8e427f97d7742832eac45647a3c708caf1e760d369134d87ff42edbfde12173497f2e2462c924a6'
            'cb5f330401cfdc21b94887be4d3817c9eef6c8b5a70a56d1a1c8e3e599c7af7921d9d576779501d48133b388fdd901f70b6407f33bff6fc70008898b7ff942af'
            '38f9a6509d3c0895dca4cfeed62d38d40b3c43199566407f234ff8b603d2ce728b0f4acce83a4e920156eee2e66a6b0aeade0a984dc4077afb70505a08ea5a9c'
            '824669b965d802b539080b3060f26952e5f4695282b30bde8cd3d6bf1de86c66fe3f182cd862202dc597d61116fadd0663e4ee195b224702c32a1ed25d00abf8'
            'fd78da8117e087eaf4b8e70a525dfe01c2c466e4de18550446631f601f0c4b13551c00347c466e31592d704fcee011aef02b18fa4b4ecc6e6b21028c34055221'
            'af1fda22dea537be5fe393b5c04e2064863feccc65abb3985590a2544b58410b51b78ead65b2b371f2377a830818f994128378bd063158f6cd12e3b3b13d6152'
            '8d0f424ecb6510147763bc116cbad88afc819e161c4f8ef25d691b3220942a2adf97eb6213d3081f03cad7159918383002de2b565774de24caf85de5973f96dd'
            'f057996d20e32644e39a0a685a1c1a62731f97cd8740ffdb77b88777ec5ef355d13002c13f32ab320c7544459467ba1394f4d8b17fad9a4dbda276e505d0e37d'
            'eeacc6e5448a52cd513ddc867bb9df009c0cbac994fa149ce157e5fbbabeb88a3893cd386a9f5865627e40c18ae32c3d891977abdc8c57d0afd50dd53760dfae'
            '854cdfadeeaf1fde8823ad98f57014367ddc523594e0f08279230254fc2616b1fe040d3df5fade61715cca6ca51e996cd3f22058058d5b21fde3ca8cbf1adeec'
            '7ea92a6d20eb566da396cb31f2c5cd9587cfe8b46935d86cf286842c38321888559889d34248a4fbc2eb28b29718442f83302624129bdb14488c27231d45b5e1'
            '14451ecc6360b0b2da2d9d7b043ae5b95472f5177ded9dca64784e0508d31894b81af4d69fc352eea846feaceb447f9d54b85bde9b2ee51fe23cd7cb37889625'
            '6b751730fbc0bb3820f5e0fdb2ebc0ddb87b319da9a66c0e37aafb3d14200333c9cdd12269dc3ba54ed7d2168d72e005612589586d3970e94277b10dadddf3b8'
            '5cd91032020d9c45747d7c8ca34caa7057d67ab3beabbef92bb95e6a947ae773def49111d5a6f08f4ea53c9a59998619d74ce92c052a265708fa882b3646996f'
            '2c259074c3789b36ab11e76c9bef0412ad1eaacd093251270cc4423f459cfb51f2aee8127fdb788b41a55944607fa0a2edd5ace22103d8bd19d1e4b26480f05f'
            '7afe6bcfe5e4d408cfce1e75bb1b33eecb2deac906a4f12f997660e5a41d9ba44600d92f86f14aaf966fd59c2b2614343db7d7608d3f74ca8a6bdd0396a68f5b'
            'ccef03778c9a993e3a8e335ff755526f27909756a553660b0d0ae94358c7fb99767f00e3d97b6c03246e0b2f138bb8506231e7d4bd9d4febbf133bac6d29d3cb'
            '9e3f60272695f4d0acd2c7a2ee89afb1bb97c53f57d45357d4d6266ab5f0273e9e1845ea7c3050c9882d0a5f656a51e099a3c17ec5b325791e05b84422ae980f'
            '80c2e66e7152de9c9e261ed70d5e4d3858a629060f9b0cff9661f77c1fa742bebb706277f71d482ce62bae12e7efdb95ed8362e9309fe8b816aabd932df98599'
            'b00112be5a252b0e1aae42b68423ce50fcd11581084b4eb17cf81b0b94fcbae4ca156b0ffd5ab3aea1b753e0a064e895a9aa0e20b7438c64942cb2edca821d51'
            '4c2511996be6cb4a9f68da7b984d1ea00e4a8987c3da238e4b9e2c592832166ae5df79a109d4f46f118437862f9ab4ff76a7581b36eb6bd3afcfc10566ab9ab6'
            '0844529924312d9c54ad9d46a3f1c41cfcf7d306faa8d8135f2f11b87a4569293266e0a956a94494248ea839b8b4b0790364502025a488b5c4a4386869100dc9'
            '570c10716a37e6a20b9e7a6d13cd03982fe446cf4ee068e6b128854a6c697b77577df27c79001f4ec0e4e82113f7ac7eefbc6e2454e4ace99c68575a6d068b98'
            '82ccc39211530962feadf7cfd285b375de114d56096e927b49cba534554c2a43b95cbb1013efcc845b59ee29edeeaadfd7f5baedf82787e52c0e5add72f1bb56'
            '185aecb227fac8fab6cef610d8639f08e6780ee0ce64a76de91580918bd3112f8b009b278a45f41d428b1ad84e3f1ee6ed3242727f79255d5468f3d0d7bd1b5c'
            '5082a52bdcd1a444cbb7cc0a6046b5f8cd455d169bca7980624ecf761dc4c46967dcb9d90466f4908e1ad60c1fd98766acf35b1b1c8abb28a2c082977858057d'
            'bc00869f4f6393efc43da2ae8ab6c0f4b7e1215f8c9ac587f33a5095d5cf9373b8d619e977ccad8faa0a84da8245adffbf25d31e21f22362cf71c76ad024d83d'
            '8a99c8936ba1b78cbf0fd6befd605e8a297b054063f8fb4db65491bf3d0aa13581430d883d9051af300acd370a02f2c35c751cc6beba372185238d91c4b1b8b9'
            'e53bf4799202d9a636bed8287b8e38dc74e96f376a5cfb0c7aa1d460d9c9c78b09b4316d9d43dd4b8541261c8e9fb320b4a81e386727703e4d414a147547643c'
            '8dac1a066c102332cc144dea951324cb2f7682e90bc4b2b22a0ef0fd5716c41a788a151ac5aede0d0a0beb501d55c4022133d20353a56ba9c59c8c8a3f265a25'
            '2cf1a67e05fb40a37c2c2a8041baf7c81b482b6d1587e3d8af50c8098bbd11bcadd6c58c29ed31c3f656784b3714ddd2d070087d73777b90289fdc7d9d614b40'
            '2c1581a6fbf88ee54695473ba2cd19782bb0065ce1717e88ad772d4dc1c2eb8cde8ebf420932a47f18d1d763adf644b21726f89133d4cd7a316212f8019ab59d'
            'a6fd230a2bcf076d8a9a12642812be2b653ef053dc0fecb8bb8f93c77bb13fdbae892a859866a1a5d3dad94d56b6f336603582af12caeb35df8e1d38cf88603f'
            '17df4e4880f76b60fda58a22d95d8232647ffe21382db87ac11a030fa2286c9a5fa3ef96ef804d4e89caed92d1cffa822696a104a54bfd270d7387c992497176'
            '7d7595ebce9862136b7a484e00f8746ae50265b6a23b9dbf5128e9c342ba5c56b1efcfbd61582011cc8d88e9ac543b8f11f266cf1854ed18b63933e21c5f757d'
            'b61920aa802aa5679dca274899a6b97f846ebc221cd5a111cf2be217d9579cfb595fafee93d8e0c4eb67e19f79921e902ffcd84be90e6fd96d258ae1647de7b9'
            '3c789734b539984435210b24fae49facce506757f45888136e46c67bf7446e7d3adc67d2153a5354e58fca858eab2ebef884d666b74dcf9bf654f3fa41cb5f8a')


# vim:set sw=2 et:
