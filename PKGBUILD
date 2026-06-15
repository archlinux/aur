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
pkgver=140.12.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org, Extended Support Release"
arch=(x86_64)
license=(MPL-2.0)
url="https://www.mozilla.org/en-US/firefox/enterprise/"
depends=(
  alsa-lib
  at-spi2-core
  bash
  cairo
  dbus
  ffmpeg
  fontconfig
  freetype2
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libgcc
  libpulse
  libstdc++
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxrandr
  libxss
  libxt
  mime-types
  nspr
  nss
  pango
  ttf-font
)
makedepends=(
  cbindgen
  clang
  diffutils
  dump_syms
  imake
  inetutils
  jack
  lld
  llvm
  mesa
  nasm
  nodejs
  python
  rust
  unzip
  wasi-compiler-rt
  wasi-libc
  wasi-libc++
  wasi-libc++abi
  xorg-server-xvfb
  yasm
  zip
)
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)
options=(
  !debug
  !emptydirs
  !lto
  !makeflags
  !strip
)
source=(
  https://archive.mozilla.org/pub/firefox/releases/${pkgver}esr/source/firefox-${pkgver}esr.source.tar.xz{,.asc}
  $pkgname.desktop identity-icons-brand.svg
  5fcff175718cd308bc6d6f2996de14eb8a93e2a2.patch
  23efd75219786d71acff0b4e7c1b0de297b84c4e.patch
  b68b1f93a6e31188486458f32fbe37811257604f.patch
  d4b3eb4f76e81f18c53863b1d55ee146d6ec7d10.patch
  dbf9702ed87ea5c88c2a1ee615998532ac8f10cc.patch
  0001-Patch-glsl-optimizer-to-build-with-glibc-2.43.patch
  0002-Fix-sandbox-to-build-with-glibc-2.43.patch
  0003-Use-wasm32-wasip1-target.patch
  0004-Bug-2023597-Use-wasm32-wasip1-target-for-clang-22.1-.patch
  0005-update-rust-bindgen-to-fix-clang22-build.patch.xz
  0006-skia-m142-update.patch.xz
  0007-cbindgen-0_29_4.patch
)
validpgpkeys=(
  # Mozilla Software Releases <release@mozilla.com>
  # https://blog.mozilla.org/security/2023/05/11/updated-gpg-key-for-signing-firefox-releases/
  14F26682D0916CDD81E37B6D61B7B526D98F0353
)

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM

prepare() {
  mkdir -p mozbuild
  cd firefox-$pkgver

  echo "${noextract[@]}"

  echo -n "$_google_api_key" >google-api-key

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
ac_add_options --enable-update-channel=esr
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
ac_add_options --with-app-name=$pkgname
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=$pkgname

# Keys
ac_add_options --with-google-location-service-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-google-safebrowsing-api-keyfile=${PWD@Q}/google-api-key

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

  # Fix building with python 3.14
  patch -Np1 -i ../5fcff175718cd308bc6d6f2996de14eb8a93e2a2.patch
  patch -Np1 -i ../23efd75219786d71acff0b4e7c1b0de297b84c4e.patch
  patch -Np1 -i ../b68b1f93a6e31188486458f32fbe37811257604f.patch
  patch -Np1 -i ../d4b3eb4f76e81f18c53863b1d55ee146d6ec7d10.patch
  patch -Np1 -i ../dbf9702ed87ea5c88c2a1ee615998532ac8f10cc.patch

  # Fix build with glibc 2.43
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1999625
  patch -Np1 -i ../0001-Patch-glsl-optimizer-to-build-with-glibc-2.43.patch
  # https://bugzilla.mozilla.org/show_bug.cgi?id=2016618
  patch -Np1 -i ../0002-Fix-sandbox-to-build-with-glibc-2.43.patch

  # Fix build with Clang 22
  patch -Np1 -i ../0003-Use-wasm32-wasip1-target.patch
  patch -Np1 -i ../0004-Bug-2023597-Use-wasm32-wasip1-target-for-clang-22.1-.patch
  xzcat ../0005-update-rust-bindgen-to-fix-clang22-build.patch.xz | patch -B .patchorigin -Np1
  xzcat ../0006-skia-m142-update.patch.xz | patch -B .patchorigin -Np1

  # Fix build with cbindgen 0.29.4
  patch -Np1 -i ../0007-cbindgen-0_29_4.patch

  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
  export MOZ_NOSPAM=1

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  # Breaks compilation since https://bugzilla.mozilla.org/show_bug.cgi?id=1896066
  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  # LTO needs more open files
  ulimit -n 4096

  # Do 3-tier PGO
  echo "Building instrumented browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END
  ./mach build --priority normal

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
  ./mach clobber objdir

  echo "Building optimized browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
  ./mach build --priority normal

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

sha512sums=('3d598dd964bca074d11b71f84d586811b0a736bdd4d1e6cedb9286c56b1e11584e85ca1d0369c9b2f8d9e4d0eaf014d1b9232a96e71ac25f71fa9ed0807f642d'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '07f704a0556269434dce87f57500dd5521b18baea8484b584c8bc40dbb618b27531f13a5110c7fd8e4a01e8a42c1483971dc7f98c9f867f397d24e1798a2577c'
            '924294ded9cc7ae6aa2529d60e6f82914cf0c8b034ae748bb84605ce64a383a64fac41692fd6d1e2278251b53f16272d398d1ff31dbeb83df1ddc26efba0e472'
            '3a3f41c7d26664c0aeb43184b35a94d7b9b2486ca69b5e71c7b4794c33db18762a1a5396d795b3ca1d73dc1cea3013c5d0ed7ae5bf809219735ebd69cd0d3a62'
            '77b571fcbfb3d3e5e07217f25ab5051d0b693456c59f6273b84b8863f7ead7bfef81677cdaf2fb560e65aafdad008967e0479ac429a860ea90a4b7e36ecd57e4'
            '566c35ca78698939ce682c71caa03bb53388f0befdcc52c4a72565c93ad1528447d3df7a11f7d4eb5dfb6aab6dfb053050a97cb255bd20838315db5e1309989f'
            '755c3d2d9f24101d80b766e5adbf9ab0bb133e743dd9ea57ff2722d243bc4056d890bfedaeb23c506b440a82859d26c303f15e9f7e6bf9fc78a14f83de5f94aa'
            'ed0f58b8532dbc773c5c91424578ad4502fc42c1d937e4b2b1c9905212a0d74e83b5a935ed18207b73588a84791d3cf0d3740a7ccd3dc67cd8009ba03ce1d756'
            '1099880b5a1af63b426fd5fd10f554f0a2ef2b1f3a044372e997940c115d441441ba14c604524309603be9bd40e31973bf84ee77fdee2c15449bcfdd6f1c3d22'
            '78a4b4518316ffa7b7409041ba1cc64cdbb6b118fed7a8c2d75665df8521e836d70d2b9b491ff140990a4c4c2472f9c438fd74167acb9f965e5428025991ce4a'
            '6413c00e574f90f08ae770acb6e1191f1d8fa60742fa540265d4333ccefb08e0c7225f17e817f49d8b167f7068780fe44436036b5a37b3fcf7ae9bd703171f4c'
            '5cf81a70a83e8f25ff5ab9f8c42afd58a6dbb95fac784da78ab21524b836430b1b68f80e9626c0f1540c53866343d6955b6552efac4908acb17750d7b5626d8d'
            'bfb0b46b42b77851c2ea30cec302aa2527d19126cf19d73368f7ce942f825998b91f067f57bb6d92f74bcf2e77e94d235be7a441467bdb70358a1fb2eac81e4b'
            'bedde4c59a55a3456345edaa63b12a4b630ee3cdbbd04c71c493a9e60f6ec89d7e880ebb81b0b5ab82e334486a0b0d3cb7198d54f7c4e67d1356b81b1effe8f9'
            'ffe01f5d5b1daa2a2e241108c4225a641d338dd2e56f70c9135f5ddcd5c202b509c896c6363e0735694b088cc0f1e09d6a8bff5eb2f0161e07f06cb2e624c6a7'
            '57a5b58ac328be2bcfa44286aedb3bcc5b90ff26d31b84f2fc6017dc54fa4a94f9bed4d081debb9696371554c516e19741f649d91ebe72364b044506808175b0'
            '5fd22a38e79ed2bdca6a9579c5c893746201b438d61fd44ba98e5d33d98a2d325d187eb42cf0d8ccce0333c8a73e960671b09e65e735d723049623590cd4ea4e'
            '26d9ce8ee466791b614e7aae9dad0df9b9090e212c85204aa07e869a2fe19c8fbedad93c26dd2a75951117d93fbde4d9c5077f15ad3ad9177652be5944321211'
            '20e07375db7ad684be57f19a7db8c635c003a9e7676777e4f91f3dc0567b8fee72a535e93d411b347874c238c61d9851723e7f5e8c0b8488dbb0d9913104e709'
            'f006fa71676831843898f7a8ea5cb0e94d149e2bcf92d4b1866e4d249ae1f0a0a08cd98a5e7ed274328038037dfa1162a1db2436daa19e3557007c98391a8f43'
            '0c2b4e492d4737ee3e45b019b18f5ae98207f9aac7c66954e16ac4f361163cb840f4f7670dd8d4000f4eb229035dc920c86a3c34515da40cecc3cda519d7aaa6'
            '98441b841f3887c7fc850b24d9cf6b60ae2a62021df31755e276f822ae2ffaacbe7e156331c4a9ceec8a6102741a3a77ec3726bf3931f2ad182feba8addfb737'
            '90347a334db31ebc1bd838dd1787a4127cd94bc071fe1f6b439c16f9e3f51421c5fa8f4cb5b88e3bdf23194076de9f54f793f9f0863267b02157a276af7929a7'
            'c7bbad36038fd1e163fb161ae89037a4f23647ede2272f79db32afaef3aa3dea1845d11ad283c6a3bcbce247359f9add8de2728ce518409d97c34ee1fde999cc'
            'e8e488a0a22b173f528ca1044042033d94a54f1bc90d01f09cd465d8085f9be828826a9fa1b3e810bc67ec4be0ae0b282d39123440d9d0b8c87e4f839f7c8f1d'
            '3ab96c00886f44ae276884034515de165c8b7f421920b127e8aad4eabc1f7b0f36395715a43c44cc0bb86bbf7525a34fe7b6d7b37b0f062cf7403e6074acccf8'
            'c8e6187db9baf3770e61487fa8aad00388ad06c832bff8d6fef48b8165c305e4716330408570d33cca64b42985a3c27498880dd2e48ea48596575762bcc094c1'
            'a78214fb630112521b012dd01a93a823f325e66f7cc257b6e9fec0c4ce5b8ba40ad361cf5d04f9f9691618bcc725636054f7c50abf86b11a70a84697e0642e06'
            'cdc420de635f67271b381eef8bd55de92332da1d81e4f579faae76571911e1a9b4a70054b70246b44f3a0115750d126d51ad16ce00156db069ddfa1f5fbc47cb'
            '11cb3b1a910ede972faffcc8d14181ea501640f8b56463b47770ffd2b2772ebc5846f20925ec146f2e5bc75162279b93f63e375afd412386d09eb8d7280dec9a'
            '68406290a79cf8d7765ea94571951d070849e273deefe7021fbd5f031bbc2f92fe8243c6d9e97801f2802a42ce970c3711f717f226839ffe81682b21a3c4eebe'
            'ce4247fb452789766b429e45a4bd24eb137450e1e43dc713774ce85e53a339789be6caa391cf33dadfa99b8afdf933771018d9552f6bc5137509d1f96a3f6542'
            'bd45bcc6969e9b9aff28e5bc015e0af280089718ca89d2f4dcb04f35ea5e172addab3ec0f2802bd181655b811a4f858e6f99d3fad8865c249ace789deca1495c'
            'b8f28428af025006b339a54eb7f7a13218970712d88f28476456c4b3f35a54cc33ff856796dcc6fb9868e6a700f5bb3fa7de3a96dcf4f4b0927ea79d1779b0e6'
            '26a48cbb48d6a62ef5db0a1b9a0d610534da9a102a88f2f693613d32f28951e27836625e70f3d7a8c69b11f3a4cf6bd06720bc303eeeaf9ee71e7b3a32c2dfb6'
            'aa4d7e287a8b376de6698a757f8ce44aa27bb2268a81c9fa579c83e52b420abcb7ca07a11da145f11ba159560f78012ef0424cc9ff9c0d95676a1ba772e05917'
            '88b1f74ec9c01bd4ca949809e84212e6a3e626aca7fa492cbc181fa11cd95390eae50309d5645e9f91caab9f527734a2a5fa0180086effbf99e7ca97f892ba5f'
            '4b7575da0e8aaf4d2394e770bf92e5446be76d702b3a7956bb5c8ed51e022af73122ae29dcde5576c67d661a1825fd9cf32632ad187d4640ab931d95649529fe'
            'ed9218e9f946adb79463e077bd24daa9c6fd3b51b1684bf1de2b02601637ca154cdb7d665fc9d1f20dc18b4c6d41a8e72b4b8c6a91406c04d0dd71b9e32ea9c1'
            'd08b2138527aa034077d54da9f7d3d4434f948a62df5abf992fb91206e687952d1ea00049bdbaed1ec0b1e7432e25d34e80b84a1e2ae4f56308ecf8c371482fb'
            'c64cf8426c0451f1a16200f584f360c284ef9fd4f88cb2237aeb3a06997be3b9807d1c4febf840c198eecc0617168596870b19665f8a4ce23959505aee6a61e3'
            'aae451354660fc70604c71416eb51ae8ce48b5ed1f1762deaded30f129466815699569360f9b3cbb85ed4456577c47e1e4c74d7956244e39513d888efee6e4e1'
            '6f4709fcbc38c3ec0518e0ed87e5fdd7d6fca2095626e6aa4a76eae642ef54a19c7591ea1804902ba32fd146882ce3cb56018fece77b67864665e8eebd2ca7cb'
            '1ff0432e880ff8fd5efb2452c5773bb32920342a735375a3e81a4bc3a0d498ab5c9150f700bea8247e2f237f04e8db1c156e57b09eec34389ecc5ec64d8eca57'
            'cfcdb102b79c7fe70c645e2a13bdcb09ebed5df166ee314b46bfdbe00575e64e5253cae5815748e2f8cda15488d4fc8b11c8a962e502b2b01e537c212dfa15d8'
            'ec941796fd75f2bc11ab2f441b9f57ee8c765ba5a72ee8f3c5bf1b6959d21800067f0e9d1aa857479dab4fcbf52b8c154fb5afccb22b00bf74798bcb8583fe5f'
            'c3f967d6265f1f07fd0d6ea514b6b236331806a1a0eeb781303efe7773e08f402bd69d932c51065288cf87f078d67bfd1faf25128b78870eb20430a1ca7cb25a'
            '5b757bc6079d994ae3f7185bf632d467b96a9b5916f7e84e6217840cbc491e52b7c4f84868844746b20499695cd17b5eec52abce85490629be36a4fe8db70f3c'
            '6c5acc21eba4b986a2bea635d7e285b9492e4ba56848840fe66ed826724107a6a2295f1f814ce760203d8b7ca3016e9f6a7a8d5ac0cc8fb9d7d13db63f05296a'
            '53bcdaf3dba22502087c8476f3b51bb0afad4b0d03e685634296bf881edbbf398a94f28289e917fb394a86c0934f2c8cdafcda8b9e4bf2f7f9565cae30df0642'
            '5ff69ed507842a9316a4568077f8b34a51db4fb93b8cd22702a1daedfb7399afa0488808174b370d6fd7b71804db36fe01709e6c9c2d12197977ddda64fe0f23'
            '03ccbceece2740ad7e91eb758709a7bbd3df4c0150c7d26c943261d38c6512025f3192d2dcd9bb627e1f84306cea0295d59ad6332b131aaed5f26e78d370d7d5'
            '924b4d7b82dad78bbd7030231abdeda525029884d4cd76790f7ce5c5e587b7344b3b3b26027f289164b226254717f7d6f4207549153563e6fa14fea71a6593a3'
            '8acbff4f04a0cabac9fbdaac754e54bfa236f326adf7445bfa7826209dcc4b71329f0896d39447ecd87682229cd88feba383d82edb055d94d0e173b2bff23767'
            'edbd82b70ded994245a7317a6520bf9e2ea8593b072ba53ad091c102b6257e0f143049ba7e89204c04a8467de4e3360f4423012c3b3ecff4207841745c9ce441'
            '0c4655273c27604f395c161d7f360e5d8f0e38c85a3defc86f22a71fc4745eefa0fb1ca06f78e5c67e40e7378ae41e8f15979b9b282451eda10b34e4b9d37e61'
            'bce2dd77322b05c512a1b69b8a4d3ef4431293ed4ea91daaac9cb3c18015079bd1bcbf3e701d2477bda70d92ad149ced0556c5a672f1919ef8c6a3bc95491d2d'
            '469c24c049f8f5f0e5d1973fa0c85b5ac89041ac9d347730f4012d66da80e0e12cdb538ed7c9901dd19aac1280a6783951acf6a416004e4f07a6274a660def20'
            '09cc9555b763843e0537ca4741b7a11b6fdd65064bf5152a39c291d7ea76e39e40f9db5de423f06914f2411ce4fc8c26ebf82635971c76877c0e69b867e2f653'
            '87ff234a8c4ed8e4c3977e4400d4de01db6bc6cefc78235b6c7c375582a63fd7edab381c044a2ef68034bd48fade833a8a5b945c5ddfe08e0df82b00b4df4f6d'
            '7dc4fde25374f144e4149b0148be6b4ea0c0238bba27a8c1756abef1a16f3301fca2ead22793a10fd8a0f9de296976974e185e2dfcd34cedac975afb4b8c43ca'
            '8646c9aa194c04a742eb19f51027f21ddb64412999f885c340fc2336e760048b35f46337c26e418dc2a143e27e8d18d12c6092f1c2b60121bc172bdbcab4a3f4'
            'a130a42bbf4598f8aa035d9c203cf90b4e43b4dea01452d550e7393745be7f7998182729245dcbc939a62794f87ab39e21a24438fbdda953e8b39fc5b56504fe'
            'd374403dd02e34e719a77327a485572f56da5590ce2713be817f4f1eb49efe64a3ad92cd5ea195e73eb5386a6f692f30688e1ab0e33c6147c28542c2c31cc2de'
            '69f2842ad9fc2e208d91b4cc10eba72026cebd0cc438271f2a1363e5032415b6347e29613b4b9b308e8122272f82f387b4699e437707e1da4373afd143cd1c8c'
            'f8b6eda3508b9d9b45acb48f1fbb3e09d5ce4f0fb7bfb317f17bb3be6059799b17306a3c668f789b35be43e75332c17ccc68b5a86db88da50cae23909b710506'
            '8a0d51f5612c52b7c3cab24e1e0300ece99e7de95c835cae5286bd7ad461ce7ad28d39ced63b9e120e466c70ad9a812a5f83b681af380efdd148c3b359603b09'
            '5ce97a563e1dc6eb1f1c7c197f489dcc089b8d0d6c474f7cb023c7e66b5ee2782502ece60512ccd04409897c01af3b53f4d27e11306d4694b055f5ae0a9a448a'
            '530f5463f0285e746bd83bb502259c32fe772cffb04c7ea05950b3426d7bcf705f0048187e3f52f236692df0948b1f0f3ff8d8932ddc334cad934cdc2f9d7dfa'
            '44b714914f7727794fb57c2148f0ddf6897b20e3f79d1c5e6f534d34f17c5d07a61b23fe6097839e9b923e2dfb4f9387886299b52c5941693dfde2acd3b18e67'
            'c6bb4e39adffe51bd59fa9c694d2c6aa2dc5c2f1ee855d96b1228dad0efafd942ccc790b399a1a2a7899e00fff41bf5f39614369748b4cc9e668190351382236'
            'e5a9197c0e3696b6c75b1f7aa238608016afdb4dd3ed20f23fd7d2bef60f2162c08510074e39ad05ce7ecbfc6970f5a0e4ad1b81468a16a2b2054a9158e60fc6'
            '60bffb4d94a099f53c4e1a5e46d4b45a02619dae6cf4d8c6ee766b87657cf92dc483bb9386419ea8b80d1f0144965001d513be7b14218a9a09fabe689fd1366f'
            'f5a1197e5b0e85f81bd5a857bd10693dd2f663b3ae03a87aa76698575c2bee41a969fb26fa9e09e95462c2aebfde202ba83daa265892720ce5ddadcf758a73cb'
            '921c54f17cd5f2912bb9b5bac50e36bf14dd9b7557ad2b084f712aee0c0eda6cfd5336e473daeffcb3fbfd3b3e8a05df2b559c42a6109791c712517fffbfaeed'
            '7bcaa3be52ea5f64a39302da94d267e4fe9782f64f49b08791139e41367f4b1c71510f01711e1813724f3a264c32f1a0bfeb159990e09bd84cb9a70ba1788cd5'
            'b7785d03fe2254684677b07dab74dcccb49fd6d46baadb36c408a025f80626da4abd57bb773902249ea24710d83d0ff6ee2d40a4694ac1fc08586bbaa092190a'
            'd99ea07b336929ec78ad815fa42f696629e57661a74f5841d83e5cdf364fe309c61f30b008753fd2f4c7f421bcdc50de029698a33046a71eced8c727da82ffb3'
            'cceda3ae8e600b9a3b2c58347e0cdfc2eafe5de04c440115a2fc191ad5d8270e21ebfc28f06bfaa7e93343e826e09057f7eee3089633d2ba30b4b4ff655bb443'
            'a3591d51d90ebff10778ff0f0fc31c1b247fa72808ac92af496228221f680e639b07e747cf6b00a2533887165fd8176bd4cceee35c4ca3de237cf78295fb3161'
            'eb87ec55c6b84c52426410471f9bc8a28781636cb0e54949904691d7003637494c784d70cffb6c42654ee93187fe25682627e905159def6aa555d91d28c45de6'
            'a7226d5a656240fa017e2d7085d9295af4f68c1c75d6ae843a21ad888d17de067434a4323fa2648fe42df3e1b6707254caf444784711752e47ace1738d24bd60'
            '79ce55725b57753ddc0425544daa2efcad240ed21ba81996275c3dca2b34fa2493aa4aa40d1c2b7f9fe05894100e82f76dcf5409f646c7bd19dc3d02ccbbc1f9'
            '96f1c421dc80c0b1c8d3cf4b5136160e84167634d688cbbccad6959b9eb1b47e3887842ca6575919ad4d8f47a18b321ab969ba53e94164086e90646b9e4f3c5d'
            'b023b4f79c21dce37a16d733e044cc60af00e05ce643b86e992961a4b8ac6aafa9710aecf6ae6c168bad6bec8993a600b25138daaec0f8b9d401200e5514e4b6'
            '87e5d5ef294087cb30ef1898c5488d6e86b5879ba8b4835ec8e66552f1a9a09bca55dc19768a7f977980dbf8b67aa762024ad7c5176e449b2457063e86fb5f24'
            'd64bbaf71b92543b74551410ec25522fcfaa585ea73fa6e10f8b8bb74df174ed0300a8fea0a6d7ca35dc8c7a03ec62e9dc0df4b43bfaff818c5ff486fa2cdca6'
            'd3ce4fbbc4e2f13adb156b3147194ca037a4a0d6a625e2a78e6606c85d0b7c4c4f17b1923f1a78b95b38a1a506d04633da1c2d8ccb79d791d50bef3440d16470'
            '65c454bff5c2e9b59df31260f891c3672fca2e4b0fd15d5b687c044c8d514ff3ef8d2297b61162572ab10d84b8f5d0388eb3d23a87df4a65d781b1825d40465e'
            '2f8459e1cf6b54e0a716ad49307c973554ec4f8b6f87827253f4bf3e3e493af4a54a5f71e1c8cb51980c799b143a3297d5ebfb6461f5f82b92bac0202dbefaf5'
            'f3fbd245effe3e00cd8f2cccf5a5bd68b89d3ba9e4fa1f1885fc8a928c73b85f6ffe0a0af2bac91b5c4b68e27152263da28472fb879a1f70fef1e15bad9cf6bd'
            '2f80e8448bf3df92eb434708f88425a1b64bd1a643a305c68d5cbf507c421cc79622de8cc23e0f8e2e00362d783517f4a61f7b99dfc9627d1f7ab9a9f745549a'
            '9b1a5d72a6a4b3ec32bf1761190d1bafbf96e23ddb64738464aca5adbb0b06f05527b42e7428a7fdac8da76645b3c5c0e87005b6443679948c3cfb42c03e4ea6'
            'a5ae645f3c433a1d56d759bc863845dbe239bac80c8a3bec12154a72311f6f8acc46950dbe334534dde3611208b32f5fbf5d1dec6ae1b72d81ffa71499fa5e4c'
            '69961fc2b4285deab6feefef04949cc96b6e4b8df9b55188fa59d2317eea08c2051d149de78fd22bba10c5ea5ff1193347e1ea572ea2730af755b5077260dd7d'
            '893fb96b2dd032be715dd41f45dc7e755e9842dedfc4df7641212da1b71ee15180796fbd638c43d973d927658b8ca8cebbaa5dad5adebb2c5ee449c997f46c92'
            '907441aa7b0f266df68c5a6129bfc115925e6dfade0445a77c731c4d0a289ab443bd015f9648e5ea870a8db4fa8e17e5d3e566647cb29d29c9b4fa85e6d2328c'
            '127fc9d9626cc178a355b3e489a0ea50ca648477ac3c6488f295d2186bf75f81b91e5395eec158ca6164856455cfb7dd06033da883d8c499302d083a6c76d38a'
            '2249e3c8261281340831239360596ff3cad81745329e1e4a98f905a4842930a2acaaa3146031b2488a13fd56cdcb7ac02446618d7d6e8515fe666b13d7db5c55'
            'c0a141fe993f22b5d965369565e6961b33aceeb30eab9706ddf9210c3a8ed29c8207fddd2f951f46aed7cfb469c66eda708d3f88b045186672079663c945583e'
            'b3f9c83a6e6ed13293a5b31ab05721890327e37654f55803f359f971190ca206cceff4795389c924199da0158d0f8c9b9bb901091c648c6fb348740725b4ba2d'
            'f436443761fdcd329b32801e9b8f99a9313abaf807d335249643c955f5d0f105873948ab313f5bbf1fa4a3810b10fdd7962f1bd5f73196e8edcfe3b0b9e4a6cf'
            '0df220b5890d0e36985cfa2bdb9151eb0abaf2e039a065a47296877abd99825c670587c127b5214002c4305f72f075dce451558b85ab04bdf01f8d689849a7c3'
            '9fa56cbcc64a99bf08c6db542b4b5aab734f0dc58515e4e6c27b086eb0ac37948853cb59922df6a29fbcb76f34aea0988f24a942ffa6656b06992159133360da'
            '496a8d2bf29efd735fd6e3478210987934ffff477f4819c0a40b620911258417b99b0200403f615978286a9a25348d373b31c17d992ac2edef714d702702bb88'
            '1fe5a73e2405af48ecbfb119aaf6322cf2f054ea5d35f5ed7ced450b9c242ba63de12054f4b9e1a4e9835bdf299e4230e122bb150e64afbab615c7d73ab0b4e0'
            '05e7a86760a7e1100b11a1d0af77cc12609876fa820bd51b08f0d7ddbe105a7b727c620e4d45edf5f4c0745b31fdf40dc46db044e621b2b3999f871f00ae95ba'
            '1a92be8dbb8b555ec73f66c683cf83584fc6957675015df945a13ecbafd586157e7ff9a55f67f3c04d5e732a3b432c8749136296e4555c9f9f85bdd9cbf3c96a'
            '8d9ce4bbf1d4d637e52704ffaa747c0047a310af00e9c7b79ecbf1deb6f6cfc946c8b850f3b8024bce42e0a55200ed1afa6cbcd25eb149a400b7aeb85129d7aa')


# vim:set sw=2 et:
