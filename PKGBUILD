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
pkgver=128.0
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
  0001-Bug-1898476-Wayland-Move-MozContainerSurfaceLock-fro.patch
  0002-Bug-1898476-Wayland-Provide-surface-lock-by-GtkCompo.patch
  0003-Bug-1898476-Wayland-Lock-Wayland-surface-before-Swap.patch
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

# Mozilla API keys (see https://location.services.mozilla.com/api)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact heftig@archlinux.org for
# more information.
_mozilla_api_key=e05d56db0a694edc8b5aaebda3f2db6a

prepare() {
  mkdir -p mozbuild
  cd firefox-$pkgver

  # Backport fixes for NVIDIA crashes
  # https://gitlab.archlinux.org/archlinux/packaging/packages/firefox/-/issues/7
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1898476
  patch -Np1 -i ../0001-Bug-1898476-Wayland-Move-MozContainerSurfaceLock-fro.patch
  patch -Np1 -i ../0002-Bug-1898476-Wayland-Provide-surface-lock-by-GtkCompo.patch
  patch -Np1 -i ../0003-Bug-1898476-Wayland-Lock-Wayland-surface-before-Swap.patch

  echo "${noextract[@]}"

  echo -n "$_google_api_key" >google-api-key
  echo -n "$_mozilla_api_key" >mozilla-api-key

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
ac_add_options --with-mozilla-api-keyfile=${PWD@Q}/mozilla-api-key

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

sha512sums=('b65f28a530016fd0cf46bc5f55fdec2a0cc66bd9a71b606b8d6dace1f6ce1d8744b08298549cf9c338eca1d9331dd506874ed3244bd3b856c153bd765e6071be'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '8d1e68b8c355d08b62ed586e7eab19c636db44a939b4416f3c76a9be6985ddd43dce802a3e185659973e19cc0832a6700b9e51cbb0d00c512101bda2f3311267'
            '8387a1bfd3ce96f9aaf25620c3da4df836060de4b9530f98e329189fb65657309f7a660fec061fac55e2fc34f41335ecca01b4b1c263d100ceaa02ca3dc4ba35'
            'be36a2bb3fe32ae3058731e4355a2d1092ff809229885d7e35c9c1653d45465c89632e1633312a376d2e6e7c49e5864ff3758b15d5492b79b3a8babe3d1739e9'
            '0900cfbcec48ec6e8b80731801b457702cc06e821a361d6cb658c430ce9737f06f45b27b334b21b2e0c2a6b4d0438151dda3bb3f74464059ad81bceb6f0bbe81'
            'f22bb0ececaccacf5cdc3cdc56a56db677f48947c221e25b7fddbb2aab356da9dcbdb694586fd30365880f6f397a07821c4b4991e2a5f4685bac63b8b26a2cee'
            'c5856c422d771feec5641080a379858041ca254cd7dfb1c57a7e5e2718d2f1c50d66228e6913ecc76e68d3ef60dbc7e302f5565033c3ff99ecd8e3b116971eb3'
            '4b9808b1451acb3b4634fc26ee130822a5ed5272c4fd46d5c7f7cc59696ddce62b2e9a39fa64a3d74f0174c7875fedd60a93208f541dd39c1c8531d097a81cc2'
            '02988641337e5c890ae4b5d0068bab676dc8080da7670f7fc5f09e57c401a749adf5216ebb52479d138cd7cc5a0cbcf43a367540694dbaf6dd9edb03ed42ee69'
            'bda429d76d77205a640c2693f89de8a15d26c32ce128d9ad1deabfa4d723ae54e19a3138c6ad326919a118860acd8d315ccca635d4b833e1c0f2469fe13f82f3'
            '9c3d9ef32db1f3a07828812756c93b228d752a3335d334243173e654400f83bfab0ea675316ae038c4dc0df93199f819680b039922d1c5bdf09c50bc3c597cd9'
            'cbbc81668f3efe1336fda5b51e136ec138007c666b44272b625f88ef19c4f59c6fb916e44c8483844bbecaa78e587c52b6b8d971820c1bb4475a0216a7a108b4'
            '7fd7a2fbe03065b0d4969759aeddbf6274127f799386f77e79c8b8cde4a8f31e625574a7f7878ca4fe364ab8a4110e1202dcb9938f737c5bf9baabf82909ac88'
            'e569be385ac2ff70045cc490c6da59d9b1b16b8b8330d1d3cfe255da8f6d20683bab61aafdd04eff0a7b226466c40d01e2449f41b3502b27dfa55ac46c38f7db'
            'aaf15a689de9ddd1e48541e2cec6c2f7d8e364294d471a9c9cc5aa4e6bc1f36d80c5f4f93122f85105e1e7e67f261a603ab56ab8fbd852f562118fdb2c8fb711'
            '584e9279c57d6f71feacfcbdf1c6ee93a12bf074f46eb8af28e65fa04c3d9d110c15d7f475a34ed4d1dec7d4dc4ea0020f9924bbea427357fdc6d6c21f745ee4'
            '1b4146bfc718e907ede81ee1f6772e32b8a930c248270bc4ca3d483719062398cc391284cf557f951892507968bdfed9a8cec311715b0345683675f498b1f586'
            '32a24ebc6bf00b35bd1914fefc484f9362308783a5f40cf0153c68933957c19f6ac1b1126610394b59d6bd37bbc4f28ba54d285ad95600fd11cf1ac118d4c173'
            'e8db6dfef191c399de40146f2426161ecb4c63b287dde3dbc3fbfd92d9ff78eb4ad0e0fabd9b1350ec89bdd64747dafdaa2a91f08d2ad08485cf086d931ac0fd'
            'fc281295c8676714c10b00a740bec46060081470812eefd5157d6c12672acc03328e5c36dbe20e06fe50c8082ff592636e2716108ac9da6319e6ed28d164b828'
            '2701986235f3a8370563e980a95bbde0231029bad620633fd1c09e3be35cb678bdb6ebdff4cf02d22d77eda908d4d31f46e1806c98af90f54e23185a3d6efc92'
            '6403071ebbca3b9566aa799420b9ddd954ee15f1b46cad2546358dd0911992fd780985c3ec59449ad78a93a57eada35710c1f16b5b17d42c8eea3b06ce023fa7'
            '20ab65c452123ed9afffc3cb7128f2d2d825988ecb773e1152820a1e4e5cbd4037aef789175aa1cd49428bf2e8af97e4429c75a34ec17a1d9fbe10a92929cbd5'
            '400ae1c718adbdb4a2188fc66bcc5fbde42ba2b59d86496bf6199547cbd9a19967a9bbb3ec100a524173395aa612ce60d3ec34368259217995b4f6bb57ef25e3'
            'fa0ccde48ad254370e177370b49189d8a8792c5fc77f8d8e5226742144bc08b557d609f0c3ae2d4d55a0f2bf0d43733ec4cf74d7512852b8cf2deb47337bc9dc'
            '23a6214186f87b919a6d4a86413cbfb1ce7319ca8d1c5f9b68b2c49cead46d97c0f041be32899f2b597edec1aea2e97992e747ead0b89dc7bc98ad35ebc69e5c'
            'c0f062e7a1fe1b91b2f39394ad7a2db44bb3b80dec0b69091136e22ecb35f6df4bccd5e117b3bd07858b806ee07e964f7a60d8e7e16c83cb38082252045cd9fb'
            '85ef043783b0321d3d64d8f3fa093083cbab80f85f8908be84823f5f3800c07f0cf7e3ec5fc23af20112bfbd93f7ac9e70a9d98e2676d52fe3d6532d8507e23d'
            '5d1d36dfe02702f9e32fdb3315c7a325caaddee27bf678c77003621fe56828f4c6592726589e5bdcc0d8fdc9d0c30c04fdf39e1462253b81f117a6b84c80a7b1'
            '3458771ebbbd8d023dfbb01ebec936f653f359ac81d6e66bd421485c71998f7ecdbccdb29cf3acf5d84ff17824416228f7ea7750532e377287de553e994fecd1'
            '2942ea0e211f1b6a30e2614de61d6310228086225fe213bf8ecd1e575b39b88b724fddd0e91d357bb077a61c33ee25292d9e4a381bf5ecfd61e959b39c19f070'
            'c82ec57531b84beed152995a914e8eb1ac5f6ecfcdc301e2ef566e953f46a91b8732a87ba6d265d885bea7ab6ac68e6c9828ffb80abf4e00d3e6cbcf2505c039'
            'e8150be3747d960f75a87fb21662cb1b06783810e865cd5bec240989149ddca4e50475585e232102e731da5f370e809262d3e05f5bfd2800018544b9fdc36910'
            'd4b976c89d99d4e7d7c654df25cea5df0c29c10ff6510d8a8152d53b8cadc230f511a8cce90167d43174b99bfe3408f1de1ee837c17032ddd356aa39c4016d1b'
            'ec19834572b6e6eb11427b84ff6838758507b5ae9a710baddaec7db85aeeb1cf0416601860f48852869208cdaf07860df00e7b726bb8c8da4cf44924377d9ef1'
            'efce7cd2905c2044176ea1444990b922ebbc58d68a0821f9c8f631f13207badb94c082bb7809a088cdebeea463dd7f51d206a2444dbf1eceb3089ebbc5efb854'
            '0ce5df30346625f89af289fecc3578383b59d9541faaad858fabc18d15b2870b6257f58c89e18e5dd6fb95e0c0b8b5492a65f406d80deea36b1f500c2c987110'
            '17c818de06249565121c0588957d5379d0b33515451c19c3be60e6d29f441e09aaecf047a0213fe122de47b383dde6ef17bc61cb5e689f16bd198f5f039b36ae'
            'c0014bde2b557e1330adde2932e8261185599c9243db91dfbb8ca56fd981582aa572c99d12579ffaa4ca684ef5e9d3c8a6c45984317a23f07c369ee1c7eb1282'
            '70f98930fad3ee87b1939f0193feacae420932c0a5878fdf640727baca4d272e0d2c06ab41cc3d069a451c3a9fc9b6f8905cfca033d51124c4a6b4b33ba15b10'
            'ab5f8f54e2b8ca808157210866105d8fbeb49640f7b225395e45b078357e14318c5ccf152fa88a027ab08ea20df58e97f30565aea699e45f065b9372ce42e085'
            '40b5da9bd1d95423a9c1ee8e91fdf37bcc5c09da3df16097e43c6cbc1d2b9960165f70787f8c12b6c9b329cf163dd23d67929149d2e48063ec12b3da603318be'
            '1aa29ce5478a846f01af40a1d308463af8370d0ecfd7dc293af64f3b3e70aa3d4cfece327643fa6ce00e03eb19192c2b161e423546c4c21883158816fc9b3dfd'
            '213865dbe1fc2027535deb8747938139293c2b4d75900ff1ce08bb506a02bf13e5960d28d2a98d3629406837c79a59258c7cc85c8f53db767e6da30ad80c215f'
            'ac876522af4c75ef07b1ad987c1cb6d0b1474cfc873ce6e58e8b0456969324f4e42235a783fc20b7e33ef14a28824414ad3e8dc56d370e2d247cc16f187e7628'
            'e1034f842f85892e377ef6a3fd746fcf438fb8b09ed0debc5aab2fc304d1fc1e948919bc26887f3a1534022a53e166859e341dac907f0449fa08f114d90f053e'
            '0a9081077b1edf0e33b3a6021a83ff36742ad03971d0f3939b99c779b084a2234b13514e54abaf74ec9ae477dafec44353a1e787712302e3caa23c90f33358c0'
            '39d1e01022c43ed90c54d16076c6609ec1512244b9c79a21f7fdce4cad66e016dd5083dfd769abb48ebfebd8b505100674801941e2e90ba66245266f17c7b2cf'
            '52c2c870351794e1a879a50c4758d1f08e211c80b11796ac42344fc695c6cb4b189a8cf7ec36a7f8392479ba7caa94cadb0c764e58d94e6f6dddea3cbbfba886'
            'd121832a45218ff4bc37581efc71ffefdb7ac95bf281eba2b5659fb2cb95aeae5c6adb0f62848ed03f1caa45493b4fd51a926bda2db0ddf4769e78ca3b95cc95'
            '7730ac4257b46b75b7cbb78da3f6a9d586650562684e9250cb17a754767517342c10969611c9dc35286b50be888ad72f4aa7d5351673aa91c56f7493d75eacc3'
            'b9d174acbc649b5f0d7575be4c672d1630ab76d8338cd54b0f4b81ed65a00dffc74dc5c607c55d1134952d7dd0ecb0fd864499d55544131efe8ffb796104a963'
            'b8b3376675a9e302bbbd62fdc5cf0a5ff7c166c294527d0f0100ec90e62d4e22210e9a5011a7068232c70df5f90056f58d6e242d8d87507749595537f825f949'
            'bfd734b57e6df1d4be5a06e64cb3034b1dd5b1482940cd87c3736c49dde2d9afff2b88ac9ad56ff48b46c32279e254f8eadfad410733c6ff3efffd8cbe9bac39'
            '49b503dae129e8954e87e10b0eea89d008bd863f46c5919164853726547658f65688b18d79df639d1bb72311dfdf6209b4cf98ffa28afccaf2a3b1c8d5129a2a'
            '8f8e14864089596543c3eae3739524f3fcc1b253e1a02628048051f9a2d6781be659f3a306e322306265072f999ef62be871f101122bf6c1311c58e0b86bc579'
            '93157663abe2d554eef0b02579ac86217b35b1ad043095f70dae5e52fc0c61fbcb0ff6205f9d568ca5842200cc35ec78322029b7b1eee6226d38791490ad99b9'
            'b6b3d2af354e3ddd73e4687edff994dfa3bb950e1b7b09cfb2269190066dfbd85343292b81144adbbbfca24ff0bbebbad754167d70152a50e482cf7a49501a77'
            '371cb7dd18d2b9b95337769a3aed1ac882e64470c0caf36b0c14ac3aafd265a4ab06bb7333f6fa0e4816a5e17de658201c8dba1a2c59e0e1bca92926a73844c8'
            '919d39f9afe12f10a389a96938850371268822e4ff014c007e6c3aa29344edc11e99ae510a52eaa0f55a68020e6c901b86eac8e5b545c29305aa65b3413e17a9'
            '921c168be1592767763425509747a32ddbf01c4b78d74b5c219f30e7c658521aff485e1a54104fcb0b26cabdf2fa6ea516c177c69cf81d49cd829e3d2dcc5c8c'
            '42f6fc470b036a0ad1d8ae103ea600b96270f971e5169bd8ff111138911eab7301e349e7f1db3da87c1290f8ebcc01434c228afb2478781043c822d6d4127373'
            '91e1f53eac8238c15a20a9e8b4e020ec0693499d0907cd92670a1319c9c36bc94b4ca825178a263cffa3d41d354c41b250c3dfa4d551cd27f067678e35cd0a34'
            '9d9695184985d0f113a2ddc9bfe3298cbebb3bd4d452d9c1317d762378724f948b44f9c2d431d02dd5f6308f669ed19d07682f365185f277231db5b4bd749262'
            'e45c9ba285cd206f9f1619faf9a4bbfcc922c51abf592a24f244b986f341304ee151537bde84b46285b64b24d1f544bc3f2ab1c80653e7f72639c06ccc54d252'
            '839caa0cae68cef22bedabce569dbf565a694ed9024eb3e417aea61daa90f505399205722ad61141e282eab7984e072726b5f41f8eeb12878bbcc490c08be85b'
            'b9796683806b4977908c06937284973cd6a8384e79fc368cd7758ab298224629efe64ea4867950586fabcf5a2e9a46b7077c7067029aaa8bd73c7426764aa4c2'
            'bf66ea649c1887dad6c5c981d7615fe341f5b89f22bd5eec68b49c50df2738c7a47df1b97da8429413367913e2fe2ca0aa394aedc3c87190241c9183607fca3f'
            'b88dfc49914eb18daa2c7625296843dea5227092ba29aa4331ea85262f984db70fd5949449b541aba77d7ba0d6f53006aa9632a7fff834f250f0a9f7b0029fb8'
            '64fb0db5d09787ec912ab3172abc086bd8644feb19bd205246b9592836fdca6653964c4180fa84d342c6e9c45e7aa6e6d4101b28f638309f126ee5f7cebf36c5'
            '7a5902ec62a752feb99ac86bb2f30e60cf77ffb98536313433ad65c39064f848b4533106d819371f8d25d9d11783133341a9faed52350e40146b857dfd72879a'
            '47331d25f233c29cdc371181a8145c6d1f201f59b6cb5e9937691a96c2ec4c7d76c5b0af27809bad3f60cc146c2f1252588bac3b06288102c75018b72a007444'
            '95aa4d2a5204fac90a3fdec17c2182462a91645b9a12442edc0dd63f46e834c48fd99ac27cb1b361da2355327045eb0f7c6507782f3f7ba034c7673476055403'
            'd0940688074c748088727aa57f5252774ebf094f3e2eac4e181ace84a39a03a0d074777768a5605e3e7ea0f85c96482205c0a2544f2332b7fb6598724bd05ca7'
            'f1e9b8a1d3849a44e1e8766bfa64c35414107e290f05e55cf143140002104c556af8edb5d58f5e8bd0ba20de37847be3500000ffa6ef8815e523b760439a4e37'
            'd09042fea6855a28c4e184f02b9e62fe571e6a13272a3fd3dfd02ebf7d9c9add1edd30c3ba4c8a399c3ee807687b9c191773fe6bc7c2ee8161d87a818d8acc41'
            '722075f967f9c4ae430e71d0fde501a5f3d029d19edc5e51e5cb064a9de61f31e578c72822adc9db1387063d029e9506295d15c49692f0b0934d34ffaa9ff353'
            'f4d27530250dc66e9756f3c9896654b7cc3b2fe4f7e62bf5c16a5c8fa997cc3ca7d10d6a97a2dd7699e78206bae7a347ae5857757db50d5d6dbc9ae9f794db92'
            '9a92ece6b417b00862c010d4a87364cbf4167289eebb483f2ea55dbee0b35c127bd4c00cc198053199d2da1d5cafda67b01d12dc36e85286852821619bab3781'
            '391b89dab22dd7449ab74d555c84eac42db067a014ee80231b9780a2079e5fe7702cc66f01f789a185548ca447ea3c8952df1f4d35a1f18ddd8ce94589842dd7'
            'a3402aa044f1699c395d55c1d5d9f0bd6037ea4e8c8ec248f124afa3d6aab910a2e068393ad105730d5835744061fc82ac82dcf9cc82ff67c6cf8f408d29948c'
            '606e64d3149c09c8de79d554bffb341c4659f35061f597c0c22dd1cb684a1617a22cdbed94a47e7c576552b4a9aa522ea1a1042ed47c467389525079da4ef81f'
            '0f1c046184e081b2d329aa643d181d9358587cd8e1705877d8409ebbcc0e3b137298e5ee326a1280a7ef3d4af47be7f84f8ba44cefb499641db471a6480196b8'
            'e8eeb054492afa84007255d58baa0fe0ad44b9fc03e1b8c76fe66911d7a28d88490380787b41f7b9af7523ce88f3c6e7ec026b192886a1569b299d04e1ee5b80'
            '9a4770e3c92750349793f4989dcb59aa3dece0367b4e1fd9b028549e9c960cfec7fc45c4e38c8e04d1771ad6c3ad0c8a86c322338b5d61f4e3904ba25bbd357e'
            '7d9f020a9a79e3748a4ba0927e178947eb2498c370179748933a44e384897830cd82db8cac192bbc372a10b026086c452b6da1489847883995631a99ccdc699e'
            'ac36db5327fd1191a4f4d20456edafdf2133ee2bb693a5c0fb050da5645ed92f8a8fed9b9cf5e370d09699a40658e85fd68f209d77e3c5f413296530555cf9df'
            'dae22749bc7b21c83ce7ad89c4647026d59aeeb7ba564df3b972154c5734cef581287e207e17e192949d5c7ba5d14c4f95cc975c560a84a1dc988a3459cf38b6'
            '89b99ab422a863fc3a1254ed1bde181a1b5763d85a1fad0ea8ba9e5ebcc5e0010dd5effab72488e6519ef3b139cf58bd644e586098f9c1fa94d292c81f35d4ca'
            '1dff1922393c50ddc12bbcc452e07924b51797ecd5f2d3f8e722d87954ac67a508aebe8cfe5f4b6564fb8a0bdfc147c2bfa81bf8a1ee1146633a89e9c8c1075a'
            '7afd060a97e9b4e159352d1d8b17f6a6999f0fd82d74440b449fd89873c1cc2749d7214a5dc9ad4f4fedb668272035a7df86cfa5a358b41ce9f90b9f28a8603f'
            '0947539770ab2545da1922b437f2fbf3878e84913c07fa11a500bd1528ab5ea74aca0edc9712ab496a1a8070a550c50ff4b9ffe6d91b10dea4f0eb7bc9edfc4e'
            '41daf02ea22e8dca8ef79c1231bd1246d4b4f96ddb6e0a98dc930889394d7d2ce5e45b70520fb04c482728f85a5a9324a3491e71e31fe66a38ef180704064ee6'
            '275e4801dc269ef7cbb0466e23857c40ccf3ec00bed6e43b49ac5a794afffee3d75c60553480e1f02607939419eb19648bf85d7ce28de334d1494694110a5cd1'
            '4c5ffdcebe563bab094d5b40e032906575f42a705ee0f34e80f62632dafb9375d5284c41b2c012e221e12351fbd23ae80ee5a166553574181ae027687dca801d'
            'f399c4aa996ee307ce7218ceea010a3fdcda4f612647ff499405441f82d17923eccb9151f0cdef7ca4478fd589cf270ac770122bf21a810aa90bb46348beb782'
            '3d91249304806f3d2ab66338583c5dfc472ed1d88f41cbbc1d2351d8c62ac0dd32c56eac9706f10e5a462996e97ca8637185521c414b19de863761ce6a909241'
            'bb6241c714b51c22c51a3bf9ab5ef8817c922e76007a813e0ffc652d49e4ecb2f95eb82fd97d92af6170d879fa0af1efc2e3d01d892f336eb981bd40168a1cd1'
            '27ae153c37cacb83e17192a53bc6c442c21c4eb438d6e99a85fbf86ab0bcc9c0d918a6233daff5057e4059bfa01528ed62ebce105524046dd480426ea8673d5b'
            '45eb0c8d027ee3d64dc5eb4aa5a23fe8e7d7e7ba849eb31e46b29ef5227a897843be006f98dae5a289ba215f6a67766d3ef3f86f837545277a7acc07456d352e')


# vim:set sw=2 et:
