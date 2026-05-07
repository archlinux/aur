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
pkgver=140.10.2
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
  0007-PATCH-Bug-2033279-Make-enable-rust-simd-work-with-Ru.patch
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

  # Fix build with rust 1.95
  patch -Np1 -i ../0007-PATCH-Bug-2033279-Make-enable-rust-simd-work-with-Ru.patch

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

sha512sums=('bda7d5e6d59a2ad310e3f3e6e8ec05c78222edce266671d5d454dfa3e8f0086add3b9c0099db907cb62b2587ed47026ba7b3aa4f0406693d142d8d91b818d551'
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
            '0753b87ff64073e722a6303ccbdd67dfad939c39144aaf52b6e8034ce50321cc429b3a3f5849e4c10c08f77d0980bf60eedfbfb171bbabc41201dce7a947e22b'
            '349e41a4e5eff5c2073fbf5e53be97d352f82a2dc7c3c385925ec30515daf27910f27a5aa4261f15d3bdf35db397b72185cf69a0b42749206442ed2a48eabf5b'
            '01cd5ec0ffdecd65f94003065877283247f59201c1e3b2e92f4001004d6471a51d16bb701cba45657df351d4486207459901a0652614f196e21fbc3a395259b4'
            'e5a740ad8d0b613ebfcc63ce4c4514117a0f4eb78e0e0aacf9691b0578985ec98145c84a925cb1a069ef83357475da2dc9602ca9424497085857689f1bf904e6'
            '7b62ec189f1843b0701ff2305c4299c77e8148d4eb0a007e579805577ab1dc6252824cac2a12aef6c5f4e99e91c78e95f02be1dcf10c1f0b33773fd9e85497e5'
            '98b6c8cababec2e80bdc6bee63e4070b9c017486682d4638080642572779b054442556e73eba23bbe427039bc34ff92a4d8f9b051c2961cd7ac20a7d5664d1a1'
            '37c4d1c1522329cf6e7cc61afc5fdc8aa09215f046d5c8b75a3265e21be64909c09ed9fdaa52e07b9e6ebf76ce74d48729e06d7f7e89e26a4d71b9d3269eacb2'
            '8beec2c699ec7fed688396c46ffca3c1fc5f7fe311491abbdda20e181c9ca9e467675f78c42c92840f27072661e2073be4c4a5245f1a6b40b5b83feaf73f05d0'
            '40c255b20fb75cdc7741a3b64d444899cb42462da084abd5c85cc8f3b30b5bb9291ffa50852fb76985a58fd49a0b645752260ef67cd443816d5556f57de8236f'
            '8285309c79f6c92e9b51cac3b6d00831fc325c019d353f5628359400c0cc4b8a990cd3bc64b864ae780f91db78f240d79304a79d83e52775af83646c5e7d5e78'
            'd9ba0855b55d0ccf46da04431c9a9327ff03a7dd1eaec30d74337c82a47c30e5185e81c8462ba4cfde2e191441e06c9189ee363a1701f17d95105ee4aac56d80'
            'a2521d93a0394069a701033768de9df273ddc900332e44f475c9a0b53f448d6ec5dcfb2e35e2ca05f8f2397579fffadec80d1c1ddc9da544ff6de4b33ff138c1'
            '2313427fdb2b61b8dc9c0140dd9eac1dd78ea847664de03273a924141a19a67d1e3b2359c57ac910da1efa9d955109f430c4040f2e88b48f01b9f2cad41a5910'
            '63db16777e20ca76082fd0cec9bbdf4f023bec8fddf08180b5c4ccf09b54792618b313fde3c0e3d4bf085f7dec9b23fb83d1172315f03974804b49cf28e62ec5'
            '57dafd7d3cb94ad237217ddbe872f23cb6d218ab9376c168604701b9102a9d5674cfb0ce10753326c886b78afaa0bf68666a666a0698270da5d52fa49103f49e'
            '4feb7c5170627ba956e7290e95fddbaf80b3e429ee67431065277567cb28858496949e8604f790112fc6498a9c07a60a9b45a533fcbf5e42796b14cadba73a9b'
            'e3ed76c4c0b36a84ce750d8db63f8f3423f9cabc50716647c3b6a8aa953c8c7cf1c795543deb82cb8709840d63bb0d90d78b23d0dee6c8de109716bd1a19b74a'
            '8e2330376932785bc95af9386a61c327f8d16b506c7a38ba6195c114f2bca9f34894594398f23d2a950d0e3f68c95658820158836279a99ad09ecef57e313281'
            '1ddb170a48cb00629f076c08164f8182c77f2c7426213212aa2aebc077b75b8c81a3fe5d4c09079d3582416f452147ec5a357ab2a8918ef7ad6bbc257c70760f'
            '36bd8c2018327f7f42b23a206055d5179d150ff1417513a1159aeb7a5039887bfc8cd55b22f95d6e1d0ad082efb7c797c43875a0f605babc410cb62eeff693e9'
            'b3a27f59e0e3f63eb2b8ff6ae1dd83fc065f5b8f42a6cd82e15bd6882794ddfda064a1ab2aea313cc4f14470e2e9dd9ab67a5c148a2ba7d358fb1282a5d9eca4'
            'fe423fa7c2e6c85686b81218b2206c71e7df79b21e148c6d789637bc9180ab4d13b74aa3e49e3e2b404037e7bc2988cc0c68b93d3e6719cdafed4eb77b3ef07c'
            '0670105db040adb41e44588999edb2b57cf9054142bdd121a9dbeb8aabbf4ff15f5531aac437a39354196ef277709b70dfe863888646fa9ef1f5dde3faf95d31'
            '9e83af8a3410a1c87adb0647921a6b0ebb53b41b23ca23fd8a75702c1470809c73559f4e2f6eaee54de4f2be763a71081e219d2b0de962f0fa6cfa2db5020325'
            'c368b6d55215065c9056b6054bbe1bd5f44819ab3ade6dbd5db19029634f32cd31ddb8df0c752cbc96786af6a532d099ac0f95a35a0e32cd59a409c3c434568e'
            'a7a3c2f4223bb8686a6e18c382874ce3418a873e72c3d0daf6af0fd71ba221310f5c4cc0d2e02c2cac057024e32b745a8b0985c13629e34ec794b82428432e03'
            'ddde328db1ba004a587c79976bc9920c18f822e33d5292ab133c9205823a0bdaf8ca379ad9beecd525a0942bcce175d341b5a670900d6ccbb7802284b4795db9'
            'c42263621a95339c7b6cfa5cffd025519794785d927daae4e68bd18da101b04c98966035074fa3275c9adf59600a9bb424a7d1a790a9eeedf080a66686bcc0df'
            '9b6e8d573940902b46cef9863804534963e7dcde2ded534a3ced658c1da12ef8733828301f170c7aa5f75300b7551e01fde29ed8c0319229302f85d26d399791'
            '29538e5c848bc5d4ec32f2f970930e448ef8af5d1649e76ab8c097ebb82b3919a7959ef555d59dae747bc47059c2bf7ad636bf18862d30a7dc68fce19f7482a0'
            '82677515cbc10caaa57ca399b12f17003f5e903ccd653b75b93d7167cc58acb1e0958e91cde308ed6db5fdd5c24aba02a37d972cbf910a00fc4c62c9289cc61f'
            'c2419a0c13b321929cd2e72ec6f8746fe04884049b3268b6fd3696dbd43fc2adb7447cf096438568e6b162fc1eee9834de655f86fb3db6382dab5deb614203b5'
            'eaf73ddb8928dbc04c25a32ac7d2209110f6977de4f9da9e09eb8c40b84f431c9b2d6ec0e0541dbe8ce92aa788041dab5ab5b961397c1e15c3e57c2b0c539628'
            'f2bb45e88dc74e7c6d228f0a63377a49202fe989fddfeb6b4ac15160e32d1386ee0a4ec5cd300023ba8f444a2bf25ffc95863812ca49deffb50e961788f641d1'
            '8522eea58125087925fed66b2885f2e83bf2646da8c7a100e33232d45685105457b628e907851e7477bc96ffd6e852f512d837ee5cb15fb846189a42079c97f4'
            '07f442383bcb4152ad9db2641d106a6a27239cdc47660ebf4a1600504dab4cafc79dda454884baa0ded6a7d0968a9453a83a43f913babedcdd216e879518b025'
            '627f4abd4f671e1b8519e9231bf9d0c073b09a12e52d354faa2546ea13d93e3b36f3dc9f7c0fd6a7ea7ba2d71a0b78ef729df777f6298773d6e2435c05f7c733'
            '65cf0c7e30993f624f9dc3da25eb828dbb1a7c8c0957dc0775675a33da294eb3e12db910b250c96c3981911edbe966c738776dc1a3a27806257e62e2f2bdec10'
            'eb88861b5d73a372151a6cadce309edd18b868b6e49025317e8418c2f895ffad844f56c46f1f0eb9c11d5d495a21f8c9d7153376ba8e4a894962c90c188c056d'
            '783e05f4be3873bdd2f3b78ff1fc1b507ba6ba1aaad79bb174724eb81405c85e025cb5d6dec9f6d3873cea1b1b4d54b3de5c3f3f6a20b1fc97c6ded33f2b3cd4'
            'e7ed0b76e7bb322abf9e5c33fcdd0555ac0bbf5f2fbc10742b11b0338ffc0779ea13ed22da63932f24fc2b052371d729c279f95b7ec212af9c14e3938dd2b432'
            'f8a851923e4cd57ad1db7cbb804942d4c816d1eb5690da79072803855e3980b2e199ad47cc9cafa6e077853be8e5f47047309e29ed2f92e4119c973c7c5b85a9'
            '511770c02e197daa157c40fea8a1279e0cf206bcb3e911cc1722e48731fa7af51cb4dc7c1d6b54a3f79265124767d73a279541f4a4d6ec28f134c51b886972d4'
            'e3514b2811c1bf959dbcb9fe9b32751c4157d48f35c1c54196a9f03039ae90ab0bdb5c0f963dd1abac837400690cf8e1c5753119a67385e576a493ced166fd50'
            'b390fcd85aa8486419aa04f457a427f021724aec04d4d6e5cfea931faba5c8dcdfc952e8272a289c71f472cc7a658e6aae0d0fa5a7d8bbdfef3fa82b8a2374b3'
            '6d01ed9c6d173d8d2b12a40e74d646536518cb45d84aade08904dd5c30ba5fefd37a34678ec019257a70dbe850cdefaa8876a481c75e13258c33dd8209d2f1bf'
            '1303ee13b3cd6c197a6a025b7e05ffad8fdf37011586b89965b27f96ae14414bf356eb69c9e90cb74212b95c73b70c2da9a3972e485060feac7045037ee6cf87'
            'c79283be9b0961e7ae6fc1f580ad6f6daf51bc92025923092c69235d08b237b4e7a3588793d1982864a79f95a92a007065a837561c4975e2eb1963b5746f610a'
            '8dd8a08341da24597381bccfe0e206da2696b430a309b77a8844e44ff59d60610cad869f4abd3e951b8be0c12b076cd082b88d2033ec90ddfaaa4152f8989bfc'
            '7106883366c41129c63e50ec833d8175c449752ad71cb61a119188195f4ca535763ad465c896d114e32c68f1fe23e7d015b52aa7218f2a38717f480f9afb5be5'
            '6e09b8f01aa1cc92285047b84b31b02b8aa1cf53505f4ff9217a15efc09c73bcba0337e715d75492ac19733153cef2c5115caec3f46efe4841faf689bda76c72'
            '52064fb8b176da91e7e4e99054690c523b811741702e6d656d1f9cc4bb26a7840228805e466414dc57bfc122a801961a11167f8a90a28b87761d38447add02b6'
            '853185656e090677f2958ce401aca450b13eef42da8ff6cf821cf0b24c3e57d4a0342d61a2c861c71e0efc4da2e9a68df04f32410a67f5c30cdebd41257a71eb'
            '1764ae3305552ab1d9d2171cdd58332ce6d7321143885abd30dbb10ef98e12c6a00b4f32caeef49993994894464961a75cc2222a2b0970eeba46a095c0bb2a02'
            '64b67bb0073b850347d2a72edfec71285a74e156a72c021334d085d86a967dd727b9a35ea848bc8d6bb108d492a090430aadf6f5d4204117e9204e890dec8aa8'
            '8a9353c98416154e46ebd31c87debd5618abf42e042fa7ee006651d13743a44d69aa92f49848ce6a4a0bccb2854f3b4cfb1f6ada4b383b2a3d0e57c95b388cda'
            'a537e5c17d3d323b111bbafeead5570c2b7ad89b468d34c02d21043fe153ce7254857fb70b07162b3993cc15041cfd7da38da449da6ed39fd9f5ab29dc112b47'
            '330dd539cac4dec4de7f1671cc0f2c2094d5969c1e6d6a71798419b3cc4ce02e29af2c48cc6eb967594c42be94c08e972ce644d101d19a205ce87fd31b81f381'
            '57b7db291a1cbe2a9e94b4e6191434065a58ee256a8b6f6b6742395e7a639f9fcba68c0182100ffc0af241f6086c4a9c055d0d71e0e9110224c806c3bd83ed53'
            'ecac02d6b804c6389f141ac0949b33390543136ee545b0a2edbb4950e3d63eab35c356178e8651562097410b52094d495dcb36a2a8afe6eb9ce5fce1c0615ec8'
            '83e3da3ed62463dbc1a81f201df42c3b7cf5ad29f8cbbc5e7061c349a234162ed3b18ffc7f2734400e2a5f9dc075e080861306ed75973895f7db6c1a7c798f7d'
            '8d1ab454ab13eb9d3f2fabd7d91126bbb0ba4d35a241f66d05e91b03a9d006fd1b8707a558b0b2891cef35f30b08c7bd7dc4945f6e73c26a8e526444b63c7204'
            '770d5d5e60e7ef39acddcfd32d6c4fbd96b74acb4c18721158b51af617d544c6c5a7356df9bf7bd1e8a7c98968cd3f8caf4c81b2e3f8c01d79adbfce42375c6b'
            '3f13c6398b194c057267578fbfefe2e02c1639e25c30d9b2649209b1a2ec76a4cdadb04378ef6dba04f469c1ebe94b34949ecd737cd4493e5ba3e0130deb4d8f'
            '57756c3de80eff714dbb9f8f7020980b1f945925916742b2c0510140f55744ae67952a689d3b29e6dbbb98ce9fcfcad4d5446a732a40495a0ed872c5ce23f0a5'
            '788bb71f20e4d6a5ac3fbb3c7fa308f1f5d1f4800b43c18c4fd8019e219dacb2b3b5d902f390051f1cf083ef78484e4085a05ea75299d3f0712b533795eb33a6'
            '8bd03055465e687a578c91ca7424e372b0d316302f0ed51e30720f7751e4e16cd87f90c430ebd97175e6bb1e242161e55b9429f7a42d2f9a0dab2a1a1a3452b3'
            'fce11e5da5bec1506412ba14db309484e9f2b037f3194afc209c0593708b714e499a8c81d94bb733063b140e2372aa53c679c47cf21e535532ee8a24eedbffb2'
            'e0c1cc6e4c81a045ff1871195e9765bb6bd29db1efc330f798e44c265dc21bdb86a16e691764b6764f8df857d121fd0596632aad01aacaa37fab9b337c367bb1'
            '21268abc3ecbf501ac16ac125ae53aa96157f8fcec0db486b77de33c2d387ff349dba561a487c8d3130b7c318ea4f9a2a8aae4d02ed3efac2a0a6f54b4c2cc58'
            '7edd17d4ef5837dbba49c14e0cd52f9a8a0dfd5792182757f0123fd55482d6f45d7d3f7cf225d85212c686e48a5ab2ed9e03b7670021c583cf9a68b695a159db'
            'cf41ffba51e8a37a753e4ac5a7d480bc81424436d9b89695c0419b75216e652937ce75b2220acd02054bbcf8f6b68991ddaab5424e52f3d6b4e56f0f040c5744'
            '2578ce456076290153da6d431b30305ac091bffd566b559ac959af199da108388b12581be536085caa4a2f6e8c61ba39d306b4b7ba1fbd63efdef53b00c8e498'
            '0675ec8ed7f81bdc4f58ea32a1981b2699586ffedfc11caa7ba6cea3d4c53e0335fc58becddf600a4dee3ac74c0fd945d04dbd89020efddf5e687bbf50164cfc'
            '7c1a40f0e1cbfd3b2cabb52ef0e4c9ea690bdfcc2ecb054e901e73bab226ef6115102b978e60ed6b83ae8f752e788951bc278d600538d8b2d833cfa7049d1173'
            'b0a0a7b9fbef9f1b349dc2e4b61504cc198eaeca5ec177104c2ec2400a45d659b0c88030d496d2182098510f4bf45aafd607bd0202298b1480732e139720b73a'
            'ee29a347db5db3f11b7545c7a01e01e2c6c0e47cadc8e895aac7b03a4b185627b02171c5353f8c10a924508c442af081accd75e8891b0ad5b1923373be8b21e1'
            '67712a465be9f39810fa8655bad48d7b5331ffd511afcaff02786171c67051893f3a82d096902b386303d2219ed50524588b55b575640af116293c3739b4c1c9'
            'd7627ef777bd3d32624fd6ef418ba2f680ca56b40bff3c99e7ea3198c3fe2df6bef6800d50b9ed26479337b6a7bfc4a7a56f76742edb28f33ada711a9e314947'
            '90974a77be3671bbb0ee9771b7564c5df1f554bd3b4db52a50e59697ffc86186256798be3854e3f4735bca86030b4bfa64bc08dac3806c9cd65019b191d0f94d'
            '09cdd0d330ffa700d06fe9d7144ec737887afe082fa89e0a62ce55dfcb716c3fed7f0fc6f1647c89e07dd67dea85fb09dacb4c14aa935b1149b935ebfc2d5d4a'
            '732fb96c6e4a9828ae94f3d3de707f5bd91a536da6f187824d6ff1af17bce6d133011e5c976734ffd57967bb7eac0dab9f41739810e3c640ce3720f3eaa09875'
            'd54affab3f5dc5c6983c70a432f1eeb956876bc6d728ad2d9fb06a861567eaa8e85a9dc97ef86ba7eb831d56b0978d73ff75c69f6483e5dee629c4af1f6f9366'
            'd5712089e9b18878b75546cbc1bad88040d82cce5e76bf8b34aeaf8230aa02c021446c603457f91dd291ece574f22dc971b0c723ed5ce0e84647e7c81f17f645'
            '62f324b8b684b8fbaa29fd2a1230db3773444660373aba53888967796935b562fe848b948c96a4ae3ff3059d4e9e117560a33f25ca7634afe8c7219423219b45'
            '13856defe0829ca67f8e4dc57ba31d6e49a6402b2b1d4e996a9775f3c975ac09b05929777904910f318632e10fc609e589072e0ca3a8249b3004b63a7d1c126c'
            '0c840fd8d179dd8cf62f661f811f3a3aec784930aa69d85b08fdcf20dea492201a56430969a61e3853fb0fba65f4c52ee96760e233c71ff13551ba3f8e412e40'
            '182c377933f27ae077a5c6a722b489c00a813598fa3e4469b143f937dcc13e4a9fedce38faf7ae5c568436df3d956a838fe29f347c6aeba86fe85ec40be371bc'
            '87247d7ac8a14dc507e9a00013177ebfccb065656c2cc91e2f97d9d7f85d63bec044f33c722b2f588510377ac19475a67e4f1575f1de70e07a5cc057418dac7b'
            '4ac46022df654cb6ed28759270ca70af44b0511139ce0ce37981053b2ae9fb518c8162ba3e6501d9dafb4a2ce3ee54f23b159925012a61c5d2edb4114b9e5089'
            'bb0a14f9c8076e81ed15ff126e12ac69d2320169c23a9899369739aa5384644dc43cc428d3361bedab3e1f3d25209e8837199e4e42739f48be13c24cebc66b07'
            'dfebbbdc37b071c5fd3b6190951c9da1e40473098e4d75ae7b2dc882fb69467661b3966c83ecc49a13c2aaf56e4ce29c72776a69c6317d595702734a1696ac49'
            'f79b535c365a7c89b30333c798a2b156aeaaa99a31c696a288453d0a06361faadc1c1746b4e9a8978d6733cacb8d9ace84ddb9d910157afdc2bea6a0a24ae479'
            'f3fb2dfa9e5e0d3dd97e16fd3ad0ce0f9c1a4b335de57e671c7f919ff7c480d450bb6f87718819b4670cca37be0feefa9fed8a8910da10d9afb74152f330a256'
            '18090a9d265d517d091e2f8be305c1da86f18fc185730b20bf50d20e3ccf2c13bef3d226031681815bd464290c195260b90bd09a997b87c847bef140ac8ddc93'
            '0c5e1d8f1ef2f36b34675e62190053e13f221fe6cc9d50577053f2e6e75c083318c2f0920e1a87939131d517da140e0436d471304d3b5a1cf10e3e2b2f0d216e'
            'bc9e612545dffb0b8d4a61cdd1c0c1b4ba2f413718c577ba21bd1123a032d4bb7cc32a8833e2acd108e5a100768c77edfb98a91f3c637c7363a7745df04db288')


# vim:set sw=2 et:
