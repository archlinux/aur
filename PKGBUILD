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
pkgver=140.2.0
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

sha512sums=('e4597c4d83ae1a84fce9248fe6ca652af6c3615607fc8973bd917bfdbd2abbceca937fe4c629c0cdc89fa0a5c846b5e2d8a4b44dabf7feb201deb382de0ccc5b'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '98c20f7ad02cb1feffe9f687a07229227dd0b0063077b6ef990ae1e6dd8e99c49f027944bd3a4e229fa40a0f921054b7f0643667e52074d4330ae35c61d2cf19'
            'e4ce4c6572086c1baf3bd812e35f0dac1866aa7acfc5c0904c2baf28e047b262642f8c4ba488323deff7486f7e1a1392287b9fbd589f3764226c07d998c8ae45'
            'b789c60035ff88626cb0a24e543e6627ef20412d78c88e845633322b5d5c9aa0b80a99c5a8d15d6801f128d2343c89c79a0b0fb895063e35dd2a47416180c400'
            '4fa3ef8ccb3fb460aa0fe5e647d28432bdfcf12739c9820e60d2eb5f131e2abf4b4741f7da19352a558579de8fb438dd3c6c5a5320048cca3fb0b8eedf6fd88a'
            '5932876debc2414a557df47d7e5b8a60ce9b889399f3fb0fe5f085f34e948857a0742b1f128396b349f70471f30f9df6d6bcaa6e31c5578dabeadbc0d4ade71b'
            '07ce9903eed31276ede03f1f560507c04d21c3f33c0aa780afbbfb6882934b4fc8c600bde9914c46246ff6625d6814e9bec3672d706238c65c5a0c4953954666'
            '59ec36f1f2af7f36c6b6a5c58138deae541915ec032624258321b4f127ba32d05691b0a8e0640e0b441cad875c468e484e03c99082056fc0f4aad77dd06143e7'
            'c94bf0ebbbc16e8362d94afa8952e8aa270ab77bcbaff3e509a0f97cd4e17ffeb16ac054fed8be4bf8ae71e46f3bcf16c2755f8e601cf33276a1cf235651d52f'
            '24c810001355e6903acb1e84b765d9504444761550012338c4b216fb65d33a4e70aa077dc35615110e679f7fb51add5faea54534d0a2262aa0cc840a49f84516'
            '825354887f187c7d7de65f8c08d2ba93718bd5b3a39c77155d7f3ccabb31ed1728378716ee14c6798de34e3b7c410a5e1fbcd72f89e44da594298951b1737e31'
            'bccbacd79cd0c664053b3fd621b7004b26119426238211c2618d4669add6f3dd8998a4f0396cc04404cb773de85e48b85495426f9eb84b4d7c0c47a9c69ebaa2'
            'fa21973e66c41eea354d5b8d12cd628e8ec88e7179bdab0f17348b0c7ccf9277d53c3ac0e2ac04237fcff6602286b690222e1c18f26bd9728f7c2090da7f51a2'
            '72aae26d64ccba3cf3af808886308340ab4848546a1e89151684469a67e8a8b6df635d2ef62ef4147038c371e46b763e57b215d9a4a6f88a5b8ea988756389a2'
            '722c3c4f9ee926ee0f538e63e5bd74adea32e3a196f75565c0d6ccb90340f5d895a06d763b9e2888d989230b5ec6d7910e35f63e847347358ed1b2848f89d2f2'
            'fe8339cc4822bafd72bb539d6cb6734db923cd5d39afd2c836423f2a3f092d96d4acfa1dcfd25737e474bfe1a2bdc8fd986d34f4ba1819afb9c8faabe4e90163'
            'b8e0651ac2d828ae3b38ecb1f0e2037a6c5e88dd607029b612baf264b584ae5a21991e2be6914370a7b88cb953aecd679d1a90c16358dbcf01f286cea10031ab'
            '0879dc48467a1a61015b0576e4976071e2b6ca86152eaa2346f5352d0450ac2e89bca648e55991187a920ae167e4722f242a8fd0ed8c930b8d2abad4a2aa6ef0'
            '8a5befde5c33f8e40fd72d52dd709c6944d6840ff28e43d6eca5b14894de9bf97562ccb61603f7c411fa409674b0981b40f5829394db673bdf9dc7ffed091ea1'
            'da5f9481d254dd10b4175a27133a8027de63d29080e3944288ec1920b0807eb844cd99a345945c6b59e91ca4a6da1e531f5a699cd52db9e6b6efbcb53a4184f1'
            'dd1fa400b66cad40186e67aafc2694c5f338dba0b3b0661f031f92e32a4033f8884cc9f8a80e1c65eeb8b833f852525e4f9cfe7e75a3d64e6da2a8b9750da027'
            '4559a6b43bf6eabf8913f4a14155a2cdb37dba3a27a31a38883b1174baa321090cc087813f0f0d76dee2b6d0d0f03978a0b9ca493844c58d999892a6100adfbf'
            '28439b8f1983df14d0e0804c013370ef183f41ba7c0670be38c7d1f93058e66b8d70c5c5eedfbec86f6ad2d18a7c950635f30a4aea5a036a7dc74c033df8ad4a'
            '1e07796429c657247b5bfe5cdadaaf8f0edc977f58e614638ba637ce963d6aaddf6d7fb22d6c36fda3ba5435c481fdc3f9ccdd0e17a5dd30f0d5bd9c9d20b1b3'
            '6b139ba7405d983a9841d182bd5aac7b70581793745f730f7cce51bdd37c7fe9d8339e02cf9dde023d205ed40df1743ef15dd4ca27d2d41741672570537ce22f'
            'b7b61e01c4e0271d5aa09184cf140cbbefbd846b31f453e3100dccb0f8fa85536e65cba7672f0c146068502febd00e46b73b61639d16a0ecdb0081e59a1d17b6'
            '714a2f3ce6cf72f7b19079fe1440551a802d87c42b8efde15c9a415a3e07bcce3d35a84ff78f66e69fabe8f9226aa5bba9c21f1927e44d112d1a4a7f068e24f6'
            'acec49e9ddfb2aca1ae4f55d820b9a63957c728c2dab36dcb764f276a41bf215e742a89c4529458072c074d92974296c5523f6587557151d9d863e1c87e72742'
            '61f19593ac50fd354b6daa03105cd64d0e83a615bcf856883e1da6950dadfae6dc8b1dbcd60b3da3ce169f593faf3128928e28fef8adb370a6c43ad53b42a05a'
            'cf8f4640336cd516b115df4de97bd466d07ed970384ce7a29376b4f1f76bea726f126f5e564f9433376585649bff2dd75dd50a2405d5bccea7a50ca781dcb93c'
            '1d15d7deee1a998180e4aaba9070ad90b04796415d210df874c2827e596b6c2abece01d5b51adc76dfe95a552ea99e70cbcb935d087b8012a5888fdb35f5c97a'
            '19bfe6789ee56038d41bee6eb52cc661f4f6193fd20c8c842c7f02cd234c23a767cb5ca48ec6e05c6cbcde028e58c6552bfe7f16242e6fbb132d4bcee1fd4174'
            '075bb287ef745db797c40851ad18b6badb868faa53f5fabc93b356cb156c7fea985dcd69d62aba220895f872f82bd30ce01e69f79ed718f4beefead255347361'
            '361fd0f4570607789ef50357de9574546de43edfdac75ddcb529bccd248506252b5b5449e0784bed7965d87286815edb1836e70f20158f02d2c390f485e62749'
            '00194f0b0a5124fdc6a1c5a8b57129ff58e9c2c85c84e1db23f8bb1dcad7d6781b4a55c04396cdc91860b727cdc156ced6d72c741cc2fead7eb754b671cebeec'
            'f5ff56eb12f4019af24be88e13a7e31047ba1bccbdf6fffac0caebf7d7f0bd98caec63b3e361e0d12f760a757e051d4dcfd83c5fb5290c04606701336d98b8ab'
            'f264ca0e967a598ccffcb6e98c99fad6d71e30f34f01cb026da605079685fef76d37870cfbb9abf2742fd95762580efc275ae9948afdf5100a4c221aeed7ac77'
            '21904d47a2b169a9feeb506bd8cdc73a1d84980942d16fa3a352217e2353e33d209fa0ddb89fc0837d8022dc3e2b45aaa98abda8b7b0ce4f2197ef9f540656ec'
            '8bf26fc8a7a5dc8f2b4c2399ff261a745919ee3aadfbc0929ffacf4da113328cb3ef201be3ada60c9677695f0b95625c211968ba763435e90fffef6a135ae682'
            '6875dc4c8bc05df2abb0848863d6f719b84386e9cfb54a23073dbf7caaca41da7c53901d08e47b12b031022c946078b09511fae2be05fb6bf579016b27e7072c'
            'ec515a238c3c60e59f980a6142abd108985fc0cb557f1552135e284cac9ad2a27bd2ce8013f8c3842a55977b82c85a697bb8df00dffc6d6bf5db5392b7cdc7c4'
            'dd565838247f1e5444d8e3681c2778e2ef9ebfff45e4c5d9cf7604fe70d68dfea01b3c0ae5ad719cf03ee2a76d73e1689ef47ab451fd42437765f5b96d62b30a'
            '8b5f257a3e04cafb2568b03aafe8de5ccbcfebf4156c02337df8d8cfa615b946f2216fabd4324caa1f6d2735b0cfef8fa27586401a306c79401cc11f93debaf0'
            '53fd66be86e555821b90bb297df05cd30fe71eee886c701281fb0af846f060bae5de9cb34be4b0c1c6a485772f2f805203754093f91b358d34888cb64e635355'
            '21d64c65d670e142d7aee6737632ec15dcc9801ed8172dec507f4b7ea5c6d8b1b94c017b8d37b7b8693b2fb628cb72a92a29b1ba1275e36cca8d501467ee0b27'
            'ca8457fa3c56ba97e0df01cecca7560139d8fa2e44b03c4199ccfd75ba0a0b5be75e44f48fa0c265e0d0e5029a11600f1fca14ec0e03cc77564ace01519869b5'
            '6ce38fd79213fb9e1300211a01a7614d3e35904d8cfc6c0062604d9c47b2bb89e5f5f1e512a95522aa9cf404791e9cfc486e524ae88a58e49923e8038a2e8219'
            '3a62e91797cce8cc346b27a98c46aa3500baeca7ef87f540fa6584b83f51db97120e4b1b062ab6cad7c4c15606eee48d103461867913a7279c9a15a785e92353'
            'f1f59af43fda35730d9876cbf60bfa1ff276943d2f8d0d8ef29b32f4c3299f947cc695c4cb2d53633cbc0ac5fbb7c7d1724b410fb6c43577fc58d53dbcc87568'
            '3d7b081fe9808a6761f06e4c33cd84bd450a906f32a3db2db3b77d9575474582020808aed1e8184bf76273b70beab3023ebe8410b6e857f53e56570405a3b873'
            '20a99c04565b455718bc665e17811420fb5d2329debc49500a70142a54a840db923321824bcb3aced033a7da1e150f872ebe6781f42a0d7320c0a51be6521bfa'
            '4bb06cfb97380787f65da9f27314fcf47abcb8e1fda1dd24fa27ae9ed1d4529c11da09e6df9c3dbf158adb94815a9069a152607f42c0adc120d9a5d0982fa43a'
            '82c77cd21520dd675e219d113d6f9901cb2faffb21e5c6f0b3bcf6017e09981dddbe1232fa26e236cbf00092622e823e3047afe8aa348cbcb2f6e912e841e05e'
            'a67517ae1eebd06e539fd6385404b54ea8718a73408e0f8ad30d111a0088ee86153a4914191b1d522cf36269b8c911251a79f363deb182c124c06859f42d9a51'
            'c73c14b4a7e0f275789d1d0e917b5ecd7648b5221d1f5c641c30ec095917ad5f484ed8223d1a96d479145c06480c889dce4f7153d6b9fede1d060456b06626fa'
            '2112877df5bb7e5ec70cdf32eeabbe233bc98bb12572a1ef795a0c5335056d0a69e43a0d4ae51fc92b8879e5cab6861d259cd93d88b0d8b6b2fff127c1e4e25a'
            '0b4a8a41361ea2d87eb0b77561a2edf572be005199487553c21b771b656c60d267a4564f4e05db0334fa86d25c6307e1ac65860ce6ea390fc98bae62b1d9afe2'
            '1f7c0afabc633788352e5b365f0d80ec7d7288b1be71aee5ef9751eed82a8c84f896fc632aeaafee87b7a974a0698948fdee488b9ed3fba62007b54ca83996a2'
            '254364e23104cc87f399a196c1d30fe357235f8beaad502f1b463a1be0b80ecef3b718135f24db4a6a135f981b4d34474903306afb3dfe1f878ee3f2df7af2e6'
            '1f7a0d9cb3956dc9694617e7ce176c30a876af8a3af5fe0b74e4f5a9795bcee53f8910e0a6943c0657c962119199f8bd1b71c2d47064e8372ffca35a1955377c'
            '9e917d62c186247c4eb5831673cec7bfbb0612f55652f0a8fb10db34d4d729638ce01e06801ddc0f2b6a63f7c5ff43eac06f31610cd008e552fe1cf95a7b7eac'
            '64790f76aae82097dbcf5f2d58c0fee34a053bfd929cded32131c6eda2c3fa684d1614ef9ffb0f678969ac7bdc42451eb7180c62c7381aa4576ea32f0977d9d0'
            'c7d491715622921b041909b56140f8369df35433c85a12068220d00d4bf3092e5a4e7c5b9d8529f1f38f72f942bda4c043b7266c8d8160b44d0eab8fadec33ec'
            'b640929f294ffc389f993bec46bf205ffc0ac1f3d58d0ea49a9d4775a10fe71f97f01f13b569037acc79b49d157187ff7c72232fbf5a96e22747bfd52ae1b057'
            '80c4603fc9bfc2424414b6249371a3836372f7b9fe65bf262492cdedcf80a517a88592f733225ad30cdcdcdd85439a43ed55f9ed796d4dc41caa7443f4fe823b'
            'be099db2256b475b9c244e3928facacc2834742f96df931a56e4474ff50cd026a262580295fba9ec40a248abd8ad9c097790a5980057b803b8173eff540cfed0'
            '2788a419e4e10e4cb22958d03220774a314a8b01926f83131b9b214b02416bf1d9db45804ae423f6da60e6fac6b208a178d32f6f93df8bd52bf9d216fdb7c1ef'
            '86cf2607233f30e3e11ccf16b057312e4409b7d00a5c2880450b8336f2b9f48b109a5661825988fc5bd2e1fb4866f70d602068eb036c67bc068dd4ec49fba4e2'
            'b8828c6c00ced2d9338a7f870157d1389afd0c3534b2a7ce8c5570f47ecf9d159e63bcb12c6a28aa9391ded8742a69bb40488be95b3feceeb02c2d5b3a3defc3'
            '5a7b2f41025cc74b7266ed4d10ba58628c6b15773492b4f0e56e27ccf4ee16d37c8133b5570de21e473a42b6f0218dde86616c08abc15c964c675084481c8013'
            '2b46455d081db3b9b57d59c3aac3ece329466b63be2e6c0d3312426da4c4c545d06767486eac49afac5019fb22de27ab6250db5b4cff1940f793cb1f9dab8a6a'
            'abcc05b7c526cc3a832a6d24ab7e968fc63a87ba830a32350c5b6f86020e78cd0c39b524da1a1082566a5db563161efabe7dd31c498c9eb0a4efe1652d105c12'
            '466bc2b0a3ccb104f13bd38fef1dd1c32f8200c4f81e3a13ab709cb0be54f4e62e34dcfbf338685dc1fb51492b08d71506cd19aab99a43736d83308613a90e16'
            '0e6af5c79b95c62e385337d2207e60b59affecbeb9643b3cbf7b58b5609daa6f1bdbe88431fe8e270d7c703be13a02e8eb188d5fc91d239e1ab006301374b8df'
            '0ccdd850f24721bf5b74abdbad5e17b46ffab321a608f84efc8bbcf6088342ae4dd15dc4e8750622bc2ee1fdeb80d3221ab25f5dae4ddd0054071ba57629e1a0'
            '43662b653fb7c2735438adf01c8540950c166a2255a4e18a8f03836fee906e491a7d9523a71132d68951f3dc0ab24ec958571ad9a9eab1f83dee4d01e0482f35'
            '218c242d3fef764251c971df7186fee26faedba13362a3a1ca1d26b0a41aafbcb32ab9bede4fcb2d7233b2dc83c87bc5b2b9467c59b8591bb3f5efd7a7b12a0c'
            'ee33c6b18bb760415f0c305c455442346f4730a5d42f4cddb5af8723dfc49411944b762e36699ed7575a158febfd291fec4819c209168a8d3a4585099c6526d0'
            '7451c53d26e136a1e2130d6900d4e586eb90d7b403ef1085fd340e8f5d4978a84917117544082d04d8beeec8d25698a133d59d9aa90f31d75fd65668a122d325'
            '9e48dc6450f99fc65b028452e80d5eb5e4493fb6841df705299e043d61aaba83d79c37c4fc8cffb519f87a9814f34689279b9557d9919f0f643194be997b0870'
            'e3d26ee53dc0d4fe5816afc29e806800664c225d55f1924152d44092c4d66c1da7725b81da69c770996e87bb2880b0101bec31797ac226053ab30d662cd66b1e'
            '5825ce56e3554e32d748cbb96346afb12efe63f02bfd7dc79566a55386f55cf96d472b11c807037113e4a2aa99acf498f7250f4f5fa78b5bdc5029c750971d84'
            '0c65e7d52739363562aa1927c6a123916054102dc8cf04d553bc79736d3e2a5f5f80262bf93602c0d27637827901950e2966be47989b0f9bba61e037384f6683'
            '18ef837622d1c4fb5de8f0c75bbeea4b5269ab3bbdcbd1a82d93a0770d2215bf7e65652b0a5c23c35d608821e8ddfc4b965cce8382165ff1d15d047de801341e'
            '7b3b9a23e8d0e8f4c6c47e296ccc5ff119ec7438ed7d9b2a4fed9957f418dcef1db071ad1e34652d5c2be4b602b2dd3fa818837a82e48216fd55f7a3744f0cc5'
            '7cdc9546981517f8d55a9c7731cbd0ed6adbf338cb7bf8be00625d230f152530d485550279dd2ba4f8edded4fa95be7ba158c6c42d20cc070ed28e38077f827c'
            '159d575216b8fb436e0c26e35af6399b44c5c484c5475a478da5985bc225321767a53aa3e77740f865d1f0621e3a48d7e1247550d70f4c6f614da2d9f98da96b'
            '94d1029a89f7a0c50819692e375880b448474f2772e948d4e93aadc630b5bdfd27198c98b8b0007c79dd67e8dadd3fb2a6f8bf2edbca616b1e0765e58ed614fe'
            '90d9bbf2c386ca683b4d79fd5ef23a74291b6c0ba862bcef3ad9313c3f73a49839d555a286ae71ddd8799b16129ab7735b662407be99ee802a3581ee9cacf5a1'
            'e843b55ac82f7d9b3109e64285e7e5ee3d91e8f7ec0655ee99fe2d1c772f0458e95e06dfb10391313eb1acfaa0a9b2086164e59bf92130e7cdcac3abc3e7b4bb'
            '4cbb796a98021d23177bb641e0d76daf471a2ca5fd3847e7dfd5012df54a81c185527c8fa5faa738465fb339fe9820de717f7253132df7ed3855fe9f5ed15c6c'
            'a95950a94f4279950951c2c690ee0ee1747fb9246f55f0b822ffb51b13fcde4d1d263238c41ecdaf8ff333bb94c6620dfcd4ba720f336158066126a7ab55b095'
            '9220568a3e7a506667683e1a6edf850fcccf57377a9d5f9de61ae4e06c1bfa64542b5952a6eecdec3963be3975e26641d149f058d258c6ed60bb16cd2928ca6b'
            '5bf18a551c717043e5d75429d20fca984d7b53840254e97ca19759e9010da9f7a234b297590b47059bd62bf77dc961f5eb0ddf790e175d60e3eb37e2f017ff2a'
            'a9a21c9dee1a74204c89ac5f3da0c5972483e8ae069260fcee4fe3593df1e910635533e4708b021038b0a766122650d50e09a0b13c8a72e305d19696da79f8a8'
            '288445e656875bc9cf1607b47eaff302e3b6976ba29bd36d2891849e60ccc88e741fee0295840da8d36c344a304028dd1035774dcc6a728e54b6537dd0b52ba4'
            'aaf00a34f0d6b69a342edc43a23d028f246c2ce5fd8273b4ba088ae8ceace513dfa38f4c7d7a09186e92bc586b0188ca1ee240c8ab6dc3b5439080dbb7dc345a')


# vim:set sw=2 et:
