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
pkgver=115.2.1
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

sha512sums=('5f9ff96996e3c482fa4d2e2861fdf14d2154bf0277d412bf9c9435204c7e2e2539ce7ef0891d8dafc74d5a12650a5ccd33d79547aa1bbb2c2a0972aaeb755edf'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            'a10ff0e945528f6723e830a608f45592e27eec5a37b8025a215e03b69016a280e5c5266919fea2a20812cf932f86d29a9716db2eedf755d7e9c41b801929a7fb'
            'b78836dab6d56a636f2f5beed8b485b5007e1c4147f949dd6745449580c052ef359ff0a52b2851e6ae41536bd19b55e07374b1e8a58af93b305e617fef09f69c'
            '45bf064dda5ce66eddab97553003ddcb8c89a522e858fc931c9221eb97069ec6c8908fd361fe12377a009fecb45b07b51fcedfb16ff6516b108abaa4b6309548'
            'eb2964cb427e9f4640a2f13e87b538c2f5e6c02641e1570b35913eb54ab782bb3ad84fac60504e6a57e1b02df2b74add6af192ddebc1fa33b8803e8ab6dcbd44'
            '48b267caac5d93e63fb62fe5f22ac42bbed5c8d8164eb301a2ebb86010ddfd906072a25ddb9c27ce2188cdb0504e2754571aec15919e4c245eebe1cd6c551baa'
            '1e01cd84a2495294b9f708aab1ce31dafd7dc3db5a8176e4f7abc21af09337fcdfe56e898e6547b7df142899f202f057109e8035c3b923ddcfa0be7c69d243e5'
            'b298bcb885179fdeee76c8d6d604cfc5bb4fd97614a0c060b8a8774502ac6ef6ea66a305ebb571c3c6a704ccd347886362a07ace8536521544f190cf6550d3ef'
            '35e9f81e78af410271e2e840463620d40c3d872399d19412af77e2e2241e2e413bb38f45bdbd82e542d4e7f19179bbd0f3ed9a79e1cdb3737537a2133564dd6e'
            'e9e465a0c171a6784727a6f74e50f85b7ca6affce7162a86cf6defe08e3158785467aeb079032ab11b97e996a5a1bd62db570edf5bed7de0da249b80c9ed7e67'
            '902a839f97737ab10bc8db0317bf9257d675795824ee9e670adbcc71f249c9882d0794e8da93c890f965da99907525f550c1a9896fe8dc941509202473ab7051'
            '21e0074a4f7ea57e2aaae7047733b6d54af739b9099977ca461ce7e3e13bbcc8aa979a49b631cdfe6b42e2507144678e202fba8cc13014ec2c9a36e81db272c1'
            'de3926f87afc1a54bfe1c2332f91dbd63d4c024fe08ebf0ebc2cf68cec1c33bfa3b7d208831edf254418e770a55598d4a8734e5b632b2e50e1859a73bee96d23'
            '468a8e24b52cb4739b6004acbad797a37515edaa53ccfac685475df1aeb00d7add0e427fe14967d262ac57626756fe3d30afcde47cf7feb3d4a26ca541a54430'
            'a28869ecd76824ee2777b3b8503d36b32432bf613d4f234ea0ef4425fe436a6283cecc55dfd8ffddb8519de30fd8c574bbf9b4be3e7a0345371da79472f3e277'
            'f973e7093cdc9c0fedcf6b35c4b186a177241e80c5ffa65c2f1cf0cf0141e3b8653312d8a125f24397a64f073f0dc554956e805fc2bc9c932d62cd46d3dc7c9f'
            '951a8ebaed531577b8cb3924ef28b376a096581c2d3ed8b078c18f9e45f8010838ee9c08a34e46183f317eecb6688fe240de24fa93d908d1357103342457c830'
            '16247ce3f7590a301bccb5f90ab3c15b6c9a4dfc2f151285f0a883224ab78002cf3ca99851cf1cd1e8b526f967716e5a29dc4841a294e99794ff7e759f8cb585'
            '9265461925925703f5d189adcccb587ed8a3444d39a68680632ab8c903ae4aee7d908e76caab18cbffb24a488edc3200f5ea23b8c021e6d05fa9dc6b1100bc92'
            '5db2508f45e120d130599840d6481087a7afdb94b9217700c2236c454e0f57124326c21afd5a3805e1c31f1bef1e84ff6de97fe98bb23b86a19ce3dd18715575'
            'a8231e9f4decb5f10b37d47c8e891a2a1079ad6c3f0868a663a97a5b37ce7bfb1a0e9256f4484e01b0735cb04b6a77604817ed9082adca267938ac2443a32801'
            '2bf5f9cd58702aa6651937c00cec14ffe15df90e32179cd7b44539f59b76c16940d481013aa4a4723f5b45739dc6432504f6e2b52b630cc5f1e93a69e761a5ee'
            '8c6e6ae8e75bf0672fe25e0fed9f61309f1970e13f9b3a871cd2ce168e91b2d51d1d56fc31a52214e75bbe91e859fd376cfaa42ab692a92eade560f359bcec45'
            'cbf7f32160a37a5ebd3edab07172aae9c406e78e1904c0f6830b89c9b59bd3469e8c456c01007a463655ff0d09c60dc5e1e502ee578dc744b5413db9ebce6f40'
            '3e88d96d218eb861b7778818f83f5155229369c62d17c9080bc1ee4cf3bdffe13668d2af63a06dfafea47dd5c2b2e682a0a305292e18517bd51e2cac27f9166e'
            '203aedaedd8f0a3ba0307622963a3771535b14914f121fd33c57380feda8174060a7505ec0d6e065224061e782f619e63d50f3bb59674b3781380257c1465eb3'
            '46afc40ae6b050b5e3b0eff58d019fcbb4ccd1e4d278646f82c6ffbf676fd05157132945d99c5d7b3e3e678eea1af181897520ca224df03cb8ca02f14cca33a6'
            'aca5dce7b3356d9194ba9e0f74c4aaf328579c023dd21b01181ee2cbda45170b9a546a0231870ab96c5a38adfa88efef97fe4cacfef6e8e6ad1c46194324ce16'
            'b36398405b02bff14e4129b28cb85d8235e0ad9ccf64347fc8ed40e1cce8c83ac727152f5048df58060b07a9c64006d191c094953e30bfdff054d0fb26b470aa'
            '492755ebf3c48ef0d273c15a72f3f7a4813226eff967e87bba1677306ab4ba852cf79c69c930d0062c1f545bc5dff42d0bcc4ea407026b3577909fa51070f5e5'
            'f0496aa64318fb69fc8c20efba7bf47b80f2855cf3ceb3325921756baebe26c6d4d2ef418abb99fd30d29c3987c78f182b5f4ce0d5a3662c6be5b858e9355481'
            'bae42946ca0a19be1560cd9a11bddeef5ab1f82b1d3817fb42e683d6e7222f868be1b7c3df4c9f059d49a05ca7fd2e7c0d4e5183d610920f04eda9950cfe5a9b'
            'e64870c3521c8d750ca99c565e500f8e517f52abee94cc47950f9ffedc1129def091a3c97b84576d5df5557795bb5ec25552e1989718e4afff722635e3a0fbb9'
            'b9d83f89890bb4c4d5560ac623d95c7bb965334c04754102ef20b924b43cb365d10a3831bca6905553e4033f666578be761df9a9d6f671c0b7f6afec97c72b91'
            'af010a13680274ede90449c68e5904f1069f9ef986746da08b1e0b4955038bd88f3bb05226cc9799396228b1025b4e5a4d83a250422eb089ddd73491ff255252'
            'ce1d9a84860ad09123ad98653f9dce9139730b17d43acbffa749492818c15b745145da68988ec9c8c29042a35d00cc813233d6224956c9573225d9a8a49b8a92'
            '9819e42b4ffe6dd993d941cee97c8cb9f9f6d7c88562b6123753ea2bfe0c199c56d2a48dd4b460d2c791607106dad015b31d1c8ee2d7761c1a6ed4ab19330ca5'
            'ee6c8ae08e183830bab4b8dc49edb54bf99d514033ae78ad3a6f52d6666ac22fd9fe0c748c4d33e6482e4802a0da145fdf782e44fb561e3b1231234dc8933717'
            '3a9c8ee880bf38bb2963877b51bcd44c83a335791374dac568aa94bbaa05124123ac5e5827e7777b54d0051ee7b2f3c23c5e7c9fb1fbc1d523a87205ec93a976'
            'd83ae99e70c296c99915ca53f496a9d134599e2e24bc3d069e25977412d3fb21a4afa45a7cb41312489bab8df7945df8aac20da6c4059ff59db928c84ec1b414'
            'f51340fd7504cc8e7447a10ff8932d672cb2bc9b6a23293ed69ae7266da1eaf00f0d000cc61f957f054869d38990914c1c59506dda27b7503f7547ed533ccdad'
            '0003d93301c7a93c3eecc9ed28a5dd7f1c18546ee0f633ca098fea75dba46393bdd305b8cf380261a745f34d668feac470124d74b753cc6b02caa2c4eda17d67'
            'a5025a1e0b5a2983e3cb681aded56a75bed69c088790f53979559899994ea82f9f8f85d9138b0902964c76663f8b1896a749f24ac1b58b9ca40c66b725f4e0d1'
            'c63584b1be78ed2ba2785c0b373660e4c4da6df4c3e3488f38fcd40276db789486e9dc6945c4ff070557a14b0d892cdaa0b227355a1e5b4fb7184644a384f9da'
            '7447f268724150e7e8cecc4f6c9a3e387ddf11d149bc57cea5798e27637fd7b303cb7c6aea136c5554e0d5ece6013195b40e66e74b81c9a3f5217c3fa076d5b8'
            'd652fa46124ce524bd5f490a12ad714a97d835c9d9eeae890b137325496e10d330494bc1bc5044baff145c046d098fd0e8ce70b70e9caa1ac2f113285c2c8511'
            'd3763a4905354128e61bf2f8984ad14a0215e2e2b5b50ae7aadbf3c9d707ed9dda9d1d52256904b610a9de9829038a3510d6564b5b41a8df3ecc286b19e0acf7'
            '53728454d1f2c2a66ae82dd429aaad47ab8e42a79ea4474be8e271442c6c84a0f70cc6f69297a91e9ba733e96cf208e81f763866f01ccd6cdc31c2888add2a0b'
            'e8acc016f2c85e326b4d402f5a3747aeb5cb66a14076f46a87806d9945a061583dfd3dd5a56b2ee76d5e707334735f2de4de7ec17c30d5255a5f81e97e8d849a'
            '8c14088556eb924d224de01b58c4d855dfe1d937cca41f174032d04a85dc21f0906bd84a69fea3a7d3fad18b068606520e06dbc5fc8f92daa4c010454d398dfe'
            '9755066a8c03009213213b95769508d1ed68686480d11ab306483217681e2942abb438b4871ed8cfcda08f628f74f24c845eee05067b3b019cbf59726110b011'
            '2037960a4e273cd7020e8afb9afb7c636b39101507b52c460eca37e173776415c7e71862c2c78482f396509f28db09d0c7ba5bb8e0eb5a8a94c73e33df84da90'
            '609cc873f1a1c18cfd07300a930eb4621455286fad2c3684b1c461c69a03a2ac0f6b3700f1799249efa1dd7fa09db974656eafefddfe843db2ae738b0fe1ee75'
            'd0529be9fa0f976a72545d729db51f058dc9ef7a266eb08a3d999c0d2ca7c0947ae44227a28d1ed8083fd0599a0fc1a97002be8740a98045b9f147e5c45d2e26'
            'e78a80a8b0d2a968f1e0da0a14e63dad6693b6b0992156008f0f1e4d184ad8ac7e7b31a2688953eb364cd7361dc4feedab637d3cb311a4e5058de17270e59ea5'
            '79846cc737766c12595fef2ff3d88eb6a55fafe393aeaf43b125426b2a11faa89a4c6c20a8ead07d32cc737ec3f73b550b2edf6587d3737b305cfef47ca28d20'
            '1cc772bddc85a2966ef2aa068d254e8f68df1f6d50f958afe253fd484e6d0b5ab0beb80b59fbf6afa8177c2dad7c3b0ae9f37fdcb41e1666c93d41497211fb80'
            '14f37a6a030a80899e679423ec36ac2f4d4a5d53bf308f8528b542d8bac6044c55ff6705885df9ca0d7b7465a51f9650677899f5e228c2eaa2f5619d161131e2'
            '423e60341863f3e098850fea839239d6d532ae04e4096cc292e7bf87385ec0d1403ecd5acb56b1b1bddb6185924927c7be624fea5af220bbd0f4bfb1fdd1e74e'
            '640aa0cd5a39384baf4d2aff4b720710e6d799066119e3ec352d522b7b762ce8c44df4bf68a3967b250479d205174b634e31dd828ca6782afed233eda4c86244'
            '144124448996422279b89898bf5a9c4cb4c159a1954372c4e4cbb40f76f46623386ee52d19cfe86f9c9dede49d280fc83f89d06c6288ab3c896cea0e4cfd2d1b'
            'a55afbd2ab42652de4df23eaad0ebef62f32a7a2128c1e3196882955061e0d3489e56658c86fa0c8851a297961dadae91d4c6f76d378a1c86b81a6dbcf001963'
            '0e9c374eed94324081f879fe8722f42154415bf7a5651f3e98f61d2687a40135970d76b81b24bf8d145a5f003b180b0473cc4e9835459abe748b1bdffc4e2dd7'
            'f2584ddfe32cda55ad2f175e22e8096ade5078b587750b22cc8c2a6dfd5bdde67105d0bf3bf1f8ba867a17d4ed24b45628b2b4970a4021d5822008f0621d9f6a'
            'e05032fd5390b52c9d319ce25520887b96df3f4250d1f472aab7e2ea8f569f6725106b3f8c9c8c1413b89a43b6549de6625eacd7d1682ca8e48fbfd9f517d08c'
            '64b49537bc394a39fdb48335c365da4fcdbbb83590bf3f663a37f4f416591c059baf17cf6c1347872daf7c241d61a4fd3ce9be5752c34a92bd706c2c51c73ea2'
            '862bcabfcfd6f9ea6c2838b1f694982ade4616492fb43ed337cfb9777894b9a5b53129d5b58b8cf94522b8e017fbd07cdf411f58a6a741d891a44cdc2c9665fa'
            '95b7f11f305380b76768e191eecf59218f02ed6ae742b9d5ca79fd49cd9e0632a0ad694e5a7040e607bb8a2390d0cb70a0806de36eb84f776d4d84db0ca00fb4'
            '0440da38a1c13834b10467a43013d797f95394498299571272f397707a9695923dc608b136e11ecd6b809b5a257881f13a3037b674ca1959799872daee97ebec'
            '57aa30bece8fcb285048e05854ee08c40c513d84b3c7f3b055bf27976305c73c74755560f7860c51f779c1a97d4009f741ac613099633056c481c7b419018d89'
            '6dcca3a760ae8f576b7e307b1eaa4a9337ec96f26135c88f361bb439fae4a867db7d62d8e745af05e230b618ee9e0d5eceffe41dfd9730bb0d3caa949d1c19af'
            '570d0926d3e8a55c58546afb667e87cdf70bcd8062bf0cfcea971295bc33cf22be457f0fa290b6d3223936d0e9bcc26d0f51dd333f41a6199e7924d5d60563ae'
            'c77ca1f76621e90e96a23c24add9d050793edf13c11d95c2d0b25dbee279a7c4a61601f18e63f043ee07fd3581d542bc5ca94531581f5c9479d569c280ba425c'
            '55e809bed93b849c8c5bc262ff205e3b422fbf95398c264150dedefdddb8b9fbc30251a5f2b8716ed74340ec5e272340678782acb5cd8ee53db3fb3c6d3aa930'
            'af289cc4c72a5a7e91f1d08cc05bc62b7cb85547f35d14fff8fe401ddabebe88afbb05c39a2cb0261c4c70ead022ec6435d0e7eb779f65e4bf6fc63f227ecaba'
            '65678bdcec7b1b090676bff4300e0492ba14fee79b02fe85edf28614629e38b668547dbe992c5e0937d395c968e3012f74beb9d40d33dac4bec3b3979de84ebd'
            'bf70e1a68915b4990a7e71f3ff2beaba870589759caf39aedb158a877cd33d7b08aca7160ab9adf88048200a636dacefb3421860259d9e75d8ecb6859994a312'
            '16484a8f8d0fb0a7ffdaa854391a204dc1d148b2f468bb4a69610732593b4c635136954ac9a69b99a04af5e31c7feb23ea9775a5312da6bcd524706fac5315ff'
            'c03d5dacba95b82963cb0ecc2d5eb830958faf74a43cb33275930f772f67aa4627d911292cda713c74b1af88bff1bbf01ff726ad1ef216fb267978e2b999bee1'
            '8b2d4e1d9f2a175834ef6d9c456932c7593bb74724b43e40c6a23a749de2b9c179540496f98f740e752e5ab3d1b605a290430c70d2ed0f5ef61a7b852721c745'
            '3fd3a7ffe0f0263ab01bcef7706da4b2f95fc1837502a5938f9dca2602ede2ce546253994092b6551cd9fd2dfa027990560f08603827165d1adbd8562cb9af09'
            'b7e9a258584765361701de33fbf78de2d95720a72d2254e4de3469b150078290ceb21e42735b12898061bdb04f043786a9a2854f074d286e52bbea3b60e90cd5'
            'bc1f3962ab44b4c153169c84b4960ee8a6eb7ff6b717a3840a6dc8e5458e07bb9fb214644142ca5539eb12e5cc94bf517d9d83319b0a5cb0d197c5de120824de'
            '5da25dd45e8c09806c371840f170c757c743c7d20fd594edf619fd4fda56ea59566b923a89fa1b9f7d3a73e075e293921dda4ec499e58acae81292bf24425652'
            '1afd8526e009618527c2f0a108647c580e6e02616554c1762ae23ed32444b8f4bf3338ebfd86245dd8f9dff5d5e326308fe87d02ad5fa0eb9d2ea0e9f3030dd7'
            '9ced3bc3ea255ccc2ad4294421c0070ea79d5ed22984076bf5d24cbe258d6cf4877ac15a61cf2a0b2529dd70ab4bf79195647e34d4336e8f995d1b6dbda1de60'
            '2a5d429f4bad996bb74ad928ac8f9bdbc23fa1c43dff1da91f2cde43ce716369525e9d3a5d9e5c952454262ecffae9785f82a7e7a426b225364a29e76fcec17b'
            '6c5d289d24f53bbaf403d6408cd8e50ea885c7ca8cebfaeb4a8298a9582304c0612c9ead9294d5f4bfecb9b4d3746bbe18230809720c6d3101cdc9c9b6d2fae3'
            'f7d6e04d6a7d094e4449fd907f1199354e5faba6da035992cbe09e41c92f9f303d85dcbfba3157e6d1813a233c726c017921e5f608f7e690d4efbc3b9aafecff'
            '70f377956b47a885958748cf8c18fe3edc8a4ce06f814c9d688c2c836bb518294cad9ffa202042b82a5d2ebedfc9e125fdf7480d701479d470075b04799d4c43'
            '1862964080f16942141639e7e755923ca62fd2735eb81d8d6044b6b2880eefa1fd2624ac2a2f938780693775d80b51ce572dfbdcfb38882777814be718eba26e'
            '9ab9cf2246c8c6654a88e39f41458c05388213aa6270dd7b639cd78baa226c04acb5f09235382d3aa5c26936bcc315be617fdccd8a444bbc0da53ed7dbb43072'
            '994948ea46cf9cbb71d984ba24940034b0f3f1ac6e5315ee268c547e058479b5780bac0ac7c236e020eb25f9470615cd479c8c6fe9bae30acc3b8315fa2d9b14'
            'a3613772df174383c6c2df94bf3856c796ad02acf35e60abdeabcd24941e695ff8ee11f0c405d175ae8455803986ad667017180c42c418f67e8d15125cdd4811'
            '9669a89d86483878f25e7afe49e11e590f62c6d32668fb7f5ca3992c2e4e9838b01701601f118dc86aad7d1cfb2bb089a8bc51a228ee3ff95569278c2be35789'
            '857042f7718fd3e4fb4e4c26cff9fc881d343aba260010f75143fcd6843bf06348138af5eeb157bac65f384055f59b619482f5cb1a38d9d5e045cf5391c45948'
            '81cc213c6e102c4c1b8e754b8befd5d7b959ce3f41aa9a65532e3bf1e1ac36b2599251f0d2230bda06658a4fa353edf5908aaf59e18b64448adc9fe2953aa8ed')


# vim:set sw=2 et:
