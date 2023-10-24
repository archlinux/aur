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
pkgver=115.4.0
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

sha512sums=('3ee680c5c503df7e4913794b7029ccffc10889f8f259f16030b24c1c18c1528439123532374ccb3a7e7a0d5d64068949cb85638a29694a7d99b74dd403ddefdc'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '16ef9451c1661b3369b19e641f5b859344beecd0e33da51816f507ee70329ee67c312985f8277177ca309cf028280cdfe1dc77ffd03eda6dbdc4a37a3d0b64ac'
            '5482de6e9806a2a1caad197d49ce05a0e7683efbc6fc4c95457fc962ab3617b40918b09ba6e37271f9d360f590484378629753aa5f66348180357704f393b3ee'
            '2e277556f5cd5784a9c197b38966e2aa1d61c944fbf4a0304788fb44546b3b83f20742124a885941c6110a2b2fd38d21e4912dfe7eb067b554ce54c293867dc6'
            '27af768fc59faa991ddca5491aefc0cdab262619f59d351c5bfa53381f85ecf39bfab54a17ebf682c1d525c53e8f1a7c229062b7ef561dc710ca208fc697ace1'
            '9fa37e38ede8566f626987cd97045c2a8fee08118da298d55e31d55986cd480fb6496676bef399e87a8a19794f48cfde08c360bb6513ac5d67ffc53ee9e6ec85'
            'db5599cde46b79609b19791b4d0a4ead28599902e574aa352edbaf21bb1b51486fadc6265cbe7f8a51d388fecf61f403fc4f41825d32c46eaafae15226135933'
            '95b45af7e86f0436fee5b152ef2c02593543ca302731540f368f9b44871ebbdc7bad505a4c26a7cbaae76b36977bb4b255ab39306fd2f341d18490d3a50c87d4'
            'a058bbe9cdf0d216056bf5d73f7a75439cf00168459b86213fade6afa325318224ed4b096c348116614af8b80682115d1cd07ab5862d7cd71c179310d2d6506a'
            '591c2c4aff54e932747357176b69313d7b0a373e28896922849a313ec37127af9959a4bb9b09580f84ea59e8cb447c8bbe7c8c07b4bf1eb77fe57937041a873d'
            '66215cbf68f2d7a8c445e3db70c1336c5aab0137fb2fcbd8980f0d2c4151947080c130a3abf548b4bed343d1a1df506bd79b2b37dd6f72e087531c169f07bcc3'
            '62469b200fc870d6dd23421416e1dc21e1ba06c48fd53984ddebdaf82591ad4f3e7501baebf78577c8aeda90287f8eafe726e3423063167d1bd4da6671b0ecf0'
            '8139baf0b63ce41598594651ba91f1134709bc51791c1b3e82ba12621ee304cd0e77957c3799920477d4e7aba6805a8c0904997ed3ede031915694fed5dcd961'
            '5b60fcf11258b7323f0d6f520c02143f53f9a6ab4f9c769882949089996c9344dc867fe4763c6ddbe31444bdb3daf23b5c3533607b09e04380879570d823e89a'
            '6d7b762df65e8c0ec1e77581b11864ee4d2a91f1d285e39de943b385901515b580c8efde3d7f8904a44ba13c9c09c35e8b192d34e785b9cd634566b7d1741bd0'
            '670ba9d595a62b764726357166ed9edc0599ae333dad9cb6cbee194b34cd68076198299cf12621a6269dc4717eb4cdb81258f0084340f17434634e449ce308a9'
            '464fc2e25a9c62aecda84d95a72195facea8e7089221649e221bdd4d274827b05f7f82c311b6e60036c1187fa971dcd03d0c0ff201f56bdf315caf312ba0f6f5'
            'dd62abc877576d239f1bbcaab34e3d159528296a75fe2bb740d7124b8da90613fd85084d9dcde636dc0a0f549e400cbcd8848f7575e5b18b0f7c298725388b8a'
            '40050a16ac1a9d32e260b697a6687e90c2908658392fb77475675ec4605a60ffe0cf2a6bff23e24c0f87d2cfb8b5be96b438da55cd24551c908652c74435de5d'
            'bce3e92cfa7281c998ae57fa52ffd9d52db02bc4b28dc327b1e6c26b27a5af4a2e97d6d6eab5749cdf64f60b875326f558a5445f3ca181ed1377c01a47b2ee81'
            'c255daf3ce1d6a6217fd5dea2df9e87d3532700ed43da33ccdd276d7041450547969b8d12686394ae1fb4eb717dd152c88a501288faa638bbde87c276cfebfc7'
            'a466e730fa86c3e7c5c24214b3f9ad66559974d4ad9a30a8ad2e185791ec0606b8c8bb6f1f01e2af4fb0eb920e5eb629909f43dfbf517270281e5010f47e91fc'
            '6beeba999898503fe98621200b3ff0babf09db22b1b0251544d32405ed9d8c8c742bd864b0fbc414d32c661bc8b7a5d6d5c548e8a5284dcc1a251b62d66d749f'
            'fa1fdddf19256261b3011b92975ae0176c5e5839cbef8c123d8682785f5647f2f78dfd054b1d866569014f96b0a32806384f55ecdef008fe1eeea19fa2183aa5'
            '68ee2c2048ce417f1235a325b0d9b489baf64e9c0a2ede0361abe9565d32729ca2a02ced21b96833cbac3dbd92ea7cfb6c2bf15361f56d7983fff711540bdfe6'
            'e24817e0105f4d1f6da8fda4174e38c5707209f1b21925060391b151476deb1e50d7d0de50e1ac2fa5357ff70da73114d8b6f5b8e1ad7fe0cc8495deae6646b7'
            '8161d072f699b5436e56428fc77b921ea13f43c929ee477f89accad361166b205c22d094a41348990df77086300af0cfc2c67190532b90b1a0d381675231e9cd'
            '211efe2fea3723e63cbf05a13792d0f55ac563dda89ff5adf90e9bbd37238742b312248b9b6cb775016a707232f58731b8c38a6f4f735991e39ec76ebe70767b'
            'ad24c5a3eec82fb9f646969a1c55aaaabbc9a8cc8300792472c84cedeb1bb16d849cda1c0ae6e2e27cae9e06f5bdcad4bfdb7d45732142d0ba3f98509158d91b'
            '72e0e631592dcdd73b4e0b9ffd00802580b8110f6822024e3f36baae0fd6fe7f617f30d78f864309576261f0178633fdb741863cc95ade26db97890bcb9b7270'
            '0dad65c855a24e10b170dc70802caf50568cad40e55911f74ecb7bdf29a8be1603277615629a1495965fb1c03797a06164669c3f5a7621cbc38de35ec28e6f91'
            '8fd8cc42b6c7cc6a049cf1d6726345f8857d242cf01a7e5db3b439b382c090f30913c665a447a729ade44a76287dd60f77683d3a7347f5f6f1388f8a2eb4f9d3'
            '45b834764f5781131daa120193ef7d1bcc80571887cdc7df93fbb940a44019e7fbd24dd695b80b9aae265c307b9b4219f31ea86b3285f71130584bedbb64d7c0'
            'fb250dff94813328485531b95995010f2888c836f1dbda83b0dfdbeeb6218e53d46fa78807482f399ea0956638b05053a4814ab46daea9a69231c25ed6cc2a1a'
            '59af70c39591489ca7ae172043913ec4485741b2f4ef86734a863203ac47514f637f5aa3671897203ef27adf8c4390355651ded67f7053f7598652c3a9c3321e'
            'aae30fc1265bf45453b182a3a71b0dad488997260941130598eee920a3eccf67fe8a8fa06ca4bf79f8217a9000913eae074c90589deeca2e67032fffba1fca66'
            '12399d063a1b21995d07cc9d23e41eb99f5f4efe586d8ddfc165dc7a0203bbee5f0b58029c08b7bb90c691a855d2c8bea9e65fe2e3193e409af8631dca37e894'
            'ef629c5bba2cb92944e0c68a44c63bb3bdbec9d6f230b1ba5c07b0cd6f9872dea2ea2d71deab4a99a0bf37d9302eee6ca5a82ce93036f8d8ae89ff083c9bea4a'
            '0072faa6152d257860a4cf490b8f53bac0015a398f48bd1003104de95621a34840bf2f7989cfec17e4751a77b5507f6ff31404890373b581a36f57332abeefda'
            '273820ea1d7fc90eebf59ada315920f94a19e68aa5458d501089c8dd11a8bce46f829d577832a663a82512564869f8e1ad371e0c5fdac21756d8abd5d67506a7'
            'bc8eb6057c115d693c5907004dfccf4facece512805f8f93d5507f0099a239e7a1a7ac461c94ac6fe052f7380e6712968a89a71d2a117ff0708a85e3c4ce5d90'
            '1a2f0d46ee936df49397d54ed4e9e4b750184b731a99126b347908b39c9e2c2a4143febc0c2a403178fdc3b35ecf29687d936b57745490137aeb26f704b8fb0d'
            '1292175704c404b8ef1a6f79bc15d18253714142522a3cae16cf44e5f82efd917348f06b3925261d939d1165f2ceed84f483f59f3f847a1284cee59c5c0be542'
            '1a47df8d5bdd4f602e66e0e6b20f1d169faf19a0a16f1e2e8066c88fed2c26c86db7a86efeed1fe8cdd69053f759e6aef2abd998e985457aaf7d8ec08bf15a14'
            '6fa4a8f1602bfb7c610ac44d6df410fa603839b4ce5530988f8db45c6ae08f2fe46ccc6e23bdc22f1b90b768c8007602f277f32a912c0b2877495f4fcc1f69c7'
            '57dee81063ba9408ff7cd44c76002506ed64acc85bf18ab84dad8aaddf1acd0d9179ee9ffdba2046190a78e3acb04ced9ffb110181131d184007199c5aebea92'
            'fd27f520348e3b4452b6c31a94dfe3cf97596f58eea2dd10461b033088da0104aaa537adf1db29d9e9fe976d910ba87421cc38cd9f8125ba9367b7f5d75fc0d2'
            '9904f680777c02392fbce695173d5f2df27d263a4081fe72b790d089073a85cbfedf9c62011ea590d81a18f223ef0a1f9bbe6996bc0bd309658821a6c4ed7f5c'
            'dee5fbe935ff738be68c0a2908338b94481a3b638ef0f36213b560846b2e5f26ff4cca8d52853a51dd82edb60ee8c8f25c266b5da25ba10622e5d3e6fb304c2c'
            '36c4fda8c9919d1bbaa71cbf07d0078925b80769b6984c9c65184c5c8d6501156c00732a9738b03aea5246aa2c81ee81746b9cf8fab2b64659c72e96b30c28fc'
            '42a4a5cb3a96a475df82146387e7a05d81769085f53f353973f8d158df423cc0de67efb252bc8dc29f7f2cdeb1c3f333f6d386806b2f3e7fa2cfcbb44ed09530'
            '77670a87246af26d08a5ff004feeaabd76eeaeb095cf536aa628e2827c3aa6d79f860b3b44410e8b71c91c20e9719bb7eaba093a68eadb4ae4a0eeaf4c990fa9'
            '460af5ad1709ce00c3d147c2a7d7eb334e52f3f1ef1ea7f4919aabafbc88b91550dc905d4316a3a5ab8e98d4886951ee2c1a058859401b4a2d83743e65dcb21d'
            '07c563731040bf3647600423ae62dcf67b11df3cb0f498e46b68b083c44ad960d6d2aa14ec1836bc09377db3bba571ba72a115ae45ed96a78b12e17164538ff7'
            'd4290ac7905a38930b8319cfe747e2d3db62ca32b4c9938d7bfc69d99cc33ec746e4ec20c98c378594e40acd99e3b4915752a29c97c2e88eaf4c6d452e19444f'
            '6c78eb06ab95fef892ae1b78f824e7cad9ef14b37469ad15b355251acdc42b500ebe8b8b2e58d4b9677d13451adbc3dbf40bf109f4f09352cbe32ae822e89730'
            'cd7c9e7f48ed721cbf415f4d1b0fc1a5f10c9fb682cf284151cfa8aef81e7839e3ca8cc78bd6afb0200dc5aa442d2a60bf3b68ec5105dec49d5858192de6065f'
            '263ff291ed0d2c586df1a471475995464ed3903767011a5cf5d7a15a34701bf9107c6565feaf5668cd32a7f5224e061e5746230a82268885dbe46c1a7a1117eb'
            '1402db33624bf0c0f8dbc8541493d355edb24a9ec4de10ea68eccd991ef919fbe37e7dc476ffbe396730ab3f8f8127861f07bc4af996ddf1069da48c9df3e343'
            'abc0d478c77d788eb15d3210ecbc204ddd8da6f854d8f413f0b4d91186be93ca01645ae768b27ec499c99cede3c2905d9f4fd347bd928f4d055d7a68c8995fb8'
            'e18466f5ca56a26c6cf24650af99765d12e6221560c24ea270e8673fbc06d5eac16226d3e61cba03ea80629685cb33ee528dbc9da5e5e1ae35cbf1598f1e2ffd'
            '31ce1d492715ce7ee13f0a77f0bfe66ca97db879073c360f6218a9a75d9b0ff2203c3b6069f963cadf0d7e970e90d8e200076da4ee2c3f7c88ab177891eec812'
            '6f35c6f0223aa798ce89b6273eb1b27cf4d1707c22fb9b3fdd0016d28d3df1286763f49f7f727f8bd979c76c2e39d746e9e2fc6503465d1c54410aa47dcc7eba'
            '2b5099b7dd60e9fa0e60fa9c99b9940b1b1160afac5661c815cad46704a9bded80d9d57dd6354bc0fd40cde9d1b82c32d9c4145ee2767dece91d0d938fd15617'
            'c4807952623d2fb7eb5ec9399ef4afd38486efd8d2524bb981d1fc8ff0179b5e1ae56b27d4a733cec034ec65cdeb1be63b497fdb81ae444c5fe5de4e4d9821de'
            'e0d3ebfc2f99258c83e6d872a8092b34beb3637949c8921b346f3e248b78718c621e182f512c89aa2ea15bd65014e62306425752012674d22e2acc44e0b07494'
            '26ca8abeaae905a0746f6723fb8021558820b74301ea0f028f8c0d4fa0ab62d54a01f5fc57d407cdf7f7dbb7371f3887e60e826b0fc09acb491146c45502b01e'
            'a3689c6f1251854b5ecf24e86c5fc4dac32ea1765355c152d7b80c5c2a1b6958ed088bd60f341b988c9e56fde0fa58b5dcbe56608585f5eed8365f875009473a'
            'c978855c53bad1d47961807b463bd454af60279766c3c3be93b7ebb1112e101da931b2be3b14549a1e7e64c4625cde5a85746cb16cb05fc702539ca78aee00f8'
            '0b056968dcaec1640d09947ed9e8780847804fe4fb7a2f9e058d12096acf353dc89ae9c2567fb49cb5b687fb10ceb3e0878d35b4c818959f8a869f26b827c64d'
            '34143e00ca29a798af3ec86ce3c384071fcf17825a705b08aa3f90e1f16e3bac9ccb422991cc04ae56d3c6c2853e1b08b51489709dbcb269d8f28316bfcdba02'
            'ce26c904221cfb3048c05e3bf094bdfe5e1ff5288c43927bb12704f9be3f038540b394db83621413331c24f7b645201356942e004539b8e5c07f2d851829fe8f'
            'ca56bf1bf8e885bd7245cf8a314eb1d0e068fc4707b5b614c470c41cc32898e0002189f39f724bcf9c6054d6eb9e8471d31c2adc20c8a058fe6d6c4774d05ae5'
            '6a687355f3c937e6ca204440014abad3f0b5d02c5dc991abd6bf0dfc07994f9acbaaf6b26a4c0313363bfb6079f40d6457351daa7326f76b6c06b0bc12d6f7f6'
            'f9441598f013f07d64cb111aed6e26c5d12b7c187ed89aa27a3e15ac244ceecfb223765f297deefbb0ee6a87b67982e890933696df913b3e909f9042c3e90ae7'
            '0c607d1f4a3e55066157de5c4146c7ab3c159a5de2ec769f509f73513d533c4559605d4c9b2fa1ebe70f191319239e76db672b14fafeab2e43f6f4cd17e77811'
            '63aabf0cf4b4c97a04c4cb8339e962cb8ccc43767af009cbf81e870161c211c8b5da7c30753bdc347263b233d3335c23361c30772456cc2c245cf88b5562a9f6'
            '67b4a02db1ec3cf9fe1ef23f9a91ca0fe84b467642bf7aa878373f510a496f1676615a24fcc7dff900c7487bb1d8a1174aa4f4cb6dbd740783b0961d8909a695'
            '8a94c0b6a169557ba445871004388c9f7528100d30cecb1f0a3985157bd9dc8650cfc1a9de11633f83cb6e3f3cf32531d0fdd5853a34b540e0442efb3d88f010'
            'b62cc0319952f98d9817384776bedc6c27bd0d50c50b3fa1630c968879398f0ff56d70f558f634b3c6349d1085f6c60c8bbc062458e46a883f05f865ae4586cc'
            'b2edfefab271aa533a0437bf6c5403e94ba808751f5a4b475d610a4ff57257da598f98caf8e84de3b8db4b99dcd6e227ff65b476e43e6620c90aa3b7ee4c8ceb'
            '2a4e3d2e0da71e52cffe69cb3c8faa550fc6d03c7f01e1644c7b365c9814950dae3362b2f8252bd1c9dccb038f88e9c4c4acd9eafd9eb6101e76aa735d629057'
            '257187337c3645915e25c3bbeb7594df4e968936ec4183a35c4e4bd9b7c5e7b06c16cf5e4b2a47b4fd9c1173818afe13c11e83e2dc934a93376e70d887cd0611'
            'abfac8290d03ca3d96220ba2fa367e68ee79ade36b3925df5e4a0201584032a16c8647e21c050b0e912180154558b1e3589040da8a98ce5afe2e4c878101eb9c'
            '1bcb2b99b372b166c0b7764dcd939789586f5ab9d5b60eb8535e871646d273a96bca23468ca83244846ee29cd5376eeb26e0e957d83ccd560591617edab582b9'
            'b3ff698d6306d846aa0addcf0fd6c1a4f285871ff3a21b518a923bde0c8d0120f6d59f9a1bbd489d8925027c20e3e8a9888e892cb5be89e7d1a9469a1d0f65ee'
            '6be50752938f4091bd241e1e3351fed6859ff6d2c4a9a3479787fbf1ec1f71b1f6bcd31971baf1fbc49a95b9fa48addff1e626adc64ef3c99ab1160893ea1560'
            '11460d78fe8d2fbfa3402933560d99e8bb78fd17cd9b6b93464c65e0c6619671289ba6d2c7d23c38516bcfd31eaf6341e43efd51dfe004799a3c355727f58602'
            'c450b6a10d9921e609750de82166ac5b85752c3c605e843f01eb81750873510718f9df507f075ba7051dc661adb6f7adfe6c25a6edff3e401d99c45cf58fea39'
            'a68b166c0ddff3be70536ac88a9ce9578a8c28046e289e087e6efb8d0b544659cde8d38269db51a67124788b29ee0ed847cd7dc6d61e0b77c92322f04696064c'
            '3b8c4927374088691ba85b51ea4d0a812dbe4a8b1ff05ac2590c13934ec6c874d05cafffc436a940f912a304ec7e7136ef8238d700932cca74a91554ccd405b9'
            '79d106d54130fc85533f34a0f430dc515a5bc6b0d1f8b366c39b0a1ce25176210eec7ec7d27ddd79abaf394112b21b513db31e3ae5ce1b64e6fe3b0c2a7fb691'
            '244191b506e254b3297a28036c21d2fc60fa06a1f45821d8a0bd9095a4c5420de753018853d54f51901dbe362df143d4b7d17f738160561b977c02ebe173a035'
            '0ac015da7b2935cd1bb05834d479ff8600a61a1c4251421caa6291cfda4c3e6a23c032d13eabe3d52bfda8e63202d91890b49ff9a2919445a56b8423bad583eb'
            'baff34d53b0ffc6f9ed5ad6b914a9c836e5b629d31cab17d69a0b4d4583fe87994eac97e655c0a3c5c13e0b3c4abce427e8da1ab8657f83c567c63f894f627a8'
            '2af12c595bae759bb429dd6f7b0c93f4f7a097501f24cc80dcb55862917f7bc57d4ab880ceb08bea3c700bd78495b7d8e3880688a2c92a33378f4d118f4f5aa5'
            '9b0f478da6e0ef2e2c1397ab05820f0d4271b9d323c234b4aa74800d998f59ca56b484a227b5a7ecba768756ebca55b0d40681658d785d3d13ed285f21b05d68')


# vim:set sw=2 et:
