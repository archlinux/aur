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
pkgver=140.9.1
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
  0004-update-rust-bindgen-to-fix-clang22-build.patch.xz
  0005-skia-m142-update.patch.xz
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
  xzcat ../0004-update-rust-bindgen-to-fix-clang22-build.patch.xz | patch -B .patchorigin -Np1
  xzcat ../0005-skia-m142-update.patch.xz | patch -B .patchorigin -Np1

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

sha512sums=('119a4e4e536fd4534adcc4a546a988e553285f9326bf16e9771854ec2dc7d039a729aedc5925623e172260a5e154172c56a011f131068736eb2a89a8de611840'
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
            '6413c00e574f90f08ae770acb6e1191f1d8fa60742fa540265d4333ccefb08e0c7225f17e817f49d8b167f7068780fe44436036b5a37b3fcf7ae9bd703171f4c'
            '5cf81a70a83e8f25ff5ab9f8c42afd58a6dbb95fac784da78ab21524b836430b1b68f80e9626c0f1540c53866343d6955b6552efac4908acb17750d7b5626d8d'
            '7a78d13e59b6d9e0c107b02a36c0b0ac982232f81bd8ac75c8129960cf544e0d7a0b9267d5cf1df8bd8e74b701c213a0384a526bcfb87245fa5f921cdf1ceb2f'
            'd027a25bc4730c1359b9aa257e4e3edd4a34c1e48588dbe6819f45263118fd0a92ff8d9bf37b86d43e77f0e832930825e013dfa8bd32e792d670835be9c07968'
            '9997568da96a80e74b9121fc5aa790545335b4b5c67ce30b20f1b12659bfae30c20ae3cda84a1ae53b97b9f67747936ae604cd65e1d7d78ed61f46ea0d4ec7c0'
            'ada1d36ed4acc20c4b24fe7ff2717e85c67738f1bbc3e4452fd004e4e301fde6c42937ff7f993a51598b9d380ad05dc7b945e61eaf1ec020b81a99a04c776ca8'
            '837c52e9eb5f0a212af6fa5c626cecbfaa69f270dd3baf7375758490ccce1e2fbaedf4b734406db50b26febddf650ce4ba123c47fc59c958159d8c318e8c69ba'
            'acf517bae92fa12c8348495c6b9457270c404899ba12649e2b9e0fa4c291eb899d7cf901c32c0d2bd762d1ea5a8c19c378f224bb667f388a292099a0e5397677'
            '7d0bd02d921de14c3c06ee8df12065c318b36ef22eb95d8bdf4c7ad64e866dd67a4347a599645552a57291aba48ea1bb1c8b1971ad5dfb463d18190179c89155'
            'f5f5c33cd37a38f5d4f1c4f2f4d0bd7b48dc2194f0aa5a8517c01eddebabd87a817772277abb5358ae19fca6e95dd442b12e90191e4c9fcedd577fb6c2c7b2e8'
            '3067eb75bda29eb10880c4965dbde682c0b8e17d7945d22c6c0afaefbd85a0cc766ed7959bfa83dbaa7f93dba1656ad1f36835fa7891f4720539984cce8ff298'
            '84cf440e4d87e533d213fc788d7e923372214882c63feaa323caccbef216aaaf8e5a7854b4b597f972daf830aa1cd2a7cda32398ca958cb353b819038d96f917'
            '65e6e9f0050c487f5b5a00a14091fde5e3af187b079b1eb9caae97e820400a5305dc065e51a4d5dcb0bb3ea3372a987f4d10cfcaaf022e8bdc03123a63e3bfbc'
            'b415019da1694e3b0d313aa9a17563adef6621db93a2224b11c940e71e52b2f8ab4eb2f7ddf68c7f10502da20114245fcfe8a2792d777a15244bf43eb28a8a7f'
            'e144295b85db63a3360ed14106b870a84f85b24b6a47c43abd51b95f51e094ddee6868359740487f3d0ee61f8f267d03e9da9af5160859b636962139caf4c61c'
            'ca5a5deb643214667dac0f16d6db6b6a58d05754aa6f4702fd6d1a8d1cff21c26977857d070bf5583911c130a2ec96fb5639f055c29ba5dc0851fb6c2eebb277'
            'dee6c12ce77ac49042bee8b0d67f2c5282626cfb38cff8d0fe70200d79f1e35ddcdc1b7311acd60c63c19db943a6d4e468967f10675d2b9b317eeab864f4dd9b'
            'd5828b7018b7de2539661c7a748052eb3c8631d90532d0788eb6f22c475046726456fbea2a336ab580a2250f95ed069ed3b491c0497e4f46c364e537f6e95b5e'
            '3449c1cba49b4d7378223a3851fe0bbe97f357805977af7c610a8ca35d0e703c60b5e8abd1660e974a189ecff0e0b4ffb5d7956903cf821960b90743fb57dd56'
            'a8ee51c53cc507870db2e21c81362e372b1b34278ab69f6ab82c4a53e15f05370a793383d2421f80e8be6d174588843eeb597fa3af1f4af5b336949840b78c66'
            'ed8a6e14f28990a697cd42a41a97256e6a7177b005e89db11fe583c8149c6c53317e9fdb953dce88945376b42840388fc1e23e18c3db6979b89554831641e0f7'
            '891895a7d4f9676eac6cf305d8f84e55d201ecf79d4aea6cc74ad7001b90f65dfb02f3674623909a30912694229078e71901f46075be1f52422c20634434483b'
            '2629eb67a7a7b5b9fc19b7c53791bf7f26a5ac1d0324886dd45710e3bf996c71411a32c0eace9021918842a3533706b258a034ad23b47879e67e6546ef80434f'
            'da158a1d62ba37f49628523922aadd655c5c5abf56072fc0940a75d0469fb6ddc4d08a753ac0d99d7ad7d7533695e73b4ffd77a91e119851b23a33028d5f82f4'
            '204b67a2e3eda8cc5f9f56af8345f770903122f124ca00124576cac417d445329d0e6a4661e4735fcf850d4d7bed951ddd2d8979c393082249839286ee15bea7'
            'afa5ce2b58e9bdd0bddc68925bf420414daac7d4275960c4fdf40c923469d87234546ed1d586bfd77ff3b89ac9d3fdb4c948793c7bb89f0093b4dbf1c2ee2ae7'
            '3d8ec5e1b7601593ed146423378195dc252491ec26899ddc4005b07379b9afcbc989c6c720ea1023009f2a539210ae266d9c06eb17e69dc6397abfbd16705987'
            '7175d72c9cafc2e3087a95c745f54056fb473311e4d8d905cd530511f65240bfd82d68ae34610341c951b885e346a33b59f2eb28a577c50586e1824446d4a008'
            'ac0b5555665849a776c2bcac61ed0b5225a2d930f60b5b3e35eb40033147bd6b0fdfea9ab752953c756f719947143002bfd93190c35b88d2b165a5d044d4a7e6'
            '1d5721ba2e36f69eb29b13b3eb47167de1c6ef86b92f708ebc1ffce0ed7cc2be3e3339ef2fccc0fcf1064d095c9e138eb315e82ce6d76b1fdfce510f04af9ddf'
            '65b2933b9e5e525afca7621edfe80424d1b1917e1d989d3002e850da33468a24396e90b793a89917fb0c6765fdd1f958e677ee507850306369128ec8556db049'
            '3b56f88f673a5623ed8d854cb8d02d4178114fae7eb820a4bbb54d9eb6957b8bac5ae660093b86ecbd15938bc73dcf1f2823209e67a7e562b261e80b3f18b2da'
            '8e38b0914cef0f69bd4e17d4873376187cf9094653b23b16c8b614fc3cf6a9f8c5d107bef38325a0b371d14b5467526dd5ca39f6c2df8b31e604e84ac293f925'
            '63bf37ed3a369d31c3e88cdd29f838f8feaab89b88e066d7d00b499e66478fe97f283ff7e7f8c11391d2c0cfe508f61050bb48c126adf00deea8c0cdf407681e'
            '3b80df3d6dc2150f10e98370adf2617c5cb91160730606d9358f85d3e1922b17370c2860a2d940b2881227f18298a1edc6f384bf7b5d68629f81e5139c0796b7'
            'c939b98d2c9e5148e4def53af6e712668ff9f3c314787477f4ea87c8cc2c81841fc0eb982d620ed01decae1efaaaa25525c5d50f13fe879a82268e38bffe53ce'
            'cdab7625c1a1e94df1875ba1c1653d05c20b03b34830b42de7467f93eb978b12b5c25581b6cf578e90103380d146871e84b5242fa89b8e72a71a6c11c5b7e1c5'
            '26bcb846f12439d128a3a753a8172629acd229662aecd935fa501aaca3d697acfcdf0e901eda335be18709b856fc6e1a7320bf464c0c793ad698015d475aad3f'
            'ddf3aea7a55a6f2a26e86c10cdec44ee99702d330aec80f5502f53ab669eb238914a1ce7ce7226ededab0e24d7060121905c1c3a4a085a46d00258d3fc2f69c9'
            '9f694786f4cb21ca76705fde20aee0ae6483d034081b005adf22414bf8f8554a32c779ae71e0eb443e64a0b3748d2014a0a73d8a3fb2278931b893b26aaa570a'
            '23ad00b98a12bb15dcedc610dfb3a265e82ba83cec432e8414c46477549a225447f4a01fb48f6ebf3f1a5a5bfc01478bfb0749ce2a85ef498d7919c9894d184d'
            '2db2ac0765d646e1be5113f20ed633b16eb46a46cef6267a885e22f8642d87a2ec33e40c9f8958d1650811fe482adb5ca95cb359438cab30351201594db0643f'
            'ef13e22974af81e0d9a8e64872901bb29f719bae47d9944eb43f3e64c30933bac4b7728d7b32f4533bdd3b0ab01e121a5417f32808180e552b74488f62f69345'
            '52d7db60949479400d591a865306a348e5a1d893fcbb7497ec699875516f1da5f8ad436dfbcff2e25587da32b6228bcaed1915ad0ecb91844f68a15070c59158'
            '6562bb194de7078772a9b72ee4a768fe2aec446abb17f84e6f016882e2df2aff59857c06a680ecc352e7f2e41111c8aa4da6c41adf02e2a507cfcdeaf4fabc5c'
            '570976bf5ff7823c705a55f921213454c515c40d5ed72cd02fde517e6639ba61f22e6e6cfd41856e91b8c1ff99f7e42d9009571087c436b604b5120caf0549f7'
            '1bdae9fd4f52740c53672c5daae9220d7b26d4afd5626d14023278462c3e6aa8b054af96c284720858a851bf43a7630054f3211a37d8e3837b440883886f1b66'
            '0933617504a1e0b2360be22a966329597f61969aa247b5bef5b967edd3447860548f8f62f36bf6ff98d85dbdd98766bb9fa074cf49ca39e9b55a642f0089e581'
            'ccad5132c705802d9bbc3260e3e819298afa8ee13bb7fa5426503ebd7d291d7cace1c71c2fe6edcee492d42d0f6e1eca5ff6054fe09bbb901fde9e6a3e19426f'
            'db57ce798f50226468686a4490350975ed96854486afb2f662ad69627e689aa187d20e0b0fb867cb84491f540e213cf6cd12df3baaa569cf4f3256f9e08cee2b'
            '02dd951e63790cb49a17c6c309f3335426b4c6339c6c3aeb407134dc5d03afd3b8245e4a50ea28969f137a114302c5000b0239602aa41837915199757dff6038'
            'f00f58b90bf9da85620f70e2ef7987b89d0f8d0262d8c7b3509c4b1e5a425f18b0378b7c9d26315a61b9c81737777e312f7385eacad4eec81852ddd641c3e5c5'
            '609eaa8fe70affcf4e01194f06083ef8fbd2d670ab3525d5ae3abe32b6a6ce635069539eab8c1b020e4ba3f5f42af262d12d99bbd62745aeab365eb33224d3d2'
            'f21a0138747bf87793c3cf6438b5b352585fe2ab8ba2ed2b4f54e24a45ac1380e3e8f759dc0dd923e48fe7962ab01bb5db1d4f5465691a94dac3916c9c26e47c'
            '3605b15a43cc53183abcf088810161e703e36314c88e134a45b64dabea29cd2ee27e19399be6700de424527b3a9a123351899c7e282f303c7054c56618f971c6'
            '5f7e98f45ae646f0601a368d1a3a9850afcbe34f493902da59eb4be90166e6a0ddb359ef9ad29dc53baa1dc4fdc1fa02be974d85519bd07fcebd6bb333a9f442'
            '32cd94d69ef3c1a246c88bf85be335160daf4231eb15eb3016d4b23e882ce043dc69c88b47671824df0abccd711ca41685c75c4dae73c5bba065c6e9ef70ff48'
            'da0560c2d9e494a49ca5fc19447615ead183ffdc8696ddda46b8c19d14e23c1ae96c965d6829e0355036d3be20a6e2a1e10199a981adadca9afc645436add682'
            'ceaaa2911332092e313f272bd0567cc47a76c4539a83335604ee5e6f528f4213b500cd11d4db4591901af4fa853af463902530c46d5f697fce05772702a3ee2a'
            'b744c70ede9d0fa9b5e70ee907aed8b945966c4af61d56317d41a8a20db574a99e95d406131a29871b3ee7c9ba5d7b29f59ba7e12e972e6e0810230278024a43'
            '11abbf17a12cc6ce563d8d98f492041912342137423e19de7bd9bc61d220835d8d87b1cb1ecf316ff98a0ba6c9bf993d1c7c0aad13df9202d34809e0db12c324'
            '256520076bc2c3260dce0c3077eafaebea8db02aa6f8da6ce2659db96493463715b31b72822d37a361117db315b15f6574bbcb8371f76c0e6b2db31c0333bd55'
            'ac5e119d2115a288b6591b028321ac0def77f84554920b5061511b42a8220021255adf6b7ff7521b6c634bf16b7e5af4407f0f64df9a935d6017d2e709f2ebc6'
            'b6e0014d6c2345669a95a58680a3a1304fbfeed7a677d4450d734a2d60ab51a44838814ca4b6502ed4137eb16ef11a75fafe9e919de117bea644a4d317d5ab47'
            '2acd36edbef6cb0e94b9ef86599e1a1a7717c8fbfd0cef5152a26863ee3b7fc2de55dcb369c6cd5b60870ae2d3a13607709907583c979ac27c54ebe90a5c60b6'
            '8bb985e8890bee888d48630f33abe4663fe2e93a59f68ae322ea45334250ddbd1f67a185f02d1e52ecaa746a677684bde20adc207b5cea253855f617f822f824'
            'efd33059e03aab558ed452570fca46330f2f053b285e0304ea52b0f7f9e32f280597d5ea270f870829d681b71dbff64241e0e62db5531be31a8fbe10da7f07c9'
            'f54e5c3fc0b0ac72838670cbb8ee32613add0fb0b60aff0b5bc8dec4c93e19daf21416a40548614f05176724959d24f5450b3aea570d6d61add6377aef941ef1'
            '49183835579591e66b49ffabd8ef6dd349975d214f5dc6cbcf10c69ec62d69a3643f70c0052b5012c91c10da75fca26adca8aec579bf21dd4673dc5ff52dac70'
            'b48d7c46443ffa924b0c29d73ac58d9fd2a00d49318cd3a0f9966a280642f9d8e12f41a9f4d9c21d9c371535d7477efec10b1dab01a64e2b131cbb1752caa823'
            '34f1c6a16cafbf7c432fc435d55492798f02b9ecd19cb51e1ccbb3eb4962b51026f92a6de7f436bd4b8ebd302ebb2ca377fa8d4b7c6ef615efe931f8f3f4c8ec'
            '139f58aab8f85ee9bd790fe7fa5449a1d7e2c6dd9dcfdb1abb539909f54bb448431f6ea863f30357a60458073a7a3f1c0f5076aa56ee9fcafa34fc8d6259418d'
            '471e15c5bb096c684b600ffb2a0fe430015f24385262fc54aa0e1361ee597ab4511d17c7f57da11dc680900983dde10121d66737f5ff89e0f793f4208ba05ca9'
            '7cc0d1e21314a2ac63f7d862e7893f6ac37e90aafce41ff11391b6749b3d9cf6c4b9e7d889efdd2c68699e1a4a6826b12a079d5e288fb69c1dd278d28f9937ae'
            'edce47495139e5f514cb35f265db4446b3fbb16da998ba5bf64817688da0bcc3690519714579c5cfb5ffd0cfb74ce5721ea11e62b47d09bd5f7b8e3933c1a01e'
            '5324fc14851c569bd9f581692790ff557610f8234c41a6399c0c856d5186147bd41db6ea3b1c3fe78824b0b2ad66d57fa59e6a57d89e119764bdef22beef9770'
            '98cb733a02534773cb0077184d94469a00400a919232e7c7720f4c16144e0d1f12f52a2d26a608b57ffe63261f6b2757e14708f123848dc2820fc9102d17b784'
            '9cee34042a1afe9a0d365156d3ff413c54dbff8c65fee8409f96493498e643768b7e0734728e04e47cbce42535d71c3c8c957e460d6fd66f91934e668ad96390'
            'e035657e9642d32d3ec9b677bc4d4e15c49a99eb2ee54db174123c313d53394b796b94b79b0bdcf9d1c88971d12c4d7d4a16cdcea9ecdd1e3412d02c68c8a00e'
            '9c87d90ceb1390e8b4d45355616253352f9484ae8bc16e54a56feab101fb89d8e774e9398054f3d86193cfa245e0ba042651a173cc12f82eff8842a3fa8c32ba'
            '90d238a0d89633293dff55263f79001f90e8a45e5898210769ef96243898343a090115d0353bbaa8c9d19ffe4509767fede4d102fa5cb3db1936c5cc7c6faa93'
            '190aa7706d5452736c9bab64807c73b0b886bd0d6c008751228cc5adae21c932cd91ca9c00ae975f1bc5e29662f2ae58ecc7d4c36c8f5f7d55813dec4dc70721'
            '9905257ba1114ba3616c94c2b5ae0735a3fec66cf98ec207e434044d14b2d16674ba8b8c1cd771e1c06a08eb0bc830524eafb4ea9c57e5d58246a2fad64b4331'
            '2d65cf256bd921a503cb0ed4d623bea2a139d5c658cf2e1176f3daff39e1956072c85f32cd74477e2cf46916400e2c1757fe760a3a2c0393e8e7f21394bdd5e7'
            '07e7f5dde9b64f037112b129e6df1e3b48444434d35bd0aa813fe1d1b22f16e1df100e6d1573b627147729ee459238b46edcfb5e834e18040efdf531146b7c43'
            '79f94c7ee641dc12b3f0cab04a55612fc7d2f2d6727a803e9c1bf48c9739173516e40f95b9ea7dca0fa577bb925038d03b66b1be73512848a498aec294252bf2'
            'cf7e8131658661b36fc593e8e349280dc7af943e63f39e96187216b25de9f5b0ea5a5c52318d8c4811440d9b6b9fdb7ab16937664a23e72970068bd5d8aea0fe'
            '8c1d3f84d13c429f5fcc421cd1b7fb08e99b39b8b9b8c20393223d152cb86038d2802615c022a50f08a78897ed377152fb93631f45dd58d3ec967e23f9c170fc'
            'b6e281f3df884b3c258b546ff90bc9c29c94741655f7a23a61e9247485d22c4fba3e739c9a4c38cc4a6139592d1672f2b75fafddf11757f2a389e2038d100405'
            '556608f6ef0835207d19e4982397c8a24f064a920e170109b7deb4b1f97cf7e55f6d713c57bd11f282477a58fe11e4a64cb0fac69e7a2316fd39b35069a32c75'
            '65e8fc2e6e182d0c596b628866e861085458c9613c80e7250501783af6e4084dcb3ab179d74f67a3246731912fc61c208f68f2854342c7b786b60216f996482b'
            '550912cef8990ed5f986bdd0e7f1c620bcadd32f1407611f6e757d2fb85308ce399a9736e35834e84a1f568d6185f5539b198c9439234463659c8c7db809ab49'
            '0c866c59d059d3fdc20ddf70e97ecfbb1d78d7aa98f197b319fcc2d88e376838330a073c0d5ca8cb0180d74a83cdccbfce595f762691b384a5d7d9a0ea7bfeb5'
            '8557611994fc7f51756ef459ae5d74b7fd376a4661465fb88f280d81d1a361cb0550901858e62fa70d70a3e1ecaa6dc9e3eaaa4a6281c9ecd5222541bf86e8b9'
            'b91f55e87688ad1544d617ea7c80d11bdd88e75c1e3fd9e94db520e5bc26d80b1133f130c518ead828716b36a9eddc9c378a47fee0899da290f6e444c4469a44'
            '1812cfcc80b6322e237fdbf0a71d4a7ee1b8fcbe95fce9d48347fd9381223792a798b58be292780102593e2ffb8196d1892406a21c55ec65a9684f51e13a91c0'
            '088dc7802f97574c4b18966a07d611ac94d5140602f0a4e5cfdc27343c3ec2857095289a48873b6d14bb5746e4d3edbb71baf8f770cfe87f2d4996bee4579f66'
            '3cceeb001aae3270fe6fe534112d518dd7531d261b1872900de59007ff6cc71d56c44a41c2dd25ecdfeeee036099c2e11a43beccd2fc5c348316f176ffcac457')


# vim:set sw=2 et:
