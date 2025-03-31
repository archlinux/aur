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
pkgver=128.9.0
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

sha512sums=('c0c8ac8374291cc93279064c73c17786c6f4fba7505ebc2cbd7a4ce7c82710620abdae7be15f60c43f9d10c3614fc9fd31f094e787105d528031c6f0510f7339'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            'bd57885d8b5123adcc3c00f486a695604319e8741623e8fb9fd59d2ec2d734283d04ef2bf606a591d8a9d1b492aac6df33732996bad366126fd629d229b93324'
            'ca9626db10d7ddcf9163fe13a5e690f3d1bb9aaf3453d391f4d41cad36a06ad080bc2dae2fce6e0b9748170b2fd6ca9068d28a457f5e655dcef44b6cb5d91af5'
            '440a2fa1f2890316ebfbfeb25c5b903bbc743121374561671d0915e20ad8d3817a60ad673f251ba7d73605b8a47af36174e37f4c97d7715ddb2b551eb5564ae9'
            'bb8e6edad4fb8f7ef2da29d57a27a65a26933246d875fa00bdf69cd3eeefd2df7e43a906e3bd49f67edd92f4911565d6444ad2f61f9fea130bfb88e6858056df'
            'd457a9db6d6478cf7c66b146e9fa115ab9c209666bcf450bc8d2d7a53eae896ca56d67ed0605b6680ef5aae297e8ef99f960ffee5a36947ac4a82feed02b0faa'
            'b4242306554295315e2b112648a733c974cb749e9a043a370d5ac7359f0dcbc400799145e7dba819b3c54ca450c76dbc6c55d29a5c8a6b4f0f07ded38d7e8c3d'
            '705d9d9191b41422431a8d5f3cc7298dd2f789b994affc9985b3a71658f62e49aedcd2aa30f2d621b393a0c535aee753f20f8724bd6efd43ce04e8f853a4e9d7'
            '4399eb5e0e47a1f1238bfe16d8a87af948431523517a1ae1c8d8738f60eb7d1a2046f049edc635eb37f0b54464d5e44a9d42d39c41f8084721981c2652944964'
            '9a77433efa5d3714531ae8c01548c53ac58b437e04c4c85af8363e89c868b788efa106301c8b4dbce12ede4aefd88b1efc6912d0fcdd5ea8a1ca2963ebc6fd91'
            '127503d2c4d0871377a0de23adb6bd475233f4173c2009a868b85011e3a6e8cefc663a479e42b96e975082294a7cc0f766fc6f85a7ac08d9521279bdbab7a653'
            'e82c7812547c8eadc2ac8e6caa97c161204d81ebdbf6779fcc5fa8823d9858b0f0be8bf1453ba6d735a28f78226755a0dad40852073838c4cfaf20437c26ceef'
            '9d2a7311e523b99e45fc62949fc0e688daec2d5f6e89d350f897948f9e1c630dddf0a1eba88c2a13b4330e3fba75830ddaf960249113a427a419c72ab92a5586'
            '95257eb2abf51afc32c52b2d13c3ee87f6d51526842fdece8e6ff9431e634fbbaf7c4ae633a65605fad66010c6e6e9465441fec28d2e0b11c738ad5822c4e442'
            '22104a718e926cd3f61d8020016a7b92781362d58c09be74487419dfdf6cd9e48fa097384e1f094365675ec6f61f1c7e32b37bd6333036700a65858ba1c2deb5'
            '18593f4b2b42176d7031ea18731e0a2ab090af69695289d4f296be914de041265a8f2fbb2429d07c88f77e2ce3ee58e6c41b690ed1e665cd3551058c3972c81d'
            'ac12fbe433e37aafe44b9e4c8437b50934026345d2c9a62b97b7af0ef7d5e292e18f698f5f5aae2966182c95cecb17c408f6fd7793ae6d47debf732a645d9bb4'
            '5e43cc09e18de017bf97d518d17b9a6294273749aefbcbe0634eec0a1191efa6bc7f690ce4f68004e3581a2ca9d3ca601e0d67a9535daf70c75a7f64179c6573'
            'ebc625e067c24192f925805656fb04efbdad5b6e6eee638ea4b60a9918258db4e3de2c3c4054e122593c84172d843ae9d45789667b07dd8216f0eaca44418727'
            '8912433a9aa1b04773904502232a9f398ad30ab5b760702e0be81b7dfecb80d1d9ca326fd6191b474a04259c3e898cacfe4d4c69956de5037619aa4dda3d6e94'
            '0a0a54aa8a6f0ce9f2d00582a4837f34fd1c93ab45035b07508a2bd4941250bdecf96f62da19c5e9c7082c0d306dfec858fc28e59776befc906dcf9649a8e7ba'
            '81f7ce9d568446e123c21d51ade9e860228eab058b16be6ce4b76389d70b606257515490372398e7e6233dbf107b6cc679a7f2d2d32c0b2a16f4c559bd34a0f2'
            '8063cae9c01986003bce3a9f2cf4b59d3631674a75e5e5897ce15fa1f0cc837102c1ec8e933ca2e272665efa4f2e208727f865f241200d5729350e1078d862ef'
            'd9557d393f09992e44afa5c58e4dd6daa8fe041408a3860a1e8ea9228ec6b6d3c99cb556e5f1c9008fd858b55857f72f417a21cdd00ed5c56e064556339ec7fe'
            '5469e508f6fdbe1b6139b7788732a804a6d103414d590f669a901b2f1bd97a5c007735edd5806090f921e88671c581575df72e2549da5546e17d9897c82d8688'
            'e5cba05d6450642017b9eb6584d5361f2370057798d5c1a1f2546c05bd75ad48c6326eec90bbf0700fc57070ac52ec583806306f74c6f58e11520c7f37f540dd'
            '119c104fc983bea12633d73f3a0279fb866efaa5d4943e84dec59e5422fc14f3915a0225763e52cfee10335b1506d46de6013527f6d7af3f4d4e59579fdcae7b'
            'e6941c24a9e5bbca27dcf7539902c22160084d324f77bd2fe99452c7e7fa6aee18a2fe5ce281ea90c8baa7efe71a146918390b66b25c335b1d12f022c969234d'
            'e11fec736518ad5cac7ca2306cc428379f58b4f47b2d73f3be79651d9c03f732475f4c5e265ab319f6fd347f6c67f69955a4799bcca54578dd6a19d7d3972403'
            '6312a488db6461c522e6109957eaa94a8e798fb6734c07f487e7aa9d7c9df409456a72fcfa292ef958323fbddf52abe7cdb81d2f05a456419380b1b7be416bf2'
            '125dad5f212d8427be049101299ca674fafcaaca185adc3e198b7389c64e5586dbd2d2629acffb200dbc22275a529d9bedb165c01406824e84ed3884377821df'
            'f7a72fc1b9ace00f3e8aa7f05b02032e1d852a67863770741fb9cabef8a32f2295341b5f276c5e42277bfe3a2f71e4170ff115e2e351ebe868a1900157e78085'
            '6ce45aa584548adb412ea14c194c4a4760411f9ce6852951a70d74c49f9c3246c2181c66d02aabadf31f6e728d5feedaab04b43a5bdebf325799faf09c76bf0d'
            '6214a5b4ea31ce49a36a81e0737cefe2fb77cad19960ee13d404ee1ba07a33d6c69a7159e75cf0867594b8244ca6155a713a76d708c6c7b2f7a7003400a8c267'
            '24a48f5385fdb595d0b101285db861afc4f5820a80412711f2df262ff114651ef8188b4fbbc249c5fa8724398569aca3bf6f386aa355897f7f8a5be31d7b501d'
            'd0a64483a9a0d072c5391311ae9e14a4cd650a5ebd47da204aa1d51729874ca891d020833f810f2009f1e57c620114a87e9a22d3ef4055f1192d2c8183b96f84'
            '5fa25b7b74f20863e34433ea09c8371026aa65b823729b833629c458d4256a8ee1b020f6bf19c923d6410402f4f6f3ec9a8bb89265ec0c5bfc071c165dfdfa40'
            '619fef42f9fb114096ef0768999a7c6d598e77b76fc309265135b017cce4687b22e63d54cadf6e1f7c9752c23916b240b213d88c448d970c94a1f0bf39105bf1'
            'ad9ea6e3545c87bdb25a6ceba18f9c6a0027065d0ed23fd7bddaa918bcde5f3286f3658d689f578889133e5516c0a46f3c28d0e8c6414d2193a683ab67fcd0fc'
            '39b235e08250c80da36ac1de4698ea49fb7d5e15228244374d13a99d66037a24064f544d5b9a374b120c0525cdd336b8e9e09d4e919e7677399ad72d276c43fa'
            '00e9ea2642f0831d8d8b4470e3bc143152774c238bf83f5e81257ba8271ac626876dd029eb048a7a8a022200727380e3399ecbde6b5402d2b4e195ab5245c8dd'
            'c90b2a624b90cb671c7b256cd29d7d6c1a16bae06cd1a2807aff5d7d1ebecaff2db57dc18b27a8cf9c865e09b6110977a2ca3e437921defda60e5e85f5df0a9f'
            'bad6fa4da6cacf12c20ffacf7293a37045eb8cb045e785fa2f6f64144ca64add003d7047e393a4474fab8d9416d8c05738ccbcc759c16f35c49c0e36f9079c62'
            '10f4605c31d6dfc5a685d529607a4458bf9bed8c4a5800ad2e994e6cd9cd46cf7b965e14a25cf05c5a4a8b092007283b6f03c895c1b133570cefcb698e1ca93c'
            '4dceb363bbd77d09e8fd190ba591caa33e25d79b0b6ddaa47b9b415e3cbdb655907acbc4533dc63ae5a83a563414375f8f666b3f3d6745f894fd0b5304bebfdd'
            '3c1c0c8a9764968375c9fc749c7a73c5945369ea34791c11e0fa61148a74a2cb52acbedfb8f3b0c77df27ab0b4740d3e67f7acf24db1d3db66fbc7ba5d3cdf38'
            '7d269e8b978a953b05b51c7344de73ef70f90069edb312f072570bdb551cc644ea338ba208a43976586d8be5ce1777a2f4faa1eb373b9e6afebe5ef3d12f8f07'
            'b72c7cee5a34445e41c03f1df8a05f3edff49926fc18935072aa3d391e6e398eeae018c6da30e95fc4eea3f475dfbe82690126176d2e80eac012aad640aaccac'
            '5001a9b9a9467462da3ebd735b74ad9506ea30eb6ccb1f9b5fe1b62a9524256e35c2e35d5135d947bd386eaebaa4a71077c2b60db2a6dbed4b49bf9b2554f344'
            'd74e4845d947f2d4054ad949616340c08429eee43a12aa9d5e69c2249e4fb273e9bcfdac5ae18798a4097059e3e3033750100ed5a7d30f126990d7519169887d'
            '0901ae1da63889acb5f115cf1e6f4ece049bf5050a4ca83e7166a3ad294aa6843c7710fbb082003cf2c3a2227d9a719dc2999cc0d099b9df27ef4be3994a8434'
            '612e506397f7a68460336040f611c20b803151aeeedca478bb50a8ad6f4bc885a42f4bb718659967335e2472618871b7b72b19dbfd1c976177d529a49d88c328'
            '1c19f9da83a015fba008fa8e36d7aa98418beafe05d898d6b0fb261d71536e85225ce43d91b0639d6b125c5a1cbe63e58af1f9db2de3c71937caccbf90c5afdb'
            '9226114080cca6cd8f5fda21a677c0fa8267f7c1da0f180a8c7df3686d23a5405e845de171414b6b9f7968fb984c143a123df41f6db95556f0f89e0ac01f5bbb'
            '17dda8d71a2ebb531ad31d4e48633e2c9d177bf4ec877ff41fc3a9cd2bd18978083663b67c258402d6c253cd10f79594a40bd7ccdcfef8761d294e8e1251f184'
            '4d1a99bce1a5bc004fa850587f0ae7ef230492ac01e518ada34fede9eaeb2ee8c985a7f06c3d6139ec9fe6a852aa8666bd890ce504ec60f8a69a991242b00af9'
            '57a6d07f14327a22c4ba5b27e3d71d965a122faf91e6a82e572d90fcf8a72728e3f3814294bb56dd0c5cd3a9348e6a408ebfa147d4aadcce2608492993da78ee'
            '870107571b81aa58ae68e6f817590795f2432615eecd074c02e61a98199c7312fbbeb283ebfae8505e9fd4e9746bc3915b967b34a393612d47c45bab75225a5d'
            '84d0c7cdc7aa952f9f35fbb4c13be79913e24a8d4c9f65464fa2eddff81fcd390c229303cd41c1a3b50e5d92c62cf2311a99d33dfbefee89d444d6d12dc7f0b0'
            'd24f938d17aee234fe297d1fde5da21ba220a1605da52682f4cd100c66f33954be5222236c87de700b037c107964f03fd9089bb70cbe6c0bc6c0444de43c2a18'
            '707a18ba623b26b13c7310abacf00080341e0b0eb119d29ba80fff356eccc1da43bdb3ff3dc471f5366d22bc303b25672211ca4e1750ddcc95b80341f3b148b7'
            '86be06e3aa69d11ecaa350da145f0989c4716a416fc9d840fdf70aa59dfd969c0014c917fc88c3b847594a0d06ca9f1ed843548a19ffe72cf4b674ecbca083e4'
            '5af691c8ee4ee3325414ee6b0405d13e0749868dacf06a6bccc3fc90b0e750b2e80111edf89af7548e1e95ffa5a40104f3eb5e37e6af40ac20528b3a2974178b'
            '8d20a9661b443950567cca35f09b257901732abc7857588c9071d40f189523187c6e27b90cd61d062041452179db71d28f5fcfe7109dd29d09c0574aeb0e0259'
            '584d38264b0d60305db8eedfcb2bd53651881b6aec5bd7d317cdca10214cefe86e7b13eee2679a26265f333bc3f79f52cb20ff653e1871928e005067e1aa2fef'
            'a7e9563bfc2a8ee1f7009e17fc409671959585126d9ecb6f6b36eab393aad4ec6a1298bdff232e18be677112253420e7d04dffdea0fcaa9abb83fb7bdb450925'
            '09780e24f788d1809d3ac6e52559db5c04006161807d345d774c7069d027a5f0c7c8eeb7ffc5702c908563204ec374b4867bf804aca138464256b3a190cc5dd8'
            '91329c3e28cf0baabef30b50e79fccc907e6e348913cfa2428a7f1d5c5b38b9e4afd3cce3c9c625c17a319c64c501c6e923da11a71a615a10df87ae5813de7cb'
            'e27ceaf937a38c8563a7a768d8b8f60e46d31f32fc7688c0e786349e468d7e5cbc337ff8f459ca3230eb5979c6022a0572e46bc791fcb23d39bcee40a40ca4da'
            'cb9b24fb091c45580322617c20db99eb51fd3e7914e83febc59aa995198e8071d571223212a3b747015a053ae5511875deb914e8630a134d3a4030fe8f968f1c'
            'b5a314379e4cea258b078ed90fdef21484ddf905860cb7cb8f6057b54a74a3a91f4c0d70d73f4c0add8c271c88db6aacdf06c1d977cdd1bd72b521d5cc41f600'
            'dafedc6f1052d8612322af21eeaec12d9dd231997191f75c33ce097c68110e51ee28b2e8a626731cc388d7c0a3242bba13136996e562ce2ac9348842215497e9'
            'a5cacc84678381d4eafdc95debc7abe254a3132a317b0ee30f4d497ee772a4a09ca8019422976f04414290fba7e378591b7b50868640df3b81b6e4766eec426a'
            'b96bb464ddef5f2717a0056a86c5402054287490a59c904c9b18d1004e4bca826af66e184b5fd73dc72079f6e573e1a2d1e271d14d9910c3e28eb99a440d2c74'
            'f53d795fa2ab088258ad6a517a3be485e348adfd0708f894443b6698394d8a5515a083b8437e11828737f7701e6a2680ecf1bc27f84021af8cadc40909f8730e'
            '59dd09f4b7911e8a6a7a66180f4f5e4034b3376c927dc4694607fd38344ff82a0731fc1b41171fbb52e45425233958b31574165434bbc7ec33f3e521b3e95df0'
            '184cfee1f7d76195b1242e1618d10082521ae0f42d77aa3311291b1529cbcca26c75893f1ae4338aaccfd7a0d013e647b051a8b571aa52c418e0a688ac879f88'
            '2f0e621c55d37ce348a5ee80b8d7a7dd99bc0c29cd536a79a14e0fddb44a9fa98e1a31f0711cf508e7a8dc5b63fdaea45a28e8a47f07f257b3d2cfc62198aa70'
            'c9f387c22ebe99f6f82e414919919ec0e365fa8a2bcdf4d6a2f687d5c4d6d624522d640668d3e6686865dcd3436ce361d98f54def6fdcd596e9f0d3e9316ea63'
            '2bcfdcf547fac53140ece9e5147e80c6dd64577221f890899e858e7fc79cde1df2b24ea36a0ef78fe4c1ff731aed330606c1301dfee2feb07b296cf97ea6dc36'
            '4141005ee57b469e1b9301c957a6cd7c9d5c49bec56d3679e376a773a4a3b9a77adbe5fc9feb6e05770de4e070d41538e7fcf3ed58a3dd8211fc55197f501926'
            '43a075af1f08ce61eb55243d3df90b75d47f7bb470af6af1be6d42cebf39f189aa2801db148aeda7b1a586e3a622f8aa4c8901c1232b7c74e52e5fccfcdbb50f'
            'a6748e473d82651b632586a8623b47db8ffc7abe887a4d6819ed9f8f14953cde36f119899716102f8e6e51e6cf921e4a4d582ce2fb443920a944e604cc9481f3'
            '317bef0fa52f7a51bd6ffcb1517b2d58f3deffc6f930e4335046ba8416a4d53e3e7314ec9e5b581c924e3ebff53b7900943c22393f5238ead505f96b69b748d1'
            'b2d48d06e788d68a4ff7544b03bfed2b350af5aef34203a53fce782a725748c066fd99753b291631410f0190596113729b880bb13242c6558ad1df881017255a'
            '4b1dadea77eb7256e527b96e9ff8e67a406f395e26730059e44f33fa3dc0d5a8c5e0321a308d20f554de957eb3d64c5ce91e8ff2a470a8d2c84b9a871f4f52c4'
            'a23b34f9e3619ad58987a820f419698c8fe05da32e39c5cb85393c547035e3a55ab11f5f997f8d36f27c31d1f7497191ddd519c907a8a44df95df17bcc65f3c5'
            'bd6681b92e70b8e16f1c55ce674a6f3d42a4ec1135e09b44e39eab8472caa39a03d53c87616ff8217c5a07fc7a6d46e0244296e177139d91eef6cfcb760c7c5d'
            '6abed12f46bb42af601685e42160f78e146e80df9d274108f7cec59a1604c846854cd9b03ea8e99421547ab3871e8f9fc6ef4cda2fb10d3517c81e736c652e53'
            '885ed32260bf933f547590cc2297a8a229edd472c7e8314fe112b318a85481ecc1e4593669e4c8f55660a19d6890e0919546353d2a025c280e350dd6ca2a58b2'
            '91cfd38469f62fd7aeab5ba35d4603cbeda9b2a36516af29b76e2db25d26a00a311ef2d872ff8110b2153faf0c537ba4a1a04e0ef01d6b7d79bab1d55a10962f'
            'b31c720e0fb053b2d2b600d78a9b31f78980b3870209fe9c66f276a31c99cd79fccf855647d6b9b5d9862c865f0c8acb96eee208bba6f684d84b57cfc2459c95'
            'd46b494df34ef42d3ae6123d05c767321d2338a134bd71281f089eca9c28f4bb5feb6f01816009ed3b19a694bd7f76ff8c970df1f956a372cf9383bbee81a911'
            '235b2c12421db95504aed1cc5b01701ce3126dd82fc5be9cb87e6610e3d22f23056eafc0736b611696aef344cca4573c19f842e59fc370c2757a61e2936fc913'
            '770d6eb279738e45bc2c97fc45e99add8ceb5c3c3caa404aba44f565ef527d53f28fbd463e46293aa45846f0233309f37f41e1005d62d1497e99687ead03f4c6'
            '079b780b125457ca3bcd3e4ed2ae9a9ddaafbfd6652c1b5f508557d304087aabd26ddc55d8aec4c60d47e9d58a70ee842a9c91b369578fd5bb34f0cd747c5ba9'
            'de655a1ded9c7aff05602b78b9fe8a2532b6c0381986d7175ce26b08a981371f4daa7c97347de94cf30cc553237cc867fe030440e96952f464c104f80a8ac78b')


# vim:set sw=2 et:
