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
pkgver=128.1.0
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

sha512sums=('8055a7f83acf0cab6124ba5809aff1c082e81a0d30ff318ec719f8fd3f4af9aa60e2094c1abd6c981193d751075a9569370176e20e50f3c1959fe27a15511388'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '8d1e68b8c355d08b62ed586e7eab19c636db44a939b4416f3c76a9be6985ddd43dce802a3e185659973e19cc0832a6700b9e51cbb0d00c512101bda2f3311267'
            '7f88e5e2c3bce9e21b430ae48b669604dbfc6eab1061dd26645f46abb1061e690750f66370187eef613ad151150314f3574e752e163c8b25d4d17573af63417b'
            'be36a2bb3fe32ae3058731e4355a2d1092ff809229885d7e35c9c1653d45465c89632e1633312a376d2e6e7c49e5864ff3758b15d5492b79b3a8babe3d1739e9'
            '4f4818a789f7da04a71fc257317e9d2341ead3209c815e25326f13be1501aeacd7da77e86e4bbc2560d1b6952f91466ff1fc90efd16f02762c85ab06e461bac8'
            'cff20507dd71d3076d44f98882f4dae05bc247f45d7c977baa8459b3bcfc1522d3791df2cc150892b838191b46656824e525f3d54f673f61b63013cc17906002'
            'e60c790ce037165dbf3f437c59c5f75b5a6365fdde17a8cd6e6898be9f1ac3139c0db1613010dccd8d1488d53e7b4ce80586010d268ddc0d7b43f031c7492f5b'
            'fbfdb0564bfcacad1e3bc42179f2c4c72f87e8a68ffd9dd7ce473516960b7410e523bcc20436510cf4c61fdfe4b921d1ac7d2397515b5a29153a45a91359afff'
            '1e2ae9f2745568722c14b3024be2feae19b5cf5f1091c249db20cba8ed8b8c2a692bf391cb485a05f8f0605375988fb022e041b37a08cc11ee8f13dde01ea97b'
            '87c7875d5c86159b7a5ef993f5518bbc29f308f63512de394aef8749186a233dc77eb22de39c9c3f4b4cc2a01058f36ced37fdd8d1b7b9390fe49e13f4d49a7c'
            'fb234cf103b4a33e07db8df9feb577de5e775367a0c4391b75b33dea4b383d36b78d81e470ebd116b6c7829835a28322916ea027e54b63e5adf2dc42f7e2c12e'
            'f0d386d83273f15a6bd7ce1d397df99c33095fb647dbbe8c460adabaa63fef91f4f76c0c2c94a910148da0409a5587fde1e2d47184acad4686fd29300f531205'
            '67f708305f0a5af13efcba5b63feb2873f30ee04fe4ed1889728b7fa248d7c54bd748882ed37f983f179d9a7a60ea0c0d2888b7a79e37ab083b49892523aa468'
            'eb90a1cdbf3fc0ca05e5ad4a2cc34ad2632b552ba60d9f875e957b1df02acd4266164e687e38bb5baced3ea5529fa2531274240a286c59b2b156d4233462aeb2'
            '4ea880709c17ded436da647db2661d1a760b0920bea7e450785d652fc7eed3ba306b122b4d6562037e12402c4c72dc3f6a7042d61ac4212987f890ea378b56e5'
            'c54d8975f8162bf176cb8fcb424e38f2a3f68195447053eb7da22957b832a2009e68c84d271f06983b026234b87db909c5a3008ba851a504d94d31428d8e33f0'
            '46ce42b570e5549e4f17358dc1d77cebc1b511e952812041a17401e06c01ea0baf7f820a91598a19ba5f7633e63f2a1849979345c005e0135cbbe97239e8f0f7'
            '677032ed8f304f6079f89fdd0ea405f61aa6f755042b7cd07aa47c90ffbdb0eebca1dbd335d3f9e0d776f4bbbdb0c62af69e46b105f3b61b6b102ea17776f5c9'
            'cc17892ce0dee036c2f1746b11cf9574ac777bd4f066c5fcdada3d41746c4c906dc6d638d6ea42600a14eeb14f0d61d34a4355d9651e013cfbeb36befb55685b'
            '8a968aa6257a297443d7a4e6c5fea8ca96d418a97a6d5907ef3886b9415ed4290aa753faeeeb3150be795b8b6ba374e2d6f632f3d72206bb922dee1d4177f025'
            'cf08dac95a48345aee7134bd2248002fbe4b89e5d0bf29b5ff550749a1c92bb5ed73adf79ef380aeebb6f958f8d34637d52227219b53ee9b76e94d489aeb8d5a'
            '083d0a1f77f31facaef09b9254787f78a1fc0fb0160ca4620b3addf9bd91119bc22ab12b115e85b97ecaca6830901841ccabec936e4eaa4be4dfc6ff8daccf74'
            '4578ab4122ee04f11e64ae5db01d8dda622240a67e108946ea1c257e758b92368f4fd1c7591356e65156f57a10e301c478abb5c10f36af435f528f5d11c3ea9a'
            '41097ea9ff228d929b52cfd9398f4afb8d7d9b575a66f0075aa8909774d9c41ff161eeb1cc7fedf2d026f5b42610041b9a895ab42f3f1b00acc5b4b83248a1f3'
            '853ae27b47cd3696a751d025a23c01630e786bf59043f3f34f374180047620d3a548b8eeacf9b0fd479888980d5923ab61cb19f447b3a6816f220ae2f3b94e6f'
            '58f44393ee66bc156e61384c198f4cdc53b240bad1d403ce33e6160439775110b21477f40b6f5e7e05f05dc019ae7e712bfee610383be640ed4b60d1990ddc0e'
            '3258e5709c1650f12fa3702318476308059ad2ecbc7abe84ce13ef3bb6d393c7b5565c8caa855fa107c76a2e09cd93ba357a75b78d095cb9e3af85ca5e70860e'
            '2d7d5c2425b195d3a781dd4b20070c4e0fb3634c7bbfaab33e6bd5f95c68cef2f179d9dbd1bd43bfd7d871ecd70a06743a48223922fa8e6439e577829f22e81f'
            '7663c980d37a61b94dacc4dc0387d1358bc65859755a311c1c8e320ede635501aa693d3c719c4105db2adbb3f3565aa07cdd1090e67372f7805312ccd9274bb6'
            'ef6e4c3a31f08fcb13b3e6734749bfd78e45b6fd018c05822673c4fa006ab3d33055de8940dbfb7ae2130151f118c0d3c925454b8c135895517519c776c900b1'
            '8f10622a50c8ad9ed1e483d834c47963c11ee410e7d938022408aad35ad51f7109169e26eab2a7257de11f80d51a76fa714ba012efc0e1cf3502e82752fab7aa'
            'd3ff26a257d874149b9b39e5c18fca255041d84932be0343abc392a44b6f908a04c686a2df13e5f224770f0809df5a0ea0d647ff3eb20067fd78cd79f1439c43'
            '4b2f05aa41e45d08ddd7a9b418787d2d9c76ca917bbbb77749008f7b9c835b180c3c0ce487b8b5745f2ae90e55f5e388232220e83ae3f285a0fc2f8034dd0e27'
            '12e49951e3364540f0d91b34dfe88e6c15b4de26b0dfa196fd35d416e2658d6f4d41e92fae7abf1c6090fc34a16dbaf45bce6762c605a89bc0199df67b498841'
            '9936d795f615a2f33dbb2116bcdfec27562d7a1b823d260812213b621dee2c9a8056dd40c88f71e80781dc285bf3ba9bda3ef06cd28dcaf7611ef43e532fb548'
            '07fb222efc92ba2679c348ee3d7d6a7f321027e30d2761ae1be5db587c7b6412e99c4ba7a9308cae40e81030c2b9b8827491de59a384a0e0c4fc5388ea6870cc'
            'f6021a592b1c183537297a945f63ea0a204d950503f879dd11045f45c6af33be98d66be4ae37cd9328e0efa4b12882669fe1c671dd8faef5163a2534b0e18c13'
            '2b5420d91cd2a954b64ba5c243fd6a8ce96180c7d4afaccd1b7ac90a16cd6b3424bd60a1e2dd00457d4886f6d791c6b89c4db619d6e7bb618cfaa88343cd4429'
            'a3eacc7dc8148d222612025a96bc120ca1b954800cf46d7076dc0c15fbd6441b0bef5cc723c2f58288492a58f96796b15ad9e1fe29fd4037d4f14c95204f9140'
            '445b573b0702345ab4b5b89d5096e6493934693643ab60ec70179c001cf66058e4d9b376c79105c57e2bfa367a8fdca662d2ad58a7b70be9f1e28f7bec6cacf6'
            'a5ecb1806810b70a866d69fbfa6fef5cf1a4575efa38c9b4b7d4b45f3609f47d1626e087c38e097335c1f4d827c0919148920757308ef588b221fb317047599e'
            '211cbc67b492a43e7731cd593e851daae138b177484e9a0bf10f68b82f1b9dd5be4135c4c2973bf6c92bf800a8900dd025f0b58d2ec376a4e65d10918331cb13'
            '3c48368e992bc94d2e89cc4edaaffb3af21ad6125109b2126971549e395a657c9e4947c46334e49014afee34519f58e3b13ce9d4a3ada632ab1d0358bb4dc866'
            'c1dcf8d636bbfa939301206b88355ca7c407455ab839198defb678b9c888f0817dfaa44b4a29bd0c9bfa525575bdb298eb7b2520fa9afb723b7562c140d54435'
            '1e0cf300ad3bcbbb22718aae60ee82eea4f9c7dc1cf9541298a0082ffb6ee51680a37a42a8bad335bad18e0cb164b035f8fcd344a8ba89b0aba2f0049b6886af'
            '10ade4b914a49e5a48fdfb4db7a147cc1dee6baf7c0687f5bc847251007fb445bdc535f9b63b276a1b576df93522f8706b291ff7682723db8f44dbc8656a0cde'
            'f702c7a13b2c55b2e11cc4423487882555baf01953e9fb87951d1cbb07664b5c79fb1f9466de212a8b057e9d8c827f342928ce62daef568c61e047c6cf606bbd'
            '39c7a35d6bcb02f1a9179f225b8d39c665c21d74ce9625381a74ac72d8139f0389e3593f980fa111407560eb67e5b4d27cca3c2d7cac0128d1cb310860da261f'
            '6681b2c340e9cc27567439fe5b0cc304282696b6e2e016b38d51b19216a6ee3608c38a8b2c8775e32c466742bb9e9a0fe5ca0bc1f7ffe35bb0f4694cdad2e79d'
            '46cfb3a9f128afc3c89e7667a7cc018c83ff2d70b2a6a00f6d0925b1855e192fbeb3bb17504c7cde6256d88a2478e05cf878776d9dde805cc54411f59fda2524'
            '2b7996cb2d0fe2dbd688de2c15f2e98a4fce15b068a7c133e76d94c9ad6d253f07fdfb70f7644d80db7eba152352daec4c7e7f8e26cee47bfb448bf4bf636098'
            '1babb22c0a23284c2f9ae93edc049f0c681d45e33e426db8ce3645231c358e603a24bfb4e290bfa4c14096579f16274bff26cc62540d6846223257901dc53207'
            '286fa3fc94eb11127f9b9a0fac69725bb33f71baadf73920409de216211983819a221496b8e1b560167fdfb9265db6979f356265f18c91837eb7f501d3a6b73b'
            '728e55d35f6def17d54a40f3d59c55cde75519a6a5c6bc725a0dd058a8b8c745afb575e8c4d996c43d0edc75b6d07cfafd1fb5ad4e4d8e6b151596aaea4805f7'
            '1224e0d5a82ed668b9af81efc5d83e819cfad7df8bbe09306a1a5467fc4d6e6da0e23e135b97afd0f51d50f6133f0697f5fe302e40994a1b3fe4a2cf2cf497e3'
            '1f55f7a9f5df663d1a3e515971fd2789c702923eea3ef80967d8f429ac5bd1687fb666b1123d036c0adcbab1bfcf3cd550f47c527cf28bfb14525e2bed8a1e75'
            '7acfbc19a8d715cc13c21785e15b1918f96347e5666af5f2155275c4bfb2141bf050b0af8d58a9ebc216e9ebb251cfc951c6a2c0707e6c9dbe99c56705dc24d2'
            '0f684acd76a81b5a6d96985af7b0f1bf683c32792786f289341af90b5d74d218321acb66d9e5d77641b3031e75250c8122db2c5a03bc9cbe0f112b9626a1d924'
            'b9d831c5a3741cfd34fa615b4ceda33c7c574cb824865cbc059bf137aab9d4770a38240a5659c9a4e72636f8392bf813d03e19fa3a900d48589cf3bf47ec1e9e'
            '3e98ab5bb0909d46cfdcb213cfc902688697f469c0779d1da261662b97ca4f49988e7d5266bf7bdc3940f7dd7b93bfaca95950c9fc7887905f774359414edb47'
            '8844dc3190c39d647a381984c433fe709d9035d5ce22b3543f43717a8c9decfab19a243495a94aec6d3299089b78c3a2d3b2551e8716cbfd9957c58251bc71b9'
            'bd2e2e1a4cc1df9cfb73a3f3b5f197c6c8901e2a0057914fb5e25055a881a728fd5ab80ffcb1d0d6142c23dc37088af20e2687acaf6730c96f1b2488f535767a'
            '29f45789def945db487b0743f590ca5c05098641bb538d5c6d97b1281e24c156c83b4809cd84d17fad736631bdc9b219f92aa6f0c014b68d36e59de2b5c8a127'
            '1c83d9a09f2c74101227ebf3ab916ac9f76b835af668b3de2f7644f275e9af444369f4bea57aed3b7783696966b58217eeab28a9a862f458df64996b896e3e5c'
            'a1221fd6ede7fc95a76c21cae01ac591739d216be0c3c8c5f12c561842ec03172fd383e47406657afd6f8dad4201478a14eb0c21ccb78550107e17e0fcf2413e'
            'b5bd091c7c5451218b81b6ec303e0201f731751d03071e06efcd55dbac610d5b7daabba6796077f579ce85397a463c15ecaa13365320e136065450b89424fc6b'
            'b5387152e4d588ac72ae56675b0af6d8bee31144b080b2d7b5a1b64f2cfbc645c1e9bc6ca3d4345b2703bc73473f40159a8888b78b9d3210d6a7136f312aebea'
            '9feb6ab4beefba65629f7a5ca39b244e189c9df9cd4f8577b9dd50a292825e1b4940619b3e2947df04d00d2a471ab98d0b70b00e51f871b8a6d38cb795360379'
            '929e3fa9bfbb17080fa04bc58439287a84165e80b109771af333e8477c5967bd32236480cbe662ad9538ce39ea2a85947d6034dcfcab8300dfdf61b664a49f5f'
            '4e8e5bcd9cd7939a89c7dad9247b49f0b7390b69568b5f2b1f839706ecc659df2b5a8ad1f02126daa5335ea4416735ed64c5a3f524cc29d599c1088f32d4e917'
            '5d5f4ca4c65d6dbe85d86ca361e36acdf930854e4eb2a064b1dad5de9abd173876d1d0fec80adce51ff701adfc0d90f595d81b3dac87b7e4a9644f8f47b9dcbd'
            'd6788c373d312a5fedc0cf1007cebb53d94533632fdb33b9383116598d4801ddeedfbc44694da2ce7546a1252e5b3e859771af271a23b88851f50b6fd54b73c8'
            'cf417de30f8729f082582694636c9882547713ed4c603129806092c887e99d465ad09fc14ec3db59209e982ca8b07ce19d69bc429da824f7cad58c53f3392c17'
            'efbc9ef088913b0e03fff86aaa3517fd8d2ec932e5fedc30baeb752fac9e658b0f30afc1ea1742782d34909e894f2a7cc17b0928596eb7177226db64aec78481'
            '1772f9d1c6d92557e896ce4e97f8fefe0c35944807056452f39186a5fcf185a51df2b1f8939fa1e24b9a3d5843b5be2c141ce365d1a7d8ec1d6219eb34b17749'
            '56d617515582cbd3ede67e7a316c56d1f324255b7739270c3715dcfa286e3b519c182c8192447fb6efde50304b4cb19d74650fa293b10ee6ec228ea859205df0'
            '9e22154d175cc6a02ef2a99bf8aa465bcb692158251ea85f7d400efe817db1ec1f8fcd96a4f393d8103a6ea03613bd67d4bccbb63b4a3d2e14fc00e8d204c8a4'
            'a819c18c10deb5c1a0c315820b0d16154eb8a382b1c7b69bdb1e815b3da25a78e23e125ba07a821fd875a6b9a06138625186c8dd5b7bebcf544b61cf865bbb56'
            '8d05d60f250a7a9584724d4ac4f5f3b78192674e80adb1a30aab0a3791f973ec8d7582ebde8305575e02e3763b85ccf1f24dfc8dc83cb4379eae43ab099d5316'
            'b8c259321b46480c25d1157dd7558e06606a4bfafbebd4b6b58c3d58c37e728444adf82a6034141c545fbec9d355550f1de192e2f06b042af7a79570dbbff2b2'
            '8a632c3055933fc4e2f675232a630950c2dd65da8b220801cfd32a4b09d9958fa675527889b33ca57f8180271d88781a620dd0078ba8eb9da46033bbf1d46f98'
            '46756945be6e91cc398e95b7ea1b01d8ec705d5b805e6ea12000ef27a868eba2c0c651a246b78015f5d841ccd8fe204bc87f528dd10aa22981c24d9f05b2480e'
            '9728f40be5507e0b04e59069e041e82b38151eded17446f6098f39be846dbee290aabfd4142207bd90f782fdc0de204cc3df2661e65f45dd2776a6121e6dd9d6'
            'c903ac44596f0bd3bc781af42efb23848fc7dae620770cf3134b71b71153b02b79c6bcda264aa58619173fbeabba75537f8b255f42af14adc1a1ea123d69c2c2'
            'dda78212084536989dcaefceefc8fa9f048d9c8b4cc6886c5498091be35d3534e39a71d83aaf6a5dfb56c9b29846d8f12c853b088acd3787babee781262dba20'
            'a760b2f74d3ba7360befa385d91dcc3008d9831afed5a47f0934a4ce51af46e1322d2af68fe8d67a3a9be748ebdf8b7b6b63e8d95d5a7eb61a9d72fbe6169948'
            'd12b6aff91e92ea3129a3da68d849fd4f285a7445a658829c71c1f9fb84c7875389b24635a8ddd6f1d103006ea3d62d6a8139d4ab3b7f7eb872f715a5672f176'
            '26bca1a6312fddffe2543e8a66184d5cb8ec9cc916e4d79ae12e67209a97afa194600a9cc65fe4adbafc1521ef42112c1ceb3c0ea72daaf072f5f1a936570a8f'
            'bd15d31573eb0744296d6cefe29ea941e6882d30dbbb742ee89dda976ae3df89544b548a1019dca106bfb20f3d886426d7cfcbc47df4093c59d86e6641cfb54b'
            'e5fe1ebe84b7cf52aef17ee0b8a7fcdaa9d014d393fa8ea0c4133fe846a07712dd0bc9e2be19705e9c1ba2cc063f992957c86896bceeb686d8e2d2f2c324251f'
            'bd755c3412458cf6eb978e1d37a35fd749f6f010c385f1477e5240dd25163b8d013fb83545bc5ef6752687d17ab19ec2fca55ad6b0fc730bd5e7447c07bfbc3d'
            '410b40be588c1308fda41464fa68443d39888f070df2f7904925a8f77d603f412259c82cc3e7bc8f1587cc0bfac87146e3f3e593aca6c86b11fe37e7b46fa376'
            'c5854965443b9b0cb617065bff81a9732e4dbf3a1a38fecb68cf507ccc18e7cb1d6affa3b10f200923fa8352d629c732069cf35f1c602c59dd134bfabb1d88a6'
            '9d6ac889307cfaa04d3a4188c43c699706986b2a402b3c607d7e5752e890645ed43e909af70ac54bdcd7d47385bf6d49e0ef864342cbb31505a5cbe1441fcbdb'
            '66da85e8684a4f36f0cf8c0670cf0429859a827b6adfd627b4712d110e5a40888f3cfd41e3300be52a5d21bc976e92ac331a7a61f9ae4148fbcd160d3c5c7602'
            '34d64c137f03e0ae1fa9820d7ea3b4ec79064ee2d7faa752aa94652aa4131213cb7cd1e3c8e75d364e6e63dda52926a96be5749db40111e6fd8dade696ca1d0e'
            '75ac1b7be4ae1971f8ecd09a0d96da7150528a1880d3264d1f4dc10ad89ca5986dd9d774a551c3b4cea554bb0508f03f8bf231750f9db1ebd601dc29008cf368'
            '0ea3a9f7c35ee95645a973c68bbd61c871ae378141a10dd6b4826efccfaf332377bfae4d6f14840787e2e06ef80864a3010755cc56d9d05f46e9bc9539ad4542'
            '524d90cabcf3ec2f882670db7571156c61b19302371c3c17703fcf3abd6758aea898b6231c51a50b3db6607855a6d79677054a9b19cfaa522bde9211b9ae30a4'
            '1a431fd2d01a78fb761c812bdff06361c2c5f59fbda12656a38622346cd9370e6748b61cc98ab38a3d31d9824aa9f2da4e90a0cb6d0533e40136aec7ac8f1469')


# vim:set sw=2 et:
