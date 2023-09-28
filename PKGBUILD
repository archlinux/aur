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
pkgver=115.3.1
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

sha512sums=('65cb6fc46bba03eed742bd67f8e36b63b19f2ad7b85d2f503595704a4e88f554758a1e66ba548c8efe97a76322fb2514db72e6ff4bb2992d1aaa86edc3af85f1'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '2d5b1c61d58ee73e0371a5a6f1c9482eb8f93043ad14cef7d5f559a2cb9350b4bcdb58777df1e067c2bf67b4e4a0c69a80c9792420ae320335aa99e441fa1d73'
            '7dc4b34862cbf337906d055c107c90fdece6a5db067302cd4324d3e84e2e9aa6d15c939fbb9292d5e976ee0e862545944f1429439db524a48378ac23cc226642'
            'b6f38e833a488668fc305f5d24adda02a6d95bdc7baafcfcee0b8667ba0002cc0e3cbb9795408c7d200f6e1e7fdd1cc8320db7040c5486b9eb9a0621e5b3fd20'
            'facc6016dff3468be4c804a5ca3a2011bddbba9b82808ea42e02510e6a64350a1e692e5714a9ba4dfeaa9ce81d202179e825653a076f5f355ad84c19ebba8bd4'
            '6836962f9dae40acfc0ba13d82caeae20d20ffef1e7e8243b4e4d1e46458f8decff9d8aedef7191e76b7863092f4d50c8bad6fb126bf613e506ef60522238928'
            '631c16318e9c56e34639301950ea6a42b92f68d63f3c4dba4daf3380db5c4fb0220443bee21b571f4c2e50896c917339de3ff3f6adbc58c520504844d9bd7f45'
            '720ed997939c16acb614c9511b35fe70208b11ee285af57851e44f08949624e0aeb4b51d5753befc73b160650035d9dcf5c9f8d209ef72a407ef98acf5ef7047'
            '0d3e56f2a8e34c4f4400c33dceb7997834920d4d37f99f885b1611bc1114094e66e85bd9bc2b8e05ba2d143f63a73dea0b92c762b57dac6ef9344a6d6bdffeaf'
            '9142f729eb55551175812091b0c2fe59706bf705815a89d3447529eca97c54308acbc76e65f80d4723642b7fd8a2592c005c1db37ac9171165642bc9afd6aa8d'
            '34c58c5e7d627cc2230b081f24e3fa15c4b968370db90741f81b7d347e200ac01735bae66477042bcfa269b2c8e6f44f1485f1c8232449a5686133fd696e5a69'
            'a2f93da5a503fe9975e615f9821a0287664f9ebd809478c99a9befd6c5bb0676eb2679b6973ebe98721a35a8097d2fcc0c859d4ce8c21614553ee7d886fc0cd0'
            '2d82a72a83598f99940ab0f62ed58721eff22087f7f549651d400e3c380021d5c32248d13033a1eefbda93a2a1cab8def9dbfca788df556434c61ff0ca647703'
            '6e3b4bda70a862d9b8fbba3c9dc9acae65379fb0860f280a07bcd3b8fc35b59c4887b77977303f40a0928b241412df4bc17b40e0555c07ad57e9bf9563dc5a44'
            '5b8b66b7f428be9b9e769794e69bb61076030ed303b195053e67a4250eddbb8cf27171730101f4b9c37bf9884cb5550766ec8531f201f87bd89aaf9287d9287c'
            '4d947077a9beed5c86a44fb9d2d6ee691f57ec6ff4757c9d2f66e697ac1bd34ed6d127e66a45ff02d548870f5da207f2b95927648d4b40918a65e58496555399'
            'd2f3693cbede3c1a3aa6bb80da0b1b2d2269c86500e70d268da96fd7847f5a13121d41e05de4740df3851c5c4419ff686625eace2ca73d2d5fee7e4df40a4a9a'
            '13a6532935e20561fd0971d5527f600701b558450108b29bcdb6b0ed61b58f9fbb5d2676dd2505d4b4f3e032be6dc30497e39518da04e264c87300e4c48e6995'
            'a9f094c76a1de90605855c6fea42598577892cdf809e96a691c7073612d318946e4a7749494239c457f074eb9b0f6eebf9c43a209c8702dc558d07888e8292a7'
            '964c83251cef56e64e57bbdfb43561cc595a0e0bf970c41c7592ac66497639b07fa7cd19b5341865f9f155d1fe03dfc4fbb366a1d3e77bdc69d78f1c45f20b97'
            'b7c20e19b545e4b407b0905bfb40cd60d559fc0cee08db46555112103a5bd1bc9d623f27e3109c73a29f82e7f6b650e5494d49d6d973d15dc1449fa458f65b4b'
            '7e6506de956d41901eca9635540b6e05c37a6c320a562abee2a948699a8ea51706139f70852cd048979275f6f84c3e6c04e2c2c9b3b3313585c9a416a6721363'
            'fc46657477385e7d390eda3488c6a337d9c902b767c915909a838a78fbe7626df69990a110bbf5828a407aa28762546cc57e82ed1e6137af5542dc83a4283fa3'
            '69cbcf54e46125a9b0d55871ad1f370ce08bb91066cff9269415130ec4d66ad6f20eaa6793799ec0be741234e4f229426193ac1c88346e74b827348c816472ca'
            '7f647bbe227121fb6b7147337cd1e68a39ca81f2caaf6c683419775eca69fbb543855bd516cdfcb352770e8cfdbd33bccf214861f4527d92a13a40097af8746d'
            '4ae750238394a2e14bf8ea98f24b1f6180a05304bc3c7ceb3b82d5e0a131f1dcd62246e8e558a06cfa1ac3fc9b27396f6b1365ac40dd8e77df164beadfc1799c'
            'e38568abc3ac4f78f887ffb35ae47b5316e6351194c747588fd0317a7615bcea661086ccc74fa8911577c0e013b336847e8a0ef976ee2e11c388d9a1b9c66d01'
            'e07ad6bfb2b608fd4abe4eb4a7283fc9e84eda6d02f4d669254d326cc3da6b60edd7ba83a94a068040298903361f67d421dd791f498defe7f1529cd7641a9f38'
            '449d27bad5e6d5be963fe8dd9188a33d8d551625eb818129fdde67ea58c94711a98645de7f89edbbb0d528b8e8927531e1659679d79a33eb896d378131b38cf4'
            '8d702ba83696a1adb032b3b7a321731e950bdfe7aa4ac8bcebacd1594c347737cef555852202a618d46f4c2e664c988908b11bd880c7ae676e99fc4cdea8df8c'
            '29049e4ef213ea82998880f658aec36bcaf1e1ef1a654bbee318d532f0c35cf3a0b9892e4c285980cd3e6ecc43f99167390afb7f6d29de0f37006d1803da883c'
            'd01cdac0b519a1a1144d08d8d90bf15354ad8ee1c3dc570f539abf339478b7f8d0856b458f1717405b5d12433b7a7d3d1e0a894ef8430ec82c77c7b5cece9df2'
            '70fec795761ab4e6dafd3751c9d103987b5bc620afbd7e6cadab6d4626c17a84a971306d80d2b1c30708e7a19265a8ab0ba9ec14b85061269b88b966d230dbf0'
            '8548d6615c13d7123a20494d9b812f12d8952937af85904040a0fbb6923639153da667103cf7ed36bd01e0052a8eadcb3446b1540455e4eda055f6e99e83aa2c'
            '712dd0e2a77db7b17502208576c186eee849ccc649c49fbbfef538928c121c761c249c642aacf399f031b6689ac8b49f76c5e5d3e69c48752412121f107e491a'
            'faa0ec725513ea3157722c48556325f324c0cff23eb6691aaa5288c259bf61a0f0890c8fb70d944f1c3abd64a77386d45468db529df518e6d95909a9440f8ff3'
            '930decbe92c4fd6fcf080af1702e98b1aa6372278c2e575ac7a59adf1a8f241ab28f7a1235fe6417a84e8a6cefc6e93af9a9142cd74ff5a158dec049c76c51ab'
            '275d52bc4a908789951819579d5d4ccd453b791df22e438f2d9fb0c3fe707791079bc4a74616e89de3cf1d836608e9ac83ab74b959668dd4411fc854a51295b9'
            'b98098a6bd3766329bab2424e9c80980a0500c705724036a1711e8c4776a949b6c52e793d17f2b681345a5018c4e8fbeba188ac4a5ce74831dbc8b0968501577'
            'f944daa60a47822bb201a57c293bb4b3fcf497610ccc15d246c94be9f19826e24bd994d1877849399217165b90843926a51d7f4a9acba2a7d4d67ca2842a025a'
            'e95fef0b25f3a1e66998c1735f93e2c17d88e7a5cd221b276f76321ff1e1b2040dced66a8c149532367bb8f6fcb6387392bf81e093c6813e89f3455c40bc92ad'
            '629c48a6743614adc9035fa832caf5a9ee3ff28414a1b222260aeabc4cd4ea5c84c66ca96ee02ea4fbd1d7a0ea8d46bbaa127a1e2eb1ee406899bd35f0dd37e1'
            '6c714b71349f2f67b0305e98c914920bbb3ec6adbd951efa54dcecbdeb05a560af709759b5a16465c6c898f98becd723127247cead9a7c69c6ff3b2ed31f7f6f'
            '47136161d2b3869530fb8be424af40f01a8a16479ef4cb4bf030a480f94348cfb35d2fa259961a7225ecce6c7e0489979b39c52c904c1003fa8d8c94b63bb172'
            '7d63b9b98b9256ca98908839af69866fb4f3f17aee1e757c6617179ee6c96c6cc29e99b37049de772f460ca854739bd0af02c90cb27dfb17b5b6dd581659cc4e'
            'db0773e747f2701d020340b737fe0c5ff5b4266f281778b69b038d2a4c7a984a2deb2a1648360ea3f54d67e2d8669891dc0486112db01c290439506da35e5786'
            'a140077e228db9b69ea91ffceeab8a53e910d5aefddc116129883fc94b68bc7f0f7a1dfcf6e40ec30007a9bde107c51972fbf3d24761950621905785a7bf4ad0'
            'ec14400fc0e33f3f7633ea18acf3fe6c94045d0d19f0f4678b9669e1c115f32111553894511c100d546639d7a9052c5f149b0c15f7e6d93902850e5c973df46f'
            '420646750977077658dc5a540f09f9282c8ca9687beba2214e0761fddec46e394f51aa90be61d2d61b9446680a13dbf2a967c27f9f9ab5985cd962e963f06d11'
            '5e7b1317788a5f99e55a86a268b9bf4b8821967f0bfa6ff23308c198d3984b2d3756c4f769593b52ca1466faa1c89d150f9f249a437727ff1bc74e8f7d6623ef'
            'fdf0a27ad5f0a5508eb212f2154ceebe59b9adce66524f0dc94466ca2f51eb3888a58da75745c8a4ff183957bfe2ddd4a55d5647d12b8265d50040291e04ea35'
            'ba3b6dcb4fd6ffe6152902512ab2ae812055028ea83c10719c329ee1b579547e894905bff39f203d07a017b380bd961434876e8bd8dd299bbf36781cd8938fa3'
            'e673b51d5182629b7b2c4285011c0891c3c258fd49db61ee02a3eaedac6c93320013a345f47bd7ec6c374c7e3107532e1e44a21e196ec232db34473013bdc2f7'
            '06507bd14e0c891648adf288acfc5043d258f619c2b7d3bd7bb768ff926b5936d356451a5c8dd8abd969a24a189c7fec4e6f73acbccd1cca72867300e93b326d'
            'f5570db0d3d0d77ecd5142570a95bcaf5a84a745304a98c71f53d925ce8f4a7f3b22a841f60890f259673a1a00194507d4714fe3c44da750f0a10e04937f5ea1'
            '1f77c7ccff08f060c4be82775915f6fe54143f724bdd9c13f30c4675850f737e130138fe18faecbe6672ece0b4a34e9c2f472534f4c97ac2fb80ab7d4b59a802'
            'ae9548d5744d37a72daa18eb736f4312f30f81de9c24630083ff4c32fbf7fb7364116c56ba90b8e113b58add314065dca239e9be583a588af0cab51ec9d54182'
            '25acec4d27742727559fe255ca796ce70b980099a5886e80a5b680a4533f5791cce2e537d8fb7e4bad8ec1d5c47d4c955ad1e46b75a3c78f4dda7f4fecbe58c5'
            'dd10478c6fe1b4dd5a74913d737c973511429d0496869c30d10a8517212655ea529cbd633c734353d522259cbeb69f2c9cf559cee5e4ee700984d59a1624077f'
            '4ab2a278cf0e9f6aa63914337eb3cf87a74c30bda970764a00ab1b5813a1488aa4ad67d1b84d0c8c0bb0cd56b9f924d1c72be68dbb789e34e9eec57fc0a15280'
            'fae696df7082f162d961c18e5a8db317124c137f2617bfee610ce4e0eff894c6089fb9acba94aed97d7f3a2e931e3548ec5d026e078224e8f452f1e4b84e9980'
            '031b2f0f228dac6c6e66d0c138c55cbb89c67eb4c8a1323b3d27d245d9f10ca16879f529017d3799408a77a2c990c09a8e629fb323374a596e16a9c2fa2bccb2'
            '6c2a9aa308846e85bc6923dcd7b1ae33c6fb64520548fb62d5610ca55482c9b064ba80396534e4690421b120fb24a48a07393448a4039ef1b0d11b8a3c8a05ce'
            '55cd580c26af2a1d975ef1891a5bb09955ae8b479ad08bb6f810f96465f8dae6a0d1f7945584bb75e56356f854821c61bc2dc185a2c7b30d0e22cc3148e16463'
            '41b1e67d963ace3804a705cb223b2f075721b86a65e69c04576de741dac4f3561a0308b121ac482adb31aabfcd4d875a39ce54a3ed96425b1a18f2112339d998'
            'd92b771e6a97b84a8c7ec44ad578c9893489eb0ed46cd9d11176b0730619130cd66ac4c989cfafcb0b6e7aeaab571ddbb65bac15a9ba162f490eb45ea3a3f1ac'
            '0ff6be570d5a8b5e2836d9a92d63918a7270ec5901436a9532bc58c1025e9b1c845e75e70d9afcfcc51c63d471d191e762d14709235e26f45f3029209955d2f2'
            '77245f95fe94bd2d1a8d0f4c95316576418614d47895c905e3c186d7b7ee929002d70ea77465b5de427ff5431c1d6b2621ffc922f2df1439019eee7b96eaa126'
            'de98095c4e37f2231d265ff0a35d1dc94764ec8d1ba74bfbc783930896ed357a86cca9272cc8c1ff0f26291475038e2d42fab8c0c809524c39b7499c86610ab1'
            'f38b7da71cacc16a7ef243ee29e9fcd4ef8548bc40ceacca1f39884e7d6e8f0e8a6bab14828220f65e79d47e5a3ddbaddf6fb4e682ed7df3c3018dbca3d0b0a8'
            '1f18635001fac6690fc57e804dbaf1e2bddfc3d3cea5bfef6419abc11db2f12edcd963019994d7cfa8fa305771e6ac00203c3b0f8a66751e6b61106a1014d77f'
            '46806dcadb032db3dc8d9af51e7168c9e80edb7212dacc72d43c795b32030536632ed80763b826d32f9cbce13a2feacea2a2114c446ae2adfc9b4fb61e6b3145'
            'b9d794710787edf05c053f9661f3e0311d28a10694b85f2b24ca142e54ef9fcf9607be9024217bcf0c12e2a755e2e7018af3867d19848b7dca44abe49f3eaf1f'
            '115489f8051d3c4ae7eb3305581c7d9accf9f1103bc43bc8031424b556f1cde9b9fb9738fb73b633d5d503a6edf824288463df699e59380531908a11909691e5'
            'f41abc4d54be5ccbd71ae1035d4fc33c0f26b8f50090bcfaae6702fcf604a4ff1c05da1c003f8e0f23f376eaf9558b924fc7786985c9ff1992ed06e09d6d743e'
            '8cac4fc498ce29695c68a4de0cb92bc7082206fa347580f203512e4863294f54935626bd9bc25637e256fab5e4a124ae3da64f67aaf71359b9a1a23f6b5fffec'
            'c1755ba6879fa5cec34c0e6f4e75b2f3fb0a9c7f228f00561e5d04fdafbcc41d77138936bef84bf7ab5555a080b445eb3e95c82cb6b851ee7f8a70bed83ee8ab'
            '324c8b577dff7962d4b12fef3deeb14d02c7f6210bbfb72a44f3df5d32651da1fa0be51c3319abf83542ce7cde1bed678e66a097c84ea6bfdf3b910f9616711c'
            '80e828bfc0eb18fe1d4655c980cc70fb1006160ed4364a90076cb18843b3466142815bc15f6100d57bd556dedfc6f1ef64441554b8bd578a3ac86ea68159d94e'
            '9c1764acb90c4519f57f0749c99b71733ee997adb1f35af6ebcd438bc08b5b0b97994f7cdbee67454a25aaecbb19b836994d65ebab1031c9cf8c2019d66428bc'
            'd496a821fec851beea0bda76edbb1a2631accf9356d1db0e31ad1e966ae13412a8ad20480ba26f6ad2aa52b397b8f5584c65e49543df09e8b1f94bace3e4be27'
            '257204d5983f376f26451c53a455b54aa7f1284cf1e4005a2047c1748f5c7db725c88669c597384829b7ac5373a2a454703193e54ac674cace6c4ae6479a197c'
            '4c40fc59e93ffee5548d9bb3987b83bcf2fef477be6edbabb89f597a8a09a22e721071f0b1e125769f21a789cf24c4203ad35681adcfbb166447777267f935da'
            'f90aec93e412b735879f698fd62e713d2cf3b80d2805690398efe84b7ab45eff0acf3b497727c5e42d7dfdeb9990e38c1c4159c1bf445ae9260317a263714bca'
            '75c2c0de46f1fe8b95e13c7a66ff134720accc975ee5843e3d11038efbd6f5cd0a5cc1ed883f679b2de037c509c0c5ae29d63df27df774cda3a3767f4800949c'
            '8bb1158b1485a3aa5110e39801a8d8770ffdc7b701ff7e708deff69200ceccc1f01b15558dfdafff708394b435d79ded4ec2e91195510689e2736d8df48e64a6'
            '56a4a5b7d65294e188b6209fe93e36d044672b055c36204ebc2efcb18426e1e37c2716f66d07601bbebc7fabaa724662f95a5802a52340dc8babd2d420b48848'
            '5615f9cc6fcc4819a922c6ea2b02e09ae3a3198a60796d1958c4ce1b6e5af191635cbd5f4a44cbfd3b944ac03acd2b9017b8fc0158a65491b64d128be429e9e1'
            '2133ef95339dcf0083472125a6daa958d95bfb7474f125167e733ee620fa42877a9d95e1512aba99e1066d3eaf538b14e9b0565fb2b37105fbdfceaf33becb8b'
            '62cc3055404415ba6288cf9627ed838a76e5c022506cea223626241aec065522ab19a396bf2f14b0d665749c9f7666b15db5cf301de11d159e48f2bc5ae7d0f8'
            '4f72817452d1087d1bf1bebd2ffd8c2265256624e1e449afe4c6a3f4d464754b658865f6408734adabf457293a1f38e710e3babc28895ce778ba140a09bcc391'
            '8b1e7808cd482161a452d3d764aa11962f31a0052bc9bb6aaf3001d9f4093df8c8cc7c8395ef5d3368d33f68171e287673215b5a52128cde2a2e767f12b08470'
            '5f9ba1addcc282d9ae82e3feed6bb8f7a09cf371e50df51b12fe7939b265bffc514d105dc412d6195e9db2301ce72dabb7bbc6e0f6f8f584cb85ed0a703890ba'
            'ad78d82fe756ed54eee4e631741cbbc627a6142e86d2bb2b5bd3f0403a0722cfc15062cd7965c59fc2d110f980b4cd7ebb5b6650d11498734f0378bef3856e95'
            '316d9ce7094d69570fef25767ad58dbb3021808338e7679912902a2eecfb6c0ec2dec9a66fc0422d295bbf9028af5cc30a7d6972422cf00437371839b9a9f6d2'
            'f9e3009d2ffefbebec11ddebce7b7bd7d6f9ddb84d5be85e1c178691633f6af95a3c13085f3ca6200d9d4d6038030f6472fa86f4bde0493acac2369af808b541'
            '29b304dd87ae32df33ad5d1485ad4734c106d2641c6ff3bc60564cd27d9806eedd2e598df22ee79ae7eaa4045c7ca3a2fcbc724a70fd74c3fd5c06f6294da715')


# vim:set sw=2 et:
