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
pkgver=115.2.0
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

sha512sums=('df3b4efd9607e8eb4932717760c865eb31ac7a96246cb4385190c33316c9595e0793a1f3c45ebb9674a9ba4fce98d83f71b063bef09ef307d92d1cd78d30d812'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '9a0c363087447b9fd88d1574e44b4343faa1fb171555663556ec6befd07ee654a6e713f8f6c0f8504bfef719d1d98968d26718fe07528e7a4627e97286457132'
            '679b81820d76f722f9df18fe28fe51d88dcbdd9223ac28c17978093877a6205dbfce6428d153bb2706e6871851bb6c840482a2c32795cf07de8c960512099371'
            '580fb01ead5396dcd62e5faf524ebef1bce4baa23b1231a11186d3a77ef70b64b66725d900f998184270e5f5f948cba778ceb68d2486976fdc0ce284ee72c6ab'
            'df555e23bb9b49300c0cc77bcea3ae15a2e29a62f44745507454fe478d408577c637951a82c5131e5c5dd686b5f1bc091990c964062a92f93d5a9e7f05293e8f'
            '100aaea526a25740c99252b7bc2777de2fe82c2461db41714b816d3603d80134b66fbac48e3dc64d9dd853cb20f597252cfb7eed28cc8d6a75cd4c22069d678d'
            'a1f0a95bd11fcf807cb32dabc72b32912fcfc2fd39d2f4f732ae4948865fc48b95162dfd1bfee2dbab75d46441b8f61b6f5658bae1426bc3f446cd82adde94eb'
            'f0b211300f7f10123959b644e52e5923db8ef001fed421e793f3de3315ac752643b6fa9645a8b2d45d1fea7bc00c8cf4a1d3156f09f92a1a57642eb430528c44'
            '7e139abc2c6381348438e02f794d3c9d757d98c270d790cc9916a35a3c374210a8ef050e110132d0f13ee32e462ab818ada4cbd42ecff0dbee6dddbcfe3f3ed8'
            'c2cef85f422c2eef9a00d86eab2c3ac8422b6960ec95eae9acc3de99b85b322cc5e3bd985ea844f7e0a0b8fa34889c208202e4acaf2f8adb0fa53759fe061628'
            'b08de87e38268debb21bdedef0098c0e7062c8854b028a29112f6d099d4331ffac212b719cbd4276897bfaa751bc5a7d73ce6381c9d2d2ff25bd338d4557275c'
            'ba017999ae3732ab0ee653e363dd623dd4125f5a9eecad171ac1f317931bff093af15e2253461ab064e85daa975a238a8b59e845beb1b68847f3ce2aea558763'
            'c6bd2e7eb3eed3b107b26988e41c197cecde858bd025d0428441b9c732da18638a8596d01785d08983301c319145c1e8a8c9a4ada80da4c8cb2d38edfa02b438'
            '155fd6751f8ef3c750eb2815f3b61d10747196fc36e35a36793f3d0a3e34cf4770ec9c071063f481d30a45a8263ba9de58c77135b481124b14d87df01291069b'
            '8f0adb91ae547a9f0e40b3d82cafc0f0d142db8019baf406b6aab1bd2f0d4793b9c9ed88b8301431c5a24d0ba045bfc74ec1ffc723545d6baacea3f6c2e21ed8'
            '04ace8487fb904439f875bfdf0fc9ff152ff997cf34a2b5a134ea71a7d16a71db9272d579c160b61e709b2fa48236ff9899c7cf52c9f8dd94051c594b3c1c966'
            'eab3213000ad264ab3bf16d7a0458a3e428874dfa67e5176f1f005e94b381680ec2756833740937c29e47d92dca52085ec4c22fcf804a24b1b7af6baf71bce6b'
            '308130e37cc855a751eefa8767dde179ef62429aaeedd4752a3af77ba9a6eb23c8b8b3b48ab44046e942365bab950d3f0f96e7a3ce3b943944e24bc7148d3652'
            '8bb25f5ddc88955c91bd4efa194ad47b44e234cd7cf09c8353b734b61249d1939848c2ca0395be817c3a67150e45febcdf788b0f2e619360c0f3ebe5518a190e'
            '58f50862c94c1feb676c3027e341c6f33796b703c846246e81f6b68df41514634a639017850222b8769ab522cf718cb6a81a89f5a9a7ad3c93195f8ded2a32bd'
            'a8fb0581e1bf62a938f1d145db6768e27a99a57f5fc1ddade620e70b5cb2af92ac1b7fc5683af485c4e04c911b469904eabf58f6d07f7a3d2655a83270fc8059'
            '7eed2a01da71b2614f14a3c25dea14e78267e2fd64d3db892f90c934df25b6b06eb4c96133ce0dcab309079025d64823ec89be4da07b7effc4fbf8e70bbd7685'
            'df1978fb781326c3c155192ff6ccfcca072d152112b4e66d2878a1bdd30f2b4f32f249f5161d0249016f1fc79ad18aee0360244bc8a91faac27f950ba475064d'
            '52782be42d171e9edf567038f9d05a1a26cbb899e893238a3a633e81745b983b9e1eb2dfa0b850302d40628f85f35caac2ad585999a15ab8bfd04fbd963c8341'
            '3f2e9fdc718e7756c16082d3565b89f1254fb88f7157f11b0c76c1d8cf1bf5be81ed8816f0aa091fbfb7aa960d7d0ccd421d7923d9902e47da743603ad0efc35'
            '281f83326efd213646c027528cd42cebc255a658902e69a4fd793595afc9ec185e0a942c296467d4dd4493d6173cdf9c821abc9194a1035b39a522da7933d630'
            'f39739bce7064326165b9c3b77a8b1e525110d07891316648a28882e2364b3434d05900813601fb4184056f8760a7bff4f57fcb8df92ad65c3c621aaec5af027'
            '3e76ae09f24f448f68fc9b344d5c15f960ddb8ba3d1945ff605b581afb6d8a4625889157f8546d2daa48039ef3e7bd7a2418fea827903a3526386fb6585e9f83'
            'ec927e079b10d3d4a78ddfbe36ed3290478381e201845827a04ec2ae997dc819c581bf4606f9dfa1ada385ad82129f3bdffba7c0e3a01cbe562b8a810d4b6c8a'
            '7f6c6a73ba1fda7375547b7ea67fc083827a40e06069a97e405cb9504106f39bbca35af525947d20a6f6b8a9bd6291df1ecc983c62d6eaf96256cf2bd26d8c7e'
            'a550267ada41cc344aae5e307a0045228a51304f6b2ee1c98b8e2954068ad624c4b788105e110d238027faca4cfdaa8141d4329a07622a56f9d9af8f147b4568'
            '878064159e96a002a6f9cb4ac75974ef142129ba0731b225a80e8f1541179ee9cf293ea8d8894eb2642e585fab29c959788b81a9257aaf6d5dbe3648f9fdf908'
            'befd10bd6c0c079c673dd8db6ace1914cc8433812b47cfebe3c4f63ad68d51cf23089493513b04ef3632ba6cab74aae9acbb33ec94365c0aba01b45113c044e7'
            'c3a51439553b3f6fad8f6f4cede9e7c3898c1f92a0c862959f3f916dfe0c9eb5eb45422d1e9d248f31548af4785c7fa8580c7fb4742af69de6b2c2c339c75611'
            'b4dd6701aa9691c1bfc7e0fbcc36c22705a5e91f25bc839be9bdde2f46a53d2dc8995821f5f82e3defb6a29d31084a48d120a15aaed993ba7b5c690ae914bfd2'
            '9ea620096ba24a10dbf7102d6731304413cd2a84c9dae50ab88e6ad0fc770ec75403e28b64cfebc31cc06d131007f7460660129954a8c26d1778918c3610bde5'
            'c10fe63edd7609281793916b05c0333a597bb37513a81d38a259b8995e79d2fb13489ff0e213126cb9b509c510a8c264038558f62ff3c17ed7bf948c549d8435'
            '7a479e3db42027744c199aa1eca2a32a4c6c784d8073763d5120dac5986f8ccfdfd9e410e0dbc2858ca8ae46b1d669aac30c5d8c29ecbff603f3eb435aca0fff'
            '9849a854dd8e36d7d5272fb9808b995361ec3c7194b6a3e9022a5211f56f198ef6fa8c0361678cc9765e922c1dd612c5198a279dc31ef274110bdbf1d38c7aa9'
            'b3cb4f8c63f2167c9edadf969daf6698c3b1f64133d8b157faf4cc6771c80c1ad5f3b84094ba7b407da795ad9fdd628bdb48832d4561c05661c58085a9eb7f91'
            '3c880378379f147c00d0f3dc1b4166d36848b6b18d044375b273df3fbf6c86579842012dd3a4292779d82b730079b40ab0d7c37526e0a614e0a9b0629a85fb27'
            'efe18f3747d3e4d31fb7dd8ecc9c24b93260ba62c3e71f5c1e240bbc566197663fe32f97e317f91aa82157412c9e2770bf484df42bf33ca809fdf0efc9fc938c'
            '839940299160ba44d5605ba3923b32e9ec5dd4b649da3e0277b34d1c02cb9d85eccf5424fdd3070ae26046fca94395388eea2801956432bd80c22057242d13c1'
            'ae47bbf5f1d5a2a12d77bf8ce1ae732f4a33816d1921e24f790388457314824cb5fe79b346ce008c820cefd5a295caa4395714a13c0c869af47da603107b7832'
            '62798d5911ecf7cba62b08d348d3a8f2c2b431bcf166caab1e1bdc3e4e38f1ff4d4830dcf6e64a63314a85ef6784f563c8974b2f6bbc66ab474cb22b85bfc449'
            'e487311b1474e636918eb02500307ea6dff85b6849b8a6ab63b0da9b2319233a0186aa9614b8bbd38f97865b14206d743a6261a280e2c71ea3b8714c6e012929'
            '94ac4438121ae1ecb6af95e79a83ccab56c49af1a5637da64e117dd11ea92ed3b853e2032c7490f57dc4618cb5cb312920df4099a40e58ebb86d8cc1056d0a95'
            '009e4702c112f938789a0e86983bd558d7ac46c2eb047ba3b90a8f5e62d7addf535f7849613c991197075d53f514db1bbf85f1df20454f3ce6ff0ac32b4fe33d'
            '97c40004ce5cdd48b22572c0c9f1a6f092eaff5e0d26bbf04c9cb90ce40742f45d20b00e501b83327cc37d1ebaf1638721c7c58946b91fe7b7547ea33e2b1d57'
            'c23687ce08ecad2470f922718bc77ca20407894af67143b42f12557c815250b856c9bf177c8d2d241e0f88ee81e09dce594c0f99ee4b77880b4b9356c2873874'
            'ab8da0bfb7138d1aefb6579b2b2ef282e36efac56ae42e3a41b70e17e8ef4678f2ef3d8ebfd7b33ac15d389642ae9f52a539ed9a63b8bb0e9c5832efab2a1625'
            '8500be22eee242b0b301f96f5dac9dbed65fa3c49e4aaace6ca1eec059eefe98af0fb339cd0b6c675d3489a8ed02aedf5effc7505aaf7b9a6b872ec9f267de27'
            'ed08c9b19766048705de83ad6916091d33cc5c02106f13bddf861973fb1fddb641978548a009c4850b975158b8a07ee201a1bc5bbf1dd9c380297129419a4005'
            '66b2361d73719f6cce647506cfd9e3fe904cabc7bd97a93d0c01a37101fe949050a9f276731bb6750cee5179389e1580956b8eb0ce6b9fe6003eb048b98ad4a7'
            'dca21f4300fc5047c41663ab72e65d6d1569858b09c14d5045b2efa8f30ea1c21507c72fdfa1a6e3d9963b527e6d54951b80b045720e6cd5a629ae15df18e692'
            'ef509ca121bd7f6251982cb6b850f638fe74c7e6b903f5ccef9838e5df22376a7c29a70e8efdb8f2608465d951639c160af24b964dc8c7316c1ef86aa99dac8b'
            '0a6944add7c6df4de696d833412a2603e317b545bf8a37fac35ea3725dd467eec52d93f699e44282da69c102e858629e15719f3e37270623bfbe188ddeb0c3d7'
            '997de3908da3147c737e3bfae9ea6d377351ede33be5ae3c2c8757312a70480008b88d6564b4eceadede8608822bbbe4af6e242ebcb91289ca3a7b95f00b9ab2'
            '920ef4675129230c31b21cff04a539324de0e29f37f027eb49abadbcb91efe0fcfed85a67627968f8275fd3932a75b3ecec20abec78e66b15589b728852d66be'
            '67d7c0bbc036de68d13ed21d41653fe0ae24ab08bacbb1383234fd69957e0452fdf6c6bb23da05e5b4aefd8f7c8685451346698e9ca9e56c311393e1e97f7859'
            'b17742b72f2217da3cecd72e2cfbb3668e2f919ff10f2b8bc83d758367cf5f192a333f30006abc671ac9a7d64ac14a196a1e35a893066e38827a3af11952aca7'
            '41a8ab8ab6140b62f5b9f5d1a40a0ddc47f58914353cb14077010263c6fae609cdbd29d518d8302db6e4ebb44c6609e0c96720bd7d676b27f426c6717d78199a'
            'cd9ec7a8c42ca0346bb5fac198f79e059b117b71b351b72245c1a7ce71fd2713f013ccee62fd479ad3a40b1ef2be53455ea84a66194605fc457b9ad712f2791f'
            '392f3f634f54773591b6b4114e6482c9c97797927f687246d97599c9b7ce87f2f8d45ad920c66af348af665165b58ee74026cb83a53858d024e68188d3a95643'
            'e345085a1efd0e70b63eeb9b15c696365a845b3f2e3a8f6f4ba1204831402916014f610cf583e596761d8c65bfe38797b3b77be7780ccb9cf015041275649c06'
            '239ada6c6d9bc538c43cbde105ff811de8114b395f9b454f3d074e73f92334165190d171e72a8548f0d363492c841c4aae76f513714cbc5e2c34345b5bb27c21'
            'a3b46359c10239feeba7eabf0d202f2c8619f18978fdcad4d263713373653237bfd1aca5b11b609c1a1c767481c83cc1b783295ece276a9b5f18a6b1ada97a6f'
            'e9f807dc3e31f11dbb6892c9e8b4a5942ca56fabb57f3ef5663f20563454ccf1ff77dd94da639e076b183c54283920315d468c51f7b5b6b7d73f337d24138c22'
            '251349d03a588c1dacd4280cdb4dbc5683139eb7bfabe0da099c2403f640a00a84c86b5a40afb36bb0702ce66fdbad1c1af7729bed4a9c1fba70ee68e92dab7b'
            '0b4219acbb3912ea6e4a351a68f4bbf3ebd0140230fe67322b9349d1bdacf76f1b5ea52babc647bea2c572dd3daf8a4838edbf4e58319cce42e46c1c3cf0a8fc'
            'd00b5323bb5d101545a9ececff7e35e9a8e513ef6e7ed804e55a3b616893213c55370b2235b729e14d283f694a9b209e925f3bb28a095263b79ac9250622b28f'
            '2094db03db570b243c5a7a63bc82b3fc5784fb4be7e2477eeddab77dc86805c503669e71aac899f079e397f3543b590f628502340bfe425cf6c784224b247a45'
            'a6d6ed3b4e0254082fa5546015823e1fa321b430335c57d31a5861cd38bd3dddc2965193c58fd2d79a12c4e9f34dde583f278a9ce7e4e4a49a1eae628c0cf102'
            '07023fd3dce85fa5c7941566a81a39af084252ce2d4e25d42593eafd42cdc92c6b14c6fed83e140529752f59b328aeb4a569cb2c6c903a9c550a74b687929dca'
            '3b5d0832b7824c5956110bcacd7d07e4fbe8756a84649aca30713cf39cffbaca080c12232cc0bc37566bc402e2393646d5fc3ed536270f6982842a0e15e3080f'
            '8ab5a57cfb8093b189ce269f380ca1267aad2a84053ea4654934254f65bf1a00952aed96441c36e75af16ab97e075daa4510c177988975dfea8a907f4c6f12ce'
            '51ebc1c389f9159675a76a246ab9c74aa94e2c633b7f65202e34a6e63a9151937f45fb63f37fd6f2c00ab44b47ac8ab3dee4469fb18d75ac18ad483c4eeb1ff1'
            'f5887b32ff1a5837735e49792c00fa322b58bab9f3661c48f2b650fd140ba1e681d976841fcc92331b01bdbdc41db72c1651637710ad211321375fbc746b8319'
            'a9f6f3c3e432a05971688e9a4d632ea42cdc4adf73c2d5f3ad6bbc4710741ea4c2a62e6febbc41af59b420ac0d92bf547dc6417d2cfd723f1ca98f3f87e7fa16'
            '41de86a5586d5f20e3aaa1e23e7cd3d906caf38febdf2e023e26e7ddb741c548353bb42a86426e0710eccba65e80d0ca1e4e7504b75fe3966ef1e35c1b552441'
            'abf1c40d176430b271efdfa567d075241abee801da0bed3b1d2745514b83c1d80376577825f1248f0bf621241cb7e7a914b41d49591ce0733fe7ca34f69ea309'
            'bc4908cfa395354aa302442adc9097fcee5d16c6f16579109927b8da54fda75af6ea7f86a735f6c60e7665667c84c4fbc01ba4200422c86f266c2b221265637e'
            '88311611f2fb1140030e19923912baec6e8ffd432dabe316e559a5903922e32c509f4c95b0b204a5fadfc7850e8e5da2f304bc82075bf158f0db362e4fd80c2b'
            '636a07388a0735b3ca332809e0fbb1a142f30abda6e36b6703a42a5e50e10d3a4655eb2b717ca71f7468b69025cefb8e2fd13c1f471f48e1436259226e2cf3af'
            '1f2adb5df9c6260d2af8573bc6641787b41e302b50fd7dea248acf6caaca1b7c72b7f1f08aee3b4df082c8199e863b0442b9b9439fd13a0cce156967414ff763'
            '617c743b532a2d0e58a061b0cd0d905e2fa3f1e07f0c33743907249465673a8422a539216a539e05abe08598ea20eda2e7a0069ad875e129913ccc34fba21c31'
            'd0991fa8b12df7f15a346f4bd1bb6563d013dabd6b1c591ed2c5d2e0bc29d4d3c372dae92e17a610844f3c96ac0bd526aee3391b3a4edd891c8e553c9fae5475'
            '35dbdcd5fcba2f50fa0db22325015dc64452999ef0abe8feb8c343fccd8360e7e45f298da22d08ecc6cf28c068a6614ae43c1332a9d12b078b74949bc2411e44'
            '2c1479f9ec723dc1db7ab691489add38255aaa55840c11681fe4e2199940c873938924d4c65ec646904e1b336f151965d294160726bd845c3d85f74f6058d031'
            '63bc2d7e96e13b078527006457db36398e5c81c54abbd59d545b11bd2a5b5d4f87ffe5efc303854cf5d0d51fd3b25a76d4d75ad0a2307dc2de07cd5dc2dfe8cf'
            '0000271608e8708face76695d288436e18d95745fc81825c39764cb77bd35d99d44eb759a450c346aef0698380945113f2f32320de8f21cf40a16ba9b1724e7c'
            'd4929d225d97a818cf9e189e57d2b72cc8c0f10a386eef030fabaf3a4f9c935a64c3e83918a10de3ce89ef9b0fd68aea0c61d1bbad18cfc484105d41845d118f'
            '611d2e7a27c778f2e23a4209017f1dee82b30e0fe9316fe9e6bd3a67fa32b9aea0f9098c7085c75697bdd167190136cff611ba67a3aa3a6909911bd5441fb1d9'
            '599535b0d6ab71f7a375c0a851537d5dcd7a1e83088a7eb9e95cde3a3346f08aa0105b0579657e3a181773ce61e69e2c6ba319f7460c68013917be15b3841ff6'
            'c9faf3a863e98f8b75cb44ce427c95f2bf637ce330603aebe4e9c305abf04cc6002853c74903b114b066bafed7de760d763b4d97f40c9571207551da9327c7d0'
            '94e97e86fc3c609530d058f022aaa22188ad0af0320a75dd1bd43639c5a289faba50cefa68f666264da569fc9c5ccba77481e40ec55c2495cd8f4b9cf2768a01'
            '92a64faf2552f7fd381b62348525209957d7cd8121c70066391d7a5a23c2f84d44c2ae26db36c8f4d0d4741083fa9bab746a893be5954fb3f6329ec2005b1094')


# vim:set sw=2 et:
