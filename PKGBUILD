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
pkgver=115.9.1
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

sha512sums=('9ccaede2fcda13a07f98a2110bb8f99c7324601d66bff311f3070a669576a1598fe1d7de2d005d725d1f44dbe3934a9c0fd0b7950f60686047d4ce8d9d812310'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            'b5b73c34355a29846ff6278bdd7b3b71df28310a474ab71c08db7947d5a558b2a09a8abbfdbbe19c83db4777e454d81b73c66811488e5d04e1545da13fbd35a7'
            '8f3b0c9166f663a8342a7208c8b797b90359cb6b52024e1c145e0c42d7ff649a9dc2a8e6540ceb4079e98ee677590d75cf9c4515285d98841116b68bf5a2831b'
            '6e2b9647bf63fc07ac6f12cfdd1b928bfc401c968ac440f3ecbb76eafe2f91b0e48134ecefb0cde4f0473e896562ce93ba0eb90f88a8c02eb4fb72520c2ce02a'
            '344cf25d4217b1bbe56f06af70dbbc82c3227d8d01017d33fbe31eb19c2d86bc15939099941a83a6b03da3f2d33ad272cd5b5b333bf2363ceca1ef32fe58ce2b'
            '20dd0bc191a19b168e911e9d5592a0136eb95dfeb5e40744596b1fc05f6586301dcc3557b8bf29c27be7f6aaad543156f2294feb4cddc99347ce6fa33b7c24b4'
            'ea34d899a66109731838c833611541c1d83481b769f600b203ebebdf97081afb312fcaaf16e2efdd9a88edc2e22c597560d96b4be37e4a9e321c802d43c1309b'
            '638e2c8a697fd0313d167dca026257b3e70a75818f00e3f5197feebffe1c4ded17e261905193b95e991b46413d0110fbcc49c5fc538b78bf669a781f17626eeb'
            '79579ffcdfb8ce03b6948e8974a375381bbb73e43ac6fc04dffa93415b00d00071e236937bbef0093a483ed5483dcb2cfc1f4e69cdcf9cc53caa6a3138e62a64'
            'f3c54ab0b37ede0d0e996134dea4fef5035caaa554ef6e2e6e1ed909222780c6401c2d1e1a3ab635f805a1d237aee2b60ae6a52d3b9032f9121c7e35917f18cf'
            'af7253d9b687fdc5f05090dd96abeb104261dfe9130ad5ad03d7b1d0ce15b5a08abe9a33abbaed7c9cb16f57a019cca9d083e65aafe5e58a546d6a1c49fe7063'
            'a8c47fb87e347d2d5a3dce7fb762ecd158de70b9f05305d96b9149984d9b90b26b9fd19c9fdb8253fdeadb4893a6a6829be42197bcbba8617310f328609d70ae'
            'cc066186702a7ae7f62bebb2454202330aa5efc96038ec6dd2d4c1ba52934bc06574dd7b955029e40aaccfd8c1db50e549dc89466690d5abab97efb56d8002c4'
            'e55fa05b54aad2e9f1b8b1e843c8c4dccfc718d100eb2a151193624c0f4614649aa1f92543a7201e11a569bd588c19be4b4a138e519f2ff2fe2d771058e933fd'
            'ea5eb3af74dcae5e9519ad106fcd439819563817f061b51c19ea464208519bed92dcd03ba63a3008b9a1df0076585cc29dfd1d381748e35687f2def71be89a76'
            '5ab124adced31b637c221c9a7f1e646e8040fc95d2ffefd0e11fc649620189468f61cba134ed14ec935269a3dd4aed55f269055179972719398fa0170cd7572c'
            '2b11ad2c240325ec60f7123473fdfef81947e4048ac3c97720d90857079667c27b3bc001d733c3c603b8cdd237b8f8ea8252644dec282733207d2a07c688c338'
            '44f83faeffad1f60f472180f4de8b909ca4643b9bc8b76e3c159ac7ae6639f5b93f99fa991d06a108d937a296d0d379ff37d842fc4f6e37e3f045fbbfed9759c'
            '7150f5b0d2a993ff17c29a9fd0e1bfa8057482457c4c10a7d49e5418b28a87e895a310366e6eb669a5b392fda5f3409e04217436b6ae7a71b6b2f76ab8327c09'
            '9b24411fc63b5e9501a61fe26022f38dd33a721359053eea2ef653d866db06c454c17c2e66da0a26506b4db63e66b0917c1f1d140e5952a3c77073758ea97de6'
            '8e9b50970e8464d18329234e268e19d3691960b821a3cdbdb757f1e1d8986f56b6d16565381bc6ff8c5028a1e200a868f05cc4b0099fe47c55707278884fd5f5'
            'd8e367167c60b6cb1c36e55bfda8373a2a0c8d10c64f65063b8b0b88893f4ca78d06a5a2fdf3351336c6657527dc989b70145c6cf0a6d20f558bbeaff08c98a0'
            '9919b4f5d46f6f4e696df39d99d456a489bad2964ece66f7ec09b6bf91419c18d2b8ecc12304c0dffdd6d72fb5526521025f41d7f921cafde829ebc26a7ce47b'
            '06716e27559c065c7c26d0a9d62c41592749ad6ba93a495532fc7852f07a55b87bd3c8039f324d34f658c37e06a55562e761e59ace85f783b3c8d65f405ae417'
            '49a731e801008139089ba053cb2635bafe22826fcb6dcb4655a4848889d09113646d361a4bd07e07e89d0ef65ec0dfef130ae7f171172e3ec62558e67291603d'
            '5bda67d2ddb392cad85efc96ec6d3aaf6b9632e0a8b47e475e84419116bed2392f8513383b2eab24d6675fc3b4fbce742c8ea442a5f8c849dbf1011b9e176699'
            'e40c5bc89e8efdff470ffd73acba673def11d219f3ad85b9d47c91b471c4c2ea4102bb979836f1bcd6c611aaf0a0ffe6d66f65aed94490f76c91b364c31667c1'
            'ea30d92deeac378fb0c287304a2c5beae40290f9e0b3afb5da5fe5187a9f4064be7704bc817b1f8c7625c54ee5ef5a794f95951abbac34a54ae6e00b09b4eb12'
            '5d6038b5b931136476ce5a8a192e321d284331fe859e0303ef09b93a00c625ee9abcf8d62542d1d6285c2e3eb4a357085ecee50f83501cf38d870449b2071c3e'
            '6be042890b5627e6d97d18bec888f380532d47578bf01e0c489279caf589abcf2b3804a8f51df2a6f6e6f523298842ec8369d6fc96d7a7460d09e5f4c4dba2a4'
            '7e27b4fd95a463cf51c50f705154a84598742db3f9af08b2cec5735cdd7c47307b7bbe1146eaf06423c007352726568c7ff9d4671e265826cd66062aa77c2cfe'
            '9381279cf31e4dea7a1694cc090041129abf3f1db804b2f37884e4c3fcfca2920c6fe3c325758299c674b7a52b6968d501878f5cc0b4109f854dd9b65421c571'
            'dd75c3433f50e7422a346cb9dbd9cebb7fe60244a60725814ba7c52d2c8c2bdac303af9cd54a7ed7181abfdd99af74c80c04249f7c7a2d0940d8529396590ba5'
            '902188f6793cc2d69faff81f6ae4509873fff5d6f75d727de7f3de18c50e151fafa5152d719f4abb0d432f8f4963c331d8c6c055bf74a28a5d4894b416f53d1a'
            '4999e722353991613cdfbf18c88415b2939a80f501e1feda5ff70950443933245667bc15b99a987937ed9d4611d3c4a6ee063e053c80556e04431f9e1851a4a7'
            'cd62da432c163d66f05c1009fdc4b750d62967e588bc208c43e4a560679d301623b46eff3800b29ed5be95558884910c2427724aec313ac3c1d0fe7f738af226'
            '8f054372293c564b0bba96c8e471eaadfe73f002b20362ca203b30b93dc4efe67f734b4ee4f69ba9f3a1a550a55b49f82778e0029d56d8e6b78d3d1a1f4553a2'
            '0000914b086840f707fa5a18b9c907373e9ad50efa85869d849f2865aa697da9a9b05608d24e003fa6ab6091d90fd772cf0683c6012ec207959e5de2dab7f376'
            '20b6458fdd5c7dbc4d31c08351ecd578ac60926a2c3f6fa5b081f47d5f8bcb620a21c6f8a99427c8adfcd8db94c98898c13af5ada8f7cdd2d3d739179356b935'
            '3759eb3d5603e6f626330e623b06dbcf429f922df8a8114d0e35d8f1507c4ea2ba70062c776a41c8fb60d8da7fec691618ae654167328db41e7b961581151a86'
            '27c4983de51b43a247f95cf0824fcef242f9008e65c8aae0df8883ca3918f3cb928163a744f137ae27a81fca270e9ad563a996c6e743e96071cd1158d8508419'
            '9ab4da7b76f4ff89edd1c9daf74362ad3d99427f7928f663002f86583a527945ab77bf2df2f492585a5eb3103607fc8948780e24f583856f793dad2fc3f649ef'
            '1a2be6602eec4c6802d223257ece1110643f0ee6d3ee5bccd89ec9f814174e15aa18f71e80627d4f00ea7c96a931354cbe5a5a084faf628596fdabbf61dce988'
            'f5e6c124937f17690f70a2735cd1ab588cf4308495e980bb9e099a06105fc458abfe844e708f045ebb4babc02e8cccbac96a5c5b0820432afd433f92aa254059'
            'ce7a30486846a041f56a5d3c29ae19843541fef03b6f2f4db66dd2a97ee9962982c7617ca97e81c9c5fdff18f4ac671b328c2a109e92f99d17197e5216e7e341'
            'dd190d68f9ddd2e5768658813e2ed27d27e5c827fd1a04ba97a3aac5d68c306194f8e8a1333e2b86443e1b1fcad1235a24376d966e07a4463a3aa8f74bb372ef'
            'b2593ae44213021b8fcc7ee16881f35bae67b216c71a7fc8da461bd20757741a020cc4a4e46efdb3527ea93188d1e6667522f8d3cdeeee836d81be792e18868e'
            '11a83d5945c24fe1e38c397939de2331934ba37f71169318f0a79fab9f0e2b5b302c8bfec7e9d77a0733cbda0524ed412760d588d304341bdd9f5e3f4ff5c932'
            '6db1c445f57541dd3696583d33cfb91b235f93bde47374b85d5417ef721efc0fb6e757d08a5165aca90207c0158aab1319fc7e5445bdd3ea0b60735950b9c166'
            '54bf217e9fdae93130a39bd3e56ce05df80aca734a0ed158b877e34661b777497b8011924f999a21d1e3bb2b7a8b914c1345ef45873d995a4d6302f209d1f89e'
            'c9c817a6f0039a06d3cf113769a70beb8fd5f3ceb659ab4f9809beff68ce5199152316ab30e7ea47d45cb13320da946d06e13fdc25605984ab802cb81e1e232b'
            '473a0ad6c806f4471edd110af81dd831d07558987151f01a0ba61b728d8ca1da50bff82444e656d49a74835e480ef8ab8ddd411e634b09e1df74389f71e7d728'
            'a53dc0b51769377326c6adc48d831c96e69ada214a8c7757ab19e10d1e5b9dff155394ca2d4e09855553b14c615b0c780d227379c392b4377e1a506b739a6c1e'
            '4280c7e46754cb52cd43edbd4ad99b93d3571162445376b2ae40da0e5c61ce973527dc3d9c9cf448d6abfb65f9572eff8eedeeb6b054ba56a3887e7139714427'
            '88dba31e9b97a0a08b25eb23dabeff03461ad7370b4c1e03ab9164e75563ab1ef56b441be2393e93dba1aa8def83606ec02df348deac522752419943cdc13653'
            '3592bd27185da919b7058c4610bf52d96bea27df0b834df47a14780929757dd06b57d5722b5275b51ad94873ce1d7e509b76e0057dd836b712cf2a5aef2de16d'
            '7a2b1330a3b2a2341b66472404630bd785c8f0cb7f2efebe0c79a46d1f9ef7b3a7374e3e2daab03f41ddf74b30cd2fe0836afd2bd21a118f7466878577f1f0e2'
            '6643055511d3c447423d112784dd882ec1ce95c1c5dee332aec14059b3653280f75cf4c44ce8c02b351ca284d8ab8562134e006c7233b1b1edc13376f4df69ee'
            'b73d979a71bd165c6682481112ec6527ed55790c800a62bba680b11ebfaad2bcc88beb4e236a2d76c019216261d384d4ddcf5e90021979f0025aa76c176ece14'
            '8d6e8b5f1187de2d757d3731e59dbab6fd2508b683ff56e54bb649ecfb8ee7f49259d099ba0caf61e47cd4c0efb4a6b2d45d2051b07530d339bd44f1084cef6f'
            '6658ada6661c08fa866f84d21b5e7fce3458f73e1852e3ed4a3fb3c2df2ce5f6a851631b4012608b8e96e80c2e4cf011640a198bfacdf20a95ae258e3ae889a5'
            '1d3afa83c66cdc21452af795acd2b939cf01c618e9f546568dbe23b46b6d12d2efb13391a2d345dbe5ebc21873ff4761261076d33c6cb403db55f5c0a12a0f58'
            '2881464e5ed8162c85437f694ec34d24cc5f71050e8bdfcee015a67baf0fd6b021834bdda7431ee5b70abac83483c4abdc3035e3a37e1efa62de6a3603fe42ca'
            'cb125cb4d1fb50aca7d74a021324d7cd7af58d208c697035d818b37957759e7aa4e8d51ea5a0ec6d97db5a79f79a8bc7a63ba9e68caa38c1bdff715fd51024b5'
            '496f72274cfd75f0397286b05b72a3494e7adcdbc8ab1a25825d10423b72bc4390b39397e23c284835768bf1027def66721f1f2990c3819cc4de92e815400457'
            'ea0b3b5049b99fbb6ab55496aac3e763ea437457f86a7adad733624f32e358d15cd3eac2544b66505febfabe6803407652e1755e81b7240ec89a1f054567109b'
            '8f9a790bb7542501eaa4803cb096e99f18fa4d8da9924568e8c222dda1ca9066393f8c6ff2fdc1a15418adfc79a275f4699216624514135b9a54bd63c2561f80'
            'dc054927be9f8c06fd0068585e86116b72b962e2a6968c8560c46dff07ce5cbd04d7e9e19ed9b5303aac2e3d3a638f6cb82262ef7aafba66cbf27b9d9321da28'
            '08c0e52833a3dbd216fb1eb8c75b8b7f11ccfc056d7fdbd0143c910fcab25d58369d409df310e56e46cb849a57e9e7adde49e5956ba346067997d153445b8e89'
            '5aca8e603932691e972e962eabec7e02dd37465b1dbaa1b9e6298a06d51384b4ffcb7a800356501b419c3382cb29a809f59c7920bd93c2e6e5785d73e5d27739'
            '774e2460dfb8f95e2e9aa91f00647ea13403be5e936cbb102d77e23aeef3f153b5f5911edf825b2b0d9658e62500d8aef3b3c328720c7fd82cce29e2806c245f'
            'b6c75cce3207c0ccdd43a8235dd3f0d974d84ef094a9e876c373a9ea5ee4d8d95707770f6f76c0eb0bf049b0b262e7f0e52e9464e64bdca718af03fc46164362'
            'b12980e6d000d2da7ce5fcc4824bdb93e42aa32e9c9c45a45f303257be37b4a3b3f690f2715194fec60c129ff1b36a21ab0b2b14f2093b9e63254fe59a3bb9b5'
            '4e5c4907412ae981e23958b0e6ef70f449ade93acfe3f224115d96eacf73a2c15f35e9ae6e7634a4377ad61b7a551ec72f19080cb68f340779afd62ad561da11'
            '172897824011b1ba19fb9fa3ca8b0c0b81c5719d1239fea9d38effdfe83fb629eae783aee54b2c8605fde0f64d593c17e14702829ff4cada327c84db36bbc20d'
            '01c108d7327f8f4c1d91abb7c8b6a24058dedf1faa5e563950baa82a1441dedfc8dc625204485f0c70a92d5b89fccb2c18874b3308d8e85c9bb655615513bb78'
            'e4296e037d22dc1aad7428a15a666cb379d49bb0b70a11ae0aa781207b9042ec829658526ada9606450bda8c0de9c66754ba0c14284996d5f1340969dcebbcbb'
            '0bfff1c614c6b42beef6786e324b09671085496678e2aa9256a7c1756dd54f891414fb0ca50e286bfa785f47fccada295e65e6d7e8e95243dceea413d43e12a7'
            '6472e145354e272c55f38b27eccc1941f236a30e6bb4ba00861331f3ed523e26ff1e7d9e624788cc659c0fd79efbe933a627baa4cbf21e09b38ccdba07e000d6'
            '29c497da7b3e257afabdd0f3ae603cfb22278b28953c3047820a69cafe556e737aa1cac2a018c6e6420a47ea437b747b9ca8fe1a7db4ea92bf4fb36956bcd11d'
            'e138a6efe1418d5716c916965d33591f51bdaf300ed275ec3be645c5a4226a4d7d39f6af23198f0604d47cf8f50699be32d3d17c1037d9b63589491cf4e5da9f'
            '3b7ee840d0d3dd58682a2718f04c8c8b720c7929fb71e23f595f5cc758a01fa39832b3b98d3ccb2e99dc8096d8dbd6f463a1bd9cbab8aab924b5f6be469b1ecb'
            '6280f35b6fb70b80470ac689eb04e640286c34e1bdf2e7944c8df3d9c5f447099a6dc808c436085ed81684efc14109a1fd7b49f7b4ae38bf883e748cba6c5fd2'
            '5c2a17110321e1ed8f0d53efd4b76ae29a81a678a163cb2d8747e5eb13a08ef39d51ec9835488e293f49d2651f8fe4d8a733a46609cd42d362b2aa945d6a9fe7'
            'b15fdc750416ae9a3de5dadbd9a0148b82a37cc8168f8c9b585d5102fa7a148dd3ea65fb1a6b78d7dc31eff57b4c41718c8b8f5901409ff8d739c798a7688bdf'
            'c7171b5d895adb73dcb1f36d3a72473ff5c670707bc58468be93955657c625cfd761e2ec9fa3ccc834b804ccaeabd0a7a2c1ca3b69d883f6a209fc4fdc178f6c'
            'bff17ec2cf68d5adaddaf0919b071a59c94033cc1fa237663fbeb9d40a7e46a1bbf4eedb0f34afe0d5f8b12aec7b7fd28dca3421947822d7b057d43d352970c1'
            '4d04e092b6d846e514012348d19d71a9551599348a7f7cd06f01c9cbf980b2fe451fc2d05b04fc76cc0f4b69a8e827cce6b184cf5657e1cebb8f4694ed5c11f1'
            '0ea7aad7884b1a9e00e73e9fb128d6263e0d495d4954f5df630853cf20e3f90e2d59ab1f2d71da3acf0be3eee7985c22328e965cd7e1dbe9876fe1b53157de30'
            'c2f629760ef77e57d8149bfb5ee10555f33461637473b93dde58f859c1bd7d2aab4e6dacee0fc75cc621c9304418ddb00eca6f40b11014d864db1f7ef991ffce'
            'bc8dbf28cd134dbe68da3370524477621eeb5af70ff9938b2c396c12e4379fbd119198bf7c9140fe8301b6afcbd15c7a73674de722aa874270d8de30ddc2e9f0'
            '6f84a51318f973a3954b4655a2dfbd1c12e7cef91d69d623843e5a4037b3eb8ed841b56ac8551a07e1a6bd31cf2f6f87c20f2a1ff3ce117182116ed4dc3f1d89'
            '6fa8b20c6caa15513c53fc0890c8074ae5e4e313f2ca4c55f70dc3d0c6f72d55a9c1c6a8fcee793b7516b222676ebe67ab5c6865e760322411a490291978bed5'
            '94872f3b954fa99743bfc6f8c4814b75830a7e1eae7070b4f890d87ec77d64ee223417d45f17e3ea8def1bf08ca89b0a7f6a7e75e22c704e87ee82a8e38903c2'
            '6d3e09544361db0dc25810e15c5106f51ddc8cdf75749c0aa3d8661196944615240b1454a418328a667dfeb223be59978ab10030b672efaa02be9d48bee7ca26'
            'd49fff9b47d0f70efd499a51d7f77713e5229ac00b95711e653a0ee059df0df1983aac5b43f2716b267ed2efe64bef688d81583d8d22eeff98124845a3fcf387'
            '03ed70c173531b51243037fd6483e5d1cfc13c913922bf904089a7723143f62805ace58024bfcbc6cc3fe761c5dc7be75fda615f8f9274a9b8713b88891643b6')


# vim:set sw=2 et:
