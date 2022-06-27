# Maintainer : Luna Jernberg <droidbittin@gmail.com>
# Contributor: Jonathon Fernyhough <jonathon+m2x+dev>
# Contributor: Figue <ffigue@gmail.com>
# Contributor: Dct Mei <dctxmei@yandex.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgbase=firefox-esr
pkgname=(firefox-esr)
pkgver=91.11.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org, Extended Support Release"
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://www.mozilla.org/en-US/firefox/enterprise/"
depends=(gtk3 libxt mime-types dbus-glib ffmpeg4.4 nss ttf-font libpulse)
makedepends=(unzip zip diffutils yasm mesa imake inetutils xorg-server-xvfb
             autoconf2.13 rust clang llvm jack nodejs cbindgen nasm
             python-setuptools python-psutil python-zstandard lld dump_syms)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English'
            'xdg-desktop-portal: Screensharing with Wayland')
options=(!emptydirs !makeflags !strip !lto !debug)
source=(https://archive.mozilla.org/pub/firefox/releases/${pkgver}esr/source/firefox-${pkgver}esr.source.tar.xz{,.asc}
        0001-Use-remoting-name-for-GDK-application-names.patch
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
  mkdir mozbuild
  cd firefox-$pkgver

  echo "${noextract[@]}"

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1530052
  patch -Np1 -i ../0001-Use-remoting-name-for-GDK-application-names.patch

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
  export MACH_USE_SYSTEM_PYTHON=1

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

sha512sums=('bff3a399c03bd1cdaaec0b6963b1558aa35b6338b6c02042ffd65fec0aedd344d01718692e881332f5f352c32da15ba09a20a09ee072200b47ae840bc0585a96'
            'SKIP'
            '88509577b686c995144163538efdba3cfe1a3b01564d3823b9fb7972e64823d1d0a444372636f8d0b355c485f095df8f273a6eb5560fce4c41d4f1c0a0467f75'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '515e8424da6d1505480f15451c56363bf72471fa4d0e47b3e43b4cac261b088b82a85ad2f3234edfb8499beabf392e0636b227d0d7cc7285e544b1e2bdcdf395'
            '04bcc68b861a7c9b2e18fc4fdfde0247ff51879f04e8dba9c2998e0cd93ca156f8cf56fb63de63bcf92c56c92da9b7e0379ed0847d251faade20b9e1df968d60'
            '7f8f56d3334bbecb3be2f780a60304df06313a6d7dbd0fc3af2e6d5b0c93fe787c36f7a4e62364893f53a03815d7845006263b1000db56d817fed8be5903b3fd'
            'f78246c7931c362ee7f108f8fecb9d94e7207d3ee2f0e9fe5baff9c30df124fe18bc3dde0c0b833d84f596920d439e02296bcb9fa08ad3799865850780cb1ffc'
            '50bb5ecf79c176d5fc00df3050cad40304538a81bdcc2235add6e2660a2b9a6b9f93d3dd0ac99a608e9f4b3df9d51bc4bc1b02a50e1bc14fa661c18969b01ab9'
            'c317dca9fa0e24aa3af446c3da9411d4f93840240de94a7bc245db98aa054d22bddc2041d0c0b301917f7b70bd51ee9d9a89f9d55ffbee03f9cc1189ba7b6ad4'
            'afc488e043f396e0511c255a3f0996f8527c31ad196eadbb4be1edffb2e4d22744a018c096787700102c33ae1c19c1f3566efd2ef35ecf47b33ff63524aed2f7'
            '3ede8d95a0eb0859c0c815995e0e50e80004f31b4e349922b78110e300c7e3498e8f2aa72f77af768054cc5f64f49a3887317c3d1927293e59d0fddecbcc345d'
            '50a7bc3be88f3dcc44750708f594dc3c44928bba0abe86e35b6e7309cb417db0ed912ea28f83211f97cd2afc5b4e3e22d321dd0adeb266153cbdf73bebb74b78'
            '41d3893f1f7532c73e5d8cd0f80a0d34b5b6b767c6ec4e78ab0ee6ea8336ebaa69a13b75a14552712ace4cb4003a126b220ed91eae2968979715e7ffcaff7e1c'
            'd82bcddf20e0416b41491bc5e7a29202e7a58e658f6fa660476a2ccefad25798169ce6e06d1458ae9dc90658db2c5efd56a2fcad0e159df2bc516cc5317ed7df'
            '7e1b9278bf9a1f86eb862d389322bb238ee2a8036a2a4a8f07ebd6988b861d5fb32bcb609851efddd81a5b2775a84c676913dc3761cfa006df5246d3ee12aa20'
            '8ebf22eafe4671665b8c6b8732b75cd30a350efd8f0ca85ee89f313f25336b709d461afdbf25973f04506607576ec378947995d67fbd691172344600a5895aa9'
            '0e0a1c89d81ff0aab04a98cec8ef31f34b72c47168bc5f9fdd234f0c21c8bd15851780fab0c206bbe06ae43d2fcf1eca88f7287d7ab052d58ff3b20ca9621d7a'
            '23d0fffbf23af1609715cf3a9e231f187931b4ea3014b5b80b1332424249a08c3a332ccc0017c056557e3e5641b5ec1b0abd6cd093f2f8f18b14fea5f9db91cd'
            'ccaa6878572b39924f89b9be7ea3510e1e25f5dfce9358354bbf6d919ae94a1cc7d578520e64c27330ba84b37e8bd698155b7b674c5f4fb58fd000dc14a23d47'
            '7cbc81d9f0de2abcc7cd08bef75c00d29168e522a0b1d852a08482504fcf1fbabe3117e4d1d7e3fd8ab82795ce284a606336a6af619f00dfb9f025176bba375e'
            'fe6d45078fdd4c1517e52ee3b563c122cc6b1d96da9966866c81128fb7264bfec7720c184d053b2cb1eddaf21023867a9775c676a1c82f24fc93d0d271647c49'
            '13f2998add78e8f8ca5f5b3778a955f4666e8230778771691229c1dbd8750a58d9beea98cca548c7140d14363b9ccdf9e68f089914c80fc697915ec802aaa632'
            '94ed89e7690171919460c130fe053a31b54f12bb6da51fc47635a6c05f1de6310d99d44ab887b89de40fa12c82fad90b3c96723cb417b291ec82eacfc0154a2e'
            '35cbc1ceae75f2b01f25269bbc841b4df93e202fb19c9830bf8039ed10eb2decb085a759527e1c21a4e3d23d343cb34f008ed4971cd61ac8bf46c516a8568d08'
            '9673207f2461f6b7ea7dcafa6f4a417f57d6b8580e9bc0b23919c6ddcf249041d829120b18960fb5b07c0f0df8f86ddad966d4eb78c79084518fc21924cbb00f'
            '391ae5adba6628c194891c318f400fe1fc37fcb503eac985fa8853207e0349dcb477ce0f90a86843ef1fd01c9b7012d1f86900d689052db66543e809c3ebc4df'
            '84b718b91897384214b39080b99a7e6815ce14f0e29ebd96cb502a0316c26d638858a1ba92a05b01abda1880c7f1a222d6a660d9acbe5c481d8290984093cdf5'
            'f94e39945ea26d51d49201a74f7800d1dfc1ee5fc083e6bd42437bcf3aa668f2aa411fe4cce728dcae5c3a2bcd6999daf4ba59fab7cc4ba125c54c7e2e6b1f07'
            '18397fdb6dfce0d21484fc71bc21e808cb421380001d6ce867a66c2f74ea71f0417cf2a011ae7a64d74178a339238b5c910b64254178eb82598fdcd93e6d5c70'
            'c529726a40441e22c29764b4b662e828369b2427bd052e7071a02d38ada5d027b74f4eed8d646787c5f22141f9d06f0f689a4ae4fef15b5eddd071bc464e965b'
            'cdaa1660cdf67a446d94d48e116ba72a5e61d86b93a1dc4dbbbff37eaf941e82f9e85cb90e2004e891955f36389953473a2b69c5b4ff4083b528b1db02edcfc8'
            '9e1cf260b99004862d3eb17a48d20fbee87b82760f69ba09aaa216f3f8a73c81669f14e6572b7a60965d0502d20975cff5c928f5ddfa95a693be89a291b0d42b'
            'bac07c6892df6223c5641693f24d8c9822668db71e67acf44c259a52135e8f17eca83d97849e34ec24ffe0672ca4b6bb2984f5be6a3fdf5712d7ea1d8f14cfcc'
            '7dd6b0395c351eb02c8d8b8eb3cba577867f3f6f7590f431534caff26b156f5c416114cc6ab638346d901489a10c27016cf5c7333295de963b677f9c242ae315'
            '5c6279f646852e8657151ed1b61a14243f55b6a982a144914f9fe7914ea0ee21cc72e530bacda9e6bb708b0455c87083a9208b0d6bd5e7f4f2cce4a24f04dc31'
            'd9cd6dd573c5882bcc3f82b7b7e6b54aef04a47d958c354dfc9c04de7ace38f04859593dd885a3fecd4b5f81a155823259baf4af923feb31c76b73a4c644d6e5'
            '14a1617403cf5f7a0e146ef305a70065c5d202441430da2a2db8bb26207cab84a6e7bb87387847e0d9b403d9b2a797a8739f9fa695eec0c9cff648c1759e62e9'
            'acdc86ce0c20691a1df1eaea174bce75f2886b452064c6601f4f7e593eba0b88cf9c23a2e4bd29335b0a0fc62bfb874f4cc4c43928be85289739d2f361addcb5'
            '3eba640a3550d2695503f763975d1e38e83a1fa49f8576498f7e7259c798c4b034319fec1e55e705aba5a8649c9479b59901e32d4b4fbc8f731e111c32514ccd'
            '618c145c6a4f1a2432ef85e57269d91506a3ff5f2c2464632a18c1e16ffdc3de1b3c2323002e23e0197fb701b7408d4905ad1905043239e1bd88de2f5ddd05cb'
            '0d7e4d709b01a8d901f96c25fd5112287485f648fa141885421e2656a81e40b71f8737124390217ac19d902c22e60f1caa6f33ea3cdbe435208f19b43f4f91e7'
            '0ab44a6d6732f050855c5b3d7b9f6e5f92316951187030c95192d35e21762dc891ba68430a332c1d3ffe201609608af0849bfced01f4f9eb3b7aebc3459c2b37'
            'f3ea7d4263b1d418fb8bdc19d0b4fc8008d4e78ef26b94bb7d4d24f24b640f9410cb7345690cf3479ed7954b7e01c90ad0167598120dfba86be9783ecf994783'
            '54f56ca69c18c83013f604139b1e3f53c331bf76b9afa50688375059c7aa878327922ade5e6eaf2520859c4fd0f8adbb8fb636127ee7aff7a18366bb866796d3'
            'db0ccf781331eca6827b88fd8efb37aaea592944b7b2bee9560fd0d7e447ca32bb910a0c997ed61c5541578538b75499c57b66e25a19ca449b5e6c195614a1f6'
            'f2073b9bdfe910a6d14aa558e7cf7b8c1f61109938b8a95a31380f08c4618f0cebb2ca140f69321791965dcb979bd4aea2716f0a92d117f078e615ce77da2e24'
            '25dcebc9e7186f80f8e07370c6bebf505c9b6780c16a53dbde7d15dc734103ac57c3f182f5d1542ffdaaaa6d6f3c96860de81146c634ed68aa225a07cdc01302'
            '41eafd61c0f5ca3663aadcc6d57f1bb72e643c534f3256643fd086be957e94acee5932fbc10c83dab65bfed982e41098accb1ca80675dda887c9bb23e43c8eb8'
            '01ad37e48542738edf82d0703efb1527ad8d2e3d42bf10bc5cb139aab22a73caf4326a0c88ad1be488e1b4ccb5eb26686558794ac990c1d131523f9e75715424'
            '3b1a20391efa3776fcf0df2e32d77829fba037f11e61ab153d2aec93f1723c9a6d5aa48521d355f42d34f20fe19148976a5df421b1c1691d1d972cdc314b4b52'
            '9fb50a38be8fd894bb321799b8c33b142bf9cbb11e3cd0611860ef974c987acdd57b3da40701aca6f3d369c6d4f534dadf69d7e4ebc01c4c87d54bb3b6b7880b'
            'e7b36e8987d7b028284552bf34abecc039e83b46af3fb7c954471b228dabf843ee12a58d824f8d160fd74245899d07e2461e38a0949c8fa21635b93750fb2cf2'
            '62d97b3021072d8642e0d3eab1d32fd0473c2157a63e86796132d6cc7204c696cbeaa3fad49b909cb6a068045de86de253e41604b8cb037f5afb541b8c939301'
            'bf53cadd001689150ca8cbecb872cfc22c9fd026ed3463bb2595f2c3b9d6678a7682906108bc5972594dc43ee0953588094a65298da41ac3bae803a90ec920ac'
            '0b9da97e446a52fc1d0c37ea4025176a7c6ea1b53f76521277cfbdd1c419f2840f1f98bfbd333c0338592a02118b1eccb44a7a7716f3a8d1758207d6b15f24d8'
            'bfb0e863bd05fb0cab49c3cc7b0580fffae2f4192dd2cfb1852470f5e0de42577b97551919674350f2b3f86e539763a2d3458bbeb40a1852d866e5b26bbaa888'
            'f4977e143a4e4e8b91eb8db72ab1ac437871ced1282e4700657d75267d4559cf684afac320fcb1fccc8b5418f9e6523e08879958493bb4c969938a94af1c176a'
            '52f290d4049bce32ace64a33c032a806520b29e927fe8bf92d5fa226c5d21de0d298b00a26e05bba539bafa2d702af1dbeb732845c4565f75a17e43be195e3b0'
            '640b3a0fd1c9885ee28e32cdf7b71eea693d5e01e67e0910b3f49ff506b1593827d4cd98cac1481a17da30db374599114cf981bd10b88db8da3518ee6d1dc794'
            'a3118cd76cf0c2f97a9158ae8335249d042dde31093df57a1e0e417536cb9311510ee577ec2b125e117c52a6a1a3d05eb62b9de47dd37786e942ad590e71bb9b'
            '9c61d4f5964580c21e4a360492fabb0b6001b94d7f628d1cbc8a8e77912e5cfe0c3593bf1cf121e55196feee62f5a3b7e4acdd47fd7b12a51c2b2453e23b7dc5'
            '70f4e2cec39340962ac2cde1325eca7879298d1e5733bc92286c1e2092b5b17601b23cd8d649d5809d0f2bf5636cb4fa24dc3b8fe83fbe3a16948137435c6421'
            '3e391053552b3d208b798a3999b0926e3568ac5b71882adc3a964f10ef04e60b8ea8c664384d308eca6b0689ccd36da2eadb44ce5568b52a9dcff2f25dd76838'
            'b8423a90f92612c50895a492b5eaab6e6ce1d6666675ac689aae3cbf285643a0132379db95791a59528ded02a4bb5ebc1d2de44abb2c3e2403efb41f24b7ca87'
            '36e49f77b19e2b0cea243c3b9201a12bbfb5a63e82fb5cf926867a716bac44049b8fcfcacae73804d0cc3bbeda230e747608ca1c9c9115cf60ce6971e67ec929'
            '65a42bba4cefc64948ecd4f6aea86178a2d35d702bbd29f3e9a753aad6ee4c47387445af0bdc8e558a2059357e27f6ef30f3091a706166399d934ee1ff15be82'
            '279b174a930d9c3c7f945943f332371db0c648697c8b2b743f09199250094de15cc3ed4d183745d51ed3f07876a7fdfa2a3d83b4c5791757d944836f07047eaf'
            'f4fb3d391dc2a9ea1f5c0354114e35ee43c4bd8190d7ae1f0cdc78577d652341cf01a36034355f615e55d3a809aaf2851d778fad9b6bd26b7a9c48db3e0521a2'
            '8da433329c3fb2f590100483bb987a8720d41fb05435ecaf714f459686f4d198e541b0c344a313ee8d26be53d548c1caa484d7ad229a4b90f9cc51c0e8bb21ae'
            '5d65f100762e325176945e4f9a275b701ef98010d3d6132dba5395f0954fa723e9a4cf186462f30d9428d889eddb8a715baf070ea70f7fbd3ed76a6189bfc3f9'
            'e0706c7c77fb9801a023667aa5bacbec1a7351649661a5d7b2a0b260c207e5c5936313d4f192719c95e7983287368414b9a38dce16adeb92497f39911fd41e96'
            'a88269a2a10bcd354546d50b1631b98abce972f376737806b5260a4f4cb0f64a49cf9b8a2272b67aa665cf99b8e88c2bd22b3846a329fb3a53e3bcb5fd29cfd3'
            '5817f7343258cd5eefc7632ea363a6ff0c7cd9cebbc0c850a1f9cc822d4f5ab2b83a19ee8d811b1af612c7594deb3e8d2758badaa3a825f9c0f3f24be54b86f4'
            'd33b90d91ab89608e9f7111d726a6d32fe95831ae08306a677ad7f5de59eab99fd8f423a566fc17590b3b2576b29dcd33280751330298b3d3a2e2e3c24db1da1'
            '91eee64553be5f02bea2fa66e66d8279440b02224e2efe3c6b895e9144f89a7910a6067d6dd320386b927bbf90fe99942bec647e23b45adcef50be9942ee92a4'
            'a91531e4d35a0aa31c43a09333a02b2934f1a93ec6413c11e56f8cc0fbef9747baab39a962e4236f6d9b51b482a8704139951fc3c587e7a99e983fba540b9ca8'
            '77e8cc402eb53da695e39ac2e6dd3c5a3dc6d2179a1dec84575b1d36f2213e172726838861e5e9df897ca329e212b4ff749db95738ea536d25bcee8019504f0a'
            '71a31e811eeafd9856cc18ed963b7495261074d5e5ac7a2bb61c45a06caa83b6a8f20f9f566474ba2141116718a2e08ea6a6e7eaa89cb240191d7480105df4d3'
            'a473952a7fc3e9719a89c9743b7c49910721d668a955823a57d9994ecbceafa4e116ceb5e11cc1112f333e75acdca87f975cdddab8824e3848465041445a8582'
            'd684e72a8f461817f1d83ad42217a39609db6188c56fe6dc44ecfbd3c7a0d47ef53fa00f0f38c2a8aef134fcda1c2c62d23bc816d44a5c1b5bd45a0dddc597db'
            '64f083332955f8758c846074a43f7d00d90538dabe1e5d9afe9204d11c6376e4b1de33cde05e748bf21e60d40f79d6631eae8f397639baa726201a5793b0608f'
            '8a3de12cb9de03b6fdd682456c287e693a5ea8acc55295d823ecae081992e1e0a9bbd12b7aa7e6cf8680081984367500d854264cd0ff3ff24229dc8c1852b7f6'
            '5c98cf43ef7e2e883a7a6b47e65dcbaa384ba9b6584932277865f2f8843e28624a776c074d5142e39ec8c838c697a57776cd577e66b5f9e2374b889d00e5fb8e'
            '5560398fdf9410baea4c9af7bbf07db624023a0887baba251bda2bd6780d7691821317f21b2a1c212b06a6313ea2280015e7862f503b079e008635b3c6ea1a1a'
            'f5fc45276f3c3cb5919eadb0b2369c5871b63174d225c26342a9da0cbc277227766ddd8f50ef57065bc11445e018555d31180ce3b80c189d62aa4685e03588a7'
            '389f042bbf5261fbb43f59011ab7768036a4541c28e15c43910f9d1a828fc80487825cfd94b6cf62d8be2915f5c3d7caecf024842013b4a01e11f0fc7d2d0e2a'
            '908e425bb07e3c331ef5496da8f85508f16ef36dbc46af75b44c733491652403abca31751ee6a280e011ed434d96e830fd167108e5c29023e3c722ce6ee4c48f'
            '90d0ede40e7e2ded67b6683f36d2136424da6c139713477cbaede8c2d5c470fcc3cc9ee4d2543195f6582046037c54b130815b97e05b5544bbca47ee2f5bf290'
            'db880460face1ffd27b68a7a859d69cf95597842cd31a5d2f9bc6909311441ac861f42b9e1c4efe6f6fc4938d59a0b080015fc898573bd51ca4b4a1188afb01e'
            'a27b23c1386a5ba614865043fa72a447285078e188a30eae371212250c9b5b3615b996cdeeef25ce437530610e0725d544a4214a850d5934ecf349d5a9c000e2'
            '96695646f828780c188ce3f8aad0a1a73e9e324a4307baa79726b7135a20910a5717b88d1bc704efd68495b0513e5c0d519cc0fabb39effe61089d6a94eeac0f'
            '10f62a887df630adfb6d26f127000efbeb0d3b7183ad886c28c0e909a6d78bf8650d5ead384d31da2a3b96653f15413df500c2fc6fc8406b027bbd6dc8a4f82f'
            'de83b5ad00c2ef2efbbee0b0b0c0d56d55c979484d5b99ea273e4681dd3d3bc545dcaf86b14e9bc6fdfc85963ac79c58b596c498b94695ef408a2d2f096c9621'
            '6090f16f32b44abd6404b79ba75e7b14fe437424852d932a39fac26e289e632e600474b53e39918e373c58d899490d7c5faca423a268aa12457885e32394b5b1'
            '21299f37ce7fef7966a774eae94d982020c890056949cc44ed823eac9ed49b7275435de06e63de2fa7cd7b2fb1ce217df95c1ba66927fb04518dae8737f61c60'
            '1c2fea8d42e68224c95a43682b080ba5ed646f7650953db0ec3b9332d58c99598af00ae2831aac2a18379ff11b8a1027d90846705cbb87815a5930f303c8774c'
            'b2790bd914882a714ef835555ac38db27a681838d28f539b004ed09181a33e8d720eff54a73eec5126e38c88e775f7e3b5ff0d3de5ebc28f6bb1915eae46ab5c'
            '7582eafae88d1e502429706ad888c16d6cf8eacf52632ae6344226be6098b88bef2b15bcb8ac0d64cb56f5e547233cabc2baa7ff8f34a65c30c3740d926317f1'
            '2c2868a086d2e693cd157e68bd9594277381221c94ce56c9cb318bca382e6961daa2afc01386327676b384eaf9d28247ea7945b968caa66bc8d46c0ec00ce60d')

# vim:set sw=2 et:
