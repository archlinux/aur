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
pkgver=128.10.0
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

sha512sums=('c0f349cba626e6ec16ff0b52b7d21e05681acd1377fd1111992860f8079373f631ff997d833a3596c72a6d8c6e4f1d051927fa719f1d37a72553dcbd5348659c'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '04122b384bf2737f881ca0e0458c8c74babab3ac9021a5d6a3a8d281b5c26dbf7c787eabd32db29304b82165fec38c74a1b8b1e5727f90287a76fa2ceee0a828'
            'a1aac9199c4207fc39346c414730e53a2a73228217eb4f02c2ebb0fdcc96c5078ba0cd1dc8ee240a59893944cb850be5daff7f6820fd92e127b3c9de8afe1f3a'
            'beeea0e959607bb5f35eb21b3af69ef3d84650d9e8ca3e3010893cb410e8c0e70aa4906cfa23f7c1db904a1d78cfa89959ac21693aba27578aed5faaa1b8a67e'
            '3170e04048912ae83f82f23ec76f9a4768a5e458f9199dcd2fd6f85a5712b69f6835920519f35f537c700f1bda9150c330841ec2bfc0453dbe931a7317cc7159'
            '9afd82842c95e4a1305b7e7b5204ad72f1438bc22074df56e4bc018ebb6f6d580bbfc3fa9dc3137dca76ef6bdcb38ba7d0cb963ab575bd6dcdf3b6869abb1b9d'
            '3ba9c3de0cf3612f531452f2f12de66387091eae5f4bc2440f4e78ec4e64bf90a76b225f2b4d6a90dd356c989324f6b0a0ae2802080c6cedbf524599fcc13a2e'
            '6fc1bfdc1bc487baee676674c8aafba8ba4382314dcb55f5cb1f997af1cbc8586148036c7971e193485fb3fd424e1983ef2c7c360452f2f2c1f5c671a6721c8e'
            '4568954fb53c3b9efe3f1edb14a2c05ec7e85038b17a61fb86eec8e03ef564bd96a19f78cbc8b86973517cd9360d927fc043c7cf8812152e4cf966d8feca2996'
            'd69b78efaf4da2eb69be1cd67da3dfd3cf6bb7755abe728c072a9a0797a820e651dc27ef9d6cd4d8b3a66672292b2645e68ee9a177b99644d0a520bf0264ae09'
            'bbed8da606fdda10e957420249e150fae05d76c3f9f2b5699c4e5d9dec5010b8b0f17d5de0624a0a326403e204b9ea8fad14b8bd6c666f91cddb6b5d1ddf2f3a'
            '589c6f11cfbf4abf8ba35e5f7dc19d8b374912a3df269e08c24a709ff0858011a412f0880993508fdcf5dfcbda5f6fb615f64b427a1912f30147072441f5ab33'
            '9b66f6c25be20178effdf9a605e70f2f1fac52a6b70f7f8fe3ed8dacf7d842bbc0b3da85695dae68c202df97eac9842ff3c02b81dab09e6f502d6a8b73028962'
            '9e6c60d09d225b32a2fad0464f2707d18fa98e1d2c633cd09b0276401edd8167835f2d3d551c4c1910db101ab23cfa0f73061d52929fd978ff417ca317130ad3'
            '04a89c362adb93130878042c2a94f6bb4fdf1ff4464649ee1915bb9c3b79b2a1312fb06cea2725f9714321054523263cf77d9fa6d2755680180f3ee1b7dd697b'
            '0221204547ca7e149fe383f7c23cd44dfdeb98371ff98c26c09c2beed4dee3ed4acabb24d7b3c71dbb594b1be878ecf76819bf70879388e1c1d3c8587101ad11'
            'b4785e941f2138c6e702f39592ad3037b1a1dc8e91846c36a34b853f9a3f62e879987ddecea4b3b75b668d37028b98f14112abc912f578f832c5c78b60c8c777'
            '58adba7680c8dd9e17b34bb4fb3809cf2607728c77d7e76ef6ccab8515a038b9bb5416a716cf53c4d00516b39ab72e44c9fb07e05c892ead68194114c589410a'
            '266e93fdf40a9161b0d93ec974b06d2f567910b2687965f14051671992ef40ca9a37b9e4cf38f52fc85b2992c8017b4b18ce159a7f21c4da1d930aca7fff8519'
            '8dfb2e2163b8d461d465c9905f68c7e9a4be01fa973b1058e02d67008a534a72935e9b4c6ea31ba6322fb9a49adb8d2856753aa11e35fadaa07e45e98b3c6a22'
            '822c7d6f961e899d7943105455441da28ad655f96b79db91ef2bb4755ef602894c9742daeb92c0f2fa350dcb7afc84f8658ed8f85e395cf796e046c2ce656ef1'
            'ab4f75b4074145e6ebe0f8965e938fef5e32c2ad5919b34239af53621832cf69bb52981ec918a06741fcc139e502bf5ea92852c52c9d42c4085d1584b746f832'
            'fee96734d64f9ea44e2e6b288802d2c0eb8f6470718393dd07b1af685b7d89438a21eb004dc0194fa1fbde0b5771986ac78b25e3904590a6f62204bb7e2a3892'
            '7dde59698117ace33f71702a5f116c1ec81a136e1f478b09df7d029db049c4309678775bf6b7c6c0d571ad5ee381aff01f8e63df0273fd0f1b5f3f7eea01c8ab'
            '2d61a3267dd82be8960b03c44832bc7fa8f7f46064866e118ca5e2b1c80591df83314f676e2fdc1732d6c71d675e80137e91a101b87ab33da4f38d6a09ff3b6b'
            'db52cccdc0ba0da5d504c5afa89801f88ddc4bcfcfdcb18d5d0f38d004e294d2a5d7eb00aafa8ff36c18465270fe8e0e35986328c911a2ee9379ee4114431253'
            'b47ee979910a115e9558c41cf93122264a6cf0ab73af8062a0220cff0ce4dbf002bb287d3f583d2e7d53a5773e181aa8f993b06bb0c0bc5782d5c4ceb7807123'
            '52ac64e6ad3ae1eae59e67adb463238e26e36b482d6eeb981dbd72c5b6df626cb2d679579b481687c8c64ba1fddc08dd5f18f390aabb9b0c01f0bccfec2285f8'
            '6e793cc2c19ab9f394c106f82d81194457cee3f58741a9e3172d9d5329d23ba7544a2d6894bf9043e68da384f6f351e347feb4405f4a311104c3ba95dc96e821'
            'baf452fb382c69929ce62812b678764bc69d02d8863efd7def4cda86b5bde11b7febad6ce999b6b555340fd95410ec5406483a3606bc8c76c46a34dbbc10db10'
            'f2a978ce591e9b9a9ce85a86392b8f5f1e60bd20532415c6bb025e63130915625f40b5cb8e11fe56a95395bd6433a17a6f055d4fe086af075750d0db07c83b52'
            'e5627548d0073ac66492bfb6f57e65446d038923ab4993b1706509fac3cc554e6ee5346bc4f78885664de3de57fdaed425085778778f8ea6de896045b94e3007'
            '956cf01c598001a20e59a081a490e62e98d89ced0ec660ad57058ac0dce7334125aa8fa3aaa049e5ef96e8a6025b059ef19c475382d97f3eeaf35664a1eb202f'
            'f36184a5b1bdf8fa56da73c2388e591439f971645bebfebd989f35472bda4ac69ab58b98cada1cb19eac1a159744c6bed59325f82055f17eb9f237aca1da7e68'
            '87c58bd155c0b6fda74359a14b6a751e02267da8866899758049cae7acf47709f5929f2f233298992ad23fc187f0bdfe93b287e384c61c83ba2256346ecd5891'
            '5afded9eeb459bf27a56a4a377331e93798b37583a9e455061aae88a4c864097e0e88b8d88c636e534d58d971a38a6909e51667291357590a802a716d61e7b9b'
            '69c552931ccb93e7e48272016d1502ed03d727d252c499c16ee353b23fbd6c96d31443aab4770703ebc592396f64045b25bb531e5afafa2d014ad9052839fd28'
            'ddd7a289bb7a9ffbfefdef72beef630a5cd5cd14a61245f73a49fd367339bee51680438ee7c11305b32d214af5643d832bf9575520705c988221e24c47a2ba80'
            'c9075dfef9c00f4800e8598f8e1932d2df5d20e8ab221ae578492d6d82350b864411bd278cc31148045f5a54e82331947933626e33b9d11deb0828f92dc11311'
            'a7f275a461632b0b9de7e195b621de14c0fdae0b333bd4c66fdb26cfacec39b37cf5c1780c58c9782085a3655c91f347cce71ff515f2d92928c2c95b40dd60d8'
            'ad5d7af80ff73656304e3d6c8444ab498282589015cc7611d29173665aa4d1141ac06b2f81f29ab65e457cc1ab7e49da9e7893f284212c922ecc973d64085a62'
            'c7086fca32c8a69ad76af8f9ef57d78b44702ae9ba6874b0ca926453195c52b53cf3e0c03efb0e4becdce4ae742d3a451116033582fd55a7331048c2c213b1a2'
            '3c1f26ff6f8837a9c84c03ae1856f3b5ff0c79459fd19e8e184e88c4f9dad360794b2de906fc7025b74baaabc07072382f8989557099b7dca0af04bcd0ceae8f'
            'e7e4ffab8a2f842be2a87bb7871c6414b7d1fe7887f808860b7aa36a7458dd2ab37af2bba1fcb01d5021d454d3d1f31135b8efc3427098e1595f4cd189075efe'
            'b5a05a5b07710b664c0602dfb53ad5bee9dcfb4d2c24f0e14fb114524f46517eca9928c5eb93b38065f1f26dd0c5e8e789b030c145019a461d97fc0db62d4936'
            'ebc17a857b798ecd8eb3f4bcddba82f2e9bc8fe37aa529f3b6130056ca1de78d65c90eaa3791b2c2078a5cec6ab7cbe149137bce54ebcf41671c183bd0ba21a5'
            '51d50be56271ca053e0e0aba634291db84dc710bed494190803dcabe6dd4e574e6d0a56d3dc405c5fe82fc3334dc123af0628e9acab3ac3827c08abfb380eee4'
            '3f344b9863cac54f33ab7147141db33d50eddee009db8c5bc581a2117ec0c46f68c7404e6bafa42ad0e613f425c83a4b8a93e8ed126541f201c7704964ce5456'
            'fadc135e6e9bfe477ac1aa9510c54923404a975eb49fc25d2e797ab5850d5f6c0c2533fd81c52569e8bcbf0a2046dd38df2f28a78e84d0bc9403c1fcf076451c'
            '040120be65c4ee4bc784f4ff5761b4e6f9ed899aed8d71718c8af47dbc6e2a649f0f41fd650605393fc0715287f752baa14d836802fbdfadf8501179a5b66c6e'
            'b34873187b9f13bcf7da3c6e487f361538bbc5f5879744edb582ce4bb105773a013008c31d0e268ceca031c1808d14609096bedc22b043c4d918ba269ed59408'
            'e523b264cb9573d3dc3883fe5eb31143f12ed56b98019c347a867546f035d8aa2e62a984eea19cc12bc97a268d2060f691bdccc9de0c33974d262a8a440a1d5f'
            '7ee75df9a4a1b3629d72aba1f9b330e114a1bea2252874e8ee4adc3ff766073b5cb524d937326546e711a1015c4e0023aaecb251fe583a6309f990b80e4dd05c'
            '15e475709fac09d1a34b464cdfd3f00cda2990f9fd4f101e9e9cc6a6b3f7fe5b7b99df8cc8d5f84f3e3705b0e609259fafbba16578d7bb71c8c804c44ffc0c99'
            'b837bc5a49ddbe2ce1bc5e79eacdf5468ab786fdb9ac8ec587c5b698d6e7fb1986c392bc12ee4eda2c8a3517dbcfd5e19dda9d1f92d69beabd79f3533fbc5dfd'
            '7042991750cfad28aab61199ed63a3e70fa32910f794c5bc31513eb350ce1a75dead26cf805a668676fd29838f00ba5a891ba2761d47a5d683240a01e0516552'
            '89bd951b6312c2bb4ca32d1250c7d158c1c3006ebaa6426188c5510603cf97d37d8e2e628059504c0bd2e4aff1251af25826b61b5cb4fdb2c146f214c66c7e5e'
            'ed0f8a740f2cdfe3909bcab1f8abcec436159c67e80d2bbb1d439333c2887fb539d4a7b2ff4e5ca5dffdf3a402d78920387595bf036afe686bc340f57e839a4d'
            '098d6581c5e38c1ce4c868b1d3851a680e17815dab8810ebec1a06020f2e7df4bac328104d2b8b1a2441479271531a038ad9b323af8d9c36d57a2808a0045ba0'
            '85c9813bede9fd51e575d5149c358df213e6c9d67eac84b9dbed84fbfd38b21e09f39d6747c101fa04f2cf0426ef4961b26c40766f1c73b8f3880a8be1a942cf'
            '4f9b21b961862e94bbaaf3586ab389f394c1c966540cbc953eca88d64c09f01c908e2e9337354777efbf0e27dbc3d03cc3986b35a087d3068675b9d8750997c2'
            '7b58120931a606ca9d821c25966211c788499309ca89c45068342504ed3bdebc4dc72afcf5cddd8a8eb284a0e7763ee6dac3cf45049502ef8f44a8ef2a0af8a5'
            '05c38ba505c8db8eaabbfe4efe81dead930f6fa913f6ebdbfee0a4318ef9fb19bf62bb63912cbf2bd0e11f678e8e37e2d0190f1e5625fae56da1d516e2f03959'
            '191a4a2e113089133b28c91d681ddec0658e722758cce7755eb25efa64b28e3833b707e7c1352a0a9f075a3cd6b0bb763b8d4d3dc888ecda0c2000e932a6ff9a'
            '9ab23a547db9a248480a25518e11ec2cc80e68043123334002e4c9ec2e8f75b61f2eba2a2945ed09eb2d5607e1403f2633eb11334682840dcaa69a8a59ea5292'
            '46851d5795d2bbf083f12d7fb4f97e57e9c79862ff33eccda8a066fea774ef46f160a65534ef6cf7e0bc886332d7acaeab74b206792fc8af3104d62344b6a2f5'
            'd1faa655ccb17b1abb2c8886aca16bbd4893bb357ad1e558cbbd4c8ec30e650870193bfdcbd0281663af5eafe32deb0b0995d0a92f5d5847574a82bd061a3a17'
            '9efaa188eb2ed86843e3e9a1a22247cbf1f98a1cf80d4cd194d30fd0e6ded0afe9fdab2bc56c6c02bb616648882dd250808437fe810ddce8d8db2de2ba570d03'
            'ee73b40d580057fb5e05ccca26b9cb23f539bf24b51667b33dc65d38ea13a0541c3090bf081759ca59ad07253c1bf7d6184930975a1f3b091f3e6da78c49ffae'
            '85a80927fe8dc5202ca24eac34d02dbf8780aacf0c22803cc3fba60b7f848cae482dd3644f3b632c7a52c1290aa0c40f14506065e41d781170446b1c8a67eb13'
            'fe9d8a841fd9b56f39ba381544923a1aa5d6ebd18ffb57c9c52f0ff89d5c7c6754747559b5f69e005cb046e5865306268e3eb3a894c36a8c44128594f9b5e495'
            '2911a7028b214437b2a8dc32fc6239b875919f9aaefef863edb365f8b7f920b2f950e984432acb74267e59ccb6a3d1cce6463b474d89316d8f22d48bbfd5f5af'
            'f87103a48f0209e8ffee3db31898036acd1cbc8912071506e8f830470b17d60cb337846f6bb979cc29f36544671c519fb27e5ea6f6e0a87ef1b50d7629b0ac71'
            'dbe670a06bb33f34167c087b2a0911e469dff0ae031983007c6984be0d41502246eb36c4ae8088dc7a464cdb78be9051f7f3da5bb3736b2c3ec4eb79a81b6d9a'
            'cd2fcae7175e0dac692255afb2a8c96281b280e060456932d7b0e7310dd1a32c861cb4c461f310a72ee724892d00dc91d16902afd463fc2d725455a752314f84'
            '23c030b004cd137b1adfe07651bf57ef345de64df5b428cecf36a25649504c7841194c96a40fb02e5c0a2d92644f02867876e0218f5fcf82b7a7f7fa476133c6'
            '5080a1932acd0fa49a535fe77e48cbe7e83baa8e6bba69fe12244dc1bc79e2efa667beb15a18946bb400590da9be311fde5873508090fed44b024229e3604fad'
            '32c43bd78bf53ce5fb4caee1a54c204b798d30c6067ccfa3b8431d65f5141fa8c33d594ca7f304c46e529b3b20effd9648280e9cbce6e24b75f28e70da8eae04'
            '438aa5651257b5bdff6b236359601532ac4f5cd92218489e05227a8ce7de1feefbd94d1ba0efe03895aa9d7e3caaf6c5f3dc04d8c479988dcb5fff2b637e3436'
            'd8ccacc40270a8992a4672b6337f6c6877b25f31d1338af8945b949315900a4ed0c985e786227946d394f75449898f78dce0b0490a82e456227438b6ab84d1fc'
            'ce9dc05457eba43d70fc6562e2bbe560219c5a854705057cf2c1920ebc7a2b3e2256ca50a00656256a3c59d740dba4da771df71b8ce51ba047db3d4b28f491c7'
            'b917229c34d7f3c8d3e7ef63429de31f1910aae1636a3bc77e9d7e41a27c125d640ce4493c05e7eaca38b3005271b0911b6b0d84e578d07ec8290b9e89542650'
            'e129bd32bb534cef592444dfde941e2db677c0845d2d055f0b37dcdfd611dca8be54ec4610a21f14b1eae21a9eefbd6022f968b7f5a66291f37c90e7c4005353'
            '7d8fdb2cbad755618e3bb3bdf77be47db9868fcd5b35a4863478e83480ba630a14d710e59e611cc7fd65a4921227c187ae1331f2702a8837eee987183fd92987'
            '58fdd89ef2a27a2bfccdc3275844c1dfe76679e25db75c03fe34d468317e07dba4c058418753bcce682ce4e8b660a9d3d31a6a49dd06dc6a0947a95cc7da0722'
            'c79b0b7e07ce1524fed3fac0a231c00d03e2e54e88671ab929dd4a2bfd96c7520049759f3998482014785e70e6a6dd369f8ca6f5c01bac42629784f19ee66d7a'
            '2238f016d4e4ef8332e087eec5563662bea7200ae0c911cc5ca5e6791cbf8d74d7d76c964405d1f996f55949b4aef203cdcda9dfae953eccb322e66fe2908566'
            '7aaeba915e57f82515293ff615ea1fe117de247fe2847682890cd462b382606a2a25b6d0d2a3c7ff22c668310d6ea8852b74381a0029ee9b35e939b937a518d4'
            '331d286a6c9321f07a994d7d4d56e8d312d19cff6ec3848ed9f6f85c6f5928e190ccdec0045cc8c2b222b6297ace3bc726db9386784739b2d38cae6c41e509ef'
            'a4e4c39477cda7f5e19cdbf072ab149e78e5995f4b5365fe7857c8feedb1144432764093d4d15334f338096ec2dba15323a8aea0fb298ddcdf7bd069a6f0e2ac'
            '6e72649d9d0e957c7fcc0d5c4f36808603263a7b9646cb215c6b27da8cee0720766ad450d92e4737488b3644ba15cdeffb445c3b9228ec72c74e0f46832d0602'
            'f5bee6cd5b5c1b586c25706dd57f87c8b5cb145dfcb5bf851d484ab652e33c40e93949345597a4774b09e87a3ec166bb6b92dd9d563f0da7920a9b0bd0e8d831'
            'd52d17ab8501179443c8f6db8a7e54a08d2dfd5fc3e7debb3e23bc4c3eb4b24c913ca300398abb0ecafcedff1a6a9d588c4cbc492426baa31fed8b8df306884e'
            'd35a126fa10fb417db4c71b9172b44284a179a9cf66b7213fc07bf8a85e3ada1ba5c0678b1fc60886c6c617de7a6096b26d86e123fc003e9215c1ae0c442478e'
            'b99ffcfe4eefb27dc9248db6c485a2250d8cc369f65ec1cd8f953b5d09761d039063c967e34c4e2f0f88b2c6407ffb881f1f784a66f38cb49a16ee687098e557'
            '606c64d34ac13d1bb8f9da88e8b13f7ea907fff2c806d96b192e50d547f4b70ee71d1197f7d3e112db44a7583e4d7be2cb27a9f2d43cddaf94d818107c0bbf2c'
            'c9b3b94956255d94fd08458f78b94ce7775e3868cbc6392d94bb693cab1cd065cca4b9297091c30d464f1166085617938da0b2c177bbd7873a072b2513f650ee')


# vim:set sw=2 et:
