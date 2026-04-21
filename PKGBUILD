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
pkgver=140.10.0
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

sha512sums=('56b274df21d0a908e826af6dda89a42b77fb0f597b75542b0330d448ae22be07a3636a3187ff1b488e466cc8c5264a8a75f79901354a49e35a3e99dcb0852514'
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
            '212d89cd2e8a8bb6107f5f4e5aabf74766411fa8bb2038da9602a5a10c43b3e6b63189251d760faf496c29bb943538bab0a05d28518d232a7f12c9b9028a0068'
            '45c5df93734886bc7e06a938316aa516d1f64ef3083686d2684192f2d5459dcac43a99ef1b689116e7b048c18738a08267e09ad7a44fcca7ef82d9a255d17a57'
            'a18221c75ae8598b39c680ab1e8f9d5e21a5178bf948b6fe477ec97505425e433a3b8f2c8dd020abd8fc0de49836bc8cbfbcf597d87e9053c858b5b233944825'
            '04eb47c62b492c4b526c09a0fb0d32a9e902fce3cb1e423b9dbce92f2651c85832172e6630bb3b2a384149889fb94479f39e40266944144a3cea8cfbc84ef20b'
            '85062bf8ab44d929bdd44ee109ad55ef238a38dae25b76ad830c17324c5ccb01725ea209feb73d2eed22b5f498b69dd47937c9aea06f7f142cd19a25de198bc8'
            '94875c10c1480af2e71a820be7409e1eeb34009be78b7f8dd7fd8e202c07309a6792a81e5d378ceb3ec84a67a5337c84d59843c4a89f7adbff4b807d250f0375'
            'c9978485419fc5a13de80210812fc08c2b4be8be5b1e4ec5fb6f93b326f983036a74bf78202f0f052c678268dff0e54bc64284b4ea260c159821a524fd3d0630'
            'c6979391db4c8914e55050b05556217416dd0e629293fb55e8d012cbded9451709711cbb8200a3c2f5b9065125636d7235148a86b8eda9b95ca46631d6fecf5e'
            'a14564509e1990702c97c56b9e76870f52ee734d04ee8b7ed9b8454965872ec350d545529713549f4a8df7803614846c0e897b026739fed95a24cd1c556afc13'
            '1cf95943687ca970f2ea19ba9e4bb10be3a01329aa12a8fc7b9ac5b893320134cd95f1dbf8bc221147a9f528185b03a7053046b2d87f9e425f7b6200b0be918c'
            'd44f2b4c28c4590dc0c76389fc55a8d1716ce6dd46e26cd0e8899b13eb1c7402e5c08cd60e18daa81f24cd489f14c10ed69e4e0019f40a5cd6669e2e153318c1'
            '476842a431ce344e6c1cd2b8f8ae3ec1cb28f867cc7090c7ed6f20dc3bd14f21a814ea128ea0d6f04c4fb3841fb6db3b493f3a1c3fcdb9e75d8d3b684e42af93'
            '7312b9e09be3a978a920b820907dea16b8a17bde6b4925dd968660e86458b9c358e74ea56d08d46ec63bea01b5d65122ec65a7ba08fa6693744a2158ff30379a'
            'ab43288a403606425991c55908bc9b12a2989fc93c6c125cb7ce7d2928f0fd4390913d07b486a8c8b51392666082c3b36051d01848c582c39a08291d6b510a65'
            '09c5e56929d0e3949d96872d79fd95ab29f6cf1beb17c00995cdaa116f2a037f339017030864022233ec1dcdb35e875821aab97483b20d4a572e26f59886f279'
            'b4aa879085ce3a2c1fd67ea2c02e6ac97c2c965a3202170690e9503c7c06693c4cd53936b6e36b338a1a06ba0bd13c906ebe7b4fdac459b152af58d6db082b5e'
            'f4af6abe613c2e813ce23549ec5118e8444b6413e81edd51031042870430f1622b238653c0f6cf9e7c3380012f379d8e9f4ed03acc0151e1c929cf805baa55bd'
            '99254db8b053416ff5bbd5f30ccbd2c523fe9573e7c496a544f5b126d703a8a6911425cf97d5958732236daf4800070ecd390d84ee1f9eabba7aa91967c41322'
            'eb9ca439aa1dfec1035feead3eeb98cf53a85412451a295779a70c51ff9811758e3d16972a29f510354eef6f29a7d3ffbaa522d989ca537da77de16ab41ee159'
            '42caa467046d81d1f8aba9a6afb6b9c491ea81c35df78d8cab342e23d7c04614c47a29b032bbec37d0e97468c39b813d01a2e9a7b553222628323b8fe4d65051'
            '4d5792a8a014339417cebe902977993bd1affc0c562872c5e008d3ecd75ab4fcb299570591a7c5059448de65028cc40b6a87cddfebb164de2386360f137eb77a'
            'fd4bfc7e008a1444956dbbfb68cac2463353cc5ae33eedcb015191d768d278db5d88ed6469ee52fc3c4403e0af97b043ea127614b39e2479b297e128ea909c71'
            '330a4a52edaf743c66b4658d4dec2c171cbab46bc8488b4fa1225f5c3a64d6a35cd75c133b5048f34fedcaee8c0e4674676f7020dffe16cc383a4541f01ef675'
            'f700c87e7bfbcf411f2312946d2300a3441485c22c120dc178f04337a2e6cbdf03fb37eec5d8a66e84ce10b8c10ed9b2aac31e76135e80665b1da0d872bbfc7a'
            '2b402bddc67c610de3887d1aa25ff3009d7f1974cac28d71b599e4af92d710c2f383f5ca469a602c718227b8f25b077029460d6f5b3f46edf6a3e1f4a44f3b9c'
            '7e44ebbeeb31a03d335e64b612ef3e0860e6fb132781e333adf98d17a349da3a17d7758122eb1441fa1a9b48c773dea326cc5792aff8d2cb358a7ac56a3f55c3'
            '3a05b99ddda2b417e90af2a704636917208e46f12da95317f96b91d54088b2f377076141e1b902cdd203cc1c6c5038ccc40bc586403e6057a8cfde947b5f403e'
            'f30fa6a482febc35057d2f0590097594139c4afb9e2a80e81fadd0a839b557249ef36b518ea99635541590e3b74930dca028f2b97e57f133a4e000dc1c26f804'
            '2167b8153f88e3a57f67ee6a8a6c546c69535e3443036dd23a47a2483b7a32ebd910cd7412f9fe000395105b4610777bb24c23022fca26f0eb985dccf05cde01'
            'f7e8785f6f937ed788cdbe4a10b2bc4a6fe480408ba409466776922034c36bab38bec5bf1ce443bf9ed92fde084540132ef4835c9c931c6c3f119efd25ee916b'
            '9ea4ad0cf8151ae880ee03427e24b6f0209dfca08dcb8adee27de5bc83b922b433ca9939ac61c5985f145aa2ad260540ff120602100241006b675c0dad1a4555'
            '7bc9b88c542b7a85309db87a9100601b49f366cfe4ae22d2e570d156932e8aa25941074cf8122b1b45bcdbda55593f1a59a817093c70bab54f6d819a7d32c9bb'
            '7156dba4652d49cb32d1583856767affec2e5f1a60778b6d87e7551245d84e2f2f521c3f214153fc6369ddc2bdd603b2a8cf84765d3781cb2b9bae13b974ed01'
            'adc96d70cddfc06098bb951f522711441c0f60104127225ca3187c6c1011953a2ad8bbe1ae839f24fb79079676763dcde42180ef8889da7620081c0286c4c78a'
            'e3e5fd4449e3023969fc9ef8472923ca76cfd6122227bd6c858304eab912153c4a491412792aadfb1024b338f1607604cb47dc0c726c8536fa127268415e894f'
            'c37c682ecb904f7b361f74615956f8d6554d16a6073bb45d65a5f0e10a67443527149b3fb320cbd53c31f1583512d07b07c1c18accdc60113f75a8ca9f4c710e'
            'c668d1b364b89c4448db954fc8a9878b2eca3c8b06d103b177b22f08bf327678dcf7d2a3ff5193f4dc068c29d631da65b733a5bf121362fc03cc1889e062c7f1'
            '1780ed79abc345796be52b45abc504c5a89d2e4658a4ada5753486d0a7bf23f9f1ae4aa6f51ab3370e947e8036f9bbb2e3ae42c4ffc089a9e90cf1f3a49b407f'
            '0257e2d0e48a7bdc164919f7af7c60b2bfc4f417c45eba8da67f5d15cfcb5da50ea31fc29818f5c5cc0577384b85c5ece52c790aa815db808126a8d5445c77cc'
            '031470f5024618b670ce62c67728c22e24e0fb7e28f801205879878248971d08e4a12c3a3def37cc4991b9dfadc2ecfde7849b700b606f29b564b5c052a5d60a'
            'a01600d7aac599507ec2cb10a0476403ab462cc1ad185a5ae192d1cb273b78fddb36527897d7dc56ac97597043ad0327625d5c54504fedc34610ea4986a2c3d8'
            'd9611be7a75da4397b2b4419bb22e91306f6f43ef1ad729d51e38cf0ec471f8b8542a1c20acb4b7434898adbbdfe15eb1e4afa9fb6e53505991ad58bffafd1c4'
            'c11692aac82f619bc6990a80806099903650e53857216047adc3bc8a2badf3d4781d2cacb0037e49f9ffbadad5b3b4156d0df4d58477715b83bed63a6826e4df'
            '21ebae08a36aba0782ae69e98ff80bdbf701656dc9bdfc3ca12b879e778ce857e1a017b14f2f6e61fc5bc7d9209bcc89845638e509c6129a4303408dfb87707b'
            '6b9203418ef5cfe05a574860ebe6180bd0f5e8d7a837f46ebe5e4926f9dc4cb4217f216e19e5df552f6197c64426da0d7446987470da144050d30fafa6aea5cb'
            '5d0d15d02411247233d4e402ccbeb728f57953278f5d37fc3d45a4deb08548a4c29d79ec2bccf6572616cdf9e24c9aa2e478e1ca25a8da40ba3516802d3fa4e8'
            'bfdb653f7ea8106dddc86621c914518f256b5834c2efba70047c87e8b1116398d6b3858af02bc13b048fd6250d53e07ccf5d77155d4a6923217580964443e1df'
            '5d67c6d1ad8ef70db902d9c0c8894abd0b6797a2636cfd9995963d1b92bab4b09b558aabd4d1949210b179417c0b1238f4c18c28fbbf5345baafc6d76a53bbff'
            '9a73a15ad0abfbb2f63642d3d6a0b031971a4ba5df8b26b5455a1096521c9a125d57299679e117ef7339d16761d27a1b38f2887290ba72a472e5c6f012519761'
            'ff0d30611a689c171d0c68e637de57ca26c7cba4e03782e31d1b3c5dbbbdfec0a96d6d312e7550cc57541dcb52b8206d6168d7d3b3f69656157c22ba6cf07c2b'
            'f72762e6ff9205e4d1811c057bf7174482984594009c3cbe7beba6e839eab8f57909a37266983c076d1f014b9bedc6a3856e3d0c3b6ee8623be4cc6dcced57c6'
            '166a1b91da8d6189047deab4e795919f0e8f6ee195ca34af477d792811fd1b0f6025cd9ee664fa7a360c22f75b7fa5006ebf2f2ce0ce8454cb7052adef608c71'
            'b296d539fea9e90427d902fb3b765302cc0cd9f5a520717b3f124e7fbe71747130f09e8809a920db4ed64829673af1e193a17331f9bc562142ca1e124873a76e'
            'b2724ba7ca2c18e9c529e46bea09c9794a101e4d783ed5ca7acbc871903586a6a2ecc4daa59eccfb832e714bec274f73a55ca56f624fc301987575e42c806e3b'
            'd70911eaacb886854f7838dc309b5672d6fbd018d776dce8c21a0e2ebc4e653f9b3a245c62508ab5a9ca31ae9b89cb97c0911831211645cf07d9e0ae3a86e171'
            'd61b919a9ac926c122534d174a267fecf8114b19fa657a1a79f937890148bad080395f67999295563e668f90b7bbb463a9ccc3c5c44f50d5643bef81db93bda7'
            '9860a5932692bbb28b55c92d60f4d1653fdadc83e84259a4b320eb5de85c16af77bb26a874a98ab0f73538420fa10071dfd036a561ce82afd291e2d6157f9dad'
            '6bc9b3d46e57e49ddb9d952132ff4458cd1ea1ac9592e9e8852d8a6b42bb53468ea267fb0b9bb747ac318be1b11994ec5e70c6b75d282628b6f3a5840a558f66'
            '7921a5df66a257eba63efee0f92e938efe0f2fed566af5346263ab363c706d87bd84d9a466606faff5ebdcb8a7972800d73f5c6066114c2618542205442a3f24'
            '5cf3915a3dae80f9233b516f80d3d51a7c81d861d79d894d0289e62bd5cb59a4bdb8b609f1c9347c7394a417d852ae583b5b99343c9c8f875d8b5afeaa3934ea'
            'c443014cf784456628682b393da52307e185f88be274c3ebd1d8cc834a88874902064a3b4aee641b2a6d3cf7081d49b1eac0fa18cff0683adc129d4067fc463c'
            'ef4bff026cd7c421c5fe85b0232e0eb78f23767b1073d7ffe0b963c5f63b3453e1365413604f03db4006ac418396d637419245580018ba2d1d17b634aad03c85'
            '55f64154a3cda2d56c072d2701a10c242b040e1f31c6cbfcb8ac44a08313242ada7c62d608fbddf56f56114a0a16fa84c3ab6e32471fffde5b91140ae622cecd'
            '2ecc98a992773ae6b524702ab0b340d47f2e4abeb9120b0f4728641c1e67e2efbb14b5be194f5d45fb42e876e3109b46d9ace1be0d64303ea7bd7a00829d2997'
            '4e1c6322df8c3e7dc05ed7456534c08d636d35a0d277ebe4828eda875334635f3ef343ad4dc53b91b6d2a9aa9443d5afa18703509b0c4515054d6f9cb8dd3a9d'
            'c2c37869b95a2ea5cd8e9d78c8615eb3495a514fccf9c7522e1d8b1bfb073fd9b1341318da3f47dee726e6a30cc4a98d9992a77d61067133307e3a87bfe9f5cf'
            'c51bb15407553f332ccc8d8bf684ea61e709bf5b2baac3608ac61dcc1802608e52cb31a77771fbf45ecb8ab8c1efe722b3c7e5a60a122d5f36c12e033012d9a2'
            '7beb895131ab2b5f5af820e3add945f9aa0818cd4947cce3ce6c2cd06e27ee515a06a4d6cf1fab0996b9c3887679485491453c969223901a0be39990b3b2797b'
            'e87b981c1f7943b6d26931df28dd3d1a12a7b067f1064a2bd8844693845cb493dca0ad3e0b0a1a737d6a5dfbc33792cf71989ff5d93735d08cd520aa456311c3'
            '54769f40f0015c4130b523a536abd7fc525f1c61ad45957878f507a510a7289d5068d75069b2a02f37485ad5c46ba76cd8bd460d1c7ba105b7188755eee612ee'
            'e92ed15dbb99cebdc98a9dd34d5e4538850c2fcad299131f9e442b97245d84f3710a194af770649a958d722eb528f1a5b44f8c1a089a3fbfe93e7de6a898cee6'
            'c87d5e131b285916a506c8d4db992629e9e6791ceffca95f544a4ea620c51502c34d983de6789cdf511d5cd458485ff26353f8c88b325d0b6372d48f886f2bb2'
            '20a5473d17dda67c6040c308b1720404e77e0bb1f52acc8b05f980dfc598d8a5d0b103d70257c079eb81890dc1526d8dc88f8c4c5affcaadacf6cbe5f80c9ab0'
            '3dbf3054e3029567443a2a44343a6b2b36dc8ed05cd41f65d0524188c4f43438953e639276e51be8c0f4ca8348e916321778a26549d6a0e0a8cf4ddf833aaa5f'
            '8b35a54200404ac0a55da8c2326e1e251f4f365c8d62ebbe727d0c661ee075004666e5f1dd4c6c07d82551dcf3ddf95c69cb1ace170958b9bd73dabc49152d31'
            '8ccfcb185b868cb7e3632aeb1e570bf8a960ca2bbcff267617ba108177f6d267c23bea2b0867d169aeeb02aeb593d4621e31763f49dc143bab9dec069f5c172e'
            '91162e9cfe754f2c1fd38f321ab399946ae4c01abb3530b0a33e3e19aa55bf1c1c43df56270e37789b22a249b7067091534d732a336a181309253afde9f4347a'
            '6bd3e3c34e75c908d8d76da43f6337465edfe036181a3335ad67e30ba6dd5c81153ae78e214395dd4bad69548110b3b8c0e7f85ee795d81442d68ad89dd96130'
            '12196ab635533b5b898a68ba17fa1c190e4ed23a152ce445c29656f7d565c124995443698f7ac9fff747cf4fa1869c7155fef4f590a2360f7f4acee310225015'
            '11c75bbbbe4f5eaad0bf6af2312f660eb4231c56a83cd55a2d2b80cd4aa4142f97efb42b16923ecc8699a143eb4a0158b10eb4d4784ed95945207907a2a13f5d'
            'b51ee7e2abffff8fda28af31c41015c4ac99728bca021a8916bd80c88c1a39ecfaab75ca0ca46ef6371b672088d608d85c5ef9e0fa3d04cd81f539a16fa1db7d'
            '67757a0d666433d264d1004a3f1a1f1ba1882c4fad06562a826984d1b66d24b14fd3ed5009c7f3053c8dfafd9a8d58b6d417f5b236c2b9e073621e01b6387aca'
            '8155450b98b1269514f8628861beb6b9c24d598638eb4dcd96e3d49cc53569540ba14644a67afb4b41aa4f97479f00508bc7db98e4c854bec5484b24e604fa53'
            'e4a6d54288b4d2bd2f42239d0cfb10356623a7fd630bed75bf8c704a7fb3a3d298efb86f06f91916f972ceac1de228cb2a0863d3f3a9a56cd777d383802dcf74'
            'f70dfadc78ff5e79b615e7ce8fb3013b6a7496db068ea4dce4b40f60517476a232bd5017c762d23718e8340e2c47ef8a508ccadf09069717f29e5b525e8eaac9'
            'f5e1b17b14273312612708f7c2e6520668f5ae399d990e57cb9661e22fdb5485480532a0f3292788d5110da8d35f7af21ab67ea0fa6415bd8954f4bbe551a103'
            'f9a5fc082941da7444e56c83d48f9ccb46e32b95e355edb20d08b934c5b7059803472befe1cba84070087ad1183dbef02cc8b4e9ab6f3c473bb95015c9131ec3'
            '1586f01eea90eb28a2306c1dd101fb4f00640a889626edbb1ce9a71dc39d89e3eb8709ce8f4e039e6a1217bbe3abbe91713d4d691b5ddc19bc3176a63ed4d7a1'
            'bbb79dd970395a9d0f30a7fb2359fe19c6863511c8292e6540b83859ab5dea317ddf93b5e156c578896c28006b5a2d77ee2d946cc24330806325caaab32e152e'
            'b7ec1f85805162f5a609795761b47dbda73ff966e8ba15e9a78fda41226add24dda1fff2127c984f3df268b4349d9dda2de2a362e38ecbbb260839ce1b5c4af4'
            '882fd550c863e0e600fd32f062e2bee7971a50ffa3d2aba2beb6dbab9aebcc438aee17f6a191cf38730e529a637a3401287c73522c68854525543f80bda6361a'
            '7fcbfb0682dd4a0cd3949b510866dfe2662ed4b3846fecc1e590435acdd79aa1c4c4070b54e4fdd2b5bcf8b5ac1a311bc7152c16e719b20ed706f875d01c6d55'
            'd11210764464e1a2ae7a43d019454ea912a0b279f6c6c94d57017f17fd6a36f42980488f775d72892faf28a65bf4466b27e31d5341d185af2aac9f04ec54f6bc'
            '45e9c65f7a7674c0ba1f264a88ba28990e013a39049057805ab8580aabeaca993e8f06c20e508814e860eea2e6d407cf58fcdcc9b779ac3c778175043e6922b5'
            'f02e3e038f30ff35dd9ef92bada33f5ec29323f96ce9143cbe1acac37a2ef3d2a8c0c2192bbdd99602adeaa1a58031dc78bcd61feb4d8068f1282eb63ecf5e5a'
            '30eebc6808aa95b1ca5402da990e5eaebfa4a0d03a4c8f44638aa28372609ecfcc62599fdcef6ba3e13216679f61845b907a534da9489d2ed2196b3bb687ec99')


# vim:set sw=2 et:
