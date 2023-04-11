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
pkgver=102.10.0
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

sha512sums=('f2b53c35bdd22a3de6f32699b832babcbf499667197c02dd50cf0b6cd956e0f4471f420938c2ab72f0a0686ed99fe74e3184afe9b5f7169130879b8f8fd99f0b'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            'd178890b9ac6740265f77e17f226d9974e5635af361fc237ab70e49cbc46d3113f6b55945c41f193dfba57ba9d702a5ffe0f84c1992134ba46b1ca35618e297a'
            '3d9e2690bf9abaebb98448864bd4e3eca01ad5be59f6be0ed16b4049d79574b325ec59c504e1e9df89ff820d9064cde8ed03c160baa52f88f29e5311c6902851'
            '174ae302d19c95a75af320c40870ffe20946f1c6bf5359fe120c7633b73c7e3e93f378518cc7206d7c36e4e0fff97dd8fa0ce7ac8870cb6b681502c616f2ae6f'
            'f4505826f341bd1afcfc2430d41691c8056d37bfa60f36883dcc5cea82ed10e6c3da9e70ea2b2de7655dfa9db788640814d89d923cf12dc94d5656d7d7c19345'
            'a034b3758d52f51d30cdc43265cb7edecd0eb7bde2bbba7dcc22e9831d8f9f734e54a2f8fb40ecdecbb6fb6daeccf32b73a5af30a2bd91ffffe0622a486870c2'
            '27a15be295eac1c5489c06821e0e3fc808429dd55eb6e3dc396a8fef85ad29a9ae71c87aad53ae50ab224d1ed7fe167e9adb4c92996520e7971866826ce9b333'
            '161707973d47228830dad0281fe79c7f7cb31b1755158a0689200e36db431d40df085a02d5ea71945008cc6e1b14250870ddfb9f4aa5786510b7cc5082b94c23'
            'e5eb6cd1b7723197c7e5fbbf9c5d9ff6b1e99854ca21a7864ba0ac770a5c9be63abb57ea581bf7a9dceb0325497d211bdfe231b37a6b884bd223170749154e2a'
            '142ea0decb2759577208e90c8d70c7c976c5d14efbe57c29a7f2c8f0d212be950f72fca57507d401e4971b7df18efeeb921aa0f1759900dc1707928f58732a97'
            'b6298f8192db598a14dc76e4600d33bc63efaa46e7efc94bf1a83e01f28a6b6addc01988ddeb1bc61156371d062e38d8b902ca49934f00a80f13df1096b3f086'
            '28afc0aebf7cebe6f0b3ec8061e1052a7e835fcafcbe8c39ef699a172a12d5b26f505423a053d87084d483cc14a76b351d3a4ed6e8e60e835051e1a5c91cac3c'
            '49e70d28cb24c690bdc9667758662cc8ada4015c6b85b3b5b2fecbe1d143c5a2c11708d9ad38b1e88e07e175b5c50d7166338ea0a65bb5583678e89cc5cd23d8'
            'f7ba629ece292849382f804c09d65271e9fc8c732c1f272c454895291f2dcc0af48e1f17db0a4729db8b53d2e8c613207f0cd796a76c3d360c147cc9c5b71990'
            '90f4e55658c9f4341fa551a480f0b3ea45d3ed006567027a8bfcd2c34ae2b3afaab7d99bf93e807fc53b799a11b18574a92f3bd2b9416f63aeb72a1b1e92dafe'
            '3db0646d54e5ecffebdad8b7154d15b2906909fecf35b80a9911dfcc36c2fc29cc7ca6382ec7444eb64d29adf96139e8f4efd28f5673e34c88461f3ea4ebb246'
            '6d3df7eb18e4f9f9941d2d4eec40b54b5496ab4575feb31cd22ffa7547b2db3a1972744a957920531cc10b27c96257e934ae9c8a6c523b75a29dbdb0a9085698'
            'f78957e28e71eec1f106b3b3d30bcc461e804d62631ea3cec2d2e30645444be1119b9f465fccda4e7bf2dd7b374bcaaf7b55b38bedd9f3e755fcb59eee87c2b8'
            '10b1575d6f9f7365b9e7be1648c50e52639c3800f6921cd7085d9c89f971003fa485b90223f92ad7a58138a55a401f29a64f8a14172aabc2c87e9263d915a902'
            'dc61267ce6952c609a4848fb9d8f8587cf75d2594bdfd230b399dbf7a58015f5b91cbd11a015b7a09279fc52cd3ebe766d14ba5e402f3235b14fc392c3766553'
            '0bf94570c51b3a1b765565c74e883941d66cb2f6c8d45d3ef016da9f6ed40a67fa675eaed0c4889a71c144302289c2787073c326406e73956b250d8063795d2d'
            'bb2cfd5b235c4107bbf77cc2acd0537088683caf20e24e926b8c0412ee277dd85de2a0bb22843771cff08fc07b9074c3e7b9af08fc7f2f2e40f29ca50d7920ac'
            '5eaf262fdf513de492888ad286645276b6344d8ff2df6b078a1e366523c4194b95c4842173db32c8651de99f0cceef832b240b8252acfd9d6a4a6c3b90801f1d'
            '39e868abf6a86b1078d39dd36b6c949d116e81a03db5dbc4569cd3b401a959e5f2c79f775eb9f2a716adeada33f0fe248b9aa2ce91ec184db4a0512c47df6b93'
            'b829f17edb8a760f201eafa03a0adc4b1a6d3d12724abe4230059dcbc4298dd010adeed410b14c48a6c04a61a6515e2263cabb21182707783c04a1270c68d02f'
            '0021d74ea30e730a0d060c620bd476eb3cd3dd6ce69adea0ccf4d0a0fb99a87f1cff93f34769f6267a4ea922d3e81370a83b3e231c76e322ef8c01be34d5b57d'
            '01688a98a0c69bd72c7d4287bbeb7c8156be2fc33af8beba9b86d36c9f73ea95d403f7fdee1a62d1da51c36cf53ee0b5a55c439fbd78d0655b25274fb4797a88'
            '8966ec45738374f5f9e9cbb36daf6c259577722c06e8e306272df98c5765e3b5a91d5b2fcff05f6085b50e548480e49085b07b541880b33195147fa786736d08'
            'f212ac57660169c8b57b169af7fd735f3da543c34268081b44d14fd710b3639b33fef83067df0beafbdddbb4081b62a5feb95135e2858e65e88d6f736fe26fb4'
            '6f5c48f45b217211107f2c037eca24dce462613c05f708de799687c75ec2b94531021490308aee4ef634ba7afb8f370073f73737195711807f016a85c0dd3fbf'
            '330a152c62f6b03d00b1f623f9ee1af8c0765e7f7b99a77729d2b84d9cd17990895443bd4ab63fed7b33d16c46c6506f095125056c4ea56a9eaf8a9237ec76ce'
            '49b873b0ce851d2371b0fc6b9491ef243868e2b60ee62b4dac1bc62350d369e84e2f7be93eb980e87435381a15d5c8fb0e9b937ec6eaf3bd463795e25faacd3e'
            '068fa8acb19a845316c5cb030e23ac4e640529a3500f2d12e57ba18821c3cca5484bf06b3427d922fa9ba2afc4120063d083de1eebb602d41e76b336d4aca196'
            '87b8434083bd1480f18ba92d1d9a1246cc07d30aaff27f8ee29f091c3b9fbf2e473627ed1cea8b461533371310ed61093cba5f5052285688a6f1ca82e4aa9f31'
            '961f58fef77e33ddb6311d7e97b939deb669c0fb8a40c610f4bceea081104ca9364342dc27e9e79684d84ff3d8390a1615ebb20e5451b79dfd12da3e20ed0979'
            '9c78732af0584972c2e4cffe1a9dd96d1b04cdc3632154575c66d5ad732413d92d309ae0e4e4b6833fa4749ebf5ba4c9eca83211326581be9874d7cbac82e784'
            'd5ffa111abfdb08e976ca43a024a69c412c67e9f7cb28738631c6b8a0df5c0b1054cc50ea9fbcaa34c8228cb15a54c55619f7d64126e25aedd84222e0abca8cb'
            '881d227b24ce38452a036090b321f3d074e5d7348b1967a3c607504b99ffbb3ca7190eb7d39621a9e4accca628ead51ef4fe1256de5184ad2b7cf7c5450b91bf'
            '6e5b5889fe006f8e0af49d3ec57e9c8974d41cf22c564d60e107bb79f6a4d99aba9c1410da9bac5165085a5afab0446b299296a20316433929b133f6bc6c6bf3'
            '38ab3354d1eec28809aee08c5f579e742f413fed9512915422821f7986c6bf1cfc042de5775a1d6b00a265cf39eee2de7d4c0ebe6d5d46dda23221a7aed13aa3'
            '607a00b72364ead71c8eaf78138e022f8a3ef23c2f509c80edb9d017b470efa66d0d93cda653659d1380499eb85a1e0a42921d81dd788619b596c69455ea3b53'
            'c0c8c520696d719480abfa30bd6c822656bc4c1d73e5836460288b95a228f340440a0a64b95c8de568cc9cbfa73c3abe2c05e51afc768e4aa9de9fb9694611fb'
            'bd5b29356384236a236966c81fc008eafc240dc29675aa1e788b3e939f53833951de49649035526ac2bb02a5e39a80ebc6a6fdb308df2061c35b28e8578b7653'
            'd9ddd57d4771a47bc92239f52d463434057f88f7694d69371edec5216e4968bf5e383c4ffcd73b14e25af9eebbfd07681290736ba77ffe0cc64f430f7be43744'
            '759970b200e8fcde4d7521a0d2c43208fac88dc591de55d40b89d57400cde74b1ae217482ba1978bd1b17cb78c580da4c4f9d1f8b377f12766dbdd253fd6560f'
            '5bbc82763d8e11455896d1ee27302c775aa69c41aa819cb3b21660849f9234865248b293c2d11dae04dd99898cc8b0f3136ef2f4acda06416a33650b344efc40'
            '8a87d1033887684afbab37f150dd2e6571fa625d2eb23407e34662477b97cd8d1ae3a05fb39d1da3b858ea19bc74ea8dae1f3c601c98b5fa6f41a877a6334175'
            '274d3fc50d7c6a1d045b5719efeedc23b5dd1d711712afe345eef5c291641148f17999a9f457fbf7b350737ba174e927ed5ae7139139f296bd31c1395ee2d23a'
            '8931b8c5279e0ed956622d0f780649c23340679f178d90e058334ed0d200e18647225235abb3c3253fa81c9583bbd0aa4b3f7246acc1254f36ed8d978addfd21'
            'c58ffddef248498c329795f01250f062b494e3de487754b5bb088988d3442d108e9b5824a206d8c4db5df8e2729c58d3d656414ee8243edac5f4ea783088642f'
            '0f84e366e6c367c41c498ba0444f14a4583569618c7aba1dad92026bf409ed49145463ae74d898ce5deb86d0d215771b5d49c646c3a75f62817904ae37937f14'
            '88f145727f23605bb1cd7792a0126299b2be721d649c174b22c572de1196ce747280608e770492603926b7c9baec5e72c0b9b7bd27683658bbb9354973efdaf9'
            'a8e1d2621def842cf45359af7c99c5b371646b238c7685189efd0122428b320b8b982f0cffeef755b6de68e05b8f3580116c9be9e44a45bc98e61f955b2376a4'
            '322ba06925c38d3a085ff6028e72d6eefa1826b8d87ef8b327e341ae0a0e18ac1267e1db3ef92a9a62cf0eb17b7d3003444475bd275fb62a3698102473f3cfb5'
            '909054b66a770238c0d801cb1bf20cb213b86dd913e657fbf891b09ddcc47da67fdb22cf25da5ed108cb543596950e22bb434f7b979b38eddcb62665a8ff0a2f'
            '48a57ab57f272e38ea753b570f2ae469524e15f40cae1c8e368536e19d4294c96a2f85a27d8dc1ee5c0b381a9dc455730bf19c734c89557de52f60b7d0381ca1'
            '196fed7bf2a097160ed71dc6fe2ef9dc3f1a217634f4687ade09b5e53378dd17950b2a05a9d97b369ae9966ffc5d569b781d7350ded009c07b6b59f82b4e8d2f'
            '2cc99467169aa753908c20f0a85e30c0a68c9327322814845ebc249efddec83b633fbd19d2b5a7015635b10c535f39a86d470bdbfd6ddee165f06a7924e806fd'
            'da8f3082a369c95ac43346637d4f5a7eaebab47464684c5f0c02595c6d72f993208645e19c304b400665f5dd62cd2e8249b5b516d48aa93a8fcb557223ea2ab0'
            'a2b9c38b4773bdcc3e5080bdf44e891f118bca5aea573cc8d57ee52fd13a2b3fa60fd11bbda29b45f1816da3a9fd710966015094796be242b9ab6df8b05f9af6'
            'f5c7e60d71bfbadf92ef50da53f81f7b52d9c3b0c60911d294ce19c1d5fcc53e79c5ceb7d7bb6b9c9a847b796f44aee4903fb039d7b1d5d685fc9c92212b9476'
            '649ba2219d0677f59dfd55f9ca14a5bbbba7b6b13021fe361e1263e0a5999b779d369beeb10c0ad2ad395bf95a523c1eef02d62c0782843ac088176b95a4698a'
            '2260e10f7133dcf09cd09e1a8c727955be19a68c6bb8dbda6cf42916ded53a54a4fdf33d396a7923f698586fdeed2266b8f025ec4e6992a5aa1c6c3371c01cab'
            '317a6fc18c0a6263ddc021681f48e414298e0c7310602501b97d4893e3637a66517499d3be9e9805bde89553fbbac9b4734f77b79e67fb4fcd60d269574a4ada'
            '3b22f50fb4187fb64eec1f80902e6c9cc73a3c764090015649d6f0e96c4e5f85321b3ba2d5b7bba954572351ad52aec49f8deb06a10a26aaf45d8885e485d289'
            '0be1ac050424457e22f6e70c18a9f402d33e42c005d58f4da772dc956c2025f95a6f4787e49a66a7bc2529aec89a5ef0bdfbd34b384da1252cd33582beb2a15d'
            '770cad7c5aaa425f70abdcf74daa7f2dee6ce1590d898b6a1c981c4fa4351ded3cf8d949e7a15c4db10e9daa6a2ace3b3ee3059d6854e7662aa2eede5a81dffc'
            '2dad1683499e08bea8d202b768f70ee7ccfb6d20dda73b18992b8e096db062fc28dc289961544d581dbf596464bdd59816d8ea7ba47cc8eb5203939ddbf9a35c'
            'f004ade4eee2f393367fe1a92fd5696c1faae7eff9199cc22e0772a28551f446d0825bb8b932a1f76b1b0c65a1dcecef389f94ecf37c17c2ea3a01beab9123fe'
            '212680efd81f86625d6b5b99cc33c17ea39815f026b148e49edb620a51918f924958eff9912b71b7424e9d20dcaa7e9830632d1082ac1ba5d49ecd32cd8a6d85'
            'fb0797fbb02e990917fbf0690ae938fc457ec799d51f4a7c2a315c205d0fc07e3c555f6727cb531829c086916f07317fb649c7bfbe48f99b0a25b15ff3145821'
            '2222f5d67673dcaddbe590e260bf202d2005b60c5185bcf6458011b76430ed2aa1d7d331c26d3bb1bba2b8edc8dcf8ec5a031522323f9b7febc6e717cb2b6198'
            'ddc3bd2937d5e8fb6448be055588d85aa41ed1a9082eea9e87d30c8645b40a5535a8c45b4d753da994b799ef116f778ff247f34eac80f7c642cf6024c901eaa6'
            'f2aa9cc019ad4142aa190608c53db2fa4a0b0513914721abcf62b12ff8e1e16305b05aa569007bdd8740c3a3fdcd15860eaa2a606556ba46124d7e558676190e'
            'bdab6adfaf7167cf97f2207a7d3b8a5ae25041f58e9ffa7a4672da637fa70c8452f9de1f1803107571cefec2ceed0c9255521396869fb1e67a4d8fc6f2577f51'
            '3589cf5c764df746add102ee23f2180a161a7deaec03e482e8b59169dd60e35c281a63b39a9da452f5f1f672564a64a79c79df376ea467189dce4099002b654d'
            'ab392e4e87cc6e81bd943773c4c1ea64f4f533bb7fd999b3cc135636e1a3668e1cfe806dc649d4448750d15d3b4bd39cff115b52abcf910ce8b6864fccb9676e'
            '355ef503efaa29a2b74ee412155db4fe7daaad884b871c8b5400ccaedd8a2836097662fddc573b425ca29318c5212a54b04c66047f8f72c249de9b9979fb5934'
            '2b38114d3bf8528643d0a6223f9ba1dd01905936f65df2c84c6047a0ced2745c6532dd65a161c07ba8cb49aaa386520e8518c120db35b42bf5f621f3499ed2dd'
            '18ee491755e3612bdaf52b2eb612b79ab1818ae1c4c6682862329e6aa160e0c51202a50bcac298ceb2470a502edecf0fd7a5d777ca44ec887471b68d3886334c'
            '58524be38aa8bc64a1518e2796b3dbb0fcb72c16e5651aad55e03ce65af0589f0384d14341216e6292f2c3dab22e6de4ce3e26236c3261cd0484212ed2ff0ca9'
            '093b1b2890ec44519cb5d2c4ac84d9e2c93374f6beb7daee4723969b1f39891efab3582c2fb0e7a23f7d3b43facabfcad4813eb8c13f002fff3747f3c187a31c'
            '93776c52733e34814463b275001e3166302c42f8d1b7204e1550f30debbddf1ed65c4926842d5cfe450a46a11a98091844345ef0143e80a278a4eca91efdbe56'
            'c6459edfa0e7bae0e12a1c10773faa631bef60d17d70ce52f2045373e0f15ba2c7f5d38f2c766360ec7ef1f9e6fc7c8b1b1081881af13ea471620093d17421fc'
            '0b28aaec37d1106f455434725efd5d3114d647d00ecec001a48ca358d9b44d08351ac8d180c754daa8beee7a0df3e5f2b3a1b18797073d021402fcda5e644746'
            '30c555fc4aa0922f410483ad167aee7b1cbb55f5c19e8280d5ed510867f09148b5cd2a2769c4138b04f6bfddb87d1a5319b31b88ddfe4ce244d40747e1be11d8'
            'eaeaba23718c610f10f4d60d1f07cf635b9bc901b9e871e2eb26ec1aae6c7f1b99964af1fecb3b87e2bfdf6812387c43375bcf2d2bde50eb7cf25e422f40759b'
            '76eb6fb2910f6f8e7522a8aaefab5cc41020baf05d34fa8f3bcbfd08d277103f9ba6835bd2f1d991b34f1de929a91bd5cbc2f9f46f2bda98c8b02cb364c3f2ae'
            '6466747f2c3c092e9a713a600d70c542bde71a57c9dfb19d19830db2a71eb23872dbc9f41950b1351141e45d221be701a90ce625adf6b9d2d53eb9a260be297b'
            '2094ff74af71dda82371517eebea1bf3486a788b57e6892c9b86aee45e4c733c1372e8b79297a6cb0a3f9ea523c0d8f339bd71dd16e599eb29de2f47f618bf5b'
            'bc7c95a7b8b27c05a70be1a085608d2ceee234b9cb530d73c8e2eb5271b34e17dbf34bc80b6543df7d654977dcc0ad6342561d1a3c6a6c680b8569fb88a503bb'
            'b1de6ff3a3923521d948f152cbf2eda735ef91dcb8bb10586c444db22bb2bb5206153e0bf03cc80779ed7b1a6af59e98cada5cbf639f87e8404350c825bee463'
            'ccdb29494831df3e37c4b3a7a98d585f61e8651c8cc2ff7064abc6450146c8844ea9d2eca1e99632843856ad360492fe24faa8ab05368a82bf4cdcb6e89ae5ef'
            '4ee93654598c89f71b4aaa0b8bfd0e8927c2c784a00c665728aa28925c9fd990ccb16ffed39165e0afa06bc73870b576c0504538c6ca7e4dc4ed4d9a419a9ace'
            'd24f803ce4935e8097ce38d0c1566b70da7a81bb5a5199d99c6315c0ba29f24bc81aabca60273028b6d1e379a025af801c64aee8fa6f962a6fe92d1d2170f7bf'
            '230638b64c6b2b7fade5b0503d7f87f2c92c35963a1c861441196df196051073d0f7f94378c39ffae441ee5cff1cb37b1669b45ae73c39fc2aef059695c9ef75'
            '44cfa7aa39feeb383e51d482d42e9ea90da825022ef4557c81777468b1f8f51b4924f416c955bc0819d20101541fb548db9cab709857c76cdb113bdfbc27b67d')


# vim:set sw=2 et:
