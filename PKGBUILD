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
pkgver=102.8.0
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

sha512sums=('93ea87997b66088b94c6e943b6e99e9a71d1908444d096c0f65b6876d2c584e55ff6120266f3851f986b664bd1f12fa31206b03479c2b751e7c3ca097ac14275'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            'b7f4a793ed4aa79ddccfe82a2ba47f995a9cb71a80422f9ac0eccec234e92bdee2d434d5f041307e8ab0d86893b723050a0668d689c22eaa23f4dbd8938acd38'
            '8712ca6889092f797cde78183eef3d8a4d59b7f47e6654ffc9f89faddeb46a31c6071ab4edf5253c168765a1353ea5b99c6fd52c02c80274d2a981069abc0d97'
            '3a329d9a65871428d750b96047641350d644a0fc542604be449569ca240dafd51533b6004d7dc9add2f50f17ab8a1326b2839f471c26c7e6858aa1ad65a79e59'
            'edc34a9e0398396de5e1c309971875ff90e457d9bcb2daf12631c430f08449f01ba31d41b6b4cb3b18673c4de30849a44fc3ad6c628adc2e4753f9dfc7228927'
            '3f432c9abc17d2e26a6118b02cbd064afb720ffa537589a93f5b87af7893e8e7cb2ade725ecd38a7554d9fa48c73ee1b4500cd870ad6273512a129811bca3749'
            '13e4bece6d0db46404216b28383d479421dad76dedc6a371870dd28f5864a41e8fd3a5085f7763c062bdf3c7acce28d06a7a243401ea575a1c5fa745f4f786da'
            '7a35ee3238f62f0e78c755de4f96742f334cba105355d23e021dc98e0d1cb826e667aa245b5b8a15610ffc9f463891b907daaed18b19949111aa31f997aaf5d8'
            '51be411010a82fe189eb839ed412f7b01eae4f5db2ab71ffb38b633a8dba3061979e0e861a9c7bb9021a5ea3d13effc8c039c920f9ef18dbbf9b9c9679902a53'
            '86eda652ae843c55bbe7e4b0666a8caa1398d99db05cfc76af04fca461c506c82ba49f5b691098fa1840b09d78dcb65aadc4a9b15f03eb9b30d1b81819152c71'
            'ac28e9fe6eb8ea39c55fa47b371cfd924d07cd2fe9530fe53a824fec03e5480d653ce84404cb90f139c4c77858a0fba4f303fb75145915c43921e536048e1c8b'
            '2aaafc9555fcdcbefbcdfd4cbcb06ab982321da865d2f0ac6def54dc1170796df0334f4abbf7a76ade63dd2227c788f0dd03d6e385c52a7a7979d5e0e332d685'
            '712f470cc24483879a6b1331f71f9558219c20b31b673bafef666227990c8e060385d1e0643b47b9ff1a997cdfcb1e79cf1880a29cb87a57832d5c4ef588ae0b'
            '2cabe01547ae8ffcdb7cb1ee45a3c0cc1d1d594d39bd87d5b6b1b4cf020ef47d6010ae9c461682f24c196c87081d0eaf1093854e819c544303e8608128f85711'
            '5bd48d0fa7a23e4f79d5b9982a3ab4dc9c044726079fd2982c6eb8a334877012d220300e9e17eb1fb47420051ddd6de30c37d057201f796cc4c8e13164b4d451'
            '01f4afcb662c70490a085289b46cbac0048fd214f906f5dd2aa70e78a95b0e08b4e1351d8b28c61b0fc07f8a71d2fa151f23f72003c820ee64c99946bf8f0171'
            '9c04bf85492c4f7c113f742bd2bb5dfe63141fc2e92d469dd94a3f6288183489fc42ce8b9da7dacb727e882f827dcc8bdbae4fc4ece147d9465935c209570fb2'
            '2932f799bc7b27b7ab9a9c9b149217db2dd39210d9b1748ebf38125bd5a4354e8493aa9a2c6562b3b43aaec507da7c4e04c3afec114dbbeee4668db0d6a46caa'
            '2cdd30ab253f91c4165a9d5103542427165698a0f14a34af61e1e4d176a8959f67a01e214fd8e76795425d3b438f9f50c686cbf9a15323c9a71292089e04d0ab'
            'c4da18bebdc982a1bcc0a3ac83b4128c0d399ff14e5c5d61a9cff98e7f9b4ba6ffd06f79254bf4b2aa77017428b139d3667ca6adc95bad3953bbd087e1929081'
            '2af8eaeb80502a3ad6c21526b7928de46db7ac9175874936bd67866b389eff4b76a31007c2e3a2d073daf3ce0af65fe02f2494545c7c8f88d5a3a98bcea9a24a'
            '3a321063c29271340976e390d7d95d27cac797f79d24d1d81dd54254e173358d7fe9513dc4493503b688c5a6b042953c0a3479c5f299b91548fc2183e8941e5d'
            'eb6df63dd830efe5155b0680525138c9f560b05d345b62711f1a1284bc19ab6fd6ce42496f019fbcd1b60b055c590d977ec54d0775cb4b590d8e0ace2a946fab'
            '59d108a10f2a7b6ccd7cc596e6803ecb71fde30725876cf69ddde08a5a029b7e6ede8c0da492ad6a1ac562be1837cc078d230b2635fc0c8be2d0edc05d0be384'
            '1b629c635acde88f5389c6d96922bb6b88dcef0f951797ccdd4dab5f9d025cde7104c596723214202d4a6d4b45fb432216572052f274b600f38115d7af7da48d'
            '09986b89a20f33477ae951f6106221c83189e4115293a295d4557e906612451abe5a2934d92d0a0bef8fc32dea5c834472df2b37e1872b772540f3d8d1831511'
            '94eb4ed36f742453cbd8e5e5c6ffc03d10800bd3fbe521a694820c8e093a4796ef0defa598f7ba5bf3cb5a2d6ff2f0dc7f7d0e586c25268a96b40c9a381b2613'
            '91c48ab4fd3f86846f84c221d65c1bd83396304a80fea0313a5eb3151d9cb16ecff8589fd794e46dd2afee4b3baaa254450bb52f23bd60966f5d3b1f3ae08c71'
            '70ef7bd36907bf6d091f765ed136ee2ec69d7bf0bd5fcd5a7c6df6a7b1a47ed268a01a16625d00b1ac5379d87637e94ca452dad3d0ad9ea9ab340ce4f9e67c91'
            '0b0712416b75957dcf10ce3e289a275f6d28ba695784d89f333e7dce54a6463ca8a1e000520d8673098b79b2281c5e23a051482ef3c95028c0f7188ab2967395'
            'bb421696b16004a74bfa8448bf99fd2d5142265f3f59feb1d39f68e14b003a56ad9e19b9082141da13f951cfcb932193d340361c6da4e219fd6a8bea5d933df3'
            '768aabcff6a9ed164ea01474e4a8d6bf62bd80d4778d1957a242070138a30fa426d3942649c222d2ef04a13fb578c5c0beea78ed740257deee816d393ad75297'
            '1a5ee3e72d435bd584498fdc16f269c1c971e90a0fba2a49d28806936b4007283c67159be3cd68825029d7d8c65273bb6c62ad1f036e52d4bef0e0fabd7c219b'
            '91fd4fb2a18bdd2fd2d9ca0952f48e25ca2950662601733568702c30b992de98e1e6ebd0934e01bb51d0bd15cd70b65c11a80f266a42df531f277a8ad203fc09'
            'dad9e2f0bd3682cb869c47a57e213e509c2a62a19779e4cb2a26d0e856573ef1df40494e72f83a628de4f9876fc6c636e7e41277d89b22b69659dcc604cb388e'
            'c76d1a465eee8b26958af1eef3cda4c4a7e7bdbb96097a56a372b940c1d2015668d667f5212d0c0cec0fbc9ed4e9a770447d5fc98c1d9ffe5310a7c36c476136'
            '6018e5adfce99ff7cd45a1b6b87873dbbaaf5f0b85b87cc586643809715cff97103817d84cbbf31491b2e4661da53589fe0241969e97e6543b60b0638160b523'
            '24cddf5e7d0cd9a6d6fa241da3a6e76d275bdc747fd4d1cbf418a0f7eb70a925045cdd038f02b35c12d0041066efbf9babbaf634345c489a1b29bf51457bf3ee'
            '7f33ad646d066aad9cf07f591013ada7a03d3ae428f1ead56679b6b70ce98c179889730c2513bb6725345329099598de71234c00bfc272af9871fd18402161b5'
            '1168b39bbaee2da631a61b311e420f7ab2378408d920b06a9fe82c4ed823ee065d2867c2dcf10139445f751ae900c8a1b589244afe4c28d8089f74b660b940c3'
            '318d552376695d84ea048f122824d81778024ff44f17f904a493207d7730c408ade136cb05ca8ed2b248bb1b503270b5425b1482485451859d29c14cdee8d3a5'
            '8767e1b01f1460fdaef712f117f4bc4069c4acc6065c0b231e5401f175e013dede63b06ef721fd637f21c3211ed5cb6914717a1c4316a7a9117f71c6323b4215'
            'a24bdf922ba2c68ef271bc0d90fb0ac33dc04419ba810aaa1dd47c6220f6802cd1ec8341183bf325ee1d0b528f0bb06422266d522d47a31a1ea0d5b57b37342f'
            '620d66a907925aa5a828324ec54368280270223a5c31d7162e5ce062f62ea20c853e45e2ba67ad812aa9f76b7a6bb76a3632c21cc2cdc8b759536dd456757bee'
            'd57185505525dc12eb9009c049806c452cf86f6d4c48c52387d5169d68e92d04beb37bdc19a54d79322b81dedcde105de210d6213f0c3a14f4b92628bd70eaa8'
            '66c2c8a7c9e52259d7242c07aa3ec038611b88eaf5688f5469146c6b82f1ec8762cccc0e3e063eab29cd9893c7bbd0cca88df071c195bc3a5809500028d40ebe'
            'f8d117989bd76144f14f062d96eee9b7d1096142d318ce9767bbd30f14a5ab7fade248e0453dcde2ccfc3b5fbb7e4fdafa73b61ed65ca7bdaeeaaa93af95335e'
            '2db1a5b4b6464428c2fd4b3e106ba4f56a5773a40a6054d915247bfa0839604f7ef07a6e7d54dca3b1ee57ca6bfa00759157eba99d11f3220f27904dbd458445'
            'e1593892eac472e04120050ad6bbb29e0355690a510aea89a376ac6ce7524948797ce4ebb69b3ca1145d7f7ff3b854d2c75396150edf0207dc6abd2a54bef912'
            'f49e4f06e222f2b504271ca9b54681da60c50fd850c61c165ffbce891140b9208ee65671f8550ccd3aa841b7ba2e2c4dca53011f4dfee973ed4ff98f297440b2'
            '920611409420903181d891724bf3b012a2699e7c8507706da5dd2e13acf2ca3dc9558ae1dced4bfabe0b2c0af0632591edacf9b0826fb002e79931a45655ffc3'
            '766da62bab117e5a31df9b540b1357abe4fc8a7bb2da49d2db06bd7e2d4cc59d69ebd27c6cbf65ad0f0a48e779363760078f46d845d1f29b210e2d5be5e8d523'
            '0c502490f4869d7a2951f437c40b244c9a34635314762be83cda43cd2fed7ab7767b0c66b22da751ebaa4e9a9ac13d40d086787aefa9ca5ecaab748db3459c22'
            '25186d24a561d1ccbeecba085fd5ba30691d9e856244636277d6b43234518e76ace0fa5f63f7039373ce9c59689bdd5a22b7e8abe82e74cdb0d3d1ac3abb7443'
            '24bcb46ab661885ceff8d58d2bcb5bef6937056f77fe31037194c8cf5746ec0bd38de4acac200a6ed0683efc913e33534f364de5a3bb7792aae4f4c66a92a3b2'
            '2f41e29eca458d54b3993f293d11449f314ee9e380c22f84ee08a11f15c34e140788701bcc11da560fac7d94ee85ac94d584de14a36bc628a2c84a81e3f4d882'
            'fe3228103a45e636aaa3dbffed897631d4d4cea87ffcf44216400324678394cf555f817d0cef73c96ff5e0483a8d2e236f33179564310dba3839047ed149bfd8'
            '7d4b67fcc925d4d7189a3d175aed3c17892a85ac42f8c8653c286496f6da1c328544031e2990ed531db059373b18805f7007134beab40ac598fd03ed22556412'
            'c709ff99d453f713ba5ce4a968e3ae1301898f97ec93e6ce8bc0ae7758364ae930b44f6ea7482fc5066820e45473df7678b7c1d6bf1025074dd4c0d247c2d4d2'
            '8d83f00c0bb2b8e88c8c58da7276b97c95a857e72ba4a7ae95788c61fac4a1ee1f465724dbc17a779e87efcf242bd704ea22935394fe087932cbd06c603953ce'
            'bcaa0a5ac749ae3b970c1f5f1297f141d674730fadecab49e4802cdbbba3e77c3c28adc108a923b1c0225db6dcfabdbda6818370a3b13d52e44a06ec24929491'
            '97ca3ab0016d8957d9c1a00d1aa344cf9c48821c2e644ec860e52a989dd77856b0668103ad302929b121deafb6bccb67ad6b131c03de496233b24525c49ad58b'
            '228d848d21da8725174fe43f91d10e0486a81ae49d626e78eff1c94ec4a2aa4b003d3ca875e2c8dfa5afb7d8f411ac2858e62e925613231f010e9b59cc9953af'
            '14fa98bdb3d32b5ad4815952efd26b166bb2f6c9d9f1e9d27c0d63376d31edb3be927d735160dcdb58508f9bc61f5f5e06ddd6b6e57f8f3f7d4b699e21ffaee6'
            '8a7e78343f8af060408b73987b7ceb659b54dd1b3128d4c8b230d89457bee5e477e5ad788c686b7ced5c4422b3a312298f086721fb78fbbe470a92728e71a841'
            'aa5e70030676e4c2fbf04b0a76ab7f8bbe0d53f2a0b88c770375b3cb3b94ad7d32afc57876337308ef7d0be60d14ec2f3e96ba6e4255acedc6ba8e956399b7b7'
            'e8e4db176b66d21a1b51c8a55c6e5643545bef7d788023c80b703d447dcd93fe64e5090675ffc0a419c7255042a2fdf69e2c7ad8601c7637ae3b3c2375c5252a'
            'fbe5ded031d6de39375e4d9764fec4f53189cbc5058a791c5cbf516abdb4673b1ee82f62b81d4759cee1a730e22c0e4a1ac954b6779014c20aba5ced248e3db5'
            '8f9a830edb4284e4db7e12e8f39048d8b90a022c62d45c9880a777f0d25ec429c50122cb21108d50bfc48e6257ab7ef3299ee8462ae2f75e2f8fd90f8c535155'
            'f119792d1f5b58d4f09a222e6742cf83a0e9ca449a2143c032ad9027273b306212ebb97604bb4d7ec635b9bdd35a6ae15d775633d2089272a7efd4889266e4cd'
            'c74c6d2565f444948353d61642585c0790c9e930f1662fd0b267ee8a8975f0a6b034607d5448770e63be674dd3f85d7ac8ef7c024701faa66e68f28585abc3a0'
            'ec43ca2f2c3c7c8a7a09b45c17f402aad4a2883c17f0795741281575bccfc6766f8f60ac6e52d3f873fa69543ee341b1b0274c273e0ed595bfdd895e9c2caed5'
            '890a43686aa43c6bb8153bd68a414ef1f5947c4c232cd95f0feb7d85268206dd59ae367ee7fce517303dcd1996444bd29d1650e70ebc9afb48c76f22883aef50'
            '69762ca4b346e408466119d8594ba0c4122411fdce855bd3cbaa9bd9c48abcd68be3e4b87fd664a8ad50d7e66fbd602513cc6ca42e055bc92910e4c9db3ca7c9'
            '5611ed35ff09dde53d02675eec9396059094116569a8b7ed131cf386a1f936e30fd8969bdc19d0f8d62f92cf932e14a7a5a27d0c6696a49688ded5a235889dfe'
            'ee107859daf9b83cd0568b291d5429b2d124de538b37cc8303a8340dd6a41a50c736081be49c623c9a5aee3e641ba025b002fe68141e0d02f7b3f7e9ef603943'
            '700a0dbec9e06299e6989da4ce1decf6bf0c2cb1dc549bc7263e9171dd494af7248ff1cc5102af8a139d143580723c52f15420ab7715d91c7db012878e20abe8'
            '873f7a5ab6a7f3dd6752ef6feedce15cb4142c5dbcdb00555f9ac08b8e98c6c971b9627680bea87cffadadf19880d1dfd95c6ac22f528a86765d5cacadd94422'
            '8b0eaef7176dd85e312c20f7bc8950f538b84b8268187ea953c01897af1ac1d01151667d07f8fe5d719165560049174e8076173133fb25b803a075be16e67811'
            '1249539c3b8c33f75974e5d47bff1c1719d2312edb707464ea18838614711cc92b956de872eb69d6f0aef25fe272219606283d2780780f41ea335b38f6e70a92'
            '678ad8cca4566b2b0c21f4530d3241a4fb1810383d1c1a4b2202ee372054e89b6eb871e6d6a65ce4e6b16be4b6dec865a4b0adeb2d2255dc988a633306b3e0fa'
            'a2fe4168b94f5fa27d5832845c6f552f2dbbe7d33c6d0cb9b18b641be64e123ecb0fb0cd9a83cfcfda5820e16cf1c45d29f739150270bb366ce0fd4bbe299b3e'
            '5cabbaa7ad5e5e6f6549bb3e9fd1960160d5125ee598291cd5f9bf128c4ec823e298946f7b74491df5e15c6b933e3054ff083b79a3f63a0359c4b1370235f111'
            '013248432e676fca61c54191dd846d4d10ca1d543ec5a2b07703cac80efdcb6319522b4149b8e2339faa64873e70a968b450290b4f57a20d8cf7ba831652ecf4'
            '37a678bbc37d9da66f8e86b8ce5c67bf05e3ec4ce8d961bf7568813c71ee6737b100be41f9ce3073df6a863d41dbc573e023727d82cc81ffeecc1f5278afbf1b'
            'eca4a8ea5f2b5aebef6e5ac4d5c4e0ab5c528d0862d1cffca8aa040089f8497384f63d35aa75f0f12072769a2f9464f4cb2cd54938b31cc8b082e9ebacbcf14c'
            'bbcb5276dc9f0ecca57a205e75a395df9a9b1d466c862591d50f5060e3651df39d0382baa314ea77e78489cd730e85d4a5291bd721fc6a4d38707aa883ca9694'
            '035e5e6caff5244736ca8402fa93c4e313101ca0c5d377e8c325a4259d96ed7a44c03e9b5a6955dbfbc885e02e60e68e22a418533a7c061c2f6bf5a259cd74a5'
            '784911a3d90eee0bb8b389aac5680d5b5039c5e03ac609a92b783445a011e1be7dd97f5d2c05454d707f55dc70ff91f61e2f8dbf15f2050cfe4b2973465c330f'
            '2bf46c926e3ce986bf279bd87d2c1645edcb8f3f096d1457ce605331604ee597123665aa39050eaf40b61136d5f26ee234312bcc5f4a6cb9c9e1debc3a246d11'
            'b4eef43743e8bec7690774467de213b86a250908613736e28193548ecba02c246581ebf8eacddb1ad268dbe6bb70d087217c8cdc0640e8063fc91cc7cce54977'
            '8a3707d21e65454bc5891ba37527a45044082bb56db00e8cc72ccddfe043634d0e0c1bc7d7bf540ed4fe69003cb3ddc0431c0944a6d50d2fb90dbf2c4e1e72d0'
            'edaccee1e8987c211d615ed57a5fbba1e71d95cc2cd4fb3fc8b2a5d7a313393f1b2f768d1484ab32526ebc952c4bc4efa75a9a24a271d169f2c61a05a6344f78'
            '358bed53bcbbc1a61b2775a0ab5e4ffca97cb7ee4d1139c01a7d81621357f5669d9ecc19aff1b13d3e5f85dcc5940f2ab990088bbb7373ba65aca990c0811599'
            'aa62d9cebc3d37aecf9dd84b6fd53550a035a3177eede052327d3bb917ef36cdafd7ff4bfdc63704823ffde0bebe4a9888e24524deb3bc74d20d17aa47de9e05'
            'ea575f9545118b4d017abae1bd9d99af33d562ef073385b525478923f8e093ee62f2b6e28ee0d1e48d75543f4fd16c46e6d867a8794b1f33212100a0e34ceb21'
            '0656e9f4565de49b2c8c249615b45e8e91ac1ba4704a1a00eebe3f2f1f653f2e717e4237f0356c22d6b4f16cf4798f3fd558c8af7afed139d46dab16fabcefe8')


# vim:set sw=2 et:
