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
pkgver=153.1.0
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
)
source=(
  https://archive.mozilla.org/pub/firefox/releases/${pkgver}esr/source/firefox-${pkgver}esr.source.tar.xz{,.asc}
  $pkgname.desktop
  identity-icons-brand.svg
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

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

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

  local appdir="$pkgdir/usr/lib/$pkgname"
  touch "$appdir/is-packaged-app"

  install -Dvm644 /dev/stdin "$appdir/browser/defaults/preferences/vendor.js" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);

// Enable GNOME Shell search provider
pref("browser.gnome-search-provider.enabled", true);
END

  install -Dvm644 /dev/stdin "$appdir/distribution/distribution.ini" <<END
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
  if [[ -e $appdir/libnss3.so ]]; then
    ln -sfv ../libnssckbi.so -t "$appdir"
  fi

  # Register GNOME search provider
  install -Dvm644 /dev/stdin "$pkgdir/usr/share/gnome-shell/search-providers/$pkgname.search-provider.ini" <<END
[Shell Search Provider]
DesktopId=$pkgname.desktop
BusName=org.mozilla.${pkgname//-/_}.SearchProvider
ObjectPath=/org/mozilla/${pkgname//-/_}/SearchProvider
Version=2
END
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

sha512sums=('0e5be18878a1bb8575d4ff03b499a092663fcd1779a05b59b82a8b663a3d7047cf3d6f971faeb3d1262f83b23022a703a2033e8ea38bcbd9c85f44bdd35d86c1'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '479cdd8e23433c1a48ae532bbf555031d72de4fd2fb1c070e278bac78aaf1f44eed34c37aad40bbf3a699ed608db5e6498deb664473adff76f38b736af210345'
            '2fab9c03e40fad0b60a767ffde949664cb82b9c049a342023c6023670e2201e01d7a2bad9e2fe51b5613b1e4b61fe9f201c30d231f835db9f9777baa9649409c'
            '7e85780f9572bb369d66c1940130a6bb73d9f67eeb2861d90d7c7f6cc8aa5e3c3726ed14244fa68c9ba3d45762f9456df0c589b8c19c6bd2ff7823f8cbe4caa0'
            '6f813d26fb4566709b4e1f5b10b4c729246b2a52ed22025dade35ec4082a0a787247a1b5e27d75aa369ddd55e9b78df3cd0b38fc292337273bd6c617880dcf6c'
            'c5339655873aba1f78c5322a236a23e4d33b7a0f0178ba3279833ee0cf0f18b94d0d10223eb29efb5430e0220a8b62d25f5df73a0a6f60eaffde134498bc1a8b'
            '936467b0d3039beb640cb81b83fcb5e9af9fce2ea31cd9eeba53977e280905d0dcb2834c3a22d4e004a448b771ffafb4d0634024b96b90f2b34db020656c1b24'
            '052a7b0d6d0f3c20868babb9b09a37a3f570e7fae40ee59f6a7cb7da8019b5f62c34302b5f9ba09d99e589c644434d8b8c0cbfa75144df0741856243522b3b01'
            '64b8f67175ebd51642c8832f961df8ace3b6fd732abec6a7c565ec41ca0a9d3fe14ad5f3b490eda854119e93eab3d6a34ce4ad994b1d8897748207d7f7a4e413'
            '5e7968be0a19c21561cd035e872f6909716d904ac9c108b76c651131d4b2440d9a673a97e483d5bdb1f767277d17197d9595bf8477e55b91e9675fbd6177856e'
            'edb119b9f1cbd916720dbe8c228f1a4f4ee021658b0282b02873f05bd1fe05c7c1b72f47ef6dfda9fc0c235329490e95af12723dde96f4bc329d3e9c9281d1cb'
            'aa6b2e2d153ece5301361a4837a789e09b72d57646f1fa267819caa94c6fdc37d104b3a4c0f639ba59aac0676749f9d9244548fc9b9403d8346bd204cddf8164'
            'c899338967c64065a450c491044c3c45ffa8a3b420554579fc5ca8996d1e63301b3e431b19c30fbde93c065075c0f36d576333f7ca1a8f47d7924969df897c67'
            '68d106225b68de0f94037b746272395645ea9e885bd99e89ea8e899e21a00f86cec87d0f560478c1c217157f4cdbc6d5479ca59563e40ee56ab9359bbee93ed0'
            'c8374ecebc1750e920952cbb3ab85e74576f05264d2bd7bfbf721d7ada5e14d40320afcd25d9defcdc9d78dfc25d5b7eb6d2390321ccd403a8c73b808a516645'
            '2d49c1c12775ce22e639eda943aae7683ca1fe9b092dde5e2102ea6d7c0dcd0eff425abd9c6f98d19b8fafbcbe04a53a6ddd69bc1ca6badee4be46a9ec9b47f0'
            '6fd3b7a3ab01ab44ab5c1718f5d69d6cdefcf85e2732a3dba6f10be936570c91e23229de364a7931c60e52e2fc616016421202b998ec44354bb16c4506850861'
            '025e75286439fa1083e4be657986196717ce909936ce6d350e658ea90056b0a2ad79c8448a34cae878ed07335f0ecb5111f5df8f739ddadba4889e493ce2b2c9'
            '7295dbb63e9de3d1e6913506d5b4e4259b46905e20090aec3566813788878f538911beab9b8596801cc7599f81f3d557a78b8dfe3fbb862ba2abb0e7e0b6ffcf'
            '5110fe0fcd721cc932c6b1f801057d9d4cc7297bab490d39619252576e93eb1d0ef780b3f748addaeb88046e1afcb5cf4aaf047a22056550d5931ef938acfce9'
            '4d88408d243a1c60c49edd70c8cc1ece9bcc3c2fb8813778d257369f63685c6d4ff4a5a5d13a6f6bf57c8639efec6b3ffcd7f5f34f694615f34fabc5c008ab10'
            '9307f5bdb3bc13ce736d26fc4bb21eca817367ecccb7065be7acec0e4cf74e0a4ce7aa351e773bc69c16203c6dd25097850f77b58285a7158b76525bcbdec654'
            '93f6eec29523acd07e0ad75d42408dc705d1da9d934ae0504e72849ba36452b20693873e410b138490331de04c8731f61a8b94718577eb0dabfc8b70ea0c6947'
            'a465669aa89055ecb11ef938de17fccf833887faf3f86206274b28c2c8a343f0fb97cbe9d38bb06f03d986f33d9918ac8644a59d6c83ec5b5d66e68697cb49db'
            'e3bf01efbacbd76cc662eb3c671148cfbc9a446f0db127d710b41bf3286d75b2ad0e639a6b0bd5e668d0288137dbb0187a58a0d39e2471d9bf00c5d9637a4cea'
            '481cc24e74a9264796fed0d50c68794a5f5b3f1198aaca8df88c5d991dee7c2e3f571f4880ba83ed981bd1358b6939627502815c29c2ce46314ccc24151a993e'
            '104e184f58641852f1a1d35b4f8f4575552ce7f479fc6ee4de00c5e50bedeefb07f4399873d860a6cb5ff9174872fdeaeb7d302a48feadcef68d70630b6f54c8'
            '5266f0ba1be10e091a91cd3318e044e0c1c0fd5470865faf51954ff272c36d815a7f64e765e4d2438e46b91e71eaa59cf8b0f3f956878f24d1e7b6116c0b52ba'
            '462f22c5b71fdfd490cf8547e1605cb5f27560bf2c5be8a1b3f0bf22f5524888065a352e47cd9665b5abd2d902b3e312228c737783cd52d77110c4054c265af9'
            'd87196c3ffa7bcb3030eb7886a825862f10755138315ea49493b5642d09a55c2e9806b4e43572b9ee34c688db070ff649ce1c87e1684240229aa919173526ab3'
            '4561ccce3bc957e1a49bdcfccf8872818426ca03edf6c65fa4baf9c11efe91bee0f90cc9049dbce65545add217c082eb8f3dc0dc2c6fae012bb842a6a6790345'
            'be3e9cc8eed89caa13fd6426543497906b0561df4a676c5adb33abf57ec09f14a764bb3bf79e7d06caa7d9f1a9f3c1b674aa06d39f7bc9115f432cb0a1abb53b'
            '8751db5a2ac300ee095cfe0314335f09f8d632720884902de457c2bc0f564d191db8fd0d211cabd319b511c6149882b41abcfc96befe06ae6248419dd8c4eee1'
            'f032597e7a4bb069bc01a696d1a360628c53a4c1be61465f9861aea3cc5a76a0aa5ed60c9cab3107688db54cf1d473eeec887da5e055cfa8f305fb4efd96fb1b'
            'bbf520291cd5d373cf429c88eba4a66d908e952ac5e71c59b702224af7bcef5c21799d54e29861816205255c911e545053da08a6584bd6d656d7cbab4a2801a6'
            'b685ffb774f8d6d95e8a39bd931ed7e0e85fc9f7050153d87e555fcf9d36f70dda2060821b2645f7fa49285799c056e746dab1721d1d189ef733b0aeb1d62c0e'
            '0363ca88c97ad8049631c188d71e04f174cac3f09a9ca9354e30cc3f004d377f78aebeaba6b5169bada6c45e318482bf700bb7f27d15ff87097c08e185e562a6'
            '669297b98e3dc647e6b0c424d4eeccddb1af195d35d3a517c4de493ec2444f60579f21d78fcf98d6510836c966ea46624b8118b3e3b4247c3adc798d7f4ee2d3'
            '41931dd79e5729afed5011d6cf4b21a321899fd4b448410a9ef58a5c19b5a7d41cd3c5f5909cda0c7f5d37deec26b6eec0fca533b84dbdbcc2f6110f78f9c0b7'
            'b404fefa7867b641aa95f757fe4674485d179c05ac999f1f2ffd7eb3c517b6a9be969d015e43df7cf9565a325cf1f19256f4c830cec2864690a2087907d09336'
            'de49eafdf26aff2ba2bf8205d6e2edb08d68b82ac2eb0a1601ca4e1372181a7c31316929e54fe182f98f146a7d3e8c3c7fc76d8bdeab52a38f62c7d375d88294'
            'bf6ee55f049002e769242e4a5b59d86d0dfb3180f9696bdab1722387ef9dd672b616129e3ddefdf8aac2ae0f95136feebd3e31d1b5bdda31c0cb59612d20b1c1'
            'fdbad9d79456b738db564a0c86c3f1cd244ad469a7727c63df04ab9f83df2ef44343357cde2c8d67a25c2d682ee66b4f7e1413dca899d1453f837a3e44ae80aa'
            'e59e4b988c5e8823d4e2b93f1bc28a0d55166e4a7081e4e6796eedd5181c799495c8e20eac2bcd541d31fc99124f0e6ed1789b3936acbdd4b4424885017361ac'
            '673e1704b0c8916e8658e370f8d6d0756e847ba3ed662cbc1c9a978e7a66c57443abe387d21b31c406f3e086f6130c6db96d9ce4bf348ff8a5923a988f2ba3d5'
            'b693d8e4b71f603bec8241e9f897c24044b8e2ab2450c9581976de17f15c4887fd5087ce5170ccb2a9b4c638622c5b7fc63f238e4cc90c196ef10b5316abf105'
            'bd4287d3808327a4986014ffba5294ece81b966874e89e26c1eee04d0f397952078bada10478d34c838b4e0cdd675b0cf50ad0715326f01fa694c506b1de2520'
            '940602b64ec19706b5270a1496e7818ff9f88b60144e05313f122cbaf7bf0842587705f2f55d854cfe93a561a741e5bd3d23d1a4c0a24e84d8175903c28e0e79'
            '0660ae20593251b0732dec45f35a2f04e01fee507705f305daac330746322c04dc00ec5ecd0e155e3f6e22931c8a4f0dd8bfc2b0807b46fcd47bc4d65cd54705'
            'ef18d46f6910ff05a25dc9c10f903718343a7da0086b095abe3ad95493775c5d359fcdca12a0a1b41b586cb47b8e063e9a84bdc9a03f17fc6057f3f4f3cd2e8a'
            'a47035f8f1f643e76d8779ff38ebd89c088f3bcd0e0446096a7f5990285e62ea57ee7c786fcd9e4936a8da6619b9bf4cde6d4225cec53e2b4f6da8d1697dc3b2'
            'aa895cd44b44c21634672ea858c81e4b7eff6c5c5ccf9de4d1b109c49ff9c1f8b418271bbdaf2b190965f0f698f78a6836a98d1fb7091a87e9b9f02a71679971'
            '0fa367572337f5ab4a3db2f2d43dce14f586b36ad4e36538c157adc51a41eab51dfd62866fea6fa6c69bfdd139b8b7deda7818d8f69451e8ae32e5903f5ba9a7'
            '25fca8c608430bbae41e4d7387a5d1970d5bd099357b4a2db19954975bacb4c0f944102d8bef046c0b48a9c07d4b13dd1f53ec9b597b96f491878559023a6260'
            'f6f64f706ff5d24ba3bd482728ab17eec978a6e51c2ac9316ec525756c7179574e42047945718e79e9669a89ba1ca1c275eadd2d133036eb04b075b80c3bdfdf'
            '51ee7006902e5f493f69cab2f040a75d6e97b43f4eec84806cf9e6e788e4bca82ef43ab63ccdfd77a33107a6736296060cbd68506e9d1e4ae77204593c76f993'
            'c885070fcc183415ca813b372d776688256e529f854337e2c740af819b83a4be4b421767cb0310f81373cd6d112145924d71b5e0f19594c4ce7227cd643c2fe5'
            '1e336ce05a26a37512a6f9eb084cc8f754584525e425677b36feb1dbe8173244da5b8a6739471b7a5524d6b7286edb9b31fe0128f3d28fd7d19f454e92a1c5ef'
            '1a85f6c89b8d5ed41adf012ebd3b9f1b71c7461364e156a717b276fb90dfb1f68dc9929d8f5abd19297f0e8d68afe4e506d0a9a6f046058968666b2ba161e4cd'
            '1f063f993649ac4547051857e6ff0fc00369ed46d3c95c05ceef78c60aa44a6c5be18d0ccb4eb27e71684de409738c75acc1e63d81add724aab9b3af57965627'
            'df81895d003a7ebf8f6512237ec6815c2a8405fb4e7bcac00dc12d7215905e7ab4cfef5298a296573865b5ca4504847bc8613a4e94d25b6d5090311a8bb76a1d'
            '7e738e4fd13e8b3c494069f7e33f6833e640aaa563ddec404589cc7bec3aed563142a51a5da9832e3253ee1922a3aa06dc03993da95e0a6c7a214d4670e3863b'
            '22907d4cef919f073d4121cfdc6ef19355bf4a1c83847d36d436ebaf4fec5166b0d4a4d52d5ee42709d6589d15046ab105a38de2bf9627c065b7a9a3546be3ed'
            '8291b9d429a86f32fb95439575472c3244f1699d4434159a7b862706b6fba46fa0e62fd9fd9e7fc3f5b2a27dd293bf58836f24061d703529fd70e79c217e0eec'
            '664efe6b7616d5180724e9a2d442b6cf4bef8caa03ef76f101c3ff36f5721920521f6e89ea9f45cd76fb1fec3291b9d7ef2ad54d5f125287103d55884f578846'
            '9e2222d6d434b0bbb4771ac2cfee2597aba889e331119da7a710f603b0d85286ca71c516862ce4d6457cc15beb7f949d96e0cd79ba33ed451b8a6d260a3e41cd'
            '23fcc10b31ac01337a169732fb3aad1b064a22483299d033561c541ead5e4d98e66c30f4b807e83f9c2dc66c4b32dfdb7ef50696798772a8f53fcf2d9c9c86d3'
            '46e2f17c0ac9ca9681bc492e36e3317443c14711b2fc63724b42c78e09b2fcf9a260e055b2ce4ce7f44301cc9cc79047ce1bcff76808d59ef39561562ea7206a'
            '056e28469ff43c85efb26a9cd99432e907ff83a25028a7335e5f12ec922ebb5bf8ba119bc8911ae297874c194c3358275bc7c678084ee3be00efaa4460054153'
            '75d77d22d483dbb3404059983499ae3479ce93bec5b99e5c8d11f1013eb20fd01c7c738921bff7fef8adfd8738ec2b30d54378be15ee9a7ff0371086d494ca7a'
            '2c9b2849fcc11e8a7faa41ae420aff61c1245351136ac57f10d475dad0c09630e09ba3a937fba5cdf3874880c68f6148ec138480b133d84348f9db61afc5e61d'
            '3030cf8873fe33e3f3ebe7d0b785d9dd20327da8e06a398c2440eceaf1a464b6c23b13e710958fe984c7d00c08da67117e4033b00053df54a7bea0ea7ba83df8'
            '844f516f82ac8d2b5f42726759a551179a192521f80597f8f62dd652d4772ee11a53131ba4e21f203baee5d6ee689db2fd326c8dfd9b3c175f94646114cd11de'
            'b413e9be5a378a8b8e8a6af32bd87fbfcf09ee7bac06e97f92bb830ee3b02115a0328285010a979dd865fcf7574b80b16203ef0b3e7815ba4a5c080ed787e183'
            '68e935d09799bca56e8d6cd2b25455943f7d0d63d0a90fa18572a877df7dec21c23cca8f5530b3098e0d068c14577ad91090e849652de62352d1c8a3521ce2da'
            'd4e65fb04314c159218cdcb4e6d4b9f4844c03d964fed99c85577da22135c3c3024a2f9aea62d86ba57f096373b1cab47161d15aea1966ad47d3c3565da3f1f3'
            'd04a655aa7ace7ab0ee18339ba4a090345848b58dca8ef06b102b1f4a99afb1abecc3c43a729ad1bfd9369ddd56a7504859bd97e16aab47a0dc61ff5df5c91eb'
            'ea262fe6498b0b55c0a1dafae6d8af136f87249a08d2e357d0ff15c91ebe8c58562544eef91b4d04d35a05af51c75bd5c0adba948c90ed5c5a73007e220b1a4c'
            '43f1a6478a3264ec17e154fac6a8e93196557ee5a7819fede57e82c7817693d0597d3183f9736eadedcc723c85ff48964c75c5147baaa87db98ab5fede25e6d4'
            '8e61178de2862ab66b313a5322f025df492f3937bb2209c998bc871a3c7982ac527ca83014067fbc6d24bb47ca06ff72e392522cdb970b263e9c8a4548b40bfe'
            'beeee54474a02f63fbc628cfbb4de26d4dd2036b5cc68be5ae91946630c936d1d6fef02c0f5f56110c719168ce15ab27e31f4a1e213703da171ab7cba80257da'
            '950876184f51b76763c1c6d38f5ed9109acc497f0c6360520dcb03065de8029d2520e084cf763e1da6b67372a0faea4fcae7f53334c3deba2508183ea1810c87'
            'dae9df6eb25aaf08e32466702b1793a19f98f3fbb42df95d351dd3ece1892c0e9b93215e7456083584755e34ad44df46c9c299ccd12607f9a77ca72c4bcedf9d'
            'd009ce3878c34093b11ebd2c46fca1b327c2afddae8a3cc54a67f03a4bc1f0cc6c0c44697821670707053bc5b8f2960261b2816c327c3e63a5a9ab984db420be'
            'cf7cca4a13f48955f2696360d7effb160a778de38e85017d303949208b323fe6b45457e604feab4a2787a76cb4b9bda3c6f5ad707be333be0211bcd47a2527b9'
            '92cf0db6de101298a6d0f2214cb0954fb5aa0bf3d45a96415c931c39b16e6d9a52cfc3092da72438e99fc90763cb8bd46769e6087a276a5cc97c3aeac83cab6a'
            'bda941203114eb022f383d4c45355d92762e63d457d74b195f34ff1499ae2238f34db8071650a75c8f163e44e5716f99f98ca198a16cc2284c2f3fc720e74230'
            'd4c29eecbfe5e363498eb8b8521b1c6dd9afc3e450258d7411b01dfc7f077b70c9d9621ec0a1c727a8d349e9bdb493841eb768498c4f8f7f5776f02fbe7addb5'
            '238a78f1ae311821eed1b0284fe653c523d5fb366408c05375a4cc7a7c5037b329f892fbe2fae691821e4978eefe3ffaf8b703eadf8f6650132b5c64df109499'
            '8277548ae6e9048d0e0c38eca39fa15a90877cd0cdd6bfa8ab9c2b5d87877c3c66adbee6808e6dbbe39042375931bf61f65abbb190227a7264fbe182f25c36a8'
            '92f0bedd2cf9bb1b191404ce03ae5057cf9e7192a05b257a0f12b510c95b426654076844533c384b1101c3a2adc601afb8d5d4ed274c1a49623ae6ba029729ce'
            '5b03b0169bd10f9b019a5a021efdee49017f987412e3feabc1908ca76ead8f939bd5d8ba8f4a0555995fb339406c0a66e5cfd651be313a9ab77e404cb1f7048b'
            '490ef02b793acf03ad4a2fc6b810ea99fe1fe3afea44495a04ff1793be664f5d985526b60bd46d40187c03cf768ef9c66322b2116701e8b2c90fbc4b7a2535cb'
            '46675b7b7aec8ff0af59f99413f3f7283758cb7dd6d9e57905d3ab1df538be54ebb827d848aa24769811451d65255b6e04fea33af005d43673c8f84c5aa8c4cb'
            'bc962eeea93536c15b2843092fb23e59a9078d29a85b29416c2dfa733bef2094a951056f5da598fe1579950b4426c0ee5f70a4730b7f1f11a7ccb073c8b897aa'
            'aba93799975521781a70e7375ff8cc222b9bf93fbc3a91e934e6657c2552cbc5de1dec21b91b515d2623aaea522b56015bcc2ef763682214e510b9baeb45df76'
            'c00506c2ec51de4dbaa32a2d3d5bbcdafed5ff25a7801936af9302506364b0d719537a0ec34a340cd9f6aa16a75fa18c1c83990f837c65de44062638677cf341')


# vim:set sw=2 et:
