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
pkgver=140.10.1
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

sha512sums=('aa3481dbdda0a302acefff52007ba2e6927962523408b942a7df673e80618fc381faf1ca70ebaac3760645bf7cb382b85658af49beca705cd636ce9de58349a5'
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
            'ed07e8e3bcebbcac704295432479d7673aa5f0e67c741c7147ce06f0761e638bc4e3e845d9416b1878dbbab7004ad1eb0414fa30fc01a077ae582494d916e50b'
            '592a2d55fd5708971ac628712610fa24a7d17d9f17e8bd8241714ecfc717669206ab67799ff0ef9b227cf77c91588391c7c252b490b5bb0f904770ebf1f74f40'
            '690664105daec730018b24cf853b0087918c81133433e95e057bd43f7c77a765d1ef0d1b6f699cb4d4a19c5a2e760d3d5e2613a8c83d8faf32fc3c0595b4fcd2'
            '0e6966234ddaa733e43bcc6d7cf3f62982d67d427fd37cc86dab107b0e24120aee2e50f3cde5dadbc3b91bc0f99fa9e78122d1d16af6f3677e11db953cf13dbb'
            'c1a92551b42ba8093485703f5193b3948213a7d115be477bb4922b900e1e4b2f8afcb89bb82da116adf3ffe102f905fe64e0ac66e7c9e1c4623ed3d974a1a3f2'
            'c21033220d5139549f1d08b20e287d2bab178fff1c0a3b630fcbb46952323b583ef5a901972476fb80bcb430c002264436a9c77b78892861f41d4089d6e2ade5'
            'd0ba8c7524b8ac95712a488c7042d22da1fe1392e1abe1d1edd5d1c729b2d40c14806aa6bae02776a094d0e0fb290e044238ed671ed5ca39a30e758ea3f54b86'
            '7cadd0698437aad6480f8d267ec9c7dcd4b38786310b3c27c1fcb1c54a5e9191f45de5fc0a2f79f57db516be4d5690b1e1d08a7ae99c106226c8276ea59ae99e'
            'a1ca5c7bebe2c76a868b536411ae29f7f6b56d793ac2d4536eefa016886e2212cbf5612b7a526d6b8304ab4213f87dd46b62f1da3eb4dfbce98f4ad27c92bd3b'
            'd84fb66117029baaef1a2baba7528bd58c8c7743407aea9a415bb06bec1750f5bc7b484c43daffbdd8f2eda8cdaa788ffbfd4d9dc76226d027f12f9a562e435c'
            '45198910fd1a2ab56879b093eeda97de7ef0110282188fffe63b3c75b7d8c012cc2803c59be0f394ad546756fcf2a550e30642a2389d1a267c441c485e01f5d0'
            '2e1223ddbd94f43c0529f7c220397a7e0f2a2083393d33ade5bcb02a6054d334a99087d5a7e387bf20f197848f9ce66890d5380c70272ba752d92fa1256107fa'
            '60df36e3f85ef996d3a9e7ed4bd3acd25097939947c0278b312f3e5418a25d888a50e8e973186c205c8b2945eba1015aab35402a78ee9e21c820a6df64fe13b3'
            'd5edb61c38e2d501c3eb5907a62de13c241b56bbfb677e001c7ae14df10a573a8f1969653235477878224ac18c9373d3f1f447b8f5649cddbfcceab9cb3d91c4'
            'e512125ad8730e7ae0b12c1ae9758258b82c2892aa4edc20a24882450f327283f109523e2ea967ff7b82b96720e7d768923ea18e51faf43ab576021e009ea20a'
            '40b2d3730bf1e7fdacc6a5f9cbea6795e4a99939e5b9b66df37fcc8275f032ff8a4570e4f88cce87816ab0a90bdceb874049ca62a9c78d67d29b5bb51eeda0ce'
            '07954d10b8d63e1c3c41646c175605341275940e5b1d028a801b2563e4073e32136de0a526e41c744979660daa49f84e02be5b2b7193cd42da7ca29966964d47'
            'f8d3acb7ab691fe4ac9293ec36191d61b81c3da3bbc3a486ca2dc67740e2693cf3b9274bb822f581fa129f5e05beb5f5d8d71b2cc89a12ac43aa0efcc9a7e64f'
            '780411cb9d4779dbb5f6f888b0c23965b8cc750cd2159031081e18d63e29f1343ddf76f0fa7b336ac9839e2e4799ce8762f1a3de804e21e0265215a0cc5c0ce6'
            '5ede69932dd733540b98460750003adbc07200c92433ff64a8ce6c0f9fd76e46b459aa0af328634e9f50414a11fbccbb030f09a8a5e353d92a1fa4701a048222'
            'efdd3510475620bb073ec6f8f1061a06d078ce4fbf1fc6447dbc2c5155d05ab0cd89ecf5e7ab86eba09bec8540585df343c0f60f6522257517111fbcf74fed82'
            '8ed11e01d789088625cd330e203eef37b9260991eb714687b7f130415bcfedc9cba4b474d3264403816d9bc062ccf2d5a643ea037512af76ed6e074f3ea8f765'
            'ab56f6d947667cdcf9a9fb0ab126f3492847cd7cd1731c02d85c900041c317741c16ba28fa2aa3249989cbca6e09e1caff927ee18a11dbb68aa46fc528529b7d'
            '921e153dcc5c78577e17a06e4477e5e7cc477911eedc77eb182efa62b88146486176a40c20d43d92876d792aa61e081a88904c7886aec39c62458ddf0d0b4330'
            'ced2f640b8643e3c9899266b6d9c3e8c5cdfa134642ba5d2e1c2d12d3ce3c16132a60c93dcce5c3803e6f602a337c800c818877980f09eb92bb602fa2a57b4d7'
            '18a7d6c878b17a2f7168fcc1120325f04d6b4eabc4bf64f2552f09c41dc6525177b41b9bcc131a15ca2f087a0d1c48bc08e5705399775649e897a44d2225c881'
            'd3dfa486bb3d48e4cc309d8106882caff53c3fac65f6f1594d97765875216c4d2a18eb778e7d2a590e488a6b6bebeb0ebd30f516c41799a32c44cf3ef084cde4'
            '9bd8b8ab24bf56adaec67e83b8c61128dd8b5f6553590c1ae01fe93fcfba261ba6edc9fbdc03b07d713ca5bbbf052f04a8b0fc69f2e3ee60e1c9d910e30b038a'
            'c393c9f4b27174fa2c036c17b2d187b6c6701639f1f27bc71973f5171f87569ae81e574bb68058eeeb2234246e7b126a0ae9b93f767ff772d2d72d58dba52fd8'
            '62946e4d5079e2cb65aff8c513901f8d3434f42985c14ce90c368cff42d01d0ced25c4eaa5a06952a062d2f30ea6b3c332a2d756182ca2ecaeb4adf66f054fd0'
            'af7ff6960162aa63bdb2f74fc053bccda8230e388e2aedb5f71c2c3fc9acb2f706f6be06f6f07957283bd81d378443267401ff306e55e264a1390f0a5cec534c'
            'fa660e404759d481c55b245eb39f69eefc80b5ea154a617a0886e82436d221c3df0ce1aff448c3fc0babb7862a9d16f27080c8ff9a0be0367f4fa069604f22ec'
            '9e89dcbc43787e319937dc0b6d8e95da3b126d9627c61f9f10089d217df85e43cfe138f479d72118fbcdee65552512433c7facdda9f7f587bfb3bfd138655757'
            '734fdd77c17a541d63397bbd95fc37537a214ed586a8f20b570f78fb948bdaa5f6e83dd43e997ff21f6f699b5aa3429a4b2cf5628b33bb551b60e0b5dd70c85c'
            '19f4a04d92472049dc236a10f45fc95ad8fb0db6cce02dbce6a58aab74d293301a397702ccd689666e3da521996e3c4332354b208f94b8aa0117e1dade54ffd5'
            '7cf84264f4cd741151bd227f36058ac5ad3de6aa57bd090ecaf63d17806d36757cfa5ddcfa5c6a366b44021ef74195135386931903fd60c467f4a94e1d71f721'
            'ef1d2466243e38f04c07195647900cc8f81823a94b9378619a10661007f4546bf65c9b5428cebb6802c60944367f0a89106ac3ac4b7b838a234add311c1aec92'
            '850728cb780e59403583f7c1bc79c7fb10a7a5d8d5b712f8439ab7131e1276ca9a54e1f947c91e8073915e16ecd6d767b918643e88a0856e79e1154db3f02615'
            '32ad5c482f8d01ab83ddd4476b7e3cc7f7850babc0f372cdc6f6e44f5f38dddc66a4e3f812f0baa77e79c8e731b4967803664619574a7c99541621e944e9a8c9'
            '0d3bdd22b250a3a7344b1168426bd2f09fb417a4a573b17e765f6d47c048530c900bdb58035c8da3dabab5ed5b944f91531175b0b9f4b27c0bfdafd94f796954'
            'f4cb354f70861a23bcfdf0943f1ba8a57be05fd77b0b6106498530326508e09790315f1c10a37a198d0f95c26350e2e668c8be3d5955d7ebc7369f4a69bf0a5a'
            'cf5f130debbbaba9bfe8f81509ae607e8d6202f13c96a304f1617dae390759e55bc2a538c26fc2239170f0897017575ea7ae11cd0decc12b1b68b48a13a1b92e'
            '8c3473d166d3fbd151bd45574cefaf8b7c13bc2cc2b938c1d1e84b87537fa6449b83405192edfd60fab4a6f63e18b001093dda10b12f9631e3ef2621a92cc08c'
            '8d96bb805b080d6fdc770bfd32a281eed0967be65efc44a9dee2c17f0cf025e65b43e5dd2135aa8a6b95d6b6c0da9fc66bf735daaed11b845ef3e56eda3fbc85'
            '1c331a244063f268c7eb5a5c8950ebfc8b4699dd1b703abdb802ce59ab5fef69906e71285643dde2d5ad9d06a08251a9710221ce617d39601f3ee4a29f2738de'
            '648fabbe603b5ec1d39557b3abc8854c9e727d396b2b616499a70ea9621b88f9a91a6b60febf5e43972c03a2736ec33bfebc0fd2a74352e4e27700086a554e2a'
            '71d500895819124ddeb1e8de815d810d58bc852d9eec2939081bb62c3e2a16741e5d25f44726d22bf851ee175add3ac80cdd09294dec2dc7d056baf5ef587640'
            'a41f8e404136f8561cbabe9ed8a30d0553921899a8f8b3cee5a162254de2d2866b863ac6839bbcebfb555921dc15d8fce6e4e32533d514635fde867e598c14e6'
            '65170a32dd6403165c0b99609e6c2c5e88c871098bca1b72694e8dec4b6d5c1ad8fc6d455a5e0d6a73bacbc9b1855789b752bff7d6f2f34eb37e46ec52cb458e'
            '6c6a4af378dfaeacff1e8868bca87cc40c01770a80b1d4b71532cc82d9ab9b0f910b888b1a6721ca5d0e5b048428f0b2c6685338a55d63cca4d1ad2a19e38e76'
            '00e46f20303f914b5bc9968836db16fb7487ef209afb9dc7ba897f5392db23fd156b8468cdae59e20dcef4499a1c062b315e941d61241bf5a0514fe4f2a7e5bd'
            'a39e9d35207cb8928521ba291adcaf0c33c35b9e29c2406b2bfdd36bce21619b7475affbc06b17a8082af3500d6e42787110b660dfb65bf40ea2f9be99bdd55d'
            'b9c5a9b2a3d32ff5dc7d9e47f10c51002beea9dcd4dc890713ad468cf1ee6da98936ab6e8729c9c4fa1fa437c9e53ffbefce3b92ff1b9319eb5ca312f88711c5'
            '02e5e11f0f9da47826259bc33a268073ddafa15c50ab067b5706667c5b6c89cf2c9351a1ab8c05334783a6e9122c95c26a5978122f3093f97f29fcea153ffca3'
            '354a15ffc78ad4a771d1479408d90eb35adf6fd0a27c03bcb42e8aa672117fd7ed274c9bc2d6bb0202e1f262bce8c6faa38b0554783d22f33b56d2075da874d5'
            '52528571c8dfe3a1625a15959b7b1f0bb688d5802a5f92555fc6ec3cbb60f58f50812b9288f1a787cf2c10332564301b87bfe0f37d9a2264eb124d054f8afcc5'
            '9477ad1f11f93cf6402d628f05fb89335558ce77b325531ae8cf414871a53ac2431bc51a045d705b8d782e6ce43488d1529bdf4a1d55ab0cf380ab6fccecbece'
            '78cb2f8fdbafef9e7e05b8d7c6b0931ea83dad278d4b2a15657e1c89b0bd40a07cb90b501b8647edbccd27f04cc03cead9ce3bf6662a0292e810f11fda934b5f'
            'a42c8857e06beb2086c205dd4f35d028161e59ffb5be1db42ba08bc5973425875427e2410058fecf86cd4233e9d6f2608fb91377cb07f86918b909dd2ef013b1'
            '840b3f4a0cb0ae45351cb6f3bdd529552eb0ab7411f371140da1195d185b78af1720fd0c9cc73a70315509b6cd1d6c6dd85368aef71bbc329b95c48bb6500cd6'
            'd9d847a5d185041c918eeef3cd4ab02d63bfc00d6e358b36a4453b3583e6ba7a2a917e6f1bc9b40b82a932275117ce48359bb0cadbc024e02f041336daf33b48'
            '1665a5b1104272190b2535f5a8c968e35544cc6049a85279bd5dc4c7fc5c6082d34c97d511a6943b67af66f1599f6cd79f16f6c850b83c23f078933530612ebb'
            '2eb8bb50a7ff5084356490d4b5d3c6416a6da104420253cde715cc09db1d157247ed6b26e4fcabb7297ebb7138580c50a16e175d7c8321f18bb7767b743c56dc'
            '0d6301073f529a8c9ac206e6788ce79d5f719d861211a3c4a5e631fadf21a3143ebb1da161c8222b4d5c1329532fd790873e351e2ddd9f2489d8902448a51923'
            'eab3948a53c06d4d89f29da2877224fd88033a6bfdadde0404637ab686502da18654cca2b7db115d756f796c4f1f27e0afc31ee5032bea344d2edfc7808cf7ab'
            '6afcfe06c13013995382674c4f87a8c39af737e2f669fc959c2c8a2e4a21d3e8956c681b87c0545d7844601161039f34f57b5bac20f94ac848513f9ab294a8f9'
            'de39ef8df878d971adcbb951a611b09206a20990feb4dba252bcf5b7e94a6773657b12a1756cd71febfc3a0b00d9ebe6342af8ffbb0f9002b649263710ec87ac'
            'aecd13d1d09d123cdb4a8f893b50026eb62bbc5f647e382e460476378b4cfc091246886d2dc7d7ad813f7e4a7dfe039520297cd5bec40341e4456891f258d709'
            '3d4f3a3171c7016da63c93726b13196ea930e5e942a677427ceed0c6adfa30c58ca54f787b7235d9983b16e68e9e323f9b987e169d3e280d76fdc4d8e1bd2704'
            '46a4e4321c7d567fbf7f47311092ed0a043aa64213e4f52576732fd2b506bb599c7788f372ed2da150a658245137e166c3fb514d66c8b37a2250172c530d18d9'
            '51f72ef2812e4ead76e2ebabed1defd1bb1a0d406d4870fa636908afa5eaab0b205ff17f12c7e4370ab3580832316902e5222164b27e29da1521ccac7f7b134d'
            'c3ddd5c12ee6a68dd3691f6e2d1df67f27b5c5b2a740b97eca9947ac3b11e72f48db020fb5e25b800636e56d83210788b4a0b040c7d694254bb1e2a6df8c9f52'
            '1e8dd4eb5dd0a037e996bf05642f60672f84c2c8c61e66efe1a0511676cf870a933a607f84ec20bc157f93e2607957118becd8dfbc8e69038b0ce7282dca7ae8'
            '710a9f6b95d30b126f17e18e4c5fd4d4124a047659da078e5d490c77f92ebf3c484bdfaae4beee48659ad21c0a7f7e460d5e35ae4fd1b222b57e31520ad22235'
            '3c6112c04548c5f0bdeaec03da72aac7dbe7aed4e2f435013a93482fe55ea018f2ec0897bc9c47d5987069109db732b66ce87a83505186c630ddab9cbcbae59d'
            '522713f36e5f50815646d8309a1ff8747b1b7e171b5e781eda50672a2ab52daf4331d22e7659344d5ad7313c02832feb1d8e85b6f1f82af94b08367428ab9739'
            '475077d585c6150585d1bc515b28f3c8bc2cd3476784e7a499ae9a554d9106fd5b4210779f55b62831905cf73d7ab9d1972934ff61353fbe584260f9fd642c4d'
            '45b2bbb5fb465ef36cff2955284b70fee421061b8646ceec60111373f7fc35fbab94f906b988bb1b8803b161b86b48c774202a7fba897325c8d9a888b633a7e3'
            '9ef983fe39f62cda29e0d206139043397f0b644d0eddffea8072c69c54f5260a0760d556a9b437b27d8c1b8080a3f1eb00bb3f1cd8bed51efc8c371b18a6fc03'
            '4bb13ccea959a927314be1c8222558a8e896dfce8c8c003108a7014ee83413f3dda6d1c16de23be6a1b5e68b19ebd7927c068029a2ba435d3c9ebc3fc82be07d'
            'b7af51f9cc2bd873f9ee78758dd384d57f13f2e3f8327b1ff299cb2c97e72340e6d4ce75a2da1d075c9b92cb7f450e8d3dc7c5781cc4d0480a039f803687b9a4'
            'feb54e483033d084000f5897abda839ae587922bee52e1ecacae1f1f73e82441520f04f4efeb209d6ac4ff4c7c38bb78f938eb47bbf929c8bdcd232652c31be2'
            'def6c3f75f56f8815fac1cd5a0076c5c2bffc159fbb334874ca56a65b77c45ee0b182036728e5155b022fcf78241f58fba2997d4139f7b089221a036d069f7a6'
            'b5981be528e5ad227ccf17719a4df8a39625c25fedc5404d097b2ff2bf7393a9fde704141827431c1cce3ba7755a91ca1d9919edfe741012fe87c64ae3ecbdc8'
            'cc5ca6b4c567bdda7ac650195c326c00b0dbd752f93738af1fb29997a376036562f696cac2e557bb2981272b26b1964b1814e2db59c8e3212e619d1092a342f2'
            '7857c82671896c7d2c964d4b19e493b37ce05224fcb8438f0290b2c7fea57319c60c49d1e65b02528d0708f8aa81f2bf4dfadbc416515d2bf413d464383779f3'
            '47c3b1a8599abd3d8b6f6beeffd3272f49abecd44df5879376c2d99c88844ffd8a885c6dee7be58198bf5c87648dd19be7174f9e73f18a749cdff079ad0c8568'
            '03927942584d69a076b230e6d0d7f4b3ed1887e2ad2236e0b6563ac9d717c0b8655e0056fdeb908aff3437b71fe6dced2beb8936b8470c4436e3a90a7e4f54df'
            '26dc74f9264103acb6fe286c529cec2f29ef1e5ff0e5a2d9459932e5b6f6abadf78fcb6be0152a2146f7c601f5f4570b37babfffc3998465988d2f4371be0067'
            '5bc096e41d93f40c3bc327462bd86645566639f59ee75de2e4840d6fd74d9c0606e8823fb5e5d116c90fce122c548d59dbab7802c1feb1c8c7949f2285348e6a'
            'f8d6029030ebe3696193b8f1e0d245fafbbb6203ead4eeaaedfb784c40a7740cf27912d2cc1ce3d6d6bdc5203314c6d0ad43f59c3cfcfbdd6563ab5eb0aaaa54'
            '51fb478bf00beac6698aa114a0dd1d38a3964096970e9de2a41e9a2fee36d4f039e1f4113fc7258508de42f7f5cd3b81d576e713ca9335c6a24137c65ddd200e'
            '7a00b3dee66bbe534c18514ff8f7c3ab678422e327db606627767aadff2c943ede716636dc593086fa04e23d63d2541ff1f444d085490016b9c0eff36d846056'
            'c3117cdcbaa2673d6ec3cd9e57342beccb657cdf9bbd1597355c718e6e720c25ffae4e116b835faa17af241256fb0dc64b31c4808ed686447bad666db4de1d9b'
            '5412463969b29111ff53a457e887097269aa68d5e187282a4b798f957e4e344f85dcd2ed03f4d621589e62e10d33f08428e2c0cf6a0df6f833d34135eb980b49'
            '0e0ddd7faa3002b503e75fc47b28453f71d654b6e981e2f04cac6434bf603e2a8a28d4502eba69366591534c0d07fd29e2dfa61a545ecd614dc2850b6f884b40')


# vim:set sw=2 et:
