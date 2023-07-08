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
pkgver=115.0.1
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

sha512sums=('fb0be7eae28df80837eb99778d9d0ca61094210bf8e029cc15d02dc674694eb9f9bf1aed6ce9102ff9e0f83fc3c4a9cf1bdf768f59832ede00a43b9b7c953ed3'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '206b3364ab54b3e424f06cabc8d88d7a235b0ba33c6a730ecc536f3ea1f655b3875f4b4f79245b309ecc71086d90416b09ab6003cdc7224aa77e392f8a23aa16'
            'b6bc3d07cbb1bf9ce1fc958270a0b439d2b82b8839419cdbb92ae5ee6ecb61527b18dfb5c5b0c9ce4fa64dffa8dfb69f9a4aa0d5c2ac017786de43f3c0b8731e'
            'e331a212e5be92c11d483d0637aac7ebaab405191319e2701dd6baa0717ad9355491b3011d091e138672d4233595375d858a37657530646dfa8c98f77084fc09'
            '6b26582b9929b206cedab1c5f97d284de180adef94046d24a568523b3a26c393aede4309144f45c484a3ad5eb1391524d5a0edb0671ea9883e2e74c7969aaa49'
            '493d56eea12d5903183f32955efa768904f89e7d6148de61f23e79cf562b89f9807ba503e05853661beab79f9b94b730f51bb510f7042efff7db91d37d7487ca'
            'f9762fac975406dd24c25451ccea95fe1a71ad18820189f095a799396c83197e647596a64bf10b8734ddf29c4653533ace1c62eba4eb3a0a9a6709852d742d47'
            'dd4c3a6e0cd75f6f462342a365ee2ca39348a277080b92ea8f2e347e90243b799ecf184acec99cf5d565345e7d9756b7ffa83d90eaaa102a21f5cfe19ee0979b'
            'c6922a4b0a93225322e04369ee40bb43beab3a304764633c55ad65638f16ab8184e4cc0e8cc86bfeaf036193ed9256366e58d98da910bfcc58e1eb26fc49ba97'
            '58163e15c026c48a7726fe59f93814dc33d9cda3aacc84eef781926f04fe1f9344ab9c089a43e7be8201866d263ae40eae44696b977bd315becbf847d6c7ce1e'
            'e68b2b69fb3bd320b6dcf3e11382d392e2d255e9ed3c03c5753c401d5fbc49281388720108df3392868a7dcac36741524702996cff59f495591bf7946d1524ff'
            '181ca476dd36cc9132a870d21705a6ef86ffc046edbfedd83358e07a09bdf3c1b24daa144022fc538fc4c3393d8d42bdf3d18a655cfa517704f1217cc88abdf8'
            'c6be82701277fa077a4898a543ce1f790d36c9e6def9394bd1915bdba365c836afe0144b93b96ca3d4fa92a97790752eba95743f7a1e01cfba90e616c418ae36'
            'c152b4884e370611bc0c26cdc8cad29302fa35d4706b67cf3f407a2a86feab38a4ca5225080b09e468d4c15b05f18247f20e95c10d92dd2aa2e2d0213e7b9961'
            '33766b91b047650bdab3bc0f59b6a076f37763d905434c4939a66da50c3580666eb9be1113d832341cb715770ad06b29986ccea2960e519040fb6b720fa2387a'
            '3565ebe7a1bb4d2ae70c8dd075fbf02121fb93bebf87208a069a69710f76b00f6f1cae96e20db9e6b76672dfc463e83a0a13a1e99c1bb87559342c5f0c81311f'
            '3ddaebd7df5d776bf48ac7313eea1d7db7ed063f6dc5a3ceafc3b339ff444d6061ecad96400fa8d3843173ecc2e3f0526743da5e8e731b1a4e98a8444a6cbe25'
            '41ae29f39ac1d67220ea0637075a088ec3483288d6048ce24699e4bbb3560bc4556ffa1c483ab992b33e15bfa2cd43a5d329421cc02462c6cfcc9063ecdc9499'
            '7e35158f6bc7d3d52dd0133391beaf24b56fc1c63d72acdbdf09dc2eccd9e52dd82b09d0ee02f41d9735e2f1ee7e33ce84ebbb4112e6fed4189a1c5911bc0fcf'
            '345ba982cf979a5ed0bae2cd2978a5a8175f8ec86c14f1750a54d068c1cd49a49224e064b137b6c80962fbf81825ae281f1ce012c2c1aa9d75aa195b5ca5db3c'
            '9ad59372e83e034dd41f3b5f0a7512e27cfe33f5fcfe1a7fa8933ceb78b3f32f885240b87468e5c5ab6066b6095a3580a2a442eaafb17015a2fecb0c81e917e9'
            '98f235f41262004f1d7a32566b18ffc3c5485b0c8fafdf17a1982dbf9cb648844c4d3840d6545706c6220a3a3d2c2e6b16fa2dc7a0dbfa8ee2a46a3a8106338a'
            'a772dd0af5af68c1d723d3196c940e262a2cff96486b069970d77583b4bb1684e37784f81cc9b6688b465c5f7c41da061ad052df4c4b549b9f21c95229d388dd'
            '2bb17cd75eca601f41ee2e25829f8fec973a21670b8afc21ddaeb50771d34fe1bac0ffd810fee2d4c9e446fe1627aad710ff3e8b4eb1073f7b27379b40c5f176'
            '6b2aa758dc17a1792434eabf8aab6acbbd246e014feb9ac860e0c93c4fbfe92171338f79a4bd76b38e0044f6be043b9c8e395133d52721a0c0a7100d7e6251e9'
            '3b243a3160ceeac35066deb04a7e286dc57d6c2f57efd8b2880f7479fe88dd10d3866fcb3a6e7914f4235351033fcd913b071b02d8e23d736ba82fc5eba6422b'
            'e926f017b58dc41bc839526e63b5d637d6271916cfdf99ddd9de296aac2dd34bd548f2d7538d33f5987ace45f62cbe64a22f585222a65f42feb0c16c2443053c'
            'd9faf6a24f78642ffd79c6d5d341000810c27730cfbde408266e8fae4490caf17dc616143350ae57df8dc64bfe72a6c66efdae374266a537c553ea6fc7eef42a'
            '65b3353e43f61791dc2ce29c872fa4f7996f8579fd8798bdaeeda66974e82a231d7a8aa36a353c256ad5b5632316a69e003d3897e0f640443166f438a939bfc2'
            'f30358b86c7f54a021ad495971cbad7586bf05d210df6f9d67baf5c9fa295b940aa5418c7d8637d40817878292b48d80570d0cfd322ec0c1f18b3ef261b967d5'
            '98ff5caef5d572e0004c40404d1e43f21abf2bf2dccce4136c5c6688ca7d5a6cbd68201fd5f72c53d65a1dc6e4201793e9d672a973796981fc328f015b75036f'
            '5800a70590425123d9dcfc9814d0d2a2c2e17bd65d930ccf59e36d0c2976875610e75dd4029e2817073263ce5953d74670cf03767cee98d2df1fedce91836c4f'
            '40c059a05aae6aa91c1d0546e5f238836cdb627b283cbec87ddced598f154a993fba66ef241655a5c6107a8ef407afba7d598452d8625147e611f4e965b14ff9'
            '322ee478e51e89c6812593da95c872fcbc5fe23163087887a89a8fb59f751fdf845480f8ee7c32616be70bc645012c3d1d5b5c63d24a630e70863747a3ae2e7f'
            'd2efb2d4d6438886b2f5575fdadee852aeda676e3fb4745330ba7f9598a69c0a0dc8ded417919e88a39834eb603faba40f70fb375097fc4f5948743ff489acd8'
            '7f89eab1a2e34b4ebfb25ed55170389c5b1d24616688807747586f65201675c64d518bda44f5c1ad8b423bf1bf3dbda26cdc3bac63b8cde180418eb24a44907a'
            'f8e9eb8d885008a7a0c2b87ad0ad5d6a0b22fdd80a74fe3e8468437b2ba0d682b4bc0066bca771bd0ecf56c372e3a6848e9e0bd777564ebf3d2e0c8f044e18b9'
            '8b84c6e7c3284a32a4d69e5f466f221dc5353df7163cba564c8447a56217b53734691666207926c475d1ef9a09fbf2d35a19135b976ae77a49a86ca26fafd133'
            '48c732dcdc432154be97d33d2d40755ffbfa59c4579163a7c3272951cbcfecba5269370a190349a47e2778672a0ee01b399153332a8a22dc49f25aebfe3f59b1'
            '37d029e597cdd57ed84018d03961876b645df97e071bc4c70d0b920a5831305c7b5769ed95f9012267203bb82b98b792f0529c8e2581f307fbef79c3531de128'
            '8e769718aae780077caaea79a7fefd009e45f235b12f95f020e1cb193375c96ce874e3a1c4c84b4c4986fbd7626d8ec2fdd08a4dafea3be51cbc9c8113c48c4d'
            'a4f48d2fc622ee458f9224f72a6ffd815b297438e5efe1923b0dca80946e500605e4483b3f3186f9a48c63d4216177deb8698d4c24c2342826092601b0ca69b6'
            '38875df1b0e82e5395ea4309b9eed9cdf8fe7def101c81dd2df52252212a8abec2a256b55dfbb546dbac843896fc3600c0652a74afafe7358048828fba9dea5e'
            '3d471f49e25baece9053c724647f9e1582ee7904d5f68586fb16eb1132d5cbc35e5c6db434ef526c949cc18f693b912e297ce9d11e9e607e33c16794930349f9'
            '2e10f644087f278362b9aa5fcbe2b9eb904da82e2f43a4fd5f8bce4069b66b00617afdf55d3f5490002672ef099e54f27960431c1a59753a107b7396de4d9376'
            '05bacbcb115353a121bd265abf63e5c8b4a33daf13bedba8d588cda42600954de1c77ed04d1877e53f1d6b1996b3514c2f8822d7eefba2f13a21aa0619d90a20'
            'ae45a64efd77cf15acf0909ea22c6a929b040119df8a361181422f8759758fb0a69d5096058acadc9389cf27adfe3f5bd0930da9bdb32225a7f0653cd0d17890'
            '8d064c9eb004db1375d30a86cb455d2621fff162a986793dd0aba8f6ae3394f5ecd3110e6af0685293fe65e438925585b22cb529e36bf7d8dd5f14646e7b2fa2'
            '54e32e31fe0248bd14b51bb54e50a602b01bd778b4f26f90c7bda3cdf5352ce38a652abf761100a3765658cf93b97c151cb741c6ccdf941d54bb67db6b00fdd4'
            'a81a8c9c3e88aacda91cc44a767164f7fe7a28ab03ef7b75224eba73bf8fd63d830f98036429275e7d9c00e3817872afe70e8c6176667cfa8b5337c5f910d102'
            '2788aff13dd8b9359e6157aabc6f9423d086829ac7a7b96ec7e4192133ada5e9d7e3834511d579dfcb850df430afac79fb673aee9662c7f8e1c5838312365552'
            '35d88233860c06b2f848735a10b5ce79ed27ad3d4666dfdf851e18c537b6ea34174c6e553a16b529923b95832b98f4dbbe9329d90cb5344dabaa61c3ec48d75d'
            'eb1c2c92c11605f441f68464c3c3cfa366d5225220cbdf7586c7f7d0a7f89f730461d2eac9b8023b8db12dae0efb5402fe5d7f79192828a86db072a8e3067d1a'
            '041a8dc75764c132ec7014b39225fdb282604041bcf767fee606dfbd1433d7705003bea05dbf12292e127d695e38b9bb739487cdf32f7f5868e6136f6ed4f4d4'
            '882511452fe34f60d250ba1f48472f244d05b3154b80a82dd0b0f2a3950cd016ace9487b65329eeba0633aa96d516194ce9c7fbde322a5d333b8c3eeb57781fd'
            '4ba24fa285bce78ce7eaa5bb0b375dc61100ab4397da2ac44a34e3a14edcb3d446ca0639c1c40b2303049a4755aacc3dc786541eb6f2885dcf9876e1d13d9ba4'
            'da68f491bdfff53ab5d5b4cc144452352d429152b7789b04c53e2912817b8e33cf747107acb80d7bdfc487aad9999ef3374467851a21c83d92dcf2b4e2c2a5ea'
            '14fed8758f11c534ecb0a9f6852b4b09ba477d6b9e6ee728c9d9f7673837136161060a00402645c5a6992b1f6c4d6a0d103468ec1982a43d173d21fa2e1b2296'
            '2d1bfc47d510a89f4e3ce151cb6f12ac8debd32dddd2d12136a6dbf528e04a55d820cf000d780b8776862c036aabdeee424d8b80f750ceb0dcd94d8fba9a6ecd'
            '1f91526d83da73feeb1552198375c3f36f1340babc96bbffd28c41783df16b25fb1f6ad5c4f632513883f4c7d8df46575bbef0dc46f796b703f4dc8ce280aa42'
            'bf617b0d9b5c08eabe60e62c2864b9b37b77d8404d5327b160695c9892ae52663400429fa89a5ba7a4d6f7d182a662feb4b0c8c9a2fd7bb8b251c0af49862e23'
            '48ddca52434a7a646bf47d8a0fcbb5dd6e54ff1908a445bd969a295dc154945f3dbe7e2415cb94d059ca6636828ea4f6aa713e65fd5ab072c9657d930e22f3f4'
            'fbad5dda3919bc3c24b306f4b2148d04e32e18432fa4cbe83e830e2a916f89639266d55bfac439b9732abf293bdc58ca5fe5fe79d1467535e676dc2bd49cdefa'
            'bfb1fd88b429fcee54fa505d72cd51a19a799ef2c8d9d22dbda5ac49a6d90802b04740daf02fec2e56a1546cbdad6fcec5d51a8499241bf5e988cf9f571c3828'
            '58761d1c89b8b0ff7dec8da975a87d87d8b8ba1906c5bf608da321f4aac785391751bfce5eee1a399489e065a7ba1fa3f21f120d1a34f556a786772080d26ee0'
            '8ea40147eb1969e3225a052cd2ef4b370b205978adb0f1e8cfddba17a005aabc73ca7a6a4be5667a8d02d3377163808affb7d66d814433631e12bcab29cd9cd1'
            '1e8afae9241acef97d5e3dcbbf3121925dee1007ba5804179f59e14603a1df6bfc4f9caa725ac954856f6fb44649565169f9cbc2457ff679afea1f14fd67e036'
            '3a6ad1b149cb991ea702580efbe9ed65dbdbd7170c835548c0f267e4c61910a7536f578a752d3783e1050fb9f89d5a0c55294e9bd72fe90cb93e5ed7ed93774b'
            '2929d6b3d6d78a621d8216dda24556d2a201bead2dd1c5b2adf166f44eec06ca111dfe19becfc9fabce446e2b06a00706f66cc130cf52253199ca43b44c8c64f'
            '30a420738583384f6e684b8b4afd94a2e6bd60d2d41c6c18741c44f4bf384ecda94eb793aad985b5752e166677595e4bd59b3d869a01020c1d4f1cf3f22fc2eb'
            'aedb08c7a4d33e36c77b154ad282a0941787711b075f6974bf51e333872091c1c58e9d95e654bd5d9fbc3e15f54be2eb89041cee98a15f7290a55953b8d65024'
            '0c1468a284a7dfa859c0ede5714a134ad63e0b853f6b1f37b6d1d8343b474fbb3eba8a5a8a9ea6582f46d8f260d58a03250da52e02231e9adbfb467541e64489'
            '6f18630d448a12326f98015c2d7ab96a398603e21baab2b05a2778d6ffac518dbaabc304630657f4a258219a22e723ba7d7d964bc33aa86f34b1ee93af41a4ca'
            'fd1756af4ea9f0ea96daefcdbf993387bc61ffd73412c0316c60900dc7662ba490b79537f5e462844aabd8e697c23e9f385385505bd029a23a22335e61215fcc'
            '1f9c5d40dd18065c3ea488b09f4435ddaaf83baf50b1ca2e89e842a005d1198ca7aed36d349eb8cb6c2243272d5f5a7885fabba57df15eb2368ce9bd750f39b1'
            'c223200c050878291b39fe2e8cc769e8215e795ea96951c9199a7a67c09db57b4047c29bed55d16d346d19c31707b40f72d094e4c8ddc753b0298220b2958a9d'
            'ac5ba3f15ac8fa4071228090f65146a6f6ddacd402e5d591c95e60e5337a874f06ef1586202a29b648e28b5d4408656954dec99e845da974fd0bedb0f27304b2'
            '795b985ce2b23a706480e12b4a74cf5e3ef3b244d428ab4f48a46b2d36ed39e2b1ac02ad95c8a4af1a046529225beb7f5ddd0604eb9186467d3710d71bd5041b'
            '40c8a675f881b52713f5b0445d61078377d1b1dd7bcfc355b937d7340616a9d00f14f27b3788d78155f87e48a369622eea22bd0d09173fc906dd1fb0226c32c7'
            '7978be0f0d3d0ba69ab4288e72999da9ec0c7f2ab58272e15353812296f4ef605bb36c19ab2b7057098502f520ab679b46d26d0b2c175c994ee14c3ff51a5b6f'
            '018274c7d3e5435c5415072a24488320256d1b691b1602890ff5a99a62ce5f4c7159f79b4f68b2cf23f6f1384d387bb1b66de3afb7c6d065a8bab879fec15ae5'
            '5f4f1728f2990cf4adaa89a203e05919728b8c3e57bbfab0635fafd94e9dd183ed186a7400f239d09fa7b916ee63f18782319dc827ec175814fc2984566003e2'
            'ec07793af3a88fd0ead8b8a26b374bd97df16c58dec8ead9f479ea08e0de308984ab7b082b908897e36a77a31a152e3dd890f883bba55f82ffa1943ebdf8b67a'
            '80768c34fc27ba29218fff4fe20cce060cd651756e9f15e542b696ea918281f139b57788c3a4a6fe9e9dd727d59d818da272ca221f30ab6b02eb8af5d43dc426'
            'da0f526e132c9d6dbbd3c296616bd4a7d68f47b8351082bc40ba13db0ab9e8a83c841303ed03f18cdaaea0b8c17270267dcb4c5fcf7fdf6b0b642aa6fcd19ca4'
            '694d26b6fd9bdbad377e435679bdd55eb38ec6ab084621288d16395055a6eb1c290d5304caa76ce6afaabadb371517d2c8491b04b18967ceea421d8719a8743b'
            'c7eccc014900d9ef8a4c78b177fad0941d8f17aad5521d2dfeab77f9453bfe31e25c38ca4f037e8e4e79e113551df624cf98db513bec194dadfbc620829df7a3'
            '9b193610cdf40f0a4eccc473722ae43cdb6a401edbaaa86cf3413b33ecf44acb012cd1128952b1116a0925bbe29d32fd15c8e8fc5fd789c07ce7309b07b5f6a2'
            '19610309c93c7dc06fb3dd210e6ec1e78551ec4f990fce0ac73bbd2eb764d3068e98e2f4a038f2c41e63a6b83756ce8d564fb514bfae92cfc6c10bb184e7eee5'
            '55e4abd1aa314e84c84a9d7f1d9195eb8cfaf1ca9cbc3cb7a0956515277b7c736998eb8be8cb5930dcf99de73fa3f984aeffb55721c190748b7cfe615670410c'
            '16e7a6f71ef9b21057d8f3bee902e3ccae84d439597a680c08d1c71faf48f3e88fcb0087fac5c12a9b96de7f3f87d3d00b1f78264d6ff1b207a4294e65fd7e01'
            'c2ed9252c6df241175544d0f331a9bc769a74d6ff808c35b82cd54d7a96b23372184a31d6e07b9eaaa758a7dc2a0774872fe8bcc6488ec6f70506ef7700e3230'
            '59b879d05bbba60c9aa4a8839ace2fedb9945a28ea7dd9b7cafc80329222a00a96c8658b1668742279589788315405be259cdaeed78c8037c40095437bf35a66'
            '36f0c696d1506eddbb834609b6ddf58592faa15b4930bd458f0b341e5afd9a855c7e9cfb6d208c5110c93f09d19bc46c47f5eeff8ffaed59c26980acddc3df22'
            '3efb18c86d2c124248362a2fc322808eb077f055aefc92fdd239587958961e2d902f53bd13b1fb3e36c04f66e69004707f488185623a0d1495040608b10089af'
            '9b9308b195b51a29fbcf9844e8a368814ece0fc7d205e1b0962f1b3aac71c581d8db6fbf6288125f54d8761259f6d2afc319178607e4fc3c1755e432c06fc394'
            '01e3418180c3051ddb86de9389108816b73215677be0908ab794d4495e27750c02fa131f4d6def56f723fe1fce6f678a6becce3b25df12ce97fa7b171cc84fac')


# vim:set sw=2 et:
