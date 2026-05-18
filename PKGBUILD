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
pkgver=140.11.0
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
  0003-Use-wasm32-wasip1-target.patch
  0004-Bug-2023597-Use-wasm32-wasip1-target-for-clang-22.1-.patch
  0005-update-rust-bindgen-to-fix-clang22-build.patch.xz
  0006-skia-m142-update.patch.xz
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

  # Fix build with Clang 22
  patch -Np1 -i ../0003-Use-wasm32-wasip1-target.patch
  patch -Np1 -i ../0004-Bug-2023597-Use-wasm32-wasip1-target-for-clang-22.1-.patch
  xzcat ../0005-update-rust-bindgen-to-fix-clang22-build.patch.xz | patch -B .patchorigin -Np1
  xzcat ../0006-skia-m142-update.patch.xz | patch -B .patchorigin -Np1

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

sha512sums=('d06adb3ef4de1324e3d61872d70de31ab08ac013f33903549bed28c6ebcc5b4dee94bb36388282c1935d77d1a564079f3adbf08d6bb80284a899cbb3d861300c'
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
            '1099880b5a1af63b426fd5fd10f554f0a2ef2b1f3a044372e997940c115d441441ba14c604524309603be9bd40e31973bf84ee77fdee2c15449bcfdd6f1c3d22'
            '78a4b4518316ffa7b7409041ba1cc64cdbb6b118fed7a8c2d75665df8521e836d70d2b9b491ff140990a4c4c2472f9c438fd74167acb9f965e5428025991ce4a'
            '6413c00e574f90f08ae770acb6e1191f1d8fa60742fa540265d4333ccefb08e0c7225f17e817f49d8b167f7068780fe44436036b5a37b3fcf7ae9bd703171f4c'
            '5cf81a70a83e8f25ff5ab9f8c42afd58a6dbb95fac784da78ab21524b836430b1b68f80e9626c0f1540c53866343d6955b6552efac4908acb17750d7b5626d8d'
            '4064306bf02f5da0c57edca1e207de6a225355ab4929d7ac1df8cf8b47c60b1ec8aad4350d65828eeef54549018d39e641aad7d37d0ad347b572ed4b4ea211c3'
            '752d9d2d7a5e634bc5309096444f737705e651390a70bfcdd8d8a14e97f6ba16087546cf39c4588c6034c4f47b795f445542effe71124b5059c24adab94dd31a'
            '127de6e64b8a85ff9998dbea57ce89d16b4b6dc34eef063645d0de4ce8762a6e5f0647812dde4f7bc6e7fd0c7a819af7d036be089d2a8f4488f2cf778577ffef'
            '45d4775723eb6f53ed678b879e94f8d59c92204b391fadc454298bb44264142e67dc438cb9839ef88d29c086583e2e4e96c25b886e6f095ec4326a92e1bb4ae6'
            'e228029ff32870a123dd8fab8bea416ca842cb8e8ae44be0b766354cc5d24967d4ef9d668aae752f5b89d7193117df27b65419880bbc8a919369712b57b00ea9'
            'ecc9a8f1813a8677085b29ca3762d992ff88ed0f749c29f9d6de32b8d61e6a8f26cb9d150719a4d091ec11d73d2930aa72d54a36d13343b31413d5effb0f2363'
            'e219c477104838f244ccf1d1c3eee8c22065b4ff1835f5918c10bca60c2fb5555217c2d626120deae6f6ee808fd2c393e3784e5af1fc83a0b9339629790fe706'
            'ca61f6b632db989e7bd8725c5fb834fbf19d8f4d5ab7b6238e005fa4273096855173905111a5a449dabd4b9382ac18c59c25a89692dd288e617b67d5f88cf648'
            'c6a6edeced542a7d18452e2353cd8da1df62f058937299fcd9bef5a30cae1fdc311cee2b66c8a6cfa2f8a1aa5b78cba36dd41eb16024aa70c2a16cd153a34f7a'
            '0e63b6eaf2ab583905cf7f27c055e0c93f38e8ddfb5513be33ca4cfdd9bb30ed1a94cdadef5d0894f30242227abb57121c9b5159d29459f8a142c8fd17976511'
            '368ab5b4ff8a70b3547dca71394a5c2cf7c70b7209d035dcfbb9ec84407c395025a7a89313cbb703af28aa5719eb6c3fadc1f861234c2e9ffd11bd06e2eaa0c4'
            'f385612bf6feba63cca40d934f470b639b2fdb07dea5a430367d4bd4c30af748eefe6c0f479c58da7fdd1c802f7084a606eb5e6976f16ae429129565e853f207'
            '1feeae2ae0e25505e3d1dcadf4c96f648cc5e5e3882dba8e255bd66e657bbd07c7fa1d0dc8ee8bb04774650ed13960e0096a25ab9207f4f347af624b16e6ff51'
            '521866521a691015e3526f30c6a2e6ab1cc4c723d810522229e972b8af369da94d75228ee04e4b72af370ced8ef533d2f82b293f06d0b8605e5d119e4984b035'
            '391c282d773631774f8e147604f6573705926d4feda98d21240532e7b41d6c2f7babe5b7e1bf961080f838cae1efaeb1930a3a66722acccc5b44b0cacd399da5'
            'd88ba7806a6f1dafae326a9f249f0138b26e8d88ad3121924cb45e6da6d6e218e17579e25d56fb1cd1e72b72c301a63b7c2a989d5b57ef3a99ca3f88a70f085a'
            '0cf4fd0539f45d5ed5972ba79d9e4b7a34317eb172dc962b5e727cbfc7ea4a6d3ce6f68d527a5321449abb5de6083ee1a6edd9ce4e04bdd78e4bcd211f526cca'
            '8d283ddc974356930fb5ef44599de5ea51af5b47b2dfbce8d9f119bf38d1771c7235800ede7e6407114eb557d42fb560fe05dca45b1ad86e494bfae787d19208'
            '0245698b35f387bb1c5389a0614f63c11335e88df6af495a0f7a820b42ef8eabfc49c6ec0d21b155cfb395bf788f3c637e913740aa3c506a3b53534f570f1539'
            '65e3dac8a7b74393736cf9e9dbbccd83c0b316a2954e65883ecf2fb7ae2f2fcb70784279506551c4ace4ad56858db49ab1e11fbc3bc7702d8b1b0eb14c3e4881'
            '57e7b1904137df3217dbe1e14c5b0c95c72f5e2c9bbc694775825e2299cb0d9b1844ec4e885d4781fc98dcbfa8f1accb0f3e78aec9575a860f61a985f749376c'
            '0035befe38cddc83f9f993e7ba5e3f0b4d8d3d3471acce7a12a0f83001f2effaa5979324e01db738811d2e1b1aa46863f946eb9ba33294bbcee1e4a257d9aa61'
            '890940f39980e441ae05335115f4a69a9defb46ef6f65b6be75bbfd30e94296948d511f30c229f6e0e81ab8f59ae9b343957ccffbafd06c9b3058aca01d41c01'
            '9cbcdce267ead7359d46584a3c5cf39621a9c1ed8d5a5c7090e6e77708689f980e041eba9de961b23e24f1e4dfaf5e9106c9f8967fad9c49b78a6a5083dea4bf'
            '663122c70d281d99afa665246d0fdfe0f50bfec569e26f94f1979c38d5886086d16cc299ea4cb2dbc5728946a8b14a3bf48263b6c867ff210b5f6ea931c87101'
            'd3424b21d4b630ac5ce24e96ad40fcc2b32e3f17782546b436b145c8de772962b016fb20b7a8aafdf5a1dccfd675daec221feab2d380f571869a9dc514bc73a2'
            'c39afcfed79822f0a1305c233c3b1daf7f7b13c62740faa3b749eebb1a75070f4c6689b139f5063eb1c4a09f018a44934423c9fb2ea887e1e0a0656fc5111b4a'
            '60044bbd788f12d08c85859e46dd5ba4eedb17c5301e34d3d33535703ca478bbee0012dde2e41c0eb1cf2eb5aed62b351bda11105635224012d395346d934e6e'
            '4861ee0358af9d42d5c8e488d86eab8d4e6bec0909792d84ed8fef2107f66b25c0d5bb75416927953f871f68659314edb5ae47e342d9ecb2ef9c049946d91e47'
            'c0426796b7c2d673043b0d29402ca28e808fba956a61e443b8b72a3d72e005b340dfc00a6f6acfe0163cc24b7ccaac9244f48c81ed2e14d9e1f9ddac22f29d70'
            'd4b30f50f85233c86556e4446908a4a24d810a0458484dcba8da4378e05aec24fac7b97785e638e6137c5a1c96fdf0be7baf2ec1d2bd0150e2557f97cfe9658b'
            'd7de0e3bdafd5090356d4d73ff0d0826b769760cda1a7d3721a046eaa7794ee899b98f6286f265b7b43b1b4fa49cbe828664a69d40b6cc9c9a8b38c528193069'
            '285b7e47d34d8b457f953e6aae36bdbbcfdd0d41cd1420ca97fb5555a471343387e4c42b67c3779a9060675fad03e734b1755392c549a502e30ffc444b405635'
            '4d72ad72401c679a66a3b628762d51fd88d4bb59d5c08b645bd2764129596a94b70eebe2c83e03e0f2de6f87b6fb02460798026efb4052d59ca98263f2a685e2'
            '1f34f676f1d1b682d4402c04c29d319d3bf8a60a60632a94efdfe760e6af6901706fba783f7d2d0cefea484d4177fe3518e2ca10af7c4335e8f643891e82cd4b'
            '72431fa9dc55b850dd6070ba2d4dd158fd38068e8400ffe9f4ed49e4ba8cbc42492802e49aee1e89f79e06cc1e87b58459a1e45f728741154411f67fa109a10a'
            'ad3b36eb22d6a07502f3fdafc98133bd3ec98e29da1a5b50bde20f9380f96fbc14da3c9f2a5bbaa842912a42de86d088e94118c4c4ae63c5ea24c2db1d34e555'
            '75276df8f81cad4a30cb899815344a6d874f288a2e58b352633f9cedc1485b1cf2e8c11fe011950873959777c5e044f2df5470e7e04a95887a7c1bd29cddd5f7'
            '3b7eb0a661af1def1a5bc517dae62d1716f66495f9239aa42402f54d2e210634e063d0c23e4f51c3f5bafd6e1f7f750baa4c802e50869d1c1b6c6e42fb013e4c'
            '4336af040a43cef3a9546ba77e716f678fab7840000665cab0b7cc785693137819541fb933b4b1dfae72fe66d65726690d290ad162685fae67db12007b80ee36'
            'ec616c7776b1b185696119ffa0184f3f692cb802bb265015522ead01bb664e26bdcf0a34757fdaf7196cb48660ac8586c08c888966dc2ee4d4cd67af75c5ca57'
            'ea14495fff531b74d032edde89e2df59905b9b4022d1a6dcbf1923bb0f1c59f78dc8f4d051048da7ab58494167a452893d2fdb8d8438f5e0967c054d95b28ecb'
            'bd9748a19357dd5509ace144cec948c05f7071467c120c8efce327222980bf4cef445e57482f5c8881b4bbcf2efedcd47e0cd25a9b5ca01c61daf4affbddcbf6'
            'bfbb55790a6977005b830d1ae6986fe85548c094d310f6613fb4cba2de674f3d6481fe4020b6fa9199ded91a3f476afb41f6b0ae01fccad2f2fdbba2255839a4'
            '099176f73e327a4ddca9e4f10934f30b2be05c6aad45a75e9c8db296e5e631920423339cb5e073f072b75f6b292679a3fe9eb75df371049c6b2a3ca6b2f0cd52'
            'cb23f39da7b20086fed2d47e508d445c7af2080973a5dbdb9ea0e50b96b0cb96cca8f1ce731829e4e645ab8681cb66ebdd4ada705d3199f26ecbd71a6ae4400c'
            '60021a2e88eb868076609013dc568a4c2da1a0b70efe389a86c6480bac1c3f3a0a126f346774b685060bb0c8584c991643fe543cf110e743186ec5da8e64919a'
            '76accaa329cf829e63869afdd011cca7c182607457f769e2a8dbaedd801f0c4cb0fcb4eb736391dfcaef61b4711b8fb6a1d2d1dc3e535d8e400bff3796f737e6'
            'c2c0a845c4800a4427982204e73f0b62d8b6fa7c839976b76ecc36be56211772fd8181b790f36350722b48f89d52c453cf9f35adc7fd39d34edff23f80a8cfc2'
            '9e1ba3a8fb3bbc5c024e1293f5ceebf1d1d48ad23af73460bfba569a8a0dc2d23788f47831992d064b55c86a8950c08b3276eb220d2333674d1d9724b4e54fe8'
            '2fac5f8f1cff6b78b5a8bf4afdf2795352d1a215a7c139e8e3eaadd0517218129d451c1584bc1fe30edd5a8d1ac162fec420fe79333fa380bbd12ac49a0e87d1'
            '9a1dc8eb181dc2b4fe42388fff7f41bd9da740f650309d21de9cc4713b10a6eef5b4bd65cb947af89800f3a43dbc9aade2c73e6799e515f7fe1ce39d1d3b89e0'
            '0b1ffe0071b7fb9e33ea511a5194e5480977069e424a721fdc7a52a46b16af32aa88aed523471291a0c9e0572539eb0b4ae396181017912d7d59bac681cbb2c7'
            'b760df0532ee3f7601025a31566b3324dceec1dcd696fac5965a8daa0c758943507357fd79c8ff909987adfdb4cb5af268f8234e9f9a2c2c35bf4b73f455e9f2'
            '7c29d2e9d8c9d2df15619117f23755f3ffcacdf048fc32f9196c724bb00a46c68a6c7e2c3cf8d66b3bca6f4061c8647ff8387e0a737881aa99599a915ac00d33'
            'd548867bd6fa31ed7ed77b6c8e6fa8d9daa9d72e3174e376d1179ea179369471094159fd8f4ec3cc6262d89a61f329c67ec8633efe665262dd030511ac3b0ce2'
            '07ea4b806c48b4b5068c0a616a13689a0a3cc3fa2fc105726383ed08570e017e6eb988ed725d8696167b26e6476a7eae1d0ba1dc54b674bdff5cbc0b530e4ccb'
            '31f5da496d3e7cbc0443e629d65e5a77a9408637ad198fa90999f9cf24556fdb6e0aa6c831fe23a46793c048264ed8abf50eeea508e411dfdfab8269acaeb723'
            '044140845c8211cbf29f1f3f45e033ea5f3e1043cdff177de2a6d17ed79d6eedfe55b047ae4716530d76aa11b5c95db137383b6b74db77d63f0ffbc99e21cc39'
            'bf910f5bffa80cadcbc35f7ad69a2c3ef9fba6bc7e6284c72c75540811556b959821c2ebfb7e3b5f13eec797dfb40e2f709ae0664686ff7ff2505f6f5939474f'
            'e8dab96c2126cadfc6622c3f2f016b55b5d561c1cd3cf81d949a5cd3893aebd43239512f0b6e591aecc4f4a81939582501eac922af93669d18233e42eb0b110a'
            'ac855b5d296e0b2098c8882800c5102b20d045c62327efcc5ced4edff4cde19187ad203f7f53e426733ab8a7a9fe0e9aa975000e1c2cc290f95cfccd59a05dd9'
            '1eec846a78be0f03b3acaf949ed7d6ff9e883db9959d68e1864f360f11dc2ef3e39aec614b81deb130d7208c2c4cc1c0d7cff9d2d5548814860a1f91c27032fa'
            '3d47f5c6b04a162b3f3778c27b84b4d6e7709dddb481bc07a34fef344efb362e00e752f2262295b6f0f55f6a281f220c7caa85aa5ff24a5009bdae81beb0462f'
            '342a987493a4867a1ba479e6fcb81fc5e8be5b632d7f50c5e82f2cbe7934c54f1ef545bfd595660dcb229dddac98996a4fc7b1b6fc22d05888901fd9076324e1'
            '9f361774225a3a8688fff65526cbc8e138fea92098f5c467ea7aa43a6d871f3b116deaa6d06a58f3a4fc6abe483f38ac4cecf9120a3e908671462b499656b64c'
            'ef691e9288c9777e65ee30fb6f92a42f0802429c14b95c0b99172898360a73be4c6b0fa6e026319c84af5e818bab546c2f1261b7e69a819544db40b48db3778d'
            '982a0eb742104d91ff4d85e34a1d72e79dcb909c5218b8cac2d25b912b1fbe22a39f8587ca110e3b315d3f2f6da9948e9118f0cfd258a4acfb3fe328917c45a3'
            '10ee716d6af2742efc2f4261d75e13358dc50c61cdd2ea7619f70a42d68643a12968926c2ce6d15fe5e196da5f521d0446cda06cdb47e8da8a13f9c404cd2ff7'
            'e04ead3bd20173a15651a4e87207637d22b716857d38b73ec656bc77c37abb2eeffeb4663ef0c738bcdedc80b8511b5644a21ea2beb12d6462b4e6cf15502884'
            'fa4a05b27656a1b609f62b47de9667772029a222cd0491c912fc495d0bc80a1c9819fa96bcae06f63f38a3cbe3b5d31451f0100f015f1b675957a478e4636b42'
            '25e90824a3737bbe0e0171bc274a8e84fee4f000bb323619a6ac402dcf587efe460a543205c3d988c477e42b805eded80c0eaa68d644fc436a79b61437be1289'
            '2b3fa9572b85ab212161cc3d5e1e7e578600029ef3505f8446463e3c402b3727499976b283e35581961173af255720291119ee47831a30542c32a057bca52bb8'
            '710b4e24ac2e7286f4bc376e05031e395abb5a485ef0700e363ea83018648d2658ac0cc6a4fb0c136179d043260f1ece432ae9b6294d35ab937a5127a69d860b'
            '11a55e13fd831d4c7c90c52a28b6648c1fbf2a31f114f02ecb5f2c163b75a09e0fa23bb023f136dc19161e49a7e5b5c59e058169477fed07082a7fd36579a7b2'
            '26becb9a236fe5892bd68473bc67f3f21299c628953abeadd94aaa588c0a6753f0615dfdde16b6401feef3399b1b66d5701b11886be224fd1f92db33a885bd9a'
            '4d0e82b8fda455c7350939503cb5d8aeb47e6b5a65e636a2e8701ee9ff2a6def97f3a7c123610a05e5b4bb22606339a79bbcbf15cd2b3d4398d193ba17e89ec5'
            '42514c1ed7e8c65d4982b77cd724f2530e8a70a2a1b4e41a37763dfd2d0882a7c7276ab3d829ff9024daf02de81acde8e7022d3c45df568f281320df13f41535'
            'fc8e60d4afadb912c00d888808b6c88f6d78dcc32e07d2df7c404a9b442213cb8e5ec4fdef6ff20d46b9ca1729833abb5eefb421867b5992929af5fe788cca9c'
            'ec73b581fcf412a572f6b89161426ebb8ba9255fa969db90b61741f0d49fac19474f7a0fe4a2815e2539ce1232262876274511468b0ae08707e08afc647ff361'
            '99cf4b4069a8e64c6025bb068dffaf073ad830c921e4b444b19884bc1d69489de910412a5e5d622ac7d610ec69e107d06610d46b96be91fa58f9ce7acc2181e0'
            '3af1374ce22b523567ae17b753fa4776215f687bc218e2187a1f4d409d2703291e445ae1ac25923b7f4a56bc97c3f56501d007e73736c118a1527278eda838eb'
            '47b796c7b34dab4a10d61ac040d76f9ca0e2e5338272cf556b6d0a9795e31e0f1932182f87ef9fe6dbabf6f90cd89b4cdd4dbdbebb9e1680fbe204c5f3f4e1f6'
            '04d5b97b992832572592cd6cfa128cebe5df3990b0c0633dabe72bae3a4078551359a1b72c8ac009d15cdb80d9cf759741e3b59e8d92881afa420c25a275c3ef'
            'bae2caf00c46cb7846dd1363c83050fa224e5ab05e08cc09d08dd876a0d11137bb366d5c07489fe163ce22ef5bd63c1909828f181a9cfabb741c0145d5106daa'
            '12fd3bebe0418a2417642e7403eede920ed622cc3c84fad3fcbdec303664ab361b66a5273c21d5b5ee371d48df85884ccd30c908d8d72ac267a941a48c381f17'
            '9e99cb3427b35ed96812c1478bbce594af4e8259a5a0816f8accd877639cd7ff457532fb56c996cb63bb46655005ccb4e1a92e0fafd7fbd6db4a395ec42a392c'
            '450b7c2c441d13512f275f73c7aa5c5ed01b2da4c51a7cd664a2255b72a2d6208db01b423bd3c0f86a2554fcb2a0eae8a50a42e12daf3cb22a02b3489d68f401'
            '4541b8cb11b5c5f448d765a4d2eeadeb5601e6f2e1222a2a56603a734a928a973a47ed814817be145a6e2702d06539985390f60dd390ee552110511b2eabfc4c'
            '01ac9d3aedafec939a36f24fecd111edda911078b92da6ff7cd68700beda07dee534fbc1b0dfd9baf51e615f32684a642f0fbd422adc2cc853dc65ae64efa421'
            '32d25f6edeeb91a986862852a9ffbc5ee34e97be56503920e87b0d5b8cb5c22f3bbb4e2065ba06f5abea6988a09b2b048581a0902f98ba039c6723635a39ec5c'
            'd9b034f265496d5487ad48f7b24eb8f68b96d39be7da1611e69b19d0fc4f385b09ce50212b89680e2359824531f69bdd2b41e4c15284e42bb49bbda36da92d34'
            '18df2ba2fe89e0bc3c746e743cd5897064a6b81fe00e5b2ca47dd4aa8b60b1e9d0ed65c48f3b4a5ac032e0af68f92a3becfbb63a95656f6d693132c290a41fec'
            '54002d5dc86f4ca1297ba0f04525e3187ca8d79fc1aa711d30c9f82ad5ea2d9f420ac17c44a27a392ac11687dd63293cd9ccf498c98cd8be2b601e7446494e52'
            '4a2135eccbd9453d040e545d02b989a02f4a916c672f46ba964ba75e12b7ad48a2f0c1c9c456fd910be13e901de03be5170c68a1bbc8e4f0d8d409debbb5992b'
            '4d0de158ebb8137b6b9c04a41662b2f359e13a7bdd93e9d96c6c137ee540157ea43bcc14a6fc0cc7434b09f3ee0364403978c3ab85eeddf60daf4798d823e464')


# vim:set sw=2 et:
