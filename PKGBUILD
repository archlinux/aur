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
pkgver=115.3.0
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

sha512sums=('4a85095620a61dc516cfce6f288ba491a99c72a78c6dfae264c1292f9eba902e3df7101b97a6f8531114ccce421c92586e143872798aafd7aabbe98a257692ee'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '7a2efe4ccfeddfa34a6905deff14f1aca69287e8331cf294dcc2692316e3c2eccf9aab0161b14862d426a2191aed7c21718b7d09293ea2b92f6e01f97674f42a'
            '8a78188b3a9ee53596ee74c342008ad5a07edc598883a392a636125021e412719994d2254dbb2f3acfa2957f380767ef0a87e0d678160ab76d06b3bf7836e070'
            'ac2fad6c99d940f41bb351e55b43545e769d2589b05ed1e183228abde5ce0d5a93e5fdeeba469816f8d7f8b6b4ec9b26e1de9fe7c8073c1ca73f08c558212414'
            '668837dff3c1e88ea300da8d0291e0c4f8a40cadbcfeef18b7de64bc40db87760674403bac042bf16a0ea53a5470909ed2ca0506bc5d1d6b323395059880c096'
            'f0135284779fc122b38a3dbe92d805c4009801d03d306857f373b3495fbafcb6a96f37622dd59aaed80c34e5f1a4f59258f8753d5c45fb34e5eda95c24175f37'
            'b0a09c0784a8bb657f929acf64879635976840a7106bf9fe8e23d1a9afba13ea2eae6c871776b7a9a1c830ae799c24fa6c69e2fd3d72040fa6994270c78c165d'
            'b25ce1ea779999ec5f68ed6be5e9769e129ebe9186d389b7354a6191f8721d754d0fb7b77da49601c706734f080bcaf795f98647dae0171b9c4d3384f67da279'
            '2f56ca2d184840784b97cefa6b8dc3f40816f34e902bdb325ed18aa6fd9e1c5e001f9f0262fc6d419df86be38726979d292d6a0ff90e8580b343cc78a0ae46b3'
            '6ca6f4319d4016d51aec8f596432d9ac182d0dc8451aa3e572f3ae0f31c6d04bb30ce64c5d6c02e422cbb3013545d388eb00e0657beae7b5167abab50df21f29'
            '87c769298f8370c4e20175ccb470e931935d9d33c43cf174436e8ca2d4b35f542d3ad80454463192dc9a3e0d171855862883630fa32286173a75aa2fc864b96e'
            'c5b4029bf398b823fe496564855301576799318de717dfcb3e622e8200e39e9b727b7db5665b9440a60e80a05117448a8249f76a25fd6683d64fe6b2df03fa49'
            '727b5d62aad4d0ae7be6ecaa9300b2b7f50a07933afb330d950d41b6e1f07de27c86528c9b3754c1d503a00f7d935fda43bcd6c7de28a0112b925ee04fdce49b'
            '9b87824038aa3c0832414d47ee5c59afc8d9ab631eacfe5d79a7ae4235cc6ceb1b6b881d37f55b801cce66e4616cb73b8803e8c2143246e5b2dad38f52ab7224'
            'ea19020f9e4520ab0c8d5ba1af82c7bc2a218353737c050b44eecbce4eaeade1b3a864ac2f05d4dc74b42e361ed3f593e506d53ef98100918e66932d4534e9ce'
            'e9058b164e803aaafb7680014f09c28a75295d7537909349e38176949180cb29e0e860bc863466a7cc80247d4f6d505b186a7660754bb636f19d99608bbc43c8'
            '0a5d369332ea3a864836496c8fd4ac4d6c575a1bda9f956a0c8ac6c6b7a780cabcc6b2f789657cb36e60cf123d9a4ec926cca9e897c2bc6371a3e74acc9b6d4d'
            'c89e337552be6de62c51c9eb3d51993fb55a3804a67c76bad776f5b66fc5aa436038864f4f4a3a82c4e93bf9a60661831aa1c2382948c44554610ec8d9f5bfd5'
            '95dc2973201a9ac9e406a1f24ebef5dbaaa4808f3c6245ef0e0347cc8fa23aeaac4dab1b5e47225ec7b26f153a4f3e8250cbc6013310805690e74e16a6fe91fe'
            '20becffba335abac89cbcbdb459596e3557500c64eed02c26b26d1eac8eb6ffa8611be35f93ade677c8109128ba2264b71cf123003c5d3e8e7071e45b4122ad2'
            '8f26d6f1e39d4b65b767c488cf4b7aaf7eaa8c037bfdd8dea4baeaaec78946c4e93fd197b50278a6359b6924daa12d00587d37db75de79eeab0a34d9fd9c100b'
            'c34164ed7993d166cd66b679b37f1b80d4dd8a201cbdb5e7b82dc91d112153ee915dfddca71a0769afd69cce77de22cef1e16a7c889f3d47ad9e2555ecd74281'
            '84a36a17c51b24b35ed00f3137738d79cef3d42f3c079c840259b743953f740667434113a719856fb84270f813940c73f3f691eb098769d0bb6ed8273919f445'
            '21250d7d6a8916f2b58e61a6f76f1c204798bd26ccedd632a85b28911dc99156a1ceda32af309848ca953808973c5ebcc1db9420863ef7dd0fec5a1e8e9b405e'
            '487f83dddf8f0d9cee12aa7bdec4a6ae1aa0d15150a73071ab50238694f85ddf2da14d1a24737f40f028f7dfa47a91faa7d5f0761a56847d12abc0276ee1e5c2'
            '6236b7cf8e91fb3083903bd0610db92410798a898e854a4adb77342d186478b344b42daada9c927dd5ddbc21ceaefe7005213e694663223946106b99b3a0bcb8'
            'f0a8ec2855d4ce5ced2424d87f491dafe9022085556c7af803729f3364e7bc5cad29d2f77c9fb79988e5127a6cae12286198545adcdbd2f7acb3b516387a02d4'
            'bedddf41febc8e3eb4de3166839bb8c68f026f4f17670cbe5b54aa82a613c4d42941d556eb6aaae7da73410abb87de291587502a5be0637160e98f28529114f5'
            'd1ce44f1f8e0bc85f778694354b69ad8b960a10fe79681f7426d576d883fb47748c0499388236d92ae8a337d0defa6dc0198a2cbb41d186651972aea0e5dec84'
            '75356ef0bb7659581efa3a7c5969448d152237883e2c5b13cb8c55d06a0d44d92931383498687e82a67e1d0f3b57e6589fbe42d23d8472da952f6d88c2dddaa2'
            '65413eed90b1a5284884ba6474bf89eac707874aaf8dd3786bf3127e4f049a4f06feeccec896d26a6799d4e3455331c48fd2c67683fd364de631b471e3a270e7'
            '5b2fed9db85074651fda96cfc4f70fa3547a0e142e6dbbe41781df1ff8cf061d5534283dd184ace6140c4f537563c73a063772384908f536f77225e9fbbcb25e'
            'c4bd5fff242dc9fb4e8c9d1e7153a13dd83dc310ff747387982b3b1e11a62b7344338ae21a4a2d264f94a52e13b9cd10330bb757919410a0f806cff79f59936b'
            'da00cf0b5594ed6ce49cd567a211f733e5fc2896d5650b88419e05188ce20a54d66c5255bcf1303fa7ad3f56f89c6720f0e274b09f1103eb2c63e2990f4d17a4'
            '3154c78db0708eb9f109d8f719d796c37b252c35fdd4c14a032285bc330f4fc2185d5ed6ff69980321cb03d30fbddfaefa2c812b8d25cca1e192c87e161b22b5'
            '2e4a5eedfec75d459bd13fabf8cf979f247fa8d4314827229e8b3372b53380232a19a7a5e7175250e55369bc9d131084bdc7dca902f5944bddfc2bc531debe60'
            '26eaee1dbbc91b6276c97334eb16f3c3f1acbb7304eb424599581bf2106e1ba37e2f4cb53268500c1239faae03b64acd4825d98c35623b648092050d7330954e'
            'bbb86a47ed64e2e9eac5b95cb0bc14f3812fee0f0b8302545c95b9ac813c90016b6a8b16fd5fb5a0af6f612557ece38a4e093709f5bc87af37e91a2865885cc9'
            'b27c245fef9828a7851953b3412954674a8a4d18aab5e81c879e914be4c254989c9abcf17a90fea506b9418f34eddd17fd4868496f5dac7defd602cabc717a09'
            '5ee7fe330a65d9029278771fd1357977fbe080a5a4fdf39f3f919499ab8362a67b4b7aced5949607c67048eef5d0b01893d03b735a66a51efb1339d1019a2f1e'
            '86675e75804ce1bcf2e297797e3a4309531f31638a6896f92cd4f90881197f56aed1417571feab5ae17767582c8f1bba9bd0f47f6bf6fd7385e291b24d9898f1'
            'a3f70c001825a120ab70fb1f46e902f887136a7b677513896af93f1da7c28ebcec33099d15700646d0516df4df14e52e9a953b5504f71f395a97574cb754b537'
            'ac1c80ded013c067262605875aac0532f0af246462585ad65729ed469f1f605ec83a1fc07362312f221c405c09e4ad9efb8e5e39779466319c2a1d09092d9f95'
            'ff7ccdb8382412c6f1070fb8f911669d9ed3137f71a2e06388488a1417cc0bb9200af7b9235643319807027a152ba7b7219c1f30dcefda60d27b9a63292ccd53'
            '9367c4b197b9121bdb43bd86341945cb0d7c29112d33d5650744a903408a38be3382b180f1b8613efcc1a865e0e033c82041e55fecdec81409b93406e28fe5e1'
            '7f69359c4918da8820e193ac574c7c3deed8936845995669760c9f8a612c4faf25d7f97d472e670476074ccb5029faff449e66429e4848b4a8b3b85efa1a7af6'
            '5c5fe70d7af0a9cc09e4db119c2bbac147a21ccc34b90e9b27226b55a63c0a9a41d3e716f8d8d4a78ae138aa4b21ba369cc7ed8320feeb8665290d8ca0060780'
            '2802816e770b9105e2e322963983369cd11a93865e6b828aa2fdbf73ee49cba91dacbe00db17dceec518ccc312696b0fee2733fbac70f4ed385af326f7787a69'
            'da9392fc5cc03b8249b90d059fdf050659befd319573d7affa23cd0a87e3980554fa98ab15e1e0e11621b75380754b53a1128cd894dc397ce5a63e47246ec601'
            '91c6ea8d34f09d442471964fb61fe64930768289db3d0c03b69fd43fc9a5c9d566e08b86814e618865ebdec2b11a85cf05977de830ac3759873ceb6b0c0714a1'
            '8d2fef1ada4273997cc415c7316def0e7a15e657bfcf17b01066e90c395527ee0dcff572ff2d0f0fd15f0a046f8336b686743ca174864983afa4640c03a3eeb6'
            '0f4a074f0063e5ef8be840f8cfe4d9ecfe7b2ceea447bdb6aa0b5136ccb27c6570c33d8ea9a056954bf5f9855d57cd8c5d56c05192ccc468729d32e89ed26d81'
            '9e7d567a590a6c96ded077b3a99c4bc29e8fe6cd74393c30047a93d6bfefb56b91325556b369e28a30d9b58169a4430abfe4afda1407804f63a358efee3a385e'
            '7607b6882e4f1664be7dfe91ec8db950bc41d0a8a8f03a3d34458935d1dc573ec1855fa27340c937fc8c00afd4d292ac48af00ebfa703a892b15e635a6a27e3d'
            '2ad1292836451f98af104a801014d1e0ef5d821f5b831202d5d356d69d171d1660a379f1e4b7115b0701546c0fea5cac90f0bbeeb692d102601941944711dd7e'
            'd5ee7331132afe88cd8c30959b8af6fedd8a76900e0b520172a59d8b29f162dfe267358c56170ae1c85e5dce384e2ba75666f3120488bcff7f15a2bcb821cf11'
            'a7b93029a0bb3e4d369408329e6060c60d784fb802951702805940bada481fb8ccf8f59ac9f4f7bc46bfe18deefb85442a7df2ada682300aaebe1803a846754b'
            'e3e34bfe30ee733a888396fb1ca12321903cd5e40f992c4683cc9e5f502dcb2080d77cc4a05f688dd8b903606f94e6f4183a18522197a9a3ae55471668b5e396'
            'd2af8cf955ba7a8ce6d3b749bc70de61fe0245b976bea3116452b7c16d550703b47d30d7ed81d92d2cc605d1c488a76ea556008ba8976213c8b4d2cbcd2b6719'
            'fd2731b642fe02ba6a793e798f59f2e02dfd3a891fe818caeb67aad43dd1ac0db4491f7d5f9096a21ca5f59fa6148652b6c47a6e36d12bdd01d38b73860ec0b8'
            '957329bb566c1cd2fc9c49c3075de1a038484229ef53d17dacba09555cb9916b511142007880d188aeaa1f9f2f7e1dc94d3d38da86c150c391d1f74da90f5935'
            '5a9e9df4912a2203d38a081bb9ccbf41ce7a9948315b0dbd9b7d27318bc742fa0df4817d5fdb8004968254437ee6bed773eabbd27a294deceafb4d28cbe8d999'
            '6e8cb360abe4f4ae1ed8914e797700f12ceb4df00f2f00c1577759f6cd59867f24c7a6643f50ea2743f5567d853f2e7f0231460e4936b50b44b40c396349ee16'
            'ec96fdb4a2c98d423654b39c13368e2d1ba36494cb707c55df78b6922741f7d0c847bdb5bdb48572a82097c93375656ff477975aaaed047e45355dbff9047b55'
            'ee6da11adc2fd135be4f23d12f10e2217537b7e4db777dfa0017260a3b65aa603ae91471c67065030c1ca6479b3d4fdc4d88573cd2a8c745fcc2f7fc73dd7c15'
            'fc845558a1c6989b5d8dc282d7df3dab975fd094222c86e9a7ea3f1e4e72d3f50b91c39b6d3b5aa5b250c7f45b038cf2dac67e1585401c50af8472021d615072'
            '9d09e6123aa9867458059f502650a95995b1898590e53e2c837492fe1e1aff8efd92d1323692d9b2d238581727dbbd5f2f0e88a9c770d0e97f43c586e3a643c6'
            '4c5ee15f85b97d4b43e922e66448ebe90529e1dc22bed1283160270d0dc263d1a5c6a226b3e873802ff60700baff1d757bd1c82fc3ed0a579cfe70540924ce80'
            '4f8586c5b0df788cd262fb4383490701f13277d997f162060a31e080c6c713f1a4df50a5b06311fbf76f376d2ea0440f19c72ec5c4c1721423b37cd5ff0ebd89'
            '76840f9405e48964348bb9f551d0cccd2fde97d8213163dd5649de7bc928104d8c400dbed5a7353598c246d574c7f43ead704544ce655b755ec6efd2bce99bcf'
            'ea7d53b4df06aad6d595407a2e7a1e1d62afb01afc67c3f84d7c82c3ebbc57d32b9de22ff25ec55d6a0f7acff8e385f47067f26684e34ac4445c227302e4431d'
            'dac5635d71a883e4a8835f7ecaa7a9f6e61e7e93eab7d4956455e897ecacb46b56caf9251fc8dfc3897777fbb7d3255d2cdd1d0a587d90c226c273922995d669'
            '798eb7181da5654fc26e5ff0ed2367882a52fb72d6e522aea218ce8f281d3d1e96b9cc22756e9c6f1bfc15146ca09e9b8c7c6ea049838f197bfe5d97b82c8e52'
            'f0fe2e6339ebe0a6357c97b61dfb528deda2efc63757c48905d9d85c69e0fa8a40844f168e5d97e25b7bb22cbfc70c1c8985f1598eb079bde94271ee23e6a9f7'
            'e862af9426ee0763001c2b2e9c67fb5d14afe81aba7946fee4a6a1da27009994ca3a9d94860ab07caf25e2aa4576ef81c2d84b454b6f01fb447b421a2d83ed0c'
            'e76bc1229a5575a6588d9a5ff3b76f64d82f975d97530ed6436c6927d93f631e0dc02522ce03f6e0c036d0409d9ab1b70cc82ba52bfd1593c41b2fc3a9b8dffc'
            '8c81d8dcc687516ae4bfb21a9b9dab795a4c9bdd11b4d92f8212d23381ed002d7324ff1af49d247663eed0b1d5b1dd5d96000325f3961b69b92d18e0efe7ab1c'
            'd5587f67619f3a006d860709e084cc600db3f98c1ea7118a43461c7d49cd0dcb3905cb00c74a8231c9fbb9adc181b2db1ca5444be1c1153803a0c48c8f1575f1'
            '43b15ef0993bb1608e262f459a7058039cea062566dab16d21d797553c5ec9f2dd9912f61a89a600ae00311ce00c4eb0f09a38977d3b37a750d82d307e707675'
            '8f06723e8f0f20cb986b6ab64e83041055f29072ce03982e6fc2dc8b6fb0b670a20fc3bd0e3855534e2634f40e78158aaf03a96fab2c8d78e6afc160590ed358'
            '8a64cdb587b5c17a1b1cdf1ee100d098dc6be91cd7ea40d5af7c1f54fa6b0a6b5479a7f35d705d0e89896c4bd8fd1a79aa93fbb6b8d951a1dabe7ff905637350'
            'b089107406077a5035dd3b6addad2332acabc2db5c60ca3a5a59dc3d4fa7d4bb891e310f25a89dd0bb597b9818b0b89a0b5b26ea95aba070f52fbc2f1a828777'
            '4ae8f2a19a8c80990f529b9d74cb7b3d902682632425fe53688f32f77090d94be99f47947e1742c3604f3cb4f572b714203ef6e55ad50e3a0479d6be21b42c94'
            '7a3742a9c4b68a19d667cedee5a18abba00387f6709f454f12a3bfeb1f05d7b23defb6b21c8b939d77ccf506199b20cc2ee2c09137476b32c53b2d6d6dd585b3'
            'b95b4fa141c49d7934d48868549e27c37a6a52ab3f8901eac71388f059b74afbfa9fe13d2e859ba8276c28e1798735e296794858913b1985d575d64cb1bedce4'
            '123cda2d694f5dfb5a718bb3fbc2b5b76c1bf033ec2f62a938ecc7ae9c687a05d5ede180031bff869db62cb880917f4e4a9465ca24b26a50fc47f38bbc4d9cff'
            'af0c0f336694ba79bd07399c50da1e3ea9d500f21274df99e9d2a4ca3f550ddd2964ef8fe1e89741a1d615de4fc5a16b8ee676c254f43727c50cf6c02f83c690'
            '2b18f040eaee2aab06caa471f3f7792da9f44e18f217945787e5ada0364c3d9992419bbdb101353e1ef03e9eaaa693ac1c5ccd827c15af86bf3a009b0d29f30e'
            '1ac5af3ee0a1827889ac68fa4ceef369ccc27ab92e29565bcb25bd28d4b6f8249018c29e9ca78f0d036f16687e79a1be44256cf709236bedc83ab5894b6a7dcb'
            '01dfb044c6de5ef6df7d8d7791bab76c7cc48ec5bbff95ecfb0cb255b39a7e2d343ed0de7327fc959c3f7022ff6316c55c58ac232e2008fd22b483f950fb44b2'
            '580530562936915e9892ec41ca1cb92e0156a1f128031fbe4c9b973d2049f58f4c97f9454a4a36ef8d68c841758a18b792967de744f1cba033ade26943644259'
            '14b83d2e33c8b3d706c543ae7a76dec099741fe492db34e44f0262f177a3341070dc8a211bbeda975bef846ec2082863fcbc8e59abf4513a470058605dd022a7'
            '2f488e30549cf372f3cc8ccc9652f3966ba81909c54f21b7f0e9112e6adffcb50f1ef25460aaefb04258bd3fffa42ac8d11484d7f635d1f1114c62d17fd2abd1'
            'a91a5211833eb7561a70265dada85c4d7cfc18e6da015b1726c0ed0c7bab9918f50d100b7ea1701014c0ff2cd5d22131db308da509d2dd161681b79b0f05feef'
            'acd7f95b63692f165da9b881352ba053317dc5606f1b0874c33083630a70e95bb9b69a339a9336d057802f14f0f57c72f6b5900a22eb04c951df0b7eddda7b91'
            '71f5d0a8dd9ac68a83cf0cbf28b33c8b0ad008ab4b279abd840e0e3695bf1cce852af51bb95bcc84bc6f5bae0f2b08986a6725fbefcbf2318cca8f915c7bfa08'
            '93aad13cb9075e00796b79ea6b9f1ef7b7d5a85177c3f380ba1a7bd799d37150b48307e7f7a312a6fe4b029bce891821e712e7e725145892c04697154293cd0c')


# vim:set sw=2 et:
