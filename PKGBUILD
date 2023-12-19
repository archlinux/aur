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
pkgver=115.6.0
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

sha512sums=('9fe23b5f715e35b788d9c8fefe6b7be8785789b4ae6f5649b05a54221934101c6e1b9580319145f9bcaebfbd00fcc33e97afb63f7d57ba102a6b02c874d324af'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            'f065204066d768542555f587535a84360b9d05f35702cb22aa671709a6648d17b28de51af1f90892a5996881ccdf7f89b2241b0f89cd79d8207fd244799a8ce4'
            'a9072bfe46e30eeafbb826b5e77f8b7fa4d8fabe624cd8ef767a6008676a1f293da29baeca547012bb8d6c475d7e0e232207520d93c88e0d400c1a8a166801ec'
            'f84047521e6d7653d1b5ceedd93cb0cd8d4fa8133df79cae052e2864a15718b577d77b7f50175ea67da2094991614ec1a9f52171df5a2806c88821ffcc8622f5'
            '227eb965eaa9366e75754611bc275d4042ab6ca4d7531c5451ac806dfc4c07536e34efbbf549a461dfca3d3bb80098c3f55e2b9dcb7ab70947477a8da79c7e5e'
            '8b2c276a2976730fa81b75757488b37cce6971ca5ff6fd40c2d748a91d2a5651743d065bf311ebeb541fccad0ded360b3c20ec46e863dd539f7258cb8d9518dd'
            '0dc114a505e03dce2c644609c19e068458548eb6321f01ed7fa8a4d397e6f27408979e9feb1a8e5c70c0a1226471478f7aad5098a9880983e8e6b055a8d1f649'
            '917fbae6310e2c135862268846f96cd11068aaf62e6fcac3f375744dfa3b268ca3705d3bbc5c357fac136e40e6f70cb572a297aabdde8b45a7c26d1c6252d366'
            'f6c871b712570a88b6bf22cdb69adc98e79e01f0848a5a6b87b3d21fe8267c0b7d40f14c6ee66b180deb7902f82fb42203a7a5459164ad16c45822824a1fcda4'
            '5cc36c345dbb53a147e45bb215bbc44fd5f006d279f7ed79e84d1d9dae482a166bcbc63effdd2dd6a8d07ec75c65aa7367c8ed50945a49c679cb5ee5b79f83af'
            'f49a83283ae4c12942081056d6896a8f7ae5d98f2f802c543fad4c523ead12c06b602dc19b9f2ddc3c2c68bcbb458a4af78a74be24ed8b8859ea853d18162028'
            '886e5726086d6783ccf018d2229b90c1cba0adfce5d961eefae2097d0e85da605a2ea62495e72cc066bb653a86b496ba7a21ea600a0f6a73d12f3409e16e0df8'
            '90e3446ba376d6cbc615068e77d5ada9fcd62448609ae437e61e24dc07ac9d97cb7188b2c0c17d14f5bde5b1a05c33b12c09857bae1abc9fa99ff85994a3e64d'
            'a2dd9e36d44972300c672dbbb18077ee9259d9b93007a39241d4973bc62715d25870710406eb22508b47b97af8811f8d98513102b50aa033d6dea204411f0ddc'
            '7615fcdfbca569b0d57a79363439aa24327e8f31df83604eaf9512ee7aa2db642585f5aa5b8e1d58fa87d95b16fd8c393c7fbcedd9d062afa803c70fde635d24'
            '841265f6d09c7509e6aa879a2bab732560a28468149eaa8f95c1cdf112113b8c4c30de0971dfa7b38d9505dc618bb2e38082f86127360fe9e136be963239a033'
            'd7447bc143e1f145be9af36bf32c55b3d4348ea50543df689d2c69df2e5aa470c2640c0b076af2f4a38c7a478f30dea6f756dc307ead0a694b96867059d35c3b'
            '86806a03a031b9b0fa432968e0393b0cc05c386a905c7cc9bf7269cd02b946fdd2054d0488efc59275e29d22a79eccd9580fc9dd1bc8f17c30a26416289b859e'
            'a235aea3484ecdc9997134ee62b08fe6792cdbdd02f229e20635e4e7823304994cf93746fd4fa27093f45689b4b8bf0d39e90c7f372ceb3a03c1c9469d3c7f18'
            '7202080392d95208158ae5d9907f4a4097a448bc3b825a3f27519fbf59c92802d77f16363c9f817fb140c2238b303cb24056bedb735b2824258fd170f32ce2be'
            '0f4832b764e721352fb62615942ed40707fdf2fab4ce4a45000b820ec1c511666ba5594368d8a14e7202bb82508f83a67d93729e9b6746119ec2374fa61773d9'
            '5370082bcd3ae0a1529667e090959992cf4ca41a3f6ac5ccd09055a8189283605de03d61373b7747eafb1547a5e9600ffcc6faf4d3952b45cf5f5b2c0d471ab2'
            '8943ac5c154819262f1a87da257239c9097eac7658fec90b8235baf6a4f2a21106e53006c0690a39ac4bfb3ee5e366619fdf14b307e433f9a8c75a43a8cae0a4'
            '51ee9896492ca6a6179a02bf9a06e6bc85ef04a1c09ef323a0f45767f294793ac96a1300e6272660fffa64b434c8acb8a6f274123608138d1bee3ed8b21782a8'
            '815206474c09e8d3ba5e47f0281fa07dc85cfed6123e07a3b870adae637b6790e49676a50ec0193be7e6e18aabc615199b49b604f1c69b9871a763052c516bb7'
            'bba821fd2d2c48c2b00e9a0af52d929d20d8eee84da0eb2bb0e01f152a2bab7275f87d31e7176371eeb43160da7943c1adf397d0b3324ffda55e109145ad9c67'
            'f17f37f6a9ea04682b93e1bbdba5f4ea99aac2a04b0a1a87419503dcabb8a3b51dbd2334cb47d5dd07d016cb127533d841ef1695046d7c09d0ecc11ca6598f47'
            '76059df8e8899ce2f058b4ee2d83a28e4ac51a405fee524ea57059447ef5c05b4d79274880f9207c60e48032e05d32a544f50038aeb6a08a61094f37f659548c'
            '2b0b1b3f6fca6ef73e7a1556f88ca74d6aebf6250ed44720a9fbcd9a7c361b946d88d75cab570e3c42165130ce2e31d7ac833f36a1def5be8c6bbf6cf4d4a197'
            '20b3048ab2d9038925beb7983f780179086cabbf41dacb0fc3b8b8113cbb2c992c9d36bc1ed88ff5d2517b072b8a586baf800767c6ae55f6db189aedea3b2459'
            'ecfa01e841c9a9e9528765c191fa872e7cee749aca974049e450ca992bbbb158ac5e7aa49cfacb4e5fb9a3f05fe9eacfe7420aa2d94d62171aca0ee780dc8414'
            'eb2f835f241ebbad70eada0690390a032541ac148346949f51e99fcfb34bb1ddfadc0346df2f4a59927aa247c0d24dd17a3378b874d3ac2e8b721d8a21b71499'
            'b10d7027b1e851da962886b965f5c6d041a11de8a584f50e07d9c47af13e8474e076a0661c7b5297201de6fd2b41cff822cdd9ce6879950509f2955144f50862'
            '7f88ae088751dbb0493a3904a751034f489c15ccdc35f1f04bd710c7113c3303a06cd54708aac3b927570820b027d240c795cc806ca1abea0abfbcb94644e2c6'
            '93baaf663aeb9155fcda976a8b562e1b2b524530321e66b57bc155d3da0fbe6fedcfeff8a94c8712af4d22240115010af44eccb86f2e80ad08f15dd0a68d975e'
            'd66f4cd9244fe5a11b033d2121ef47639df35ab45baa81fb071b99b161031ecf10942d567d12214ca83b5c6edfd5e3e5caeb37456bd704ac6c513928201b6574'
            '652ee2537bec0892298eca1739ae9ac69c554daf547ec5cb9a757c68e09d1278b1f3fa3cc76d005658b7d1c1680210208a6c51a39dab79827fe84a677264ae0f'
            'c8534e53ea9c2e812f13d1e86d0c8618d674ad73400e79df0ca92009326e8da4c22a480ab43086d30144f795ce400d096bbe89c0435f4e8c1b69215679609b50'
            '464e37cd4f2c1df04a22b0c2801b0d7e341206104b342b05b4e828d926ca7fe82db549917054d9b78dd3075fb93861cce92be9398327c671b837cf12b0c7e366'
            '7d207909a2bc6713f0da49ebd0d43fbb97e6a9e8a5edc6b30f8b2a4bf215508a361c831bc1663bc41515ebe26cf5efd9b365f63bb6f13bfc9394d8d3b96790cf'
            '8a7027e6e572e14db5397ec7d1e470a68c533dc278323ab490110ed4502a71581e75bd013881fc15a04353d8f4c479720e820f7b52a5c4b4f243276208ff9d87'
            '3def7f914e942120331cbb17d007a2dfd2df4d4e6ca0d2263bb54e1a52ad72261403de8932b1ccd82024d7ec9f3dd13b2eecc9d003fae662bbcedf105dd9b1ff'
            '5cf9382547f08fcd0dc734856067905eb0addf12fd760fca4f1e763f6a90fe2a991c14210823a97bfe202826484875ff63a9548cad6a4c05dc85a0eec0f25fc4'
            'c7493db92c6153830bfe35dd25f3db5574b2c2f96b0a71c4c209f7ebfc3ee80a4195e8c7441c0c4c2af1e9463a445c795c628da1b5d78cde8567cc2d880cd0d0'
            '74f817eaffe58c5c09301886914dd8c163745e51832ff5f14789b5f4f32db81d01bdc6470cc1fe49d42996ac56b82e04b3fbf7638f482484c865fcd09d849694'
            '686daf1db39c4686e9f097101cd903ee3e3e9bdd670c9501842fe1ace1a0abf4496dcb7fed77cfb2b692458ebb6cdae685b568ce395912cc34e1b87d5e5cad78'
            '2c741d133d39e196547b88e74d8f9020f2faa3bc246df298c6e05ae4c26f340e561aaf021b3aabc5ebec257637ab5737939fbdc6f3748ec3892c7bff6b87218f'
            '03506bc355d0815888019e46d2cf28121adee08728eff8180153ce9db3e814d438af3913ac90ca0b076c85d336171113f6445420e276a2e6a76060a3a3f59478'
            'ccc46161111dc7991b85570bf2db9c6091f18fe55b16884b180f0eac90a29c0acb95ce5a714015c57363befafad1dcfd8ddad508b589f2a2950189e931070ddc'
            '40ff16466839bf9e6183ad08c864182ce874cef7e1e072cc2442ed3f20ba87a22ca934eb1777125bedb4e56a9a8a24544537d414377492e0411a5133e251b1bc'
            '4bff21dfe1f2af95994adf237db30922b0a9cd09694f1aa85095c48184f7d6bdcb43946e324ff3d3fe986cf8417b6a11086e28263f358fcc094ddd684308d213'
            '4731de18cb422a4957632d8a0a4939be05c592e134cd8724e4d14823ecafd458c8f89b2cce14d21eeb204ebe09132c00189bac3c52b0e9b33782f53bf445132b'
            'c861b0ade357d4f32aabc82bd3c11ac9397c1fe7039153c599958045e4f68bac86426c695548b2c1d360580cb228a8a8c8968fedd2348f6e7cb966df57faeb2c'
            'c377d0403fc4285009b12d37a9a675b51ab77ec978e90d4eaf94a050dfbb2fd110f532460cf7c11aa09802770a3ba3e8dd116493559ce155ba4826f0a3727176'
            '8eabea694b73d374d5d88e5fa6bbd97f02c4ae694b618c6aae990817c2d5643d3ee3162c5dd8aa9404ac8561f2ade61da0bfcdf7b9571ec7e50d0949eb25e20f'
            '309a68903e6c1d70f6950927f548963aa80fd1b6af049f686cb3c03f6cea39c5550ef395300fde06cb380283b44c2de5e1c93506d51fe61be913f2d2b510b34a'
            '3100fab88ae66f0045c43203f22c98ab97ba66185f78f2d136f8d5c11b8be9823f35a26d54dda59a9bb47a08010268d9eb8e11ddd2ad641bcbfcca97b4ce037e'
            '7c6505e1300d8b53c87b279192a080425308fd159b43554dfada62ab28a86ba06cc216279fccf6a396578e77899da23afdc7e6c3373aea21766005520baaf3c4'
            '511c66a3ff54224f39b2cbce7cf0544c2cca226bf1e07e17de8aec6b76a6ec20bd9b1625fadd5af6483b96d67993446acc260390d86c5b4cb2ea5507e9547ee7'
            '5eef8b4de36d9db0940b021822bd70210e4089c433f16ddb7ad29af77a2eeb5f645cc605c636c7203f5343de12c38918d43c24163e764293070a0d4824fbab95'
            'bde55c2fbf6f08d964a839cfa81d0d2fa9705efb22cbefa75839fafab39f13a6ed6e9e453696fd1f834bf0220a3c479a5b5bf60b1b2bdc52896608b8da21c3e6'
            'd66154990f27779dd2125c901d83a16a0c39576c2f16fa008c2e566f4fe047e99084374b6b60968bb8f87f1eb444dc37fcb32f0346eb6f5ea5d7b47612085c64'
            'f2b5ce0974428c5970713b181fab996f01f99980b7dc1ee88b3220cef937cf494b1d5e2e947ddcfc7adf747fcecada0c6a23f9f4a3bafd893a906eeab23d1dd7'
            '5390b6212777f1b20b124cc94638faf745e3eeb2d827a12e49318bf3d879631a88a4160cf246589f9cc4f60a036f23380ae9375849c6401a528024f666c68cdf'
            '5bc748bb75d6a75493d4307f8389f5c3b4fe983e02eb33be4192180427f27055c514860d8c3d4d6fed05a005f57cae24c88ad3402f170769ef9308668de529b0'
            '400f18d316de2ebcf83967bc6d88412f4e83d794b6f692c0151c32e650c7842ec47d6803bc92913930f64c03fa43ec56a371bc20d1715554436887f699dde2b2'
            '800414a273627534dd8b8190028a528d2fe03fc8bb4566338c15dc4f49dd5d1a35a82adf569b47d034ccafd380caff8e7fd7cfc39a66f11c4eb2879db3d4ad98'
            '5c2d03ee8f76b4964946a74fcdace134c9db43fd9919b9d67099088f86751a9187ffbeb4b69f1b77b0ed520d2ed61fd69e422339ae3338c2331f5d401d3387aa'
            'c1d652df59377aa7e7fce3904d5d3a9fb3fde3d24102c8c5c2c9d318ce3d1869689a034b3e1fc12485b62d955aa72568a72cf104b1e7b071929251861046cdcf'
            'dab5083c65221afab83c2333f91a9276d5eb66c0fabe0b0ca8d487a8b3d1b79727dc6da32f6a80657bd77f74ad2d2823c7c4692e55e25e95415db00e3c11f286'
            '02d5b6026c8a3f2267df2e5a543ee8f5b5598a640f8e7128a2cb8d51c8acb59001e943f3af19129e6974be19840a7ba8d70abaecec616cd7f99c83ada1466076'
            'b39d91b44c86fff07c540d616dbef2c3462f6ecfb1b0401a22ff808f0ecca376500c8035fdeb452264a197fc63d63a824587de482ece98b6ab15da815828d27c'
            '314ca87ca59def629b24ed041c86880a3c00c3dd153d43a477e9eaa1f7978bb7493741c8c415dae1b98a84b12c2d74ea39e41ef620238466bf7c94b02dee0b7e'
            '4cfb0ce083bc483018a4c333364c89266ad004e84fc616a273b891412c674d91678c2a3e67e6aad7ef719033bd4e8501d091618d355d1079656e2e724c50466b'
            '67bf28a589fbabf3a84734a3a1249903e83892d6881ba50dad6716f65f8bc58e6b1ec025c46d1c266364bbbbbee2de1cb0ef602f40576f7bd45c671c77da09d1'
            '6432bda4e5b3e19f5388cbd45d6a6e65d96d815c18c38c0084d37720e99a84fcd5a475a4de569a9b70b367a603276a36b79cd4e35382128c132feced70fad74d'
            '0dcdb611c8a5088f8929c54d0a52ea9a3498aaa912c91bc06c6fc1c9936c030124478a6eb8d6a9b27a27f3b88986e6a5b2b27075e3fd0a3af9e232b7da582685'
            '837795f637b33b8c26e54614528fb34384f171acabc1b5345fec98446e2c24b5e4a6bb317a7e3cfb2db086278a0da19efddb8e987a631368c02f4a569c475ffd'
            '0d30e2b13a9bbca81f7ae94ac52d0f606f5a7235c088e0a3768980c310b8ba064121e2ac8e89f09a610fed558e6b668c7b4cff2cae24644836bbd315b5c92f0c'
            '686e26b46f3a044f17497b37e04072a3e1837ce58fbeb9b106287ecb97ee9749d5dc333aedd68846efda186b82081d69f402b4dac615c8d421bcf974068a86d9'
            'b9240d33b3182812d05c6c5a653a1ba10a42cb266bdd97a2df6e2103ac175a2075df07e94c6479a234bfe32da8e7d8ecda954d871af93e535418595030e844f9'
            '28f0ac6a69e0bea616ec835bad49280ee896424842b91eeaa20f04f024a9c32ff90907ec1769e9e05d660601c299e4eb7fc8ccfcb2632e5e22a9d47b81cfa873'
            '6007d586434f01386a3d5a8a07248df105c9aac93500bfe8b7324d674714ee71039bf70b0a4fa412bbe41515114fc24490bbfdb649d5f9163bfa9847471f4a49'
            '12510fd431a62ed7ad8c690289b914a26a3f0d8ae05d8a965e0b2471d968bbe73ae16a0cb634550d0ea33a7fc92b049bf997fde00f3a52cd7791114b785d1458'
            '2695504cbb12b409e8a72c4e1f07f732ae8c4855519e1e4fbc441326266afe0ac0681856a986d969f727c2fa78bc7930236f0f73b1d8aba884945a828a122534'
            '9a407f3565519432619c985b25a109c78381a0b668375f643db5fc29899e07a0c3c3d3f22349e3422906cce6f8a9fb9223620a1f1dcc1b0d9d3ec41311f314fe'
            '91adc1e27ceae7a22ecab6742cccbc8a5cd6ecd7abb5ee92da612c1ecaf5251c081fe5f71f104149fb9a37a1055b9b408c6fb4fa6d85db94ae0695beb7de75b9'
            '850fef1316107edafcc8a1a815bac82fadda576900eb8443d97492a8a120dbc837cf6aa0d1b013331aaaff03c6ef33606a90d24edde306b1ec2d702f39feddd6'
            'c268b468901fcc540ad35efdc977705a7deca0f76c212a55acb46b9ce2c51ebfa0e8b8860b5aac4829e3653d27e36fd0933bb421d7e4950ad685413341937933'
            '16dc6e0675615e2507d969aba73b42c1270367ac6b8565c8aa44ff237e1fed1d13d12332e0567a9180bcd5d3d73a6eba0eb8fe25186de4be259c5b2c3531193f'
            'ac14c8c47bad2bee53ca3e2c3f5f1b039c1ef974072e2ea38d35b3799725d3d49db63bb4540f2d4318ad1422dc5b99bc3c9574cba4634a727f433b06355f4f80'
            'e41753f455bc7fda64b59656303a9e2ecd45c6acfcc6db48a3621e387de6a262d0eb9542c71ba7b52edc8eb62c4eeb47a43bf20b84d7042f176c77cb74b96235'
            'ffcc03f0c804eef064516dec9b7493a5121de2e44fb8568af7366c87f9340f7c345cdea55a67f48d7b6f2aa3e40966a3a89e626593e7c70393432fb6241e6f5e'
            '832d3e8df159fe64409b7ff0c03c22bd23e4fac8ed13fe8b4e78b9f4e910c65c2a738d004fa9c70156565e0313cae27ec73252cefff4fbb30a1768cf344d0223'
            '400f2f0bc788511099eb818abea5a3f2492fa3b9462db178d62a4fc8f1973e1a51f96b68c0711f2251839541abbb8e62a37b54f7224e0f3927635c5a64267e72'
            '75a46e891393f74ff09d35f2e46b58e9972a1f5b5152b26a68c975e059621e4cd652e5231ac31505ab9bdd2acc46f129bd21b762b11533e22f8e94e4e496b58b'
            'd70aae9cbc4b2b83f37bdee66523309ed2961a6c203c3b7fa55658cee0e96555170dd5224b695f5a7e72b1cdac244b28b07a0827618674e40635de61d7e41cdc')


# vim:set sw=2 et:
