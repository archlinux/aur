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
pkgver=128.7.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org, Extended Support Release"
arch=(x86_64)
license=(MPL GPL LGPL)
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
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libpulse
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
  d12754638c687fb1faccb217c2a44a5b66806c37.patch
  50d41051085b8d1201443a09faeff9207f5152af.patch
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

  # Fix build with python 3.13
  patch -Np1 -i ../d12754638c687fb1faccb217c2a44a5b66806c37.patch
  patch -Np1 -i ../50d41051085b8d1201443a09faeff9207f5152af.patch

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

sha512sums=('26f9661b395b85a44b42bd72ef1ad976c614216c68f6c2dd834d0ac8b84b9c9f398b8ac550a47396995d96e6bb5fa9a50064d7f2f526bddd45aed5039ef131b8'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '816bc8d17c12e4f641cebe19195c2700e0e63ad6999d4970d61279373a90c3a88b63df3083e68c3f5fbe19ff0ac88246a6e826030e6133722798a04adc33f571'
            'd1e2925f68c7ddf67fc2c90a383d7a8dc03eee08eb547e2679b55d763ca035b9b5794861e9f761247fe7a218c5a3b66eff45f2276688c83da7d43f62af4f059c'
            'e52338351c9c04f52a1cb2b78a252e1f419c2595d173e565a4ef902bcc4bd78ecc37acf7ba6eb3062ba8d09a2ac2fa83a72593abf020492ec437d843754bb5a8'
            '2f51ea8f920a2b5e694ebb847098f9807c1392ca0cebbda156904894314fc6221f428f4dffdeaf298681192b486341baaf25f75e896be191456317168de10c41'
            '1da8dcd4b9b1dcaf1a3f324dc9057beb40e18ccdbe249f6121b629a05059e1de4c2385d773f52ebf043acf550ce1f3fd88acef5f070c25f6919a874b3e1ed0a7'
            '9595b1a87b7f59b632b29718539b8ef830df19426940f5c04b837bc0dafdb10ff2be62d90d486395b8f0dc26b2bd60aa58f8aa48de0eae25ba26e580b5476b72'
            'b645b69ec25be8339c067a9f7c24640e778be70a09f4aeff0b57d76d43bb7b3cdb085c069784465626b3527b956d905ed741cf46747dc09c2b202b118cf7f397'
            'ccfe501bf75ace33d0dc9e0b8271fa715e9b9e3c2bab6395d49a3671e6fa8e11d6530f2e04763b282991995f8110763fe8b1b9a0484437347f6cfa65f2d407db'
            'ea2dd0562293447b3a3b67d286f45a35cf0b61496a3ba4129d05018af0add11ff78c758341bbff550104a6d96766b5fae6d1d96b7a0093b9f18623e572adf64a'
            '6bd507162933c12c089254d3cc52fde6be7bf8fd07dbdaff17db9617557e52fbc9d07d6bdd982facc9989e8a58cefcb405939aa381e6b145b0b96803bf0b6ec9'
            '76bff1022714f4cd634133975b939b6f5eade0be0677272ff82a896bbe79829ac8ac2b774502a8c08984ce968a9a6ce1012478f62f733379a682309991128141'
            '20bb0d649fb3264b9614a1962a78a6fb1de956e973c0f929c72abed1224f134b61e293e1f52568e9b5d1dd9b69dace3497c89376fa47c1470ba1abf6fba5d69b'
            '647aa9b0a31f447feda5f2486825e0d2585682378f27136a5bd875f8528dd95ac5acf3ba9e15603e8443f13956d15f67336239f25a461579596ff9f8376cb46c'
            '4731c7e66f80f30f50bbb0a8d4d74a342c5159fcf207e51885f84f471cceaf334c176d70f953151f5d2de165463d3d75822d04e1cc5a0e13e7e43f74fa367a2d'
            'd999ebf32fb7ab11d6eb2e2739926769e716c37568336d50a8de9bd89c8debc7c8562ed8e5b59e3d414ce5f8f8867859e08918bf521b796003ddb9d3ba3b6666'
            '9d4429772183a9868a360cdc0df0aefbe4239eb324197939334ca858352e67d4de0e255cd096f13bbf91911ec65582697ea16962327c358f47a171921049f4ab'
            '7637cb7036b0ea5b0b0b3d47128ba4ac75a50dae788e1d55098431d21d61ab45f0a2e5f41e346d4691ee82ad933660be6a62bb056434fee13bb242771506daaa'
            '1fda03acf5f9b6c121b8fd0c80b381a0bfd1fbd055d89ecb0b4598629e022ee94f9087d6db70e69e547d7e7425c9ad3e7d1750face58b6a230000301fa3ecb9e'
            '1848b785ebc27d3440b76528ac40b39fe74ebc124d7d11deed977d4d2a03feac87b8bcbd326b32ea88ad829d218515b298110cc7427a6d3b806815b190de09de'
            '9f54dacdea129f7e6ceefbe6f68995d0b032b594f6a754dc7b7ae7df8f77c5284c404a83decafc72b74e5e3a78a7ff12d1a52bf07fd764bb451233c05b7928e2'
            '3e46e6466e5672944fdab9d5a9bd5d2a2535d2acc5f75187070831946788e8ba63db775ccbb48bc52a36b3232ce2f8b2cba57e756ecb73582463c2a3d5c2a41a'
            'f5084c71326762fa049b6d20a2a67cd1e4c7fdb133c9f30f4af20085092105b22b68f62e86f0ef177a886d802bec5ffd665154dc6e7997e459e72a581a5b35c0'
            '099b8afd7c7fb5daacb947e20e5e64c208ede29c7b72b8e020e6005b00554b32e136c282f679fe8ca7850bb1c7c6adbb8409e304938a64d539118bce163e6b8c'
            'd69461a248da1ddca21ee93865eea8a4283c37687c2c75c568555c37b898e2788cc86009941c891ec50838e9fb2333fbaf7a46f771edc78956c4a7752c3fa51a'
            'd403f78d7ec592ed5b056cf03ffdd649a428eb101f9b5b110fc841b4f22387cb30224eb2b484cce10d8e3bf0f9ec1f844a01303e709b74565ed8667ee813a9b3'
            '3b5a3a134ab1dc4f883ccbec519fe4c939a22148786543a30ad19fd99bf28e63111032ec160e90d28abeb89fa5a43db138a29878038eaee0dc55364990ac120b'
            'b22c2a96975d412629a1e79a616a505d951bbc4699681a456606352a929a64f1686203987637059d02d0d9f82c45218580bb0138ce9a4edac95850f871a1ba3e'
            '51889302b604ae367dfb23e2ad80b87d3c5e7119b7f515c0b466a9cd3104f7cb9f3fcddbc0ad00d2da46de6d248ea342808f6f426d4daf69ea7d89e6a0e7f5e3'
            '94e5cd9ad2037c17f3f23711cb51b13ba6cd6c4c1c229e42eadd60863c457225e5077b6055384f638115f83228efddb16925e39371b4105c5bbc170825670853'
            '5648462262f63f0f71aa288e9283d2fb607ebff512e9f92368dbc07cec54d29daa201b2a5c29648fdf0f7f60605306cef5a1a5d501cd3585c2a66baf68dc2972'
            '0c78f511c9a919f078c7548fd6dac2955a9fd39107ce7c9824beb51a529c40b018bb015ede00e0627ed01f57fcd0fc17e23e87d0c248cdd25284679a00f395d0'
            'f022b60feaf1875ed5ded956001c9c9b69dd1fccd452d3f8755d73d422a641539e34a97e8bd62e470a24bce075ef7e529f72125ad107def218c15a3eb2ff52ae'
            'e271e3f84bd19ce671cd676864bf521bab9655aaf5b5377ec3c53c6667ad36e15465fd17b7725883d2360d85047c183633a8582b39f51ead3824970576aac71b'
            '5ce43cceb00fa1cee1fd77dd05894593092923aee63ccb6b3cbb04b674c13f5813549db6393f33f11a38985d829d3ece0b3481ad654420f0e33fdbf11b9a969d'
            '1f3759b7618167194910692bdb4a4721e56ff9b0689d321faffa9c8ce4bbfe03c2f3dbff2e738fe098c01f05ab5e74a2086cf531a3ed9779c04d9dda2489c21e'
            '057b2b5a19ff9aa876f4399ff10bb4b170fa3c27d9015c094dddc1dbfb66ff7eb359e143c4bdee4e80caedaa29c0b913abfc1108cf0a21d38476a94383e6e0f7'
            '7a8bc523ad28074792e28ca654b22954b905f148d2ba93423d2de52cf5e78380dcecb8622cbbd5cedabb9cbaf30d46d81f8420f4a397917e20cfe99c51d740d9'
            'a313b0275def574823739c81519b6148d622ac69c249a2df41a2ba5116f42e816707798825fafa25d089c3077c4bf9bc7cfb1c2bc1220d01c13445b2eafcabf5'
            'dd46afdbaddc04f8c2cfcc9b53f477275dbcd0d89433894924b49b89bde2d07b593e3b3a37a0cd939b17ab96166d9ff322d9fe9774ef60c1149bc05855aa50b0'
            'a289a316228eeba2f536b0853c41e24c02a48acdf77c82f75be4952adac7a9b93ac47f40429c1e6c2da7b8da240dd3b43de1fe028747fdc3c2e942fe2d5d70aa'
            '9c8988e1b136ddb7ef5f86f495d10ab804eae80498e26e9a7745b485e204f1d5b8897a94142355a68b577174a4e7e2dda8c6e0a726b90ded00468ac32f05f8f5'
            '6580a50e9e22122a6b400e1b258937c7adf5c247a27cb20eebf0f5536d69fad9e15f428d2735d5f2f8dfd267e2b05136aa7e008769f032ab4f685167a5954d3b'
            'c5d4d9f5ef1ab78b2cfa0ba0438bd59a8d2db9d1c1d6d93f8b049409d868aeca78df41b21b1fc77a2064890910a5b1520c07514885daa73d889b44cac6e2e968'
            '51334f50656598a69cd873199612e2e693eb0288d3886d00f14c2edb911f271db75887499aa2cda406980180fe16d241ac1c4757362ef28616f768e40c016a80'
            'd9c57531683612ddccf934edfa76e7aafa6de5ebfba159b6293a23c55d6d1a943f13d03f405582fb88e1b1a41ee2526ef39eace8cebe0d24a204b837ce574986'
            'fb03efc01d7ed389399d94d57493dff5fce8d9e3bd5b8f71ed79c991954ae6d553d5a56e6fa9abf105f6c3413fc80c53c97b310a9846c30df789ea83f08ecbbf'
            'd3903de671f16660928c7c1a39dfeb1b78e39cf2fbfceee68b322eab47df9e4e9ddb4d1a86f35588c375f5e34a82c2c2621da3d5ad7d5eafd09784e6bc09e0af'
            '6b5d7e05eb402bbc619e8dd0a963c3669ed1cb771d8f5eb89932e9d32c811b00f931b44f2dbdca9555ac287add8e30da1d5d44babadb1e2f752e7c1d75a4c9c5'
            '87c9d8f3e0839bcd0ab58abe329a65718be7fd07a38c1bcd3a9b4f0775431f14efef9d95e5165bd09718cc3591c29149426016ff6d1e5a45624d283dbabb40ac'
            '0cba7c09a86a146255c2e749d47fa37f23b7f20e01d74e7433aa5f29deafba0cac5bff3ab217a90648bfb52036b716babc7a1fed794357b4f8ee96dbf2d083a1'
            '4a4671ef535faeba0dfba5afa1eef39d1803510ace737665f271f51cf7e6fdf3a1f7642f93f77dd5797c023bfa1392662de1495596f72d6a7b533285b4ffff2f'
            '4a75a3d263214d11d00e39700ef311378b10950256b34590fb4c00391e378610a71bbd49f41320633c4656d607aac984e242c96d2dd8ca22f3925b5b3f4eeb60'
            '8d5c5de551f79396886e33b1199fdc6bac5b0969b3c9a1f84b8239b9b62e954fdde34b6e069d118fad5ca1cfe1568bc36441ec24ab6739991c898372a65f88ac'
            'a330c2858a8b2087fc166d7d08a89dd246778ae23700a1a2ee241f1d9835b60f1588f052a05bcf15fc2cdf1ce89f11dc43f595b61468a819bfcfa4069df644b1'
            'd84ba6dd112bba69534ae93819b12ef63e59f31ff8ff2a731627da81ac10d9eb62835ab583bdcaa0764191b07d66c8fe42a7fd5886b3bc9e83d514d431d00a75'
            '34908a6925293e0b488af13b3155a5cdd50492e8bd89e67f911fc7bae9c401234732860b331861ecfaf161e30a4aa3ddec7f62dd87fc6d20694e089ba6f5c23c'
            '53d4e90429a8d318bbb2c720fff0e1d49a426521ebdba3dad2a1e4f9f6f2b917293595a4e9b912b96cc3b06d07a650b74cb78c4193bc20e7c121ac38ae640a0a'
            '0ef3b15d5101155b904513ebd64a8941be2ea282462252db8ac73e957fba005779cea4ebc047a20c22000b5b304c5ed06f2671363b99fcb877b41189572aca8f'
            '09ac3c0db7802207d8a22b93581a170c361e2b706410c205e7f479924426ec704328f9daa82417d9ecaf4a4a08217b045122bf6490d97e6ba1dc9e4cd9f80b53'
            'a5706941340de16a7d691e92255d2a01faa8d2bdf089647450dbe16e8405cb0787e1b15d5f2daf58212f9a23389a9693d997187f234e66bea4c97fec01f3b934'
            '1f05ffa418eace17236c0eb16e60e85017d913cb89b247125692bb230b98df5d0aa0c91da2023ac3f65cb2d07a8ccc079c7906115505cdffaa26755c28bcfcd4'
            '65e6c6ad4d72646a3ace4593ac9760019ee5da05a5a11f1591fab321413be64d67ffbd4f40724a16499a9178a109864a407818db2b8bf25489fa114580b61868'
            '351264d6e2359e8e219f0d6897cf4c3ba0626d41aaf44ce6570e820815fd77fd42e31859cacb1d87781b6298f3f421c2e00f76f8e954a46db1147ef8c855bae2'
            'b429cc0199bf8e74378cfec1f2b778b4afc2020bbd69ddd159028cf3ef2441a73f800ef60fdd55b537f766f6cf5c026b8b30c5925795424cf1f704eb7634740c'
            '93a1d4f60d388f50e5a10c60d41539a8ca3064a28a06380b50544e9b09877d711288b7ae4fe84d9ca5119d699b4c628fec7bfc16b30466d23678258c46a5f3bd'
            '44f22affc656e750f8e5788ddf0fa544f6736d46460fe89ca189207d0c1e92b71e3bbf6136a4f8e4022b22f0dad5e003569543b72218c6a7e8f28dba9b8a60a6'
            '62b8b7dd394635a376ea893b6443f6d809b54efbafb6cd34f60ec14fd665f7b5595bc3b793aa24d682e4d50850ee5ca8ce34f744070cd7d451bb7c6198a29ddb'
            '15a3b568548bdb6e7a9c0077d25a26e26bc452c4da2f0b83e0f3b362d5680156f729324e51561dba8e088a5f32d9b7851e49b8226c8c91c20c6119e4c36dd8ba'
            '3a5ca8ed7a390f8fa1ff1428e464ad0117412ac545f83654fbe5db676560907f960464d5172755449ed3dfd18a18fed41dfef72b49bb503bb5391f040f449d79'
            'dfbdbb24b235e6f83b95e57d363b35ef06922000aba4c8f9f92fbca00328dc4bb07d9519e230fefae658ecd890a60d9959834988309c36486dee90a4c4144fb1'
            '89b6d950044423ce10b76d21c56955eb10139fc03e7f0c8d9b7e5b5ceb5ae563b6a11e9a95d839ceb87c0f294ca8bdc97b3a24a6ca863b7fba5e1265bb412fc5'
            '00c077a2053e9402eb94102c1d51d19a3b5201875932ecaf1c97705f8656b3adb25476d6b60980e06552005165110315c5a99399d42247aa86366cdb049c10b4'
            '282fb1cb78614289f922992a92895d2f87239062d26ccd4fde8857abb26736339f45306506e22547a8a10ac3197e9f8138444c77ea82ecf9db3a42053df60df1'
            'd96966539ac61aaf47f6d0bf7b6f39682dc0c4cbda3320799fa67d17fe933625eef7c6ef2cb2bc3c53e2fe6a358a20928019a638473dc59be56b8886682a6be0'
            '9857306f575d00f560740083a045b3db7a36be8f694b4c40e66fafedffedd2d091b24c3e93953d88568f75f701427b427431cdd573aacf4fe83cbe967410a4b0'
            'b20b2e7c444045f3e3faf21384d96273e32fcb4f3bd6b2082ba91fa4ea611db25311d887af29cd7cf957dd73c096c6c33c5a2bf74f6b52bafd914b5c161e73b1'
            '12e616de8eca4205b74f31d249f754f72a07d3cd402c13e500239879f1230eb475216b070f0d76864c426279b085c86b20531212550b6985926a042659485e60'
            '9038136cde24e027f20146cdd1ca6a447b244b47477bb2e3f86e21d9250126f8c66809b267c662902d6cc0f27000b61f01d46f2f14948e8072bd8f1bd69a8b6a'
            '390b59b7454d6b47eb484dfe94d8d891c17e482c88d21db60ad77e74ab229b9a6c0feb7a1d757ae6aefa52973521578d5f6a11d354301851ba57a0958ccad7d1'
            'd5c1870dec6beead2fac388dff8435df3d82cf971d41e980d05e6d3ac114e5a33a944b38369a8596c3ec79f92e1b880d8cb294c046183c3fc111c308a89c1933'
            '2776585628cb1dabf862af5bd7c3bdf73af17cd02dc9b6196c25c3bc00faf6ce46712921aca5af128a6452398c651e87579608bd837f7e7b9d058d2bc5eefe68'
            '2a6372a4dbbc8d016095bab8dc10134355924df1b4359ce3369687829340448e749664cef778564bbf9983ba4f7203202c073c88fa4aeb77443efc7acdd9e1af'
            'e029bd46301ca976d05bae682582a08e27a7011ef56332ec8a0c3837ff38ca85c28ebcd56399cd2e277e963eb5a1a5a6a0b82c2e0599a741a1635a0ef3ce41e7'
            '8e0ea23425f43d0bf59205343843f5897d5bbfb4932cde90b7672c5dd7c569b0d1edf2af3d896815739e8d02e5c8915c30fc52db0687f0edf71047ba92fd80b6'
            '51bb6328afc91a3ee4df5438e99ffa869058c21af724267087b0681eb305e8f35bcdb923cc5d9bc3032abba6a98f9380e71f9a723a1076a8b8f855f124770aeb'
            'c3e307a704ef9466aa22dfafb39769fd013487c24b489b29ba5fc4316c130e3194527bfe1ed79813e4943a8be7942059895b9ce07c8f26e5ab47f8c9aa79910c'
            '5a78c2f212e33ab8879e16291ef6c4ed4a2024d6984c04ae46f35777f0c7760ce5f12079f783fb16d3619d43874b4bb7fe84d2cc0df46ab557a9a4cc7f0d7a9d'
            '129798e28f5927afa37fbac3a2c7fb1ecf819baeb3f0bc769629c9f330c247b99d8224cfe52111d40177f909f8c924c3e72b476484cbaa07c0675c91968066ce'
            '859c7f00780631db0bbea50fbc1957ae8047f8e65b4dcea35b0c29a33d96a6163aebf1edbc0f589d68e33afbe60601feedb28d746b2590c555ce636634d120fb'
            '8360ee4ec520d0fef0d19701517a446ed3bfda48c5e76615677f3ef3e21ff176d4384f6afc727c73e5958781b575d04cd6f2e919910df784c4e5a5c97b6431c4'
            '33ae70d2f59b14022fd640abd3cc5d66f0584332eebf9cec783026b646d12d597c9e5940e65cd7a062a4c2bf754aa91846bbf56130669d190e729526c90fdaeb'
            'b60f5e0bd0f14fd050c1f0382f8609184083647cb81f28d5691dfbde941153a0df2bf8f6dc75ae26fa1e7ac342c0faa8ec441210be112cc4a513b7b19b89eb5f'
            'f68bfd0fbddc0dbb12ddf9d29cd4b5baf8d795040d5059516740e3df09b7e791ff51882d21f8ef8d746cd12bf52c2b34a830a647a0b1f231a00fe5b63772e4d3'
            'df42eed1bfe2821aaeabe02324454ff76641c674c48d3f14f681ed8c36eff4967b13002e41bfa8aeb34fbe7e57ee2e3e9a8027b2d3d009fb6e5b751f535fcb4b'
            '99cae768c73f615683b41e581cafab1a5164c366f7a7d8020103878eae014fa214cb2f85705b15c1656031314031f45f36b273326ea7291abe8866c0aae9b243'
            '2e3910f114fc2e3d7d7f8fb8a0ffafe7f2528a5b8ee9689ca8c9fe5eb93d401a9b35bf06eac8f89a47fa45eb3108fbf769309108dbc46f394a2b2c65be5eae43'
            '9ebeae24f93cc2bcb49b8c482ff474ebe3357286d2fd35864e4a1e156d1cea5933fc776e18b75fc686ec84f91e355e49a8ad9e5f9bf044b8ca3a7d0bbe2bc0cc'
            'd6b2df29a1bc98e49a96953c315f3aeb4fbea66fc9691d37085d0946c3710f6f0174927fe7103009343cc038f4eedbadacd592a4eda24b1d3f7f395474853c7c')


# vim:set sw=2 et:
