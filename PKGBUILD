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
pkgver=102.12.0
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
        $pkgname.desktop identity-icons-brand.svg
        0001-Add-a-few-missing-cstdint-includes.patch)
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

  # Fixes building with gcc 13
  patch -Np1 -i ../0001-Add-a-few-missing-cstdint-includes.patch

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

sha512sums=('2a85cf1e1c83a862c2886a63dcf3e3e8bca9dd3ed72c5d0223db52387fff3796bc0dcbb508adb8c10a30729f20554c5aac37f8ad045b0088a593d28e39d77fe5'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '3e05c6c1c415f013c31c6ba90c593703a0017bc1057867bd3c8de308ded14f4c0a38808aae2365dda31f03cefcf10eeb3d20a9b75095bfcd698f786def348f32'
            'f08ad62427923d989d0ef70aa9538197df9be35126ef32355c244ea2c5447bf12cbaba970db3e96f59e532c35ac7344597a0281dbcba4a6ed60cef806a89b8f9'
            'a1e5dfb80d902c7f49e45fa6759cfedd39c8db708217e282d2235e2976dab46045154a2838bf4334cf1736d89452ecf3c8c0a23a4e8125eb08bfb004b5d1d0d4'
            'e615f66f3088cee9c99203f637ef9d2db71d608ab00eaccce2a6de9d2487d84b81edc6ea91bf554ff441f8c45057e1d4495e0cdb29e4d259f56e6ffc574bc8b4'
            'd18a4db75319611b7c713904999923d6686c017301b85235c9e3a1228f868b0ccf1a763011e5542424c3f0b02af847802711661e6304f124321b7bc8a342ddd4'
            '90bd4d3b498eb3c080ad8131e23b0871c2037a373b417540e79a90795e6086137c63fe16db06606fc28ec64961203b813d50d4e79909c08d636df379ed3ffe67'
            '94ff9237efbd1703df9d9c7366d14b98ccc1fd1d7dbf6a14e4753db747ce879a97738a4e21853fa2723c0b04bad11c968ae21cf3f1fd44427f8c20d16e5fffae'
            'da4127d747ef9f412547143fe050c240b269abcc0f54f2e761d2bc87ea356f45e0f8a629598d2f25fc9b4a9cbaaccb05e162e0ecee4c86403b268ce884f54300'
            '918e8faad7f4aaed157ea5d74133b2576100676bebce5381783ad73a31cd275b846dcaefd607ffeaa9299554a1012f8b473ac7f97a52717f03c5a65fd3037145'
            '9d50a164226c951709b329fe640422c424eb5a9ae7eabbcfd57345d32add51be612de65b73bb129f150c1f703fa87d5cff07750852b6771072127c9fb664a06d'
            '27cf52e542ebbb16d1eda69ffee1e25242e7fbb734176d867614ee96c06f00015d8a1839d7fad423d74bbae2cbc45eea7d3c40bb51b8ccd55539df13bb09d02b'
            '97463f60914e4b342ba3286d8a0fab85db55e9f9c977231eab66172e158093360c337d8800982db4f373ab33879d872d8c1c70b2d1e92fe67d90e04324286901'
            '9e62951ff6c1b6f67164247cbe79131899c513b4abd23323918fcf587d737f509b6b064294765e012e9ba0ea1d9cfe2ec720af48834f0090c74c6da1450c894b'
            '84d849579739a7b1bba5ee6b4c16af7a8ac343ea0af3d510f59549d67573e1149253c945351103d1bb98899c8d244322064b9356a332226eb7e13eef3adc0f08'
            'cba4f52dac5d63f668e0faf5c7ddf50c23bca6a1873f68c01691c8bca5486ae299f0be12756824e51f4230b513a642c349e0afa7e2870b54d49d2dd9d8631d28'
            '51fe86b3a4879c182da190c3aa6ea22ff5af6ca19a1698e0b1e381b82698bb039027ee764b1dfc2cd8004f83f64cae7730b201295335b6fe8b557f63cea9445b'
            'fe0a4cb0fa5fb6c400bd09893b3398912cf5c632477fa1319dee39e3ccd84efa17b28e821a59ab6535a8c154d10dd5504ece2f0cc068e542d3c9ea24d0b78e8f'
            '97d398e6d67207b346900ee7cee6a3c29cdc9f42fd964a69486033e6a43ad1aacea1183bd923b653ee4b83e3920669bca6ba455b44f524ffb801f98bf076e847'
            '16353fbadac5dbafe98327ce65d0bfe74b1bf66d8133a239c4a78142b2da85294d057661146d706aab626e123de74a59e67e50800b9fa21fb0f5805aa93d0efa'
            '6228c2594dd0592169966566bb946fd6829916bf04424e5ddd90aa008d1551fac4daa65b1d48ddb36c97d7756d0308f5ecd703a22f74f40e372d3e5837f818bf'
            'bfc392a20ae0b09b37c1a3beaf01f8c464d6f7e4414fe67d3140ecc0855710573fa39ee40aad29b2ce35d25b1ba0506304f571ff4ed06d15b601c2dc63160445'
            '4e57ec79a3a3d196dc7d35f25c65ed2a53e14702e16033ccb156bc4ec43df1433dfcd0d90e1e5b6e47163de4f95ea4eadaca9d9fe9e5ed9deb8518103975d839'
            'ac25ae7b32c5c10d014e79b6ca4db59b560d0c0e57d4259a0ffce3d8770a02c70cd17e87b409d3f07415735c17eb355ebf115fbd5c8208ad350cff86ee5256a9'
            '6cb070f34c57547752446e4b7c658c66a95504e4ee06c240386137636bb56085f4ee611247441e97fdb39b99d0a6556da67586f5aee5bd30af8561d4d1b19b31'
            'fbac584940bed0294bdee3ef00c19137e38e63285ee456fb6a5b9d71d122edb1d33dec806120e7b0314ced120a313ee4853dab25d7298e09c0dbf69863a99546'
            '4c774aea30733c2b4bba509d12916a692b2c5a0bcd52b4c45ed880d3f2c65bf768fc0936ea6b60931bc49c1193e86064d9aa0df12cf5645bfd295db708b9b570'
            '458dbd66dfa46d8419c2e74082259fd440a8866be40b98c9a1f4d0895161aec292b0615f054802ede354c76c838280b8ae9a8c8a20d7d0b13ed6763c4c4226ab'
            'dfca94b0f47cf52f5681753f86d11693193fcfbcef56266e0e594e8fbcd54f56e6170a91a0c09b12128190a305683687807e233ece21718adca65d923c643989'
            '2ea543a89f0b689f06e9bc22a5779afb43466da42fafc1748081e06d095af61264eb1e778227d5348095cdce3d4a49fdc86e29c49b89073aa91d2c4272dd361e'
            'c0db6f9c6374a4f118d8ea34f22cc49359f6c92f7717877dceafb87596d8919e0ad84f2a6b0f33b674839b7f313282258bdb630d84a7e3975ba75998313da160'
            '1e26686960542a66fdc725514b7bfe3699461f90bff8ae5e27b80887ddc1e4fc88abfa334bdb0a139587d9af9d5b810e6a4957a8b0d62961defaf51887c87305'
            '89f6654e37489042007aa5311f039a377a6611098a8b0f3329e73669b39d9001d031d946c05f8f78cf254d594f55e3d6748db15c15e3802122763696406e7d47'
            '5186a6044b0b0dbb0c6ec0abfc8429b5d4da3f6679ca38f15ca186683dde438e9744c657fd80ddb4607e47f7d00cccf3ebfe8c5a6c4211c723170e10df67d94d'
            'e56b841b0c6be321b06730296bcd5f35d73920b897c3f1cddd799b77b23bedbdce35bfb458c28e697083ec035773e14e9f39eee9c1dd5f8625b9667c20d9240c'
            '81f42de1a1dcf5c68b6e1f9aa278350e07441f4ed767c895c89083cfbab54a9f75d84a94d08c4b4a3b9a0df97478e958a1e60fec011d8c30d719a76eeb541cbd'
            '8fea2fc36214b4fa3962d9a46cdcd715d58447631ccd4ff0ca55053d35d32f3117ffc9b6cc6f056c403b678495397b849e4ab9f30d5daddcbe8209aeaadebccf'
            'efde0a1b843941abc7a2cefb06d209c9ed6e8bd7dcf7298a0d4b67aab6c504057fcf4aa4ebccbc3517b37528a4323eaf24784514bd458b10e5fbc5145b18cc9d'
            '2937774f1dd00c990b7126b3114427bcb80c7fc3b5a9bfe292ea5e02952b0171bb90630d1998676d7e3ecce3f4b9d83b658091da2b2d77ad8eb3112c8dd2ad33'
            'fc4fb54dbea84bdc8aedc09e0859828a8cd3d92b3060448b3a945b23e7d370edf4515c0e738a407ca2080c98caeb87588e3a242bde3f68239783b0fcf3fa704a'
            '9e009b6df53c7dc21ad81177ff5d8c9d11f6828bb8ef46380d52eebebca90c6e86afe474dc94bcf0136d36c01ca3de1ec546615c5923dd26a2e63af78ce69cb3'
            'c2bfc1c457cccad69f6bc7333c40a2b7585b90a5066e8d2d6daaec175172692248255ea850d560bedf2e9ffa1c483a543c55c121315532704cfb899a32a1864c'
            '85e448dc0449be41f6c76696e6cf2a333d7c779fddc836ee06c4dcd55d62fe2a3550e8b43b795732db462a8efe5a8308bb8fb450ed37721c0711d35b60476064'
            'f3a42c868d9822bb7e40e06201aa02b3f401709665d181b6f6cf9b33634dc0493dd18affd97bc759c1afa604225b795e65de9f0c63530523649c26be97629c19'
            '701a433a57fb59887b8921a7ad6a1ab9c1638d95afb83c18d5288272bcc1ab59012574db7322954e03e857473164339a53ce303a453d884612000183a7be2585'
            '6560ee6c870c72041687107a1eeb25ee09cfa592931167f8361196b95b6e22ae5c9ccce7d883327461481d0d84e589eb248dc283741411b4724154f1fea1e6b9'
            'f7755a4378dfd1e281a29c6e4a8b043f3ad78f439d81c578a5be6621f1ff11ebebb88fa9ccf110e5650af549fd32468abc8665640410d53266e488233a896385'
            '6c18c7d221e7646a9b7e9d71edaff99c57fa3736d6bce7f27d4e2ec51b0a48ec5fa67a4bc89229422e4ee82d2903f94c83d4e789b1a517a08e9914dbe5cdb6e7'
            '119ef5ceaeef7d5bf730643429fac52ba7f23d834ef448e6ae19ffe58929535e6411eb472f9cb60acab126124be84ef99d82b7da57d99170c7fdd2daa00d751b'
            '425ffcb4bf3172411c1f8b84c6f2505f312e5472177dcbebb3e39fa7a2c5446aa923ba50393beb69dfd5a9a7b3c25bb8136730c7a74ec521253517ab290afebb'
            '39396b176f705002111826b23c8518b4a48c07b61a1e63aeda1b21a09ef589b996ed76841e600c7e903f68efc02270cf250ba9760906ccb2663da8ea47e5d440'
            '4c736bcca4b1b8e45e6829ce1e85ba997f5cf0c00c724966f8bf7a38cb179ff200bb271ca6f35b2ecccf39172c6a5cc27222f5ef7da644cec609b50672de7eb7'
            '9346f3887c7d5568bf1932c95e1e72d6d51c122efcf27555a2f69589bd8c9c91940bc877bd4cdb65e0b75b48ce048789f2e4c11238ad481552722829a377da8d'
            'f69da891596358e081fa321fb42e4c6f3578dc8454e7ea75ba823f583de6f26d3a3825457ea0d2ab2a53069aa3e8c40336f22f9ae272fcdde16ed504c5e741d1'
            '2223cc66c78c9947cebf285422f2b5a5f9466dcdd3c12e73bd613ead46d772961a47a9492aa6be27b86de3880ab24205387e59c1358966aba1b0479404dc5496'
            '73dad831a23d4a8e7ed86492be96e216cc48c11015c77e62391749151bec21c36bd76cc7a76aba22b4462d45a7e56b02199ce26f1479d747cb2708f2d56b37da'
            '0615960b26a11250b58d9c252f7b490fb3f3f14dcf6089bed91ae3da0fc04d71022dd367a2e69e44592bec51f1f08d84cc106a5cfcc16b5ac84e494f4c09b737'
            '06b3cb8e444af844bfc5381d9db1e0fcc64ab9f0cc4b81479cc4c55336f30b9754d2db0d859160d54f9fc0d42846670d2e19c10e00af9ad2e04ba04ce2a5a082'
            'dd161f63fdef14dcc3736c30b3b8a02b7345fe184d4bd654a136dc34f3cc138ca0cf940ad04d244d09894e6bfac3da44b8cd2dd9f699a28ec027eff33fde7162'
            '476ffbd17e6e09011e3bbca1de654e122198ed34ce3903d20cc6bed9258ac3897f48d278b4a52bea69042f910bae1c1a215dba534b9cd6a9dccea5f18595ae32'
            '0be15bd29423ed73f96c82a3a8dca68f51745981bd26282064ee18e7a29855d5d2ceffc4d3b9be995c839e538792dc4d6eea51d0ec871a26abb91664e466c537'
            'f8d22eb95d544a483468a79bb9cc9815a494cee60e27e0333d2f53a900fce7c3f4ce6a0ae742a482b6fa7bcf4d2871f9ad8dd118b8946155fbf79fa6936b6879'
            '55f25abc87b25db2f5e01063fbe4cb8fc6060aea70bbf35ec9784bc4076c1faec52f85f9d14873dfd412fcd94a1ef42fd14fd76be3948f8d712773c7b57ecb48'
            'c721851964a4bf16e3703f5bdd7831efc18e4cd344938e800faefc5928ab8e383110e6af71fc026b681bff68e080db49e13aa582f858de2713ab3c8ff05ad59b'
            'e08f0f6b8ff04fbf5931022a88c53c4954f826955a7dccbbc71fa3e1ba3f8c7ceabf6049bcc133811e6672dcacf58248ca3ef737e5ebebd26cde2774598b4ef4'
            'c271d7e69b0c84469757c770ff9cd6738efdea8dabae60bed4201d460649acb57dc31bc028c1fd89459694d66b518188abbd2ec2d792e4871356636c0a3e3f02'
            '27040a3c01b1e938f3a8ac98cadb484fc1a1aa2823ae21cf9dea00ec641371e703cca1957320b34806590bba861df1c18b78928a71679da8a55dea2f2d655ab2'
            '482e5fcee9efde58aa8feadea1c114595f682e91123aa07b0cec78d47e716cbd59d42ac4654dc2981c6d0e83f4d2a91170700db88d8d21913be1288691fe9381'
            'f7d73b3c77eb769bdd756d8d2cd91e89d2a70360d13b228398b4ac756256fc34b34e19a50952ca6921703b23086e9d3c4217f5b12ad0b373a244fe6a15c12375'
            'b0fa33a2566f75a361586347435a438e233f6ec350b24a27358598c989c1fa6dc6e77618170ee492ce905e131f202008ba64e2117c5bcde49f4cb6c6bde7754b'
            '2e6c0f9400d03917857f4a7045452319f09e6af33fc70383c8adf4036de2d8de6c1e707aa4676e4831ebd51d475af9df85a12c2f0081d53b124e761f1a31671e'
            '82c4a02c23afb2a76ad8e1854cd693b7726cf091efa996e8973b8f439995173e7a5dc8d9bd52a317769cd6c80804c088c5b66bf5061e80ef9cc3310ebc6d0041'
            '2de9847d22545d3682b6536287005a4853f55ead9475e10b60d98c6cb7fe348621442a3e31d10716b0ebf7f74212c545bba210961f1a3b511ad333a5e7f070c3'
            '5e60897325331a6ff9584e0aa3fd0687b5831026d3f8821abbc335ba99d5cd57ae02550dfdb14170d41e1e1f407eed6ad8d924af75a2d7a38d3ab7facb35488d'
            '9653e3fece068f5f9a94297923e2ace14f39c57d7cecb3512882ebac58cf1974be187d521c2b88b54545815c71ad2c1017719e87558d5d39b02be4e30e8e78cf'
            '5700636dd0fffbe06a4ec0817dfdaecd59c471bb79306e9af5ca13b0c578bacf8bf4825b6d34360a42a37bf06a8f139f4e31ed4f621195a7a22ecfd5770bfa26'
            '84b15cf910c360e463f1d0cb5837895323e40408bb0cf75ce88abe81ee0ccd4c7487e26afa17476493a9b173c873727848bfc2a278d90f7a096080eb93306cce'
            '442849167872610a9d8d77fff046b0a86c6afb1877f1a671419de30049cba7eedc5d8160ee43c6db2bdac75fe910de8922f043534458311363a66adc6128afbe'
            'd607a2d5eed587d9d4bcec1da7ddca660fec67cdfcd1db2546aeb7925d618f9db146d232c6599ba0a505d9ffbad4f6fd66732c4cce43a35e80d784346f449ce3'
            '423fe17d89620c267cf08f9b46fb039b0c034139b707d75f228493189350d06961a6981ae3fa6840d19cb869c744f22fbe55837331b2b5bef1276a831f5b9ae6'
            'cc982b654728bb0c56d8d57bd16e893ee2e0c1d98e004ff080befa097dbf8823424d27629a3605236d55785da944c034924c1fb4d131164c7a44608672f71982'
            '665731901ebd828cd14da231faa02b66b28311ae1a09cdfb0879b8a7c8e39d30d8f20ad24e70351e84ecb29af12dc6ed76194dd6abe336fcd9e697514908670b'
            'b84c507fd2072af8666071bc331957d7f7501c122257047d93494a093c090e1b47228bc2119d4fbc45dd1abbbd605c526faadd14326a01d2b107f14a8e9ba887'
            '7b9aab8d30a8fc74bc34c432a5dc58ebe510a3230b64f31aed14459025b7e0ff525bbceaff7c0096ea4228586b651341644c54b40b4456596b098265c56b10d2'
            '2ba4e19852a111a1c0a06cca62c78036a682661f76895319459256fd849ecc63ea9c6aebfaf2364110c7d966d47ad69d387d955f87e25371a77dfe570ddab573'
            '8f1f3b4cc4986fc4e8861b863446e46201ec2bfdfe0aa4c544374120da184921552088aabfccf901ba346569cfe95cf21ee629730ada345c697a4900ef8d8fdc'
            '28947b1f180ee61d52348c310ff241994589d929e5d789599e1f9b711662f39860a3e142171bdee8aae2f3747a0841707d15b2b78d85c95ed6e7e761cb23e7a0'
            '62109462d1ca4ed9545b324559ca0214934877a42c98432186a6e4186667ed802f937e63c5c7587e7d3611f97a71851d38f3a3e833ed7b1a5a6ef976e9bf9ced'
            '2db8614b1ba6fa5b1d0fec2a23d05415546f7ddd9cff244d29a01ed11ccdd6b95b1ef82a65fa04456e9c06718337630820bd365abe34b4423b17b6d7cd00fd80'
            'd8d99d1cc4c15ba96a533975ea2acbe498f16efd4c6131c65a2be794f696ec174c81ce1d2d81c8a5b265930eb77e76db074e2d9da5208405efba9a655238ad2a'
            '9456433c6e48f54855935838e9315bb4f9ff3db5f5fe339b5adf2d3ffa1329da15810123205ac3b89235f8ae02a8231eb1ecd3d7e0ff6864fdf4041d195e5660'
            '7efa6b0df7197153776e06b0241d5a19a8e5a79b95ada7b42c6b0aa742f046d387d232a4dfcc2237e4034b6bce878e3bd86ed0724c8af1bf877c03299ea3525f'
            'fd3c960f8553abc8959c3bca0639b974bd0f62030b562c4661a5eed5de691273eea142e8cbf1e592976c309a464ec3c629b14f2091dfac540b82b44e8b14c314'
            '5fb27f2a731878dccefc2f081889549df3d0515a932ac282f514771838700563c51148e5044aeb646edfb7321c1d7c59e1c621972623877dd901de69da01d5a7'
            'c082c61631db309cb89c065e02ec7a2890768f75bb504193207a35ef957f219621868a334368f8cf325bf1250543ef92de5631ab0bfbd27cc709cc9ba084674a'
            '0b072a6b7faf00d169cccceeceeb851cee5168c1027c5c4666edb05c8373c9c21ed4be303adb66ab75138cc4028c7cd0edf13548b64c38864d4972d1cb775d0f'
            'bf176ca21fc9ad1b4b7fbede824be03e7324659093b3fb101c0f8931c029ca79bfb1581f5c843f23d9c552f73a1308ec931142f93368307282054ab281c42421'
            '5f6b9bcbd1cce9594dbd6123d803e10a604cfb40b34681632ddbc9e670219fc679ead4856a11b15fb069ad438c6fc75d7f98ca9cdf2195e98349fc72111624f3')


# vim:set sw=2 et:
