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
pkgver=115.0.3
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org, Extended Support Release"
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://www.mozilla.org/en-US/firefox/enterprise/"
depends=(gtk3 libxt mime-types dbus-glib ffmpeg nss ttf-font libpulse)
makedepends=(unzip zip diffutils yasm mesa imake inetutils xorg-server-xvfb
             autoconf2.13 rust clang llvm jack nodejs cbindgen nasm
             python lld dump_syms
             wasi-compiler-rt wasi-libc wasi-libc++ wasi-libc++abi)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English'
            'xdg-desktop-portal: Screensharing with Wayland')
options=(!emptydirs !makeflags !strip !lto !debug)
source=(https://archive.mozilla.org/pub/firefox/releases/${pkgver}esr/source/firefox-${pkgver}esr.source.tar.xz{,.asc}
        $pkgname.desktop identity-icons-brand.svg)
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353') # Mozilla Software Releases <release@mozilla.com>

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

  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_ENABLE_FULL_SYMBOLS=1
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip

  export MOZ_BUILD_DATE=$(head -1 sourcestamp.txt)
  export RUSTFLAGS="-C debuginfo=1"

  # LTO needs more open files
  ulimit -n 4096

  # Do 3-tier PGO
  echo "Building instrumented browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END
  ./mach build

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
  ./mach clobber

  echo "Building optimized browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
  ./mach build

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

  export SOCORRO_SYMBOL_UPLOAD_TOKEN_FILE="$startdir/.crash-stats-api.token"
  if [[ -f $SOCORRO_SYMBOL_UPLOAD_TOKEN_FILE ]]; then
    make -C obj uploadsymbols
  else
    cp -fvt "$startdir" obj/dist/*crashreporter-symbols-full.tar.zst
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

sha512sums=('416ee56bd4a602c543391faaa8de31808f267ef2167f7d913195de45d3628de08d0582dbaa8905c847e1431bccd9d1d5d73ad9e7e5ea75be39e4d908a8b40376'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            'a3f2440af040e861bd249c18acf7d751f18b1d07b7136059c8909839bb05a3b8598db9c7fbb4ea226d66e31202d097735ec577439ebc714d6a8d83a6017d7be1'
            '22ee45b40393e062182817eb981795c20fb7c2dfa755cdd29e65789cc8b7dd34042160ddb53cc7a7da41c0d1f268db4e163cf17a26d26d61a38fc126c6dce663'
            '4fb02d7249ddd26b2b68c8a4407c008993f1992e0485c8406958fe946e0615197d2c03291c168896f3dca6c69a4df65ea08c2cd33daaf51612537936bc610124'
            '1fc471381a689deda72cefef9ec05d553b10654333770cb07c17c05951bc6b3a439a6034f4f7df761f307e11f93f8f1256e7d19c90ab91d41ba09bfa1e28ee25'
            '435a7908c03cc8d14506a326f1fe9add184eca38297636c7c1b6a9a75275878907c97e2899d91146e6397a385ea7d9f34bd2e482c8d1a0cbb03e675aeb4242c6'
            'e1f3c350a0bff7d535b8ad0163c877bc34aab44a3e908f315cbf372a5ca3ee07130c18226fdada91c0e66229f0602fa2e07a4891166adf43279f29d3eff6beca'
            'e015a8fd8b773f97b2b86776cd4987fb55c173f3166935592d787c6da6c341fa7c736f35418c0a0ee073ff8a8f4e6fa824d2116b39987d19524148d9ec42736e'
            'b53125a26f775767147792f4034b337aaf97431ee7b0687abcd3ad67b534c49ad2cbe374edeb996c8c9a1875526ebce6756c28855a92fdd2eb5fac7e64f8f901'
            'c3f36bd3106af4184f3cbe10625686d937084aaad7cb3558fbd2d04da01e964cb7b134f1919ec1d738988a0317d17b898967a8c96117a9a91863bbfaa78038c8'
            'd6647abb4b2a94851292465bf9efd7b0669e8ebd35ea46e79062f89b625ec2033b7f4b2bf66bb23cf9f438419b415d5387b2f194b7b041fbfef017cafc34b748'
            'a198c4d9afdf09ff22f0f631c0c7d8172c71f784a424032c44652f9cf182966391633c66ca85d975e9a10ce6f2b473d8a04002db3c01cc6c423dd0a740723464'
            '6551657e9850638bfbdf285d4dad01e42c20421dab8fca05c11db9de3b16422962348f4cff264a1252997486eb08a26b654dbe373dd9ffc57f979435c162dd9e'
            'a44a36ba59bb7eedf191126bdc59b10cd3f4bb461e7c47dc20a1b40021fe63229809b7a531ff01197ccab2b26ad3cb84070e4a95caf6088903bb4c4f2f24e855'
            '00cf06c33e5dce536d28cfdfdf5b1d8a1d20a701bfae7651225b9d8eeba4ce8557ea3c171202e5b4c02b0b2f77e71e955e54de3c6d27920e68ea2566d4afb395'
            '5a06392afaa07221587d4865dca736e269486e3428c28b3040f05397abba0eb4184fab3164d28849351047c9b17a379358804c675057e3920afe9f717634dea3'
            '0340bdf23f95470541a9f5f9d4458a6a6f06763ac0d98f7e3af3d648ba570c976ca95956297af30c9de18973bc6d5f0f3f483881ee8ebf8dee2d294be8630fe3'
            '04456886f2f9a4770037305b1bca0652c692ff0f66428dadbe0068b4d5f0252eb19d736dbefb9e05b0ca24c3a7693378e05e930f65122d14dd74c3c517f12f97'
            'b4a6b271afeb49dff6cb16ed972d9e7602b7c0a035be6158e08f1f4cb7bdb7d63c7af7803707c646dc73a27d562c857d44e9ef7158842310e6fc41122c1baa93'
            '7630fca5fb534c553ce7e3b8d3801c8ebef657ed4ef5b937014930b5532c27939315e4da814d316a61316c033119842fb7d5d71648e2d7fd63609d0df54390e2'
            'a1172bf03826650ef76a0a994a9887eff0d950e2375f7756d7144112dfeb4d1832902ce40e1d8832a038fce968fbba622aee0596d1752a7d8afc29fe1195368d'
            'a71912db8f7fd6d84963a3b4e61a6d4b4a5f5f7de1e3d6384843aa465bf8dc8751624bfec5df34cc7577b2ec98335264e098757a7059ca4464f7094c8253f73c'
            'dc719fe3f05cd08a1dae37740ac0fe895356a5ebe401253d731e13067bb09506680b4ede9b935287fb228c6857a00ca9d5c5597df64a3e78dea11803b3020cd3'
            '98bfe70d498b034d2c47b7936e81421081fdb6af7d5e8c72710ce806ff5b1c67e579b835df3775fa659bd5670de7577b3de47170e378ccaf0781ed89a368db90'
            '9a38faaa7e40abf36766020c5625d55add98deaace357c5e5e209b16a02d55e45d087bef3ff383625213f30f9790491e2f9d2ae44f694cab1d2d33ae7fcaab3b'
            '263f6f2366876867a7e9c548d92d84f6144cac31bc2cb99467c5f021499d7daad49828f634725b069461bb8e9d3effd2cd2790f2b0162f1d3d0e54150e44f1ff'
            '473c2eeeb5e2a2488ce8473b374be3663be4e2508d847fd1d2a7d9431075adb215a7d8fedfcbe64abc0137334b438e24334e967a70c4867ff7a900e6f806671f'
            'e8d1152978a654bd9ab223b313a8da87fcd3c2bc338c29d8415b07dafd2c6478af28149b9ee7a2e01b3fb0b7074fc66db663596d60446ebc983f2ab647a4765d'
            '39b4bfe48c55ecc09b3ad059a5be7eceb0d78011717704d6d515202c9da3c52b5691a6c4cb9e5043b9f00ecd291fe573e8025210f47f75fd504e8108bdca61f7'
            'b14b703dc60925511c70e5021529af9fa4ab678a84de6dc308ea4573461a9e70080950e9e4699b3d0cf326a2fe2489249b261b4c9cf6f675b38c619cfacaaa31'
            '700402a498b5d372782438536d4255f7ca2f62efabd9f3a21f29ebe93c23bd49972026243491e20ea1f0ea53588c71738d57babe9b2ea686473c2f03ca51d6ac'
            '00644309bc18cd27cb66e431d47bf944fe63767125c2fd877ddb807fc0d832f4ae76c2104355dc6a042051f0f6f42f31843a73e23ce2f94bcf94b6d97dd4b521'
            'd455e3bd40eae72249167474db27b933e6061d531312d1e619a1f468d6394bb1440cb5ce50e297fa2b1fbacfdc6d266f9797c140f84a3a69c7a0e985314fb64c'
            'c9afc1ef0d10623a32d706dd81d131d24f5459766e75ad5018b742a56a8bc30f343ddfdd2e477792a923378aedbd8720a2adb4b9e50fa932ad2e33273fd386bd'
            'f6f62b411d5d51dfac8b032aacd4904039df32d4e62b4b2230d3025505bfa606fab18740ff9046052d8a8d4424e6a77ab8557df5a9ad47b6b1303bb82698d9bf'
            '277581c4a54585f8d500e7db5dcd9e1cab425216fc9d60b8d321604cb583d917112146e2bbffd249c65f75683c7e811922266bef6bad59ffc7c4e28b86406b8d'
            'f82869948de039ceb86f036cfb715cb3ec651adf7ed007155e2385e8f359842992d445e7df1ef8dc96cdfe97792837e8b4b9d4525b3a7bea24bd705802a65c38'
            'baaff3c44f8a62649219b302618a7cbc36de265d2585c7e9ca44696eb48ef437240c2064a0201fa42b81a59e205416ac11c3633498d2c3b4ebe43abd7cdd7211'
            '372911c9b7679f2feb2bd7bc7df6c4c61a32aa0f7bd0f149db6feba3cdef038f8048337fbd2cb0b336c4b4e671d760865ac90a365c0bf3c3bb0ace7d488d4a78'
            '089473a84c5138dc270326cebb5c71996c99a346eeb1134d2cad73bf1d97a5ba7ed223256d8d1a178eb69c15fcf9766ad9a5ec0461169e15e9d95a42db063972'
            '1adad789a7d43703b42e8224b4b87c4bb1a40d07f70673ad26d2224c41c03ba598019851a7a254b67ad53a3d7ef8da9d1be84eee9523a4df55225790092f5a92'
            '4c24da2a0f236d1da80da65d03b96928899bfb7639c679f747697457a19d8c66b84ce640293f4c56d467e8dc1ff712692f795d47f99903f89af64e91df8f58be'
            '870b44b58c3e4f81ecec36603fc02f81c66e6b655473d4b293885c33509c65acc287464fa9da19eb005eff68fc5a8e864012ee584fa6767524bdee9aa38752ea'
            '9295fc145b43ddc610deae5b5a573e6e320b98e9ee4e7a61b5be2f27a4c316ab5a534ba450c7d47d8d4e60b1079f0f3ed4997e1fb44be7251c84f165a5d3b927'
            'e8e3cffcd46a576c6ef7686cc3d92a53b39c4534ece4ecb53e0b8d340cc4e61c6e4dab2a1a100fb4367441b62d761fcef85bb4c5521c0658dc0918b519b61158'
            '1a5792870e9566afcd7035d39b19cf542dfa390a847a89777ff2c1a77c9f90a1579886b32aa1489ad1a6e5fb345bf6d059c937e40cc2a0cda79408f1e9448360'
            'ad94a0a3dfa59673df1036cace122baf3586efb17a291ac3c586a8d1534dfb7856ae610b4a4b314c8392feb368d8f62b48b7ce7c12f555ff5f69a98cd60e755b'
            'd69d1a68b89834f599157a3de0e4b5fd46a968fd0568a20ba8278cebecb0ccdaed8f90a73920421d0894962a2d3eb3f04d0306d0ef997d3fcac81a18b1e2830c'
            '0717b4e1b4655b8f38dc5d9dc7df2bdf57624f8a76607cc2739f6940da87f846af633c4f6bbac4bdb0d329ace982e6e5bb3725abfd50ad3295cb71652f0e3c44'
            'c285fc9a51aebb438ac4a889f8fc94181c86973704bc1b385a9182fba9b241815bcc64472f4d08925c09d25553447d14ce2d25627b0f01adf6ef4a5f13d60e90'
            '53ed310502c09e6df19dcef0b663a269409049eb5a83fd138f5ac0fca184b7ee55167a7c8ce11f8dbda81e78a020549f4a86b16b8308adad728d19c316d6e4a8'
            'b3c3450833a4efc60096ffa086c144bfccfce073ff9e290ccf0431d344409ca560b5b6fbc8541adaf1571cbe8455cd5944e8a612b28ca3a94535bb4469d4bde2'
            'ac261dac98ac53ec5553f471700deb12661d764887c928eecdf5af9e9d8446e907be2402e166ddb2d0c2a1807f48a9a9ac61d1895939f68f06108d2e5f94bd37'
            '26ad8ea214370fa69396538dcb31751d24836531da7ecda12d04f1545882f4911c6657c496bb6b86788fe51cd4997a204575b16f802408fab8797c7f02aec36b'
            '16957a910bb05617a8d1a69b8f59016db907a8ed4621edde6e3dc08aa3bed85a1fcd4cbd1010b595aa2c9fb60d8ec7cff01521fa7a4c82e8f1db6c15b46b7e2e'
            'c4acf20334089a32ab94d705f1715f7858237fdb339d0b7ce6dd49f78e3d6baba510942c40f3862919ea4dea76f4b0bbe7cdae90d0a44202e1166241ea701249'
            '2249a6200ea0e62a06866c1ac7d448ce75baa157ee5039bfd9c21f036b9e1dc1d990d170b9633291cbda972ebd2a58d41f7b27dcd35db2972a900267d1557e7f'
            'cb53ece847a7193c32e609e30e16ed48b2f81113feafb56a0f5fcd5d42eebd41ae788d3f207aa8e8f93857143404c32e64adce22b999bde359c6851504b86ffa'
            '379c8fbd5e0b1d703974b9ff03f3df834a5c2dc5c660fe4964061714160bcfa4facbf374183ca913c4d485d6f710272c171f5c2c87728a0ac3ef9a400818421d'
            'f195b207b466910d7552235d882d1c005eda3606bab52a636f39adfa1101401eba7800b3b08edf2649d5cdd5081c635e8df336e5198fc08499178fd505fac6e9'
            'a212abf17bc2f5b7e0dc9664dbc4854c53657f60d525d8505147acae9fe416c945b74d2323727d65b434c69342bc786495be7ecb1006a852c6fd876081e47039'
            'bf0ee4deca48cac23d10d6598162cdff6ad95a98241fd99bb2ee5a8fecaba6a23536ba09e8bf23c3a06704f92f45eaa18d51745608572e3f122d78ace52aeef3'
            '43aec8d9b153658c005a69692edd41a9c13564b43e9e888be67ac3def1b25a1b8b9aaece14e98a276cea144522bfba6fa761804287582993e2be3096237c6219'
            '1a3693950abab6996758ba1e871419b235e7f95e4bca1f97dd69f9189e450807dbb8b1b0aafdd301b784b21e6fee7d8e8b03363e09847ff6c204da6cfe67291c'
            '2f44aca360cd4054d1f888350d703fedb2454ddf48e9b2a9716ada74c54cb166a950b97befaa01126687ef0182e030319a08c1f12cffb5f974b80ec37c1c0247'
            'c95814da3e4488482d34a8d7fe76bfffe232f68bea2549ad9e1365d949c8c580e5df926a2af271255b3beb0397f399b01bf4f0c64644ad0f11d372ed5d52bd25'
            '3b58bae543a29eef63335d7e174e9263f2e92b33ffe44dd7ad6b59a47ffc90ec74a86eea2cea3c19a1c7545cc42fb46d1982882c275af14f9ed11ecd480163ab'
            'f82e945a052fb91bdfa94aa180cfd6bfa8b72c13751e07ca36e841c28bb52e151ba7640df715d3727d547ce6a74e019cc072c341ac70811cf49779e2d15e61d9'
            'b79fd38da6f67f776e4fe24a5c0a6bfc81a7d2a45940f725c26ca2ded8e2280298d13944e87e18791d3a0dcad979e7bc6d1d8fcaa431b4fba944f966ecc47c33'
            '77697a3c82913d287c992f0f784e971cef3255cc9a5d3021f5f70150e43cc7f046f0d8bae95f89157eb2965c3a10f4b7ee4a5d5b5d245a59a56c63d73f534b1d'
            '3600d3b44eadb96e6d8c1c5957fc1d86ed1a4e53718bd0add66e9919365a2f6985c7d7366acbc27c01498fcac40b18bd2e9e00195f560b4677a369dded9f9d1b'
            '8c79accca84e2eb9d6f9fcf8cceae8397c69c474a937c70b4d1129b60415115fc1ed679e0eac6e1fa698c90964634d17a3f0fea531d1d620893e60fc503dc3ab'
            '904dc178ad0928d7071a7d8304b1cd10c5f8eca6e08dd80c8acf9f2db11e6bf7fe7942365b22555f87ca0e8610a4133865bf72589ad3d4089d4eb7d4184d24eb'
            '76283dd0d4be75572a6d5896050b756dd8370a7c5eb96b5167181f3ddd3a6cc875a3932e9ddd563b1d5dc76d0e11a9099fc96031fcefe8857121bb35335192b6'
            'a1ffe7f7fec828fa4a5d0251888113d9118cab0fe73cafaa2c3645c20257f6981200bfcfa978b6ab971845ca5a56aec49d41094e066cc23efae56e1a8e835ade'
            '0b3be4f049777b7698967bbca15be29fe656bcaf0be6db5d9dfb1b9eeaf9ffd5805496e330db0ee679fed35cab27fb203d5dd78c087a1ad430b64bc4bd80f933'
            '8ab1da1e74439d571a48af6fcd74a0afcf97dd2c564b11f62579ebf4af4d3b7db25bc61acc5fb933fabd00dcd2c28aede7b1753adaf90508ff1199984fa51cf4'
            'a07832349c6547877a7b16649732e514e8a2f028ad24769e4c5b6d492a7968819cf1f29b81fcb8f7ae102d814107179ae6d61cc1224c859f0a0b509fac97315f'
            '17f424b0dffe5c1c779f8bd6cca0a8fe4102f0ef26c69c79e0e9ddfc4391cfd09f8f2b2af837b2acebd90e72afd866d4ce282df6e5175ad5c69bc9e26f54198f'
            'e0a66889a5f4efb339f14e7711e4ae7199a6d74e7de0fcf3d5e44dd489b262c0a0b370261eac9cffb9083f492344feb939c453ea322ab26ee5147a94f39dc8bf'
            '0187d49e227161acd240aa2c7f23159364c8b812d155ee92e30feb667b7ee3644110b930946d096de0ca1b7352eec723739817e10dd0993b14cb7dca2f787d23'
            'e6675b4f6b2f038e3b7f6d33de4cce4500294f19a58ef938d819da60e95bf1568f761c2a4d929443e9f501bd38ecd066f6f2a557141859ad104602cbb752b006'
            '371d50b1b3882a35c167d86337e816a6a10958bc035fa9448e98dbfaa6250e9990d5b1de95d34524b9f4551c28f2574278e25e37494c26d913835aff870f0901'
            '0f358a112bf5af84485e1dfcf66fc054219663dfcec5a049f58926d167585aebf00370e6e33b44213f1e801bb75032fa393a6b1d5dd1df362633b4acbf68b845'
            '56674f5bb21c52f2f90d5e6bcdba97b77f1eb82aaa0e24060d34f6d0d6fbfbfe5d9afbb92ebe01a868917a1c192c8eb019927f9f92fe8f6226ee90b242c360ec'
            '26715832c5ea164fe94738765c453c9f0f8642d8d94ef55d80a6a7f985e63d629b70b69ecc4c145d558ea52416572e7adbd55079ad8ae08c9c253978b662bc9d'
            '85c8fa33fb1baa2552158ecfe10ebfd3294d7f9fa854e213040675ae553f7b5a96861e75bc6e0e9290f7a7a19ecabcf48a80f3913fb8c05942456272c6270c1c'
            '07b46258d18a262772519793b47d936782744ea70bf13bebb8ada086f1e854a7781471977c90421676b6e4d933fafde594fb9617082208b6a436dc0edb67b8b7'
            'ac1c1357370b6d7eb10b70d631497b37c1902d41419bb2990b5a54692fe0a20122e2f99e7d60a7a7ebd4ee50c3ec65ad22c6b3e6d48b86b6b46a6e30cdd53409'
            '15554498bd87b3eb64365776d85bac22b3c45d4d6633cdac2442fb96ca9aa12e5fdf0ed2b024c659ec75b3091100d5bd3f96d6168b8895e2447c37d3b708c5fa'
            '698b990ef2f9e6eb55406b227d63197bc18c484cfe30f0425e2838f1790aca73b5956887352edd8ee234d04b6cf7a96089b265b964ea642da50deb37fbe26722'
            '55ba09d9d1e56b0497ac3552b0008145fd7ea3a57ca77e1c486e5998d4bef6716f2518f8323014af9a4d657f702e9ca8bdcfa42a74b76efbd04f75a2afd91448'
            'b78e09ce8a01d77bd24db75f1c2856cc187fe3f72f406b024992fd06b34ab7c6db2b85598ef52ae644aab36a1dd9584e2c9324436fef7e4ea20d7f776aff6f5e'
            'a804c7ca18f8f519fd3b03e1bccff5537a9c1a6a86ccec04f23b66bf717d05997edf12244e18da0415aa4d376a06ba42e1cab9a86527eebd2130b4d93ef0c595'
            'a071943c409de6fa5d9b7ac4cac3e0a17ae34c37b48b36fbf402e85f67ab2b27a8ff3ad88448c312bfc62cd00718796ba103c278b8facd4729ac473f0fc3a507'
            'cbc2e7e1d7f4a18fbc3086f4a608913bbd279baa54bda989c2979ee38847abc69796fcdc05dde3e4271d511fea6cf4d33be22defe7c1dd11106abc64a7d969f9'
            '2ea8c0c53df5d8510d0c394a033b071939d35af13420cdb3ff77d1979f05ceb3236a8fd0e6f4e8000a21617e48e71c56fbff212d193d075984df61f300618a40')


# vim:set sw=2 et:
