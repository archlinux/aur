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
pkgver=128.11.0
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

sha512sums=('80af64c1dce6d7a25111480567a3251cc2d1edce00acc4d85bbaa44590f5bbf4c0716f9490c3ab8ef1e6fc2bbabb2379029c2dee51ce477933c7a5935092d279'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '7108ab823be6828f3469452d3d1f93d93663135bd5cc659f8491e2b345b5d4cfa12d1df92f9454d81d43a2c42ca9b9d185ef7e6a87963a649da293582faf5dfb'
            '619534f1d14385f17e19fe6d3cc13324cc998b16cbd5f3a40d2e25d134e686c7ea9c48f5549756b20d2be327a6b447c59be593685b12be76c6be9c25f6e8b4d3'
            '30750127514b0d990d9e69d1c499e4389e0793117ea9b5343cc36037f3d08d40577a1e2d34b325a1e3617640490e3864a93a612a3f6ea38f267f3b6c4d399f97'
            'bf5714a1d76e911fe6b45516b316fd8091f74873267795119f166517a52bc3ba738052417d3e9a10f2b30901f86668a92cb563ca51cdeeddbdf863183d7a5f40'
            '1e3ebe4a9c74c75e0d9afa2af8e7e0a78ef6bc0e204f8d90fa93fb1f98fad39be235b09f91479de820de4f5ffef7304fc3dd983bcb5103d197fc34f96a7616e5'
            'c518e75771b7aa999fb5325a7b6bbf049cc4c745f85011b27624df1d965d9dc056664c1e376c271594117de9e6fb1ba7efebcd6f92db616cd966fcd8d46405e3'
            '8f56bc747305e63cf8fd087e11a9950b91521d0fdec8a9ffc31e9036d27d4e1c29726b2d0d9e0e194f7ece35c9b79a34354bbe0ff271a4d1378a25384a502431'
            'c4a247787693185d0e04b95f590e1f952c4809207634fff063f78f2adb0a7dbbb4442ae9e98468960a3f8d0b1d6a85253b97db07cbcd3ea4c193f8fa86400ff7'
            'cce6d14328117bf040fefad12b46d94aa370864ee342d09c9ddab8e08f8a1f8bf1ff8f2c87378a834ad19361caa9c8beeab5b375bc22cd173cc59e03a3030e41'
            '1de468c7f84f7284e016ae10f10c6747f943261c63f5f1cd192bded39ccb38379058512fc6e1bcc7dbc7a334d8577d294825c1000a7e00b01b585ed267b3a3ed'
            'ed2ffcc1e734defc2d5c5cb71cca9736fc6e7200671ac21b60de13fe9dd83ff064b949d73f26e272a2843eecd029f502c0730ee38b7331ddeca51ec0b9d5624f'
            'ece86b19da7f1d528c78880ccf689e21e04488bebcaffbc0653bd070c440fa95eb0aaeecbcecd64585ef021a8144cbcd216da6889e19ce0923bb98797c5cb02f'
            '908eedbffd04b93c193e96c9062204f0636b21018ffefcf40b4c009aa6a6f9c2deabdcc0f4523d7ac7bc99533719c5a69ae8b5b973cfe5a36b9472191ce26f80'
            '3020f8fcce6858bf5c4f70bbb092fbc037121d5aa824aff617748e18554b1596081524c4f44afd34ee873ca0fb906cc1839795b44b5f86aadfef51d965ef1256'
            '357d99e358814b948aa02f076014948330fafc9f1803a7747d7e89b061d2f5088f280e447d685a30d741acc3b1def962c690d3fb1af8d794cc42d05c44ea0ce8'
            '1f16e221de41e0989a84338e20285b66b104e86caae88902e56c2adbea80ac56badea5bd3dd85eb37498e07106186a3a08dc10a38d1d28247394983ba718e33e'
            'f5332f2d3f35cbc160f30f630f875d7231c5a63d143f260207995bf70f2275fa77dabb2248edb1c25498a922ca4f8b05743e564c1d7216b6ce46dc7fdafea8cf'
            '70595a0ab3780bfcd248f9999b3eccd7da8b4bdd316c537939bfdeaf4e3d054f68e40474a5d24cccdf39da2db2bab7173c7f8a3d204909ca66d374f36c41d615'
            'edba7ec3f56f95affe155500795d796c850fb20bfc4fa9215af42c81eb07b86f3cf72d947f3f40df73312575a4af8980027a2f97a50064893696ed66c2741b34'
            '04846e2a39d76705317b45134a717d7df4c27c02f2bd2c614ec3d3f1598c35ea8ec7cafe9cc22ccdd478c87f1b97932ea25e0f51840db9f1524488972078326d'
            'a12c66b7bf222c3a08c99b9dc191c0a4d35c95db0a73fe6e24afa2a37705c0741dfc267870398a3ea1789d4ef9e72cd828f373ab2e5f84c685eb69d157550164'
            'f6faf075ac693b0fec676dcd0958e640bc51a3711dc7042ebe313214e0e8008ac52f0e0692fbf8b5a9b8a2ddc197c3301c26e71d23f38281eb895ef87b944a0b'
            'e9bccb2411e99ce2e61c9245bf39e52e7cee4f55671196c7d35a544e2b792315d30662c4fdc8bdd4fcdd5937f4f589c7650aad91173e275186829040953d5210'
            '9a556ccd28ece2afceca2146731f8a9430d489dc1e03feb2daa6a2ffea5ccaf657b210d04025acc27d9f25efef6c722fbf8f2cf00a70dd611545434ec5d2841b'
            '82e240ceb29a4ef47577a8e5a53a4444ea497ed14c6df49659c620698c6d5c3497bf1a3dce588eb0b3bb7b7ec54bc92779aa8de4c593d0dfaddd5d5b70fcb2fb'
            '5646982caba0d641f709f6fbf49d90988a0bf35faaaa6ded22164f424c0a10d0e8a62a0317e8c1d1a5e8fd47ef27ab2d5f0cde2c1a3f663938169ba0600a1618'
            '84fefb17f472a221ba20f693ecb2e4d5d153715dd574a7c82311d754e6683fd81dc326e7fe28b6d6659801ab93cb5e26aa6459d01b0b2b4cc9d455a95fc66f39'
            '9fbc630b04e13d15cc95a5a383f5cfa1296326d79d29fa90c9c5e1f99005ae594c088f46951b54fe987b0c4cf33cede7669c765cdc06e84cedaa9498577235e5'
            'ca865d8125a44aad3e0db87a425d6e66235a2efe1ce34d6cefb1d04b7de8ef8f4d2277daa2bf4961f4dbb4bf218d9dac05f2e7ef39f59582aa1c556651f58e22'
            '2b8c1a7845f755c07effd893b600b62d93144e86847cb63f517a1dbbd532f85511a6d6e9cf6c82ce11a7320d166e9c942fcce08a2922e2b7acaa439d6c53c81d'
            '6ad4779de2a129ad54bb5ffd9d4a54578afb2834b8870e8875ca5db62d6d076427a3cecee6d7c105b5fb260bf37d474b8747bfc5c96e44be86a9abffaed9eb9b'
            '1da1e01f4a8b90c9b2f4dd6315e2f83a0a545b26e78969ea17ba8316292d49e94b269c7b70fc59384bea23a8fae5e879174bc12ddaa456758426490d518e479a'
            'aacc3f9c76132d447dc237282aef86474746e9aab4ceac01fd1ca759aada72734158cd0d29e49c12796f1a3dd3788faf73ff1138c6bb68402e4acd3dc98ecd4f'
            '7d8040d8ba23c9ff1ee3076a03d209aa533a74da759e94ef8a0f76c270b92fb3aa92b025d20eb65f94e15a14a2fb7cbc4a339b78a16fc71e264544642c5fbd5b'
            '081019efd0d53da3902b17abb5422d0715b18099ea95adbac918c461fbc8f7ce73bf3b957554d5ad5da7ac0c6d819ccac921c23ff9fece52baea171a7875f179'
            'd7ad72c4acd0b4a20ad4d1e99eafc66896e7490c27d0556ef1b84ed5d500afdc944807d71404b0be730d7f5f0990be142894a694cb6650f1bce6aba07119380e'
            'c356b86e547ba2551bc9fff7fad281f8f65ed18a3226c52c5b6eae9ef1c24138e7dbe0c9ef981733d401589337deb5de7622a39317b820365cb4cb6c1ec8792b'
            '20ad3537aba57ca81f9299d015110be093f59ef890a7aa35103a5c2c7b2984ed0b854455814ba42c7b4191b98a719732e263a253d43c9bcdfb9b8ee2bdbe0605'
            '2488189e2fb3d3b3469b26d0f0783258a4523b5c0ac3a53cb42086eb0b3d23fc0912fa3ab3d05c3363ceb4ef82311fbd447a6b6d14ee29993f1f099ccb1088f6'
            'fcda0b4cb707898e56442560eb339fb266d5e376a25f3808d3167a0c898a1e86d945a383aa324ff08e7f5a8caaaef4347d27f1f4f2b037b063a2cdb79af1883c'
            'f6720f0beecbb99a1b9ff9fd55e93deb89cd723a69f02f7037212c21bc48557d59064c1a4076dc58fe42efd2191c2d5c020c71828aef13acc7d344cd0179a54d'
            'd5d072c189f9725ca33bc537ec6ffff52fb075b2ebb144a807e562969033df52e22b2e5e522aefd3b9869c10b6399e715315cec3f498406181768f004097663e'
            '83a267d519a658a0cdc88083099b53ca5fbfd46a2d361d5355bfcc165691f3767372a9674d1307bf04bc230f4e0cadebfe19972032e7f9ff8d366764bebbcf21'
            'fd64835e505b56aaae822c95bb47bf285502ac4618f8898a52e3a18846a827880ad6045080b73dcaf079333a2cac1b00365f7e64915fc4dd4b718db296bcb858'
            '04c41744b1c6c1b791775eaeaa26997d7303bac36b8557e82a21a91651999eae1c6b821519ccaa4ef6fde7ac782b4610564eb9fa1b306be1ddf7b13abeb42a38'
            '8ed9da30f1dae2ed566a8c13db6ae60f06a604f1c85cc347c052a8a31ab01506d4dd4e5e3945afc923e874b16ff928ca04d9f51873c87825cd1467dfe72bd181'
            '0db908273a203b0665502874e52c0b409c7adc27e854fd0e3df42689fd8d3f7788ece2c16adae263f85dc5da66a7233e24df8cd62840a4a5d94e1f36f6f732c5'
            '45c461325c59490ebe9bc47faf0fb8f54b1add23cd8a5ef962e2b930c7f42b0d91e77357491f43473c3bbc3134f91b81fc53daa334a316e89e78e08061a678e5'
            'a2aefa17459243e375446a2f9b6c304498fdf717cddad52cb05a10decab9b812a4adddf48aef4c6e7aa3b57b9962c834f7568e82158ea1a8e66b7e96e8d863c5'
            'e64001512a3fdda5beb00282c3a39ff5f22d311ea1f4fb8db762b755c3f2ead110e5a54ee2ccc26e2392cc6b2918c947824446fef84d8d71b2eee41a000720a0'
            'b5b2b317f2ad72573fe8c28c02e6ef38df15abbe839a6e4b4a7bfbe0d2c759e7605c52aed42bead9e6c2409037aaae6a9611bd4147fa426341029e55b41abc82'
            'fee429e94679d8b6c2434440583718966433e9ea7366c03ebdafb8a259ac79f52bd1f16a42c51430c4c31a4ffccb244f2ec553d03ccf1e1dac05d75324a1dc19'
            '5afca22a950d5f5f23c206da17dcdf95fba795e99adbfa41987189fa34d4e7a5cd6cc6663b73ff3934b0e40a2914526b9944a1e3c8af8be559574e86c084eab3'
            '8d9428b7447bee85acdb96abae73fea6b1aeabbd16488de1e3c760a129bfb06ffb75b514fcd0fd7cc99da6447f75a27edda5813f9b5effc08f81927d1f8bc8e7'
            '056e5bd1299c1e2c53b049a426ea3227c308b6f35477cc04bc650d24a98ef2aff30d76adf1b2a5988f4d0e314c77067616dbad2a1e631c42b03d9dc43968063b'
            'c4cfa01cb20880175946d87913d93085684c2b6bf44c13c54fe566836403efc7d0247208dd2580e75dc497998c1ab098d7df43ca60385729dcbbb3a223adc808'
            'c813e69c30e384e4ed035c54623296f9ff9314763f4d7c3e8207aa6f672ecf2eecace04f9572b1f06a3ec63f5de324886b6d89b0859c593d3d7d71451b19c857'
            '20c14b23da366cc7784b828991619c062e54af65b8cb80603eda9c6d2ab92c864b8c2c717dae40fc0e57657033ece0af1332706c55e4b9b23f37eded38961812'
            'f0b2fb1cbec10ddace4405f5350e7da4dec8ec5e307586122aa7ec3c114272f2aad51c7b35b79bf039a95b01dcefaf2263dab12d603b0a35baa84b9ff431c544'
            '370093d24038c44c623036fed0a55c9cb3c03db7a2def80a159d0d3b5c91338a5f6d063df93f9cbe4e881a438a295cc0a42e966451b290171bb394338ab5097a'
            'e9efdb74379e72479b8fce1d5fd7ab7353733aefc83f84850a8b5a81a518038c3eea800da3d7dce77ab3133d0eaed33893cabfe2a45b83b30b289bf553fa2a42'
            '1a2b88f69b46f6680fd2fb748848437d4df487c4e42c5ab474a513d977e3f3849b4068c1ad20683762644a6a929db898670b00ee36d7ce9358768d19933ab3fd'
            '74ba7fb01ace9f2ff898c05ab82d2da4bfa77c16d0852b810027562617bb26e603557f43f6d0b532270f2aa3296ce4b5647af10a0435914aba1c703b40c7b688'
            'a1652d0708eb0ad7c0c8ed3aa8415ad87966e61b55f3b5eab66428c379a2d0ac548155bb97d775e3ba003bf4bcf9f3b07bc484f1db6cbd02478428221b4480c5'
            'ba872efba70b1d309d8744473f06ff39976148453983d751c9a7defa8d8cf417f22f623eb4b4019cca530b09af3ea146fbcad51518fe11b470e538397f3ac449'
            '2130bf62fb9fe80b3408ad2e3d9be6a1748c92a92eb50ff69918b451d93cd9a75346ac54293a97065a665923dbd4eca2ffc59774a0397b84ce41af98f296fed9'
            '0cde3746fa1ac29ec8d7fe7305d006da8cb2fd87e75cd71d1a86ff978988b49c7d12989e769751bc34d42671a5581187a5f14e68b184021860ba783fcd90a5a1'
            '58aaef4bc7a24c01aab9d7e65e135da4a500f7ada8c84be65f676b00aae3d4337f6fa2d255310d541f508ab8e91ae39a5ea62767f042e503aa79161c2afae7ea'
            '6c0cf54e7362c931a49dbe0d98ea044638089ac77585cd6e1dcf7d3ac80a3cb7088afffe4854117bd216fb789b3c61e9537b01f89c9d3365d119db548d51e3a2'
            '28b9fdb21fd3d9609072e1ec2f13dbb74652c4dab879d1ca5abf2733df094d5d27e3a52d9b26b7741d3113476945d2a006e8b7559b307fa59885690c85edf8dc'
            'aa6f53df213fd2bb68badfa0d7b9e74c5a4d5e1491bbd41411cc3ec4014d34081baad94fc98b6b7eb8fb7de8779a2b9fdcbd3bdb716819591c6c67d92b6691d6'
            '72ea1f4e33e64cb35cdffb0783eadf0613a2c89949c7b0aa428abed4f120753640999642bd8f0f93f589004e532f023fe01e7dce6451f958f52b545856596645'
            'a05c92a45d9464f7c9ccf24036e133f4dae900589461ade80de48145ad1fb7c7beaf58b03ae789fed3d82e7476d91352e858604be681c145f0142fbf6bc253f8'
            'e857f75eff78bc034ae063a46c1d8e6bfaec5c58aa5d2751fae605e274ae23ee70d372b0d3a074e7b2432db48af54fc0a8e7a7281cd539c9b664dff4fc7d7e67'
            '74ad35d11ee3b4585bdaf8aad37d391c71ec26b34a38d0ece1b24f563ee6190dff74263103a346363913a9f210b0d7811d93fccc7e987c43292693bc922cf589'
            '7db63e075cfe2df73e51fa90fdf6c9fda6cb3d85a02dc8baba9b7b3fe20ad338a9effc8dbe1a83586913d52c096191697f97732f2dd8ca833200d745c1f1c3f1'
            'b49aa9ddf9d55bfe1b4a12ab276c6ad7f5d34c645bf6315f3b62f17aefb000adc649a44a677113523ebdb39b229d0228e10e34401c2e13fdde9212fa7a1ca359'
            '1254d9a3e4cf5d32988e8bd37065c16ac31526b9d185833fabd72efdfec996f9199083563dca05820b685ca2109e83c7bba54f40522acb9c8030c0f4138000d3'
            'b051deef2d0edb03f9e3040a25d377b26bcf3227f61dee39ebb32e25625443aea5986981a0081d559313f3c8eb5a80269b4043a9a25690a22109ad733eb2cd2d'
            '83dd73578836c048f50579c9d58146b18b6ade4eb932210ed2f082a57b3225dba41606e22ec955e251cf0a9064d22f9d7ae41190493936a01611c2748c3997f8'
            'd67b308ad44af199bf2cc4a7bae3e4c320b39ce16ef5913f971580c838c332c076a42e1c35abed1dbf2afeb317dcbb87e79f1570d664b0fefc23cb24a6d7eafb'
            '1f4b440b18538a2dc6de101b6129342acde289c8d04a31c99482c59b48ab1c1d358f8d04aa36959bea1c776f519ec7a613f86f3d2b6746d82ce1969ea1353c83'
            'ae02dbf040bfe24d9c28127b0d6e32110aa3d60d02532566e61214994df928f5e488c5d3bd4b347e496b2a9706a375274a195ccaa52af03152749770396f8310'
            'f319e1a492427b5b64500c0674c50de54dfd188be5403fe1dd3e36fa7100fd5eaf222eac8549bb6a4d330cdc88978dfdec508c41933ffcd88cab0ce447d0f4be'
            '4c497f51fdd0525bb16ca3ea98fa04750fb2cbae986219b82829d11d1be93133131dd153f225a059a252797c6d46ec48f15fb2ee6ceb4ca563df05fd9f87367f'
            '8dd2c4660ca0d07cbbd93d01ebfb9f58df75e9f054d7eaf40a5ef3152246f2c976815d1113d51352614d71575952a7f71073f31f81fee9d61e200e7a8404d818'
            '86df0da248b7dfddf63327dbd86d866b8e82c78a949db74edea69291b8030534e70debc40c155bab67604e6b9ae120e8357ff4c88d0d2a39bdcc9c164108ea7e'
            '145fbf132028a7ce1930fcf13e3c8ab81c927a6cfed41cf8c2950acddeceeceeea5138331ecaca4dfd26bc30837829b49e27e808fef39d8ab0fefe2456b3e0f9'
            'c3d970fed2cc8e914146fb63e96db92d20e290c8a52841ac88bb6f6e4abe427fc165911ae7797c86a80518c7815fd45a9d11e135026604dce030c6a236821196'
            'fc462f514b5961bd3ab1c8b826e3c11d7b8f10fd8e25b2cdc334a77134ba68cacdf399a3086859c0fdac79fcd2c92941a907eec5d80644204fa28aa6e998d8fb'
            '23f75e0bd718e7654e53ca0d8562dddd196968ecad3ae8335dc1ad150755a7c9589edc208409fbd357169f463b27f1b4d91e89ab1b7a8df621ad7c6e5bdd1e54'
            '093d0576d532c37f9583d0e71eb6ed29b2f87e060eb8a1504d6d063e5cf99656c4a123b5ff3f01f8eb08cfa826b776090b6b9698b39dd54ca18db19841dd7c37'
            '65c63e9761c8420134e78642d9b8afe1c0f64dab1491691c17e268261403809e523c62aed53205815d3b9dcbb8698489dc177d7e20b307a036b217c250602636'
            'a2ded271be5c6793afbd3d0c6fe954400f80788c4e97da1e59acf82bcff1952bfc1b19d5c3fc387b2be2999bacd0a82a838731d64a811acc0b92482ffcb736e3'
            '70848eac6b137938528544d8cb866f53ddd22e80495bb9d00908342fdb1f84efc383e2346891f532b04c33d89230ccbd40128e78a8cb9e7c4100bd28c7a3fa1b'
            '78b1be4c75947426ce20d82f3dd22cbd6b34bb1c6436dcd58ac2e8ce39a54dff8fe42ddc13c215e4c77dc6fb04a97e8a1191e423d5c53e4b710d97d54a461b50')


# vim:set sw=2 et:
