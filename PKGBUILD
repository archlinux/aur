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
pkgver=153.5.1
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
)
source=(
  https://archive.mozilla.org/pub/firefox/releases/${pkgver}esr/source/firefox-${pkgver}esr.source.tar.xz{,.asc}
  $pkgname.desktop
  identity-icons-brand.svg
  # Make different channels installable in parallel
  0001-Install-under-remoting-name.patch
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

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

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

  local appdir="$pkgdir/usr/lib/$pkgname"
  touch "$appdir/is-packaged-app"

  install -Dvm644 /dev/stdin "$appdir/browser/defaults/preferences/vendor.js" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);

// Enable GNOME Shell search provider
pref("browser.gnome-search-provider.enabled", true);
END

  install -Dvm644 /dev/stdin "$appdir/distribution/distribution.ini" <<END
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
  if [[ -e $appdir/libnss3.so ]]; then
    ln -sfv ../libnssckbi.so -t "$appdir"
  fi

  # Register GNOME search provider
  install -Dvm644 /dev/stdin "$pkgdir/usr/share/gnome-shell/search-providers/$pkgname.search-provider.ini" <<END
[Shell Search Provider]
DesktopId=$pkgname.desktop
BusName=org.mozilla.${pkgname//-/_}.SearchProvider
ObjectPath=/org/mozilla/${pkgname//-/_}/SearchProvider
Version=2
END
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

sha512sums=('9dccf8c5383653ddcf807b500889a91f9b9d56a512dab88a2683755ae6cb0c4b5d0788faa9541e5709a2b783002ee9f434020a43c8a43653038a2c3decd9f2c1'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '2b06a2398e862fa4e61ee5e41971930a9c50a90fad4ee99231fa9f8d94d07e3f31a044d2a306a73e28367f654ad5568bf4a64ea42898a5001969022e3bc8e992'
            '2f52725f410f845927c8700be2711fe6a86c7ca53e68dc6f58a1ebd5db24a256dc5a0d14bda2d77d34360188e5478e94092710864f2e279e7466c3db39735783'
            '0feae30d151037d8fc01a6143ba13750dfc26033d260907826dc091f00327a2bd059a81244c95db58273ca472fe02075700e767d1eaaaaa933bba7ec0cdbd3ed'
            '80302e07b94d7832fb3a503e64e63a91945499d05fcf2bb5ce1194ee05e1e5b4c10c9bd67d15ff33e5ff57e70472f9cda5741cf07e06f8479ce72cfab8d57536'
            '9e3b8d66eb664225aeff8b4b876bdc2fbbd92aa591f838f5961836025528c5e53aac911ee2ccb0faf16c5d9425bdb803607b62842d1ad50a7406361a3b5dbe92'
            'dbf65d4bd54aa697cacab980a512902593ade21909b4988b149c89ea454aa9e42fb46746fb8c2971d488050648fdb69c2835f134e0178665378a7aac0f8e7f97'
            '51e5888eed7e612ff21715b5ecc24d408234a6195b9cef87e347da7889adade27e585dd4220483d22bf1744910d8472ca0298fb913ddd4ff4ebe2c2ace3b347a'
            '9af6dd88d25774b3e0efccd76a7bb401b3551dede42009bc42991160b5df90feaf12b18af35eae8ebfe639fc682ffa71e75449550511fa005fc32e1d191d0728'
            '7a045b96c1a41c5ff0cb5c1dbe22681289cccd366d7cf9202feffcb418e696f1dcf4eb4abeaac0738a1faac8ab06d92f634622b983bbbc9ab374dbffe00adea0'
            '6bee49780f6bb0d5a5306d98b2ae199a1b4de678857017dcb278f07e4354165ac8a7ae7fb9e6fd582b0c5efd7e0c64104cbd1c8438b9975879a58f2af7ecf694'
            '5cb9ced5179f1cf1f535b7dbd1a06aee6e22612a7c6dcfddc69fe044c85a8c4ddcfd76ce2cae36ab2464be2b1500c880eae8b2dcffceeb66e2b1074c63a3e207'
            'd29248ed6e612295d63733eac318b3d82d2be609d68cf9e4ba5c1c85933319a5264e9a722bf8a2833f539a0bd6937f99957c0c7ccb89cafb8f1d7f389c84e5e6'
            'a8db405bfab4a7db3eb693861693a87fb607bafd7cea2879bdf58128fd888aaeb8807ecbe945bf865c9e278a5b21840d11db7bcf1001823984a58474e53c157f'
            '3a17d819e871d9ed1a46540652b736191b1afe2fd902a163147845f970aacbb45b9da7f0a5be8b2062af64dc1fb1c1fcb87de45fb9a13b138cfc9e4a516bee99'
            'e0b9865b58bce7081897e16a6ef2f41ccf01e435e6f66026cf9232feae7915c288e2ec0703563fd23e64def2fbf079545d38d5f2b5526554daa7e0727c9bfa54'
            'e28dc6a7a715383ffd63cc7dc524e6b34fb38daa9db19e848531f6cc06a2bcd5d0293b264b58a5cb49eb6a616374194c87c87b7965f36f4bb2c0dbd3d6fba463'
            '157bfc22e40305fe91712d294dcc7ab62b21fec52ab1b4025fa26224412d9c29fed8a604dfcf3cf5add138d08459b04b7bcaba7b0597c863dd4e6d4e68a8e1bf'
            'cba2f902b5fcf29408dbc08f9c2835543bbdd62b393afefe75e4a6ba0d166a27b4d884a87fedd0232768625e06d28a47039dca413a6296df8e78985b6b9e6861'
            '24e6e48e764cda698ac8f3b84ca04ef8aed3d261b785093a390d99bb126f32f0bbf6fcb4c3a8ba3b54fc07f0482edc6b4ed30e6103467f5288a885a6c1a24c63'
            '9ab52380cd2484f659d8411fa7c397ebce63fbc8ea831511e10e17afc1d0b1f025dad0fd7a9e03a52164e47561b0d536b19a1d62e6424f119cd234d012b0313c'
            '102dd94477adbeefbdd5ddfb62dde32115cebfcd14ba0776167f25f9d2d0b51f3390991e112183439c4045b503d942b1b523406d8f76f01b238d1b30c0f745a4'
            'c920da6631cfd1ca00405d8bd45b8f03e57714cc92bcaf1ccf8f5f688157d49421aaf4953ace08aa3fe03980dbd8be90b1a5e446b75a238b773d2e1fe4b2d95e'
            '35adc5371442376cf5988facdeaded42638f07e11d8bad08af4326e3fc91043e2b8d28123812bb766b0e33fa119a0176517c4ba708f96f9454f59da22311ea41'
            'b007333b640109dfcdcde7f3f320a54ab925483cd68ea92ce1dddddf5e58f5b4d0951b4e8069bd09f3095de17d8e7fb0b159736b21c44fc9759d36afac4f8783'
            '15d925b93f2f2efcc8934c8671017d4319e651396de861a0003210b9a8b91bb1102c5cbe2821061258c2fbd6deebe374a2bcd9faeb0d5cb9b0672cda07e8bfa7'
            '4e5e034b0fca97d11822d04a9260ca73bf0631bc87ed8ef034b7ece07f3dfaa1b6d7283f9029e0e9e38e876285f7d1c778eca5e8c11d3ae9dee44b5227d8baca'
            '7434b0c6c9e52b87812801979d4f04dfe7e6dacf19c7f8f08aac53c38ebec68165af3b38cec55e8d4c7e074deb99ab071b39601f81cd17d9327dfa795006c2ea'
            'd50c2f653e43bdfc27208984915dbe0dde07be287f209061720a0c093083d7819de70b0d7ea78a14dad15d61c61a24c10ece4b32d6e337631736edd272ccd299'
            '1dc8de260ded8b82ec20fe740a7539a96e058aec944631216b9871e0f9184a345ceab098622fdf26ce3b256d3a67a7ece21289101adb9dbb5da77fcbdc1f6d12'
            '87b9ee5bb815678552cd9688a400849d5db39113c4529d5807e1998e2be77b4bb342d1272ca7496a6eaeacea79b89b6914037823706674e90ae0da8f13cb527f'
            '5dad360e912faac596d9cba6d4705f4bdf2b2b9d2efc39ee9d976aa5ed7c3a7c02065dfbb9fa99fc312d36df01e746cf304a7c0a0779c2f8e34dcb70222dda54'
            '50136347bb88ffbe303cc90bf3b211ca265fb234a6a0d53cda962ebe5aaafaf5de851f2aaa0341730835cee468c5723c84284e31887f53087e4ed97199901d5f'
            'c85ad07c71b21f38eddf200932fbf27778ca16658e96f1ad140a5e30aa93b25811cf0853a9e54cd283ef4a826431ec98c485726d53a21fca12736f0ec36aaeef'
            '4b8f59596e58e279b75f734ae2edbd9d18630c15d61a66330c9ee8a549e2035d8b70853d3ad951e6d4c6875d43bdfd88ea632861fc3414f963f648699ac82124'
            'c6f2d7cf6ddb77422bb57e7c426d14e7376d592a682ed2c0b1f8930b2da6ca56ed74269dbd32356dde4243acdbdafe2c22890a0fb584a7b47c31ce6c57c3f1fd'
            '5a59489c8c26ad4d754708ffa5184466e6df0fda34542b6769c4523a662c7225ac29722cbb8030700fc13decb0ff56d925a6aade632fb5e7d8f39b61b44ab43b'
            '3cc3f5935f922b7a1800555edede8ce816ea720fec0c671e7147e2958c952383952e82ebaad31837c5d9bfcc46a5d70b3419b22e2aad3d1eb82cc000ad2de4aa'
            '4e0f9be286c089d91771610abec6c9f30eec58eed8a34cc13347077fd389bf288f2abe92e26139bb4995a4971d5761fdbba2b4df5da51e254cd63cd416a61afe'
            'ec3dff1a5996dd6e4675c2e7a85287930793e2076d2821670c4436fecaf98b177cfbd8fd3bb4962f394f244b33506616c1d150a61398be2f494c44b387704d4e'
            'e070f8a89709734c6388af691b624943df6a1cd750ba71fb4d0eaac0e29f00c365de1e4a143af9559e96afe292fe78f90c94f0603791445e87de267aaae46b28'
            'd965b2ea205f5a93f00ac372375e6b82747e8ceca8dde783e68eca509ffba663ecb0d7d54eac4ea90a98af54350a855a4a6e9c0ffda148dc6a77f55cb894ac65'
            '6d4ee6a285102d1c3a51cb34c4b6572cfe0b22f8b9878566a6ffb730d4ce0b824deaa5e5d8a1982b0706523c82df928adee3a6b563f6200e6240350377940af4'
            '5a8339be41c9ee62aec4213788fc51630ff9751256aaed24f5b043c54e44797fd8d644886c4d42afdb1cfdac4f9aba1cb62a8539b0276304e500ec79cbf3509d'
            'cb8061725648711db6b4960128ecb6c6ab9a3ca27e9ac69b6f5108590fa98df77864a3aabd984823472445bba761be61c78a14a80fde276a63fd1e572b7a0f4c'
            '30ec517cfc4164616984218f87a0fb2039fa488ddf2c145cfeec95a157af514ec12a2db3c3daeb486c98c676d1487f248135be87623109efdb52646aaf0519ef'
            '535163c29ac6fa15cb6036b9835ffec9133a5a1c1c2603a6b35b57df5026581d347e7a4110fd1f34ab2a6f0a1c19ca000580223cb895cd246a4f7e1978e15c05'
            '590c6ec2734ccc1086575df393c9b9eb8542ac48fdc230adb7c5412545cca8bfd7bcb98bcf445b224df7cb702e928af86d4d8a0e1c1413145684ade07a7e237f'
            '3781bf36841c655f3a7fcadd979c868d6e5948dc5f227c4210991ce187da31aaf0a42edd16767a9612e8c19c3cbe430a2bc9c74b0a0332afdf7f2f6adfcaad02'
            'dae0ff11fe8ed683b874e6371a9dc411658f7c237f65bc15dc49b0267f1117218db63e4034430899575d2c03da24b47c458f943891cae19a5da7ae5d4056bab3'
            '92e49cd0a74d69f81e1670c39ac508d2f80770b0362ce8370eb0ae8cde5442501de111cbc49465a741e1aee18a52c5e78c897893c76a60b720a0acc742cbed90'
            'cd23f15f35ac6669d24fda21a53a444265c94f3bd239a0a6f77f91d6a3f4e0a2b5ad2b8ce4437dcf895b85709ab491c713a276c60de8435c11bb8ae6a184e7b1'
            'e522d5320d4a6f2ec7f910bdb623e14be8abe48288c9f66c1baa09ad06805272cd7acd815d715367fe08ddd2f6f241d7f854e76c8e907f2308dcc28fd10107d5'
            '1a13de1618930c44223b726e0b6ba532975a5db1a97baa6c5e6c7881422061d4f18a5f17cbb82989e074bdd1a49f561902e488f3a13afa4f0870ede1fa30ed3b'
            '234b9f6a69e786767dd1522575a5966a714bb2b725583ab56fede27e2762417832479ea026944833d1151f9b4ebd0fda2542a0814e786a5b83961af83709b228'
            '6dde74e2b06f436c281ba481b8f326a3386e369198cfc9f2ed0d049fde1351886887d675fac7264e45406c8d1f9f252332b9dc1e932bc76d657a08bd3889cd7c'
            '4f60a6757fcaa9ec405ad3e1a322c3c9b5a59c89c13af74f1d0a866227ab2076d035298f0b083078361b805ff3f46bcbffd1088af61a1b5898be7cf84d70bf90'
            '4b65679cf0401930b8a00ef4e4dc1c11f73bb901827bc6fb7733dd2991a2f51d4838fd4bdd549cd4f34054b7d65de6e4fa4c12fa3fc09eb0e68b6a886c6c9cea'
            '1fa07edee3b252176272ecba0449ae6a9226b2231d53909fa3b6398fb164094986d1f6bd4a6db6f13a1a35e869ef7b8ead952cee134916bd2cb47006e9c71554'
            '1dd3cad02868f77d91f95c59d0cdd41f4a8854b346c9cb27a0db6b9f2ed08c007dbbe0ecb2d878457159dc1d4db1fdb5935451c349357aee5956105e97ecc13d'
            '650970b4bd74f5c40384938024de9d8bbe68c31ef8cc3838ca7c6bd5d8d5d6880cedb650559223753444c10d7222ee6b5bac1c4b1eb5bf88fdbb82b9d79e7ab6'
            '0c367f5aa45469835c612ed9b1cb6596ff8e6279dc3db8df75cf5e584592a1d9f93ccf087d581f559c5005492cbb1034b5aecda7147b93c5654be5d2dcd82275'
            'a37992957c862c703e1479e9488dc9ac1f5fa21cf40402393d5ba1fb69d5580ffcc67d56da20c3004466bd900ff0866cc4e61a6f7da55ee0adf5f909b6d19eee'
            '8c0100cb9f8d7266d6b9bab73d274d1c7308315dd81f1216bf66cf185debd9d52adddd87786a2f21b01bcace8986d1c1ec3175417f9379767ca5bef366c999e0'
            'ef4c20972b469b0b735ada3cc1334ec82cae05d15c978a0ca8b591860f5313c783cd11ae929b6cc6521d1c4515492d0d02ae1987a31ebdf5fb247abf8ee4e8c5'
            '742ea5d9fca886eb2801d631289ebf80f689f7211afb73750c2aed9dbaef392895ea23ed6f9dace3150855239cd1ecdd579364518266018b66a98011ed63cfd8'
            'dabfbd2ef48255ed8ce2797661a0c62322629f20da23f1c1c5524f64089098e6bcaa0a2c8d451879ea414b24df184c53e590de2186bd28776d622d958a469f26'
            '61a62519ecd9727ce0f0ae55929d896113971d615a359ff1f2238765e74024a0231b477a69483bd66c1b63681086779132a6a29a806562746414b3e3d5e8ef89'
            '9d21dd8dff0caae848a57376f87130975572666d453cc2561f45c468eea379bc71f229971dc830bceb8970797fc8f55e98c60ef1b16ec77820e8f324a7fe1b6f'
            '0defe003ed756eec2b5518800b1886960cf8dfcdb37ff4ab58fc3608a75ce98d1bbc123130b0df681494a18a97583e72e1b1f904c39c7f953f81027e5515a4f9'
            '12467b8ab4ec8c4ef63f669232dc9751037c1d533a5ffc03b046a6e92b86eb4bd50838185413eb80124765eae192fd46102989c45e075f8cb01c8d58549cb458'
            '849b606be0f55067e0a6acdecded6d17556168621152b5eb08d81366103f54d8744f5b742c04ba2dd140df501be00657838338120ea8cb0494fc76b366bda609'
            'ec2f3fe5294350d3a4387d71af74b490769cb186c4bc7c2691ec3d423959c0905ee204721ade2193cb42a3bc578c90b781f0aa0e9dfb6bbb7328ab4db37951ae'
            '560ad5b6261e3c504197f33484cbcc73cbdb3d61d29bb58b8632f3449d5686ae7fc73210308324870da8ab953839aaefbe7c99e6d4eba6ca77ce4aa202c87f40'
            'b8850fc0fc576d2269737d4103ad1b5971551434d4d2113d7ce2cdae76a44c3f6c3d7ecccaa70365f69fc36c6ef92cd9e790c096925524747355bc375c639c9e'
            'd4cc167cb957f0f7deaf324af463e1fd58ed803302c6d1b25b55358178211460b38a0e5860ff9ca5f16684720f40a84c6bbebd9479a2bb6a572185b3620ba06e'
            'd441741b1fe75ed80f3588cdc938fe3ce2f4ff34eabbe5253c19b0f299c1864cb047bd13952f3375beeeb377a9972007ea9eaecbdbddefe605849000f5b7c5a4'
            'd19524e0c0205aaddbd7a184ea0878b04c3dd4bd7dc85cfd7607bfb466c7a2b1deead8249d005aae40b8cc669e883c85f165144d9c188fd3016ec00f1f00ddb1'
            '9563f6445334a3922e9d9971168802a8a256216e543bf67de2b7fa8f2b9697780be050f5b09c0019a55bc58635d3b0fec66fd891c01f2e39e54fcc00bc86d869'
            '37e241d24286ce24caa369f647e89f5a3c016dfc265099ee3400444a685bf70ef0aed2fc2a1c4679abf6f7adf7c13d65b86d795296886aebcd11ea5e6dbb1381'
            'eb10965a466ca33dfd8cecea681b4612d849895d928b7af9850a103fede8636264fa98969bc43e55fa09ccfcd706dfadc52cbea092b64377eb8bdac752858bd5'
            '8e8420f981da60a56e8bd5e983c2cdc44af41255087be51497f5ea3101139ac75880340b250de74f99dad17c9dd91648c38779286ed125ad3c4c4562fff46396'
            '209eba2e5cc31ced85ee3e7b0728d10ff62a40d71157dc3fc520453850eb9c8ebc2e41f0412920a1e99fcdfe07aae9b222d1668596c23217b37fa73a1654af9b'
            '59270d421a112c0e40ab2ba6ca8fbef8740d845df502624bd53f83fe365e5e97ba4ed12a028d3dd5cfc0819453b8a960f011b3fa552220f9e56a20199e58d84c'
            'f4f27b93b323448abde44ba2e6ee94fe353badad5ea643a8b53c661919e8663510b978638d558c75e1e78220972764aa317a58bc435ac3062f6734595af720ba'
            '95b6591222a7a663cf174274bd43a0da1536512d53395af28b8610bfd1a1836add7fd81ce81f6bd00339c2f93c01acee6a410b697f780b724813a6ac9dce23e3'
            'b0b71740f22491b03c7dd22a26fab3565c52affa5a986d6d4c14925e99643817e13242237913cd697d48d02881a7b39849c82d0ad1504980d8a668c1bbe3e82d'
            '67d4b56803c9dac1ff7305e8df929067194902d2d5eca68f480083fd8c305c3fdfd9f6374c0ce0e5cfb96f8b6e56133ea366577a384c29a3c1e1daa1c382e7eb'
            '3592a35b919376e84c3b2c9959def0c070c943b85685af0e4d484a7692a7a91059d4a2d24beb27ef1936cab8ee23bee8f2c267779f1d50209642eb18b44d3cfb'
            'db4b23978b4963308559070a2e519a6a5d7057f7f919c861851e3aa94f970ba9b2252924114d68d9e8e7fbd3010864f14da48bee8c4c4d3808add2f62964305c'
            '47ebb6c9a6a81898837fc7241c280f0fd9c81493ddfb78a40de4fd7c697b19d74587f4bc2ea4ce9daa66202b7b86aa5a285edbd4aeb973122a2cdf15642ac872'
            '3dba03cbc0c709ffc4ce8995406ad1098bf0ff9723099054b67a8434b8e646e8a08c28f66d1ea74b22f50f85e4950d0446262df007b1d6377c5149dc4047c2da'
            '6267c1786728dcb40b71143349cfe309e86cba4fa8431b07e63bf038d486f69952c7a6f9daa26eae4ab0b321a9ae08d61fac6f6122b699552589ced02ee8c0d2'
            '5cc7c275434a4d0611871c69dc72436cd3a5343d6512bb76022e9fefb41dca62d8758fd1d5809cc8b6c05b79317389415ad698056be391a3895a8c29e9a0a27e'
            '755c2380971e689910ea54411b101ae8e2d7faaaf1fc0593e3f6121fabc93fb871ff83154bbcc6b039981a0f9d9808a500d7f8b755889106dc7ae14436a80503'
            '02a1ed3bfb21553632623c6b52a6500ecd8c774661ecdd36618893906475b15fbf02cfeee2a2f4a226c3059d5286d0b6043e452cf8ebe6796d3fe67027373760'
            'ea3d02cfed2be380d6b0b01569fb0395d4e4cc8ed4904d3f450bdc3636bd669abd2550b4cf4309d6ef882cc4d1c4d5375b4978ffe5ac1f1dc09f0795f42d0c13'
            '8ec31937ceab7868fc416eb18a16ac20e81c48abc72aa4373a8875f13816435a92694d953eef45b8bc9161817ce9a5b79578d812e869033d2941753659013dbf')


# vim:set sw=2 et:
