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
pkgver=153.4.0
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
  # Make different channels installable in parallel
  0001-Install-under-remoting-name.patch
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

sha512sums=('79e1f2a0f8c4d156c80b8f4c580aa944600d49cc811f961a3eca251113241638991fda94ccb74a44df9030f643586c41686861333288f13793e621a262a1b131'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '2b06a2398e862fa4e61ee5e41971930a9c50a90fad4ee99231fa9f8d94d07e3f31a044d2a306a73e28367f654ad5568bf4a64ea42898a5001969022e3bc8e992'
            '9ffdf13dda72f6c6224e5d755cc7e15fb31a317c0514d4eb5c2f51381dd26398d86d07d5c0018a1b91c2b95e8de8b60bd4a070da3efa81985fd03314987cff01'
            '821c698c72791cc31ca990c61fbf054c76095fc2691b8a7ca566b8d5ef78bef992b96d362afe64793a2d3b0f54060a7fe7d2c7a2569b0e3e3fc4a9a0e0d62579'
            '1c68476a55d5ecb9530126eaa2e6c79e5ca445c6fb926f007dfffb5b9beefaaf1ab3c76f7ad5584fb5c93003cd1e55bbc01adf7404ee00d41c09922b1f8ede67'
            'b7c5b53b7b8b7cbf885ae19cdf4baed058f5b9f30240f221cf612943a1cfb5616b000da96b309f694146844a6175dedb4435ee967408a9db59ee887f9b949df8'
            '8176c953d5844dfe6a30e346063d08f619c3845e946e021f7dd531c1ef01106cbb705ce4759c31108c8715c581fdc1e6ab030ac5253fdba872bcfcfa4c4d26f1'
            'fab2528acec442bb661a912f345d1d63f9a3ce8082be1dd79585bc2af86f82280c2dbd8911a4fdf9403cf1c8845250cc2f93098c2f4556342d1660c582bea68d'
            'c9c55a7e3dbfb95f216b14546c77d00c5ce842972eebff70ed9814fac5a318bada91b51b56abff9aadcb392b3eba33c1732743346d49bb32fdb9d1ebf8bcbb7c'
            '193b90908a18664445177f9fd39881418597eab0eb7cd8506b910c99815e52d0f54f7203bcdb5172f1007f45d79021a9ef7ad30114dd8fcb7e5d9442e076fb58'
            '294edb12c6a15d59cabd8a1393ea464fc72a3bceedc3865e05a532dfa7f6ff8877380a8e32eacadc2d9966063f3e13dc01c1f743710455aa0eb6572f5f15f5ae'
            '782f0291dded154b0393f4bd193374a0bd264a59311dc87a9c82fb833bf24dcd40072dcce9728c1c841f037279486594ff8e92fb9a3411634cc86844bdf4d06d'
            '64d6bd7bb5801e126e4b5d87b50ce2cfb965175d360b8f8df7abce1e84fd6aef389458108707bbed310836918bd8300f561eed6625208882775f36edcd1b00d7'
            '2e995d04e4607968692dd6b3bcf4be8c0869f420ca0612129c38921a2843285237bec79b697dcacb0da439e52d34d6c41ed20144f833e1a98cad96f9f08df7a6'
            'b58d3e960a0fe46244e90021e8165a4e43233b009518ddd34c09ba39126b134fed69d169787d3da07391573b9444f93c5c7120f4094b0140c3986971d24c0f90'
            '4144d0c881dc9b699b7413deabf329ee7766ff2feefabd90b3e5ab33bff2e9b3458d8ff1e668749898663dc736a1cc7d3410a6adca404c0f3f771b195680d15c'
            'f77af9f05cd5857ffcb7a7705d9d7fa5410529242815c9afc211da740affc01a5dbcc354dde8dfeafe8c1e81b7f2699ee0ac2f152150f85145c06fd7bb0f7d39'
            '2fac35ce37854defdc8d00af209f57878b75dd7ae403b6e42a444dc3d64425efbafbdff76374ea77c62d459eab1185f0679e1ddc4eed9a4f57a88cfddb96c06d'
            'd26672be58b3c1277351ac7789bd4d8ecb0807b5e43885c88741e93340b8aa6bf5fe4c9c6c35e5292bfc8f830f35690067e7ac10c5561205e459c34d26d66844'
            '77b1d6a653362e99caec95170e4fb915d3770932edc9f4c5f5a73e459e2d27f4b4849f42a8b8f3665413bd40e9eef88cb33e6113b9fe2bd474e4d35f4154c255'
            '1642c42301e0cab904c5724166958ed9e489f74a4392e13a3578589c871290f01fb777f8e15d9f686769998f322a31f5d8a63471315cfd8b98d86e11da3ba331'
            '572edbedf83e4b632dd8dfd6e948109cc7c9cf64a5e63e65b5975acb15b84e4f40032ed243ed8c11cada2812932bca6a2b490fc2a77bd887cff2c6e0dcfd5d70'
            '86666a98d20a6f3dfa3a6a94bb73021f9fef5b4e3d3d8c475b90289d3919e53956144b8df74f7d706dd4cbc686387614ed9a3abfdc2a6363bcf564fa0f7c1bc1'
            '3f2b53f29e673a71f6b3026dfe2119315c3f317bb459ad6c700c95cd258889ea429ed68176dde2e88d3eec9aafbcdee4da0a79c0e8eda732969ddb86c1ad992c'
            'ef492a51e6ab722511b565015c4708d988fcc166b6939c182f52e6b7e124af6ee7d259eaf34aecd1b212d5aa8a53da392cf9ecf907276712c7f8111d2bdcd1c9'
            'c8ebf27c17c7e5372b4eb76b3b44b288cf3ad0c18c8eb216e0e64e183bd014694ef15ec709acc6abc429445466f40f681352477f26938666e47928844bd403d4'
            '46a3de4b2df4c369463a16b36518eed44c042a0864fd112ffd837ab3fe0966170f4bb078b42416a49c25642e177b09818a710f66e01d9b7765bb1449eb1245b5'
            '55c994195dc43c05e08c727119a2b00939ca20f2dfd3dba1eeee4e173306219cbcb359979d0136bfb463e5289bdaec36f6a4fada39281acd5a58d06815233249'
            'f3c9c85d757e74047f04422498833f2ac1fbb4b867dd37d19e48402e8c8678b6f131950509ff6dc735dd950550a056fbf704d491a1643f150afa66e538545df7'
            '080ebe585bb1b23d24d0ccac8d6200fcc9653d917cf66fedd2a8a2e02ed47066799da99cc8c3d7bbd6ac343cb54e91ff427edd6b61832190e21faf7753e262fd'
            '8b05bfa9459528e60c6dfddfc305dd3e2eb0636538693aa1ee21a007bad9dc47bad10cc245950e049d9d6104b49f5f4be413340007d7c88d8f64c2b13730934c'
            '630bc17d39e1003e7137e30c859c7931643eb41c7f11c69cdc4147b559a8d2b7d8b18c498a3ff37a729a18abc64fa9d9f0d3fc3931bd8a29b7ab8e631350b1c4'
            '70b309044597c9e3ecaac9368f5f95a616548c00ddc622a1bfd45af91275ef8b7d77be7b16a0d986390ebc8551e424a6a2094296321bed678491322d8c8a23bd'
            'd5bd2d0bdfff5ab4314acd2a7d30b978740b11c7c065753036199f57a42c985afbe58d194f3dcd1313a2c1c52aee86ce47f2c819454efbab273a8e01304b8305'
            '8a2039bebe8583abe6aa639c0e20c218ee7bbcd31ff5076150ffab2ac4a86712b9ccf5d7f3c994d37d423b95fde4aaca677a5d656af298c20ff3fb26074bb69b'
            'ef075954d6ef7dbb1b0494b1166606cb3c4a17a8cc383eaf48c4ef8c03650e046d2e957388a29b3258d217b055fe5b3c2a234b48d2dda3f37aa87aebacfc40e2'
            '9a16094304d01f0c98fd99b146ebb78591c241b1165add7789637cf2f198890e5bb19c8a789f93a6d141e103d3f64557653ad3650b47bf12da7182376b4a54df'
            '95c089359be60da04a38c3ed67602ac4855ca77b71a9f9ed332491cdc232ee27b4f56a8d53116250b00e87d132553511ddb5de240424ec3678062b6b3e77b0e8'
            'd890f6e643202d5e899e5f3ccfdd6cf27238bc922faccb8b81742828ae1235ce951669c3ddfcdbacc93bcf452a27ffaf5606416a88bbd7420cb361fe2d996bc7'
            '5f102c2bc2e99ab91cab64dc44fd168e09554d39eb64bb38f2bf4f554e37b380082cfe54f02165fad4b817c6aff52d16335c1f5193773d2dfd90303a3e7347a6'
            'ef3d6e3b5e914081f1bbfe92b4a43abde3bd8cdca5806f2b422914c040456be3232fef9fe35047e6f43af3a69f360a15d31b1942ff0cf24fb10f944e13b6d801'
            '3ed5d47ef02004f38de480e69cdcaf06a52b11a2f9d1d965586e4628fa9ac14d99413d204e90889e884a824831457a66b7a43afb4c4833ce7b7210e452377000'
            '2b897a4532d12d38893b02402dbd18d476693bc79bd84db6debabf985a948093f86768754cf54089e869cf293cbe12c1f55750aed53479628997c602ca1d22af'
            '10896d0dea604a11ffb13ccd04f01505c99c9b04af9de7a1101abf07c74abaddd65da69372e7d246ca0fe7a82a2e9aadf0ce268fd0367712c6512e6f19c31bc9'
            '672320714c7174fe9dfb93a6ba80af7b6989aef5dd4cf3e85d9a722407545f17aea1479618ad52e53d59f773df3e5653a234b3f926b184be0eddae9a64a32616'
            '2e24615090951ba599eea40f7734419ad6b533b3f52cf978747ca8e8652156b3ede5b7b6ebc6a057959bb574eec2a466ca45298ce3d37074d839d60bf3a5d6c7'
            '98e94715b5be3007ebf92d756320219aae5a54af921cf66310e7fb898710d3b54582aebdefe7be65ee8b2eeef87e364e98cffddb8c05b5cd48c4daface24012f'
            '52c793509047a4633ccb31a10fedaf2680f26108a440bbcb5da5bd4685e597133ccb1c84cf022c0e3eaec2f302848c2141b7c085b09886277565b39d622e80dd'
            'bfd2d574470aba7e12809c0a6759c8502915ab6cc0d098f686f07033720c8617a8bb68dda950a015903ad5433c8eb5edf3ef440e3bb57393801b75d8e253ee72'
            'b8a2cd3b3798941cc884ad6831c262e55648d2283a37fb7564b2462a7cba9d89c48a788f53bc52dae4de1d780630598e43e97c27d1894beffb5f7f3f00d80b74'
            '112c779879c59c359399d17505b2bcdceb83515af41f8f03fe51fc4b24d699af4399834027b27f93470c83a95238a7053758bb83edb78bd58c436f98a51ba4cb'
            '4a2603a9746db3efa67cc819263aca64341575b79521d548df410f20aedee7c19d61f5aadda97c367351649e29b3ca959b3224f81520de3ba06dee944a8d915b'
            'ba60b03a8f2a18ad642d280a1c80cd001e10a9b1f6ac423f6dafa18daeb341114775f415c8a5e97982af092806d307429ca87efc1a3414b436de9cc7298d1579'
            'd9b80a230ad483109c6c2181360771201269b29666efe23acb4bcace672237b99d5b2de52ea6f6c70b876cec5819d01aacbec7f3b8825e7d26b05d94941e161e'
            'b6b735a41013b5d3912329f6757057171c686b906f6e252ce7a227da4965a5013baefab8cce36e959689d8223212f3200e16c88987939468c3d863a6703161c9'
            '0b0af5d7ba6b46689c1295ed0d5020a3b91de43d0de69afe38a759e870e2ef24f06a954deaae4d25d16d7e7122aa1b1c8f88fa50e40fe1852aa21df8be945255'
            '79d6a2b806cd2bdfccaddb679fbcdf31f628a36130d812793f73e357e1782b69bd76abeecd36efd6611919c7f6c566120da5231b78dbe5076a337e69003b2603'
            '238dd5788e8b841392f128a20ef293f272cdc3a38a6417ee2137821c313cd38ca0b05e41414d45bab7adf2ece30909ca7d7ef862efca1c56d6b34fe28a34a4b0'
            '4e3bb15e902f3215c7df2f2dd1d4a7687b99fafa426ccaceafddf70b0da36bff18a51f12229bdf44c4f88fcd35f3e1077b6b1fdcf9a634baa6df32529937f711'
            '69b74fa8de3ec50a7ff4fdd5104d212bebe5d254eccbd12308352fce84cdf1a318a856efebacf8aff22e7d6f786c72f10f6efabe6559ed226c3ddab6d009d005'
            '639aba42ca9bda0fd6b1224613f6441fce3e3cd3438d6e5613182217104824f2978e3c312789ac57828a5b45c6c59409f0648b8fa4e5cb58acf8e84056905d1b'
            'a78d5901cf3a61ed6306e074eb8d6fdbbd6aafae832da516e8fa6e6415e76132ecdca268c2420c7eb2c11f2a2a2adb935a677c34c5d87e2753d32ae31874b898'
            '27025f7e109f20e086fc34764c2d93ce23d6eeefaa6a2cd431b359a678a91795b68e19f41b4a8cb30775b3444ebd339232fc48f8a3959fc797f9f298c6260395'
            'b558703a4eb6a4d9ff92b9d76bd3296aea395b01a48686ef140a1c1a07a0930f362579559a44b94ea61065b073e3eb98ee850c01d898623b915bda5a68169f26'
            'aa2f6789e8a38ac9b57c6e1d1e1492c14f27bb05890f096032669b6ef0f86ed0716eb8228d0a594009e9ee332835fd56022fd3e89a057a717b4df51872e1207e'
            'd4d95590abc9b12b31ea7badb098b58edce6404f5f963bf138cdd68a6d26688232b950a5d7f2e7213c6e81d7da7d44e4b0b7f8fadb4647e4471780a4405e99b9'
            'ad61abfb05be5d56ea464acac18f52697f34e2dc6dc6ff615c13eddcc875e2fa6332c4c599a51e1f553a43d8a679b0a905f86e2a8389419ec47ff9d035781079'
            '30af83a50c22bda0c851470fb65c74db81e52f928f1051d2506c572b62c8689b572078604e9b5246ee910f3daee21bb1ce6ed67431e223396b843aa0503b3e86'
            'b7c2404fcbe6ae70ab97b75ce6568297cb4502e6f3a59f7f9b163587e9cab2ae38ae4970efb6b765850f3563419f286ae09bfc48272db7b3d05b0a3c6dda5482'
            '090cc668a9a1b4b227c7af67bea36a4aabc9ca247f0451559db2e086e083e94276682f5e68240dc356bb109177c6741c1f72946eabc397c08e5438397b0466e3'
            '358fee0d60c1fcd584f97bdb36cf144ab7a337973bc7f8277ecb8132f7630106de3c76fc24eac36f6fbde163774aa90ef169ad56132b2c626dbe63a7170b7377'
            '4de34cbe3182055166eb692a274155aaa17d6e32504055d83a6db9c05d1a5df01b314998f8fb9b7f17d06f30f9c567e8a7f0439b1e4a8a39b44333df9df311cf'
            'fcb5a3b94fb731ed91b3778257c65d1fcad45260b4a59f06d5890842d05c645dceaee90f8d3b18aeaebbfcb82c632a2f55bfa5b6e9d84b8702a3233dc02ab2b7'
            '1e45d55e0e3676e60c7c1a56b99597c8c3d2e2f3d05a1aa31c90c2db9d2616d85c9bab1ce20d674a6482d902e1bceb96e3449e4dce8935e426b1b0f065ee4983'
            '3e929b0ba75147a948bda080803ef9e27f8b1e871343e778158e6a43889dca17d1dbd5473e42adcf950e93cbf06578cc096d00818a04eb26e0420d694da3da82'
            'b1e62e3bfeb3483319529893e6f7434efbfc019b86bcdbcb345a9e152c6277defe0ff0e7561d9cfc7a0412d5420668f0af31d57338599d1bb7a08e5af8dc37f4'
            '3a78c9bb671e57142e85de267e262482bbd96320ce5290753df65a22eced4be6ed703cb13fce996aa298382f8a57725b595fc519edc6ed8b6ca222087ceeeec7'
            '5ff12239cb5f7b73f1fe174e1793a6ff70ce1bf0409896d5ff9a768fe6fdd62fb2347b34b7fa89e446e07eb15ef340f05f344ff2fba1886e48ae721c541637f5'
            '507c1b9a97901f7a98068bc28686535cefc0bdce7a0570a30f416e86dfe78907d10de87e8a47f25526c3d76620db0984c583e5a6ba4489289ce9585c2f707674'
            'e9e9fd053fa095c6033316c5833f859e4af69f38263adf2c089c00df4ff99c4fffae9a0ea28cd05f76ce3e85c1392df76f8c8c8d2c50d6fc939a52193e0c6334'
            'afee279508c82f357b2932f9ee8d559ad5561a5308fc332e719104096c51ac9a51625aee0c664c8244a41f3daf659634f51051f4005274e0882ec5eafa52bf34'
            '9bbfbcec94becc90a9a59ce694a85eb84cd89c7094283ca7584c65e680f9955e0ee61b3a18d5df5199197f454b7a66182c168f1129ed6ad14deb369d80a39d9a'
            '25043c8d5d78dc39c53ca5692ffd568e4f93214900b65be18f632a7416a092ec7c75bfc3aa70bad3abaa663c64daec69ebcefb42b8a1f712d7238388b4219e86'
            '27a39743927af37e370d65a38a794bac177fdfae3b67fb241857a2d0dc017ffa31c98573226058b31fd335f0d45c05a1c20eacfce1d30b7b461ce26c420468f4'
            '26f94e1d12f25105ec34d613f6058337fbb9dd4f69adf8453c06c077e62a5a7c678a9f2e43d80bb009dd10e54932fd30cf89b5fe5c29620ae9802ee94b276f6f'
            'a54c55d89a445cd7bc0d18c65bb02c7931ce6780ee3c1b37e1878b49e40d55768f7df76307a531fb6d219bcf69fea262311b2fc95475007e2acc561de175271e'
            '353c6731a60d07cb84246fcb07de5eb02955030a1182e9a1ab405249307647acb53712cd279983097a542558f177a68e893f3204a438979ffb3975897d9d05ca'
            'da4c9bcf85c2bdb8bcb7b358a0530054566731330d03a11a2814e82690b4a0df0b20c2e88e9d37598f058d78cec0b4d13cce24d88ca01b48cea035f196a802aa'
            'b6b1754fab38c83a584cfcb75958ef5f5771c1d08bcb2a8a5d55caac9d5cf436dfc9145b5d64d8f360279b444de2b6927d4d1e77d17a4f5beca08504b0ca3db3'
            'bc84cfda5ba127dcdcb96d52d6f8abfa39ed8e2c3df053104aa8fda5bef7d2d6c6c97ef7935160e49d3fbee26a2304efa78ee55b7aa22363743d2fdd03a0e061'
            'a95faf1185a18dce4db071f3d43b4df8994b3aece19df2b6bf3fbc22621a36430e2ead026508673b0aacdfac72585043e82e2faaff14a615abd804e0085a19fb'
            '1392fd3a8a7a61d21e98a22ed573719cf2901d215821a65fa589551afe6ecb8a6a6ec944e315ca784e055bc2cdc61ed029f4139f8803d8a616ca2e3d27334883'
            '10a382371e6c0daa3b3e4e9c9dd2a8af8596aec2f31eff7878f2461c89ec8012f4fc0c42be60b262fae37c2419ce80e3aa553af94015ec074aab86d1de34dde0'
            'e2578c260713eb24129de2d50836ca0584dbdc73964c4c81910c7af8bfe1c1f3440ea51d10198d10dc9d3d926c06a48a20f853bb7dee6783cf5d153e2faff86e'
            'b6d69a68f1bb01415a833e516baffa05c482d6ac7a34478ba69186437a366acf935e5a739805ebb47706381da05199701aeb964630cf736317faf961ca8f1f7d'
            '4d0ef9571216b8e124d7d49170e182f7a6d3ccdf627cece5c034d146a736496c19ddd6e8f2d30f33157c153eba00a424a1a9511851ef95d22bb1eff39b84c322'
            '84653cf44373fff301351f1df8b206086af6dfa9b15ce6d3b77980664833235e84405462fa499167c5c7ed5580aee1dd77d1298373ee7ae288831463721980a2'
            'a81d0c0659f7147b2dd099f9715e9c38d66486043a5de9d8a856d376a5a5769bbf4fa619c557c79efbd9b4556e7dcffff8832c0ec4b4123a112d6725323949b7')


# vim:set sw=2 et:
