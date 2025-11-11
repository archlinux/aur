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
pkgver=140.5.0
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

sha512sums=('412236a25cbea171bd5bd535e45c3ba40957a94e1f8dd3ab74241e0aa1c4075fcb8d394b9619599d60ce3e4563e712c825fa8bec441794f229356802f72b2861'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '1f9d61ea9f068f63c71b0b63ac8c89c5a00da954d25098ba4c9305b21b910aa7784fbe42b326e58b5bdc2844ddcaba2ecd076c1e487f8a79aa8008e197f93d34'
            '442132e62aa63ec3616df5747e378a729cbc4b67b21ec075dafb8f980b051958fa70e59d1dc8248eac30c6447ac80015e13002eb583318790a2cd9f0c19835a2'
            '28866be47bdb4792c7749db1c5fc7a689cf0e1064d85934915542b68bee9a61efd7465fe094d7f3b7f81736e60504c36d5109d868e931a2cf1595cfa6fa24ce9'
            '55d756a869ef8431c1bac713acc8ddb64f9b31da9b942a8431b272a4d596d47ed5054b8ea899abe3508935391fcbbf8fca6efd7a98276f39b48ff65ca852f708'
            'cda270c4a2a82fb5e99a022657c8d1ee8007733ba1c88404af5db6201363771168d4a65bbcf24cd0cb2a78205d96259351f7a5f795d0504f976e840a67fc2fcf'
            '5a7993573b9854c7ba93ea4419b0478fba0134105ecd63ea4a8bef6d9d16264d1242790e37d56c1739188c2fd5273b58af927ec77e777c78fc816d8f350d9b21'
            '3d37b65432e366443f6c359c80d89b82e00bd7f56d4124521fd321bd2e9487c9abe6645eb55a316478579dd7230a1a3732d5d215b8d149447ed0f93d75bb7c7c'
            '0ce515f081753e8bff2743b6dcba8be28814f5c4baa14b68cb72267c90a4634eb3a9d466a62ea63ffc805d0282580ccae9531faa6478de63e46ae973ea4ee655'
            '1cc9f18fe3aaa87d04cb6238d319059a4567e762519bab666c5e1eecfb15dd1279bda7e390dce30b5fa2288528d2bf57bfa1b6c2673e680d6705835bab538680'
            '1ad95241af3d3b78b8d8506f366b160e9261fa4f54cb6f4d9ac8835872e51291c1e93bab88672145d9df28f8127e4cfaa7d2fd6d80e86799794a1fef064d9a29'
            '43f9bf7005221658dc42ac95c3793ba33ec4193504efcea67d9d38bd831befe860331d5a64125cd9ed9e3f8441813d93a529288e2f33c3a06de3a0fefbb72474'
            'fb7eaf24360a9573d09dd2e3d0ad40c4155a78400cc763a2b07fbeee997fed4a2cc2866219e69e63d21ea0828d50cb8d97dee21536adc49780a16d03e46fc418'
            'ed65c7b3496e42593f4852099908e6c95757257a6634f597b2e1c7abd871197a7c25f2d625d1c285f7e748c0e559a34b2746b7af1dee22f0e0ee18ca7cecb649'
            'd2ac893f65ca0b5b9585c6736c1110ca70f0f24ef93be36018af541a62e70121d94681d3a5d4cd772c4b3e38d8c31d496ebcaed671887aed79946d86d77d7b46'
            '00a8a8a11dcc43b18f03a8d634d9f927ce04a2b64441bfbadad579a392420c464acef919bc2ec5208f4521ae6bdd4a7e8d378e819790395b8ab22f1e9246a8a4'
            '4133c89f761fe3cf63563d299c6fe4db151247c0cdf085e3a7697c8ea38b50eed4229330c78846baa3950d3b618afcbc35d869b20f8ab81039c07f31857aba00'
            'e8fda1ffebd542152039980a81d0f83e21d36208b209d55e5178457bb10f23d5e48b03dba810260ba5294817652c16fcefb6d43b082532e3635920e96b4657db'
            'c9ac6df49ccfe21909b64d9eea130c601eb24880dce268091b2055e322958f3bc60b7b17b1032160c1ee3d7d7343b09dc0a39eaad67edccb01f318e55e74dc84'
            'a4cbe41e8169f25d4529374de6f59c7b6d4e760f491276aa94097ce780cee16bf247b43d03b1fd25f28a022c4783092beb4df291fc1ed6a771aa85107c66f0c1'
            '01676d7f8ea52a7a96cb5bae3ff8e51532322704f0935e0b7574b7e8463a4faccf12ff54381bbabf22640de4cae04707a4ae1a17a0298abbe574316b57d73121'
            'cfa78ce867e445f8d87cffb98ee6d9f30275649ba447be0ec4811695d1aa63e4cab36280f0c394961be4431c2a05890b51aa19d8e0fc402c85d4da999377aca4'
            '80e09b466b162bab5719051189ffadab584ae5032dcd877a46247959f73c69142d855cd65658de1ab2960bbd708d0db7adf3c442002bbdc4762a83466c6c4dec'
            'a55a9f4715fc685a526d3e505d7a1376b61a19ef18f0e71fcc8bad0ce252ae7f22b7897baaf281642b9ae27fa9510d0ed58ad411a2eeb4dc115f6fee174c5007'
            '835adb9b7036f4edaf70f57596363802f76eb23497891e801d1516cb4b3d52c3eaf83c02e2790323e950c6952466d9c4c2ca3ae4707db07043e346394e275f09'
            'c8eb7eae373fd4512dffc3932b986885330086fb50957b40cf3f8c9fe34146b5a20aad33e8aaa614976f81d9206b18a202ee1c7d7232ebd64b3feee874a47c7c'
            'e7f227e1db07d1f40d82298ba3457abfe389e6e44c48c60eb8397612f0038fb6695163224ee199ad29d8b3e0561f641a0f513ff8de5e1c9885983cd8a90ca533'
            '3970887f1dabb3b43b8ea29270daa2d053fcb4d9b233953d0544e5d8e1209f48a3f57c101cac88d411b1e160ef593324b9c028b30949cccbfd64308a51102571'
            '425330a271e39fc35f4c828a710e24acbdb62371c1101c1769ac1487668d4df1cb0069e7977ad21aaa2daccdc87bb57c2804986df4e19dec86f23fb57164f99f'
            'da66a09e8f20cb9cacd0a96ff51bff9b86c17579b6524c036498ee90c1fd75259050bf113f4a5c22bcb0c674ec8e7c05909cc959da6c30b3a822b7e7b72f97e0'
            'c3478daa89bcb140dc526ab172e92a99ca2863b7fdaf7cf736f042f69237eecc61da3bb3c301d6c87b1216122603efc06b6d652900677f6c34edeb4bc8279586'
            '0fdcb9d43fa8b2ecde07307b640e7b701fca288a94f2bb0b1ba6b7cfb92da4eeba5df10ca9f1c55701e2d500e35b4bd1f3be419d48f5467158badf08d5751246'
            'd3f0c9297aedaddf89436843d277891c4cc645223ded967ef6280149c42c6b66197309dc004d30caf6f9377b8325da93dd47fdbd6bcd5cd335b08da4b2595b5c'
            '85562e8b7338d4270f1a7ed8c28253c8febdedcea8140e27600fcaa7acdc3188d2690466ad54fb6aa642d104546c09e0413d70c569fac04d5978759895692193'
            '701cbf346602955157236f95fdfc6dafc7d4fcfc7bbcbbf2d922de3f69f556a9c3aa4ec3b781c4a3268a91ad0a228931f970839c7c6624db48c0ed10a03a1ca5'
            '7f92bfe0533c4ff4f5dbc5a6d67aea2a77a3880ed5a396d7cd90792949746585a36efcf05ddcc0618c919ce9b75b39f611df26bc7d5cedaba7e6413a154ce7ed'
            'ac0ac36548a2f294fc1791eca8ac1e914ef4141bcb445b00aa2a27fbd2085d74e22f94e552f9ce7296499b4527e99cbbf48cdbfe795f94720e8d07f1fbccb783'
            '79c5a1a972602a8fcd0d64064d89f3386d8ac480698cc16dbae159333e5c6dfe522815d30336145455f5be7ce19c993bf615e6fd314635306d68c105f82e4d21'
            'e4ab5d82e4532b30468355f221812e999e3379f99630f8eb5e49b5cfd3a444bc29188c2c357c7b7e433b9e42d64a274a77416f2736dc26e267cc7067432234be'
            'cb8fe077fcf2687a919cc473c74b190a7491ae9ee562a7f75d3b32347889edf80ce40f5d946a75114c0fba0343ee276c3891242d18abebdb37a6d42a4f521f11'
            'd69ebd7c90add2a8d07b1b452b9f838914c0956fdb37d50f91e7884983a5af2f35b2cd7071032ab096d4acbd2dc6454969924bb7fea230334a6d83cd6c878226'
            '73bf24e348d120f55f79a43b799ad80345983c116471c82ba1229542238d962a3868e62970614c1ac4b488ae5fc8c50e743db8f0f09f59baf29a37ac8c975492'
            '03f701b4c49271771bf4ff734e9d5cf1ca0dc82c021f026100ffab2afb458349c1ab4aa6ad46d9892f8170ea1b78fb4b8de8432453001772c6bda1a01a48581c'
            'e7320965cbca0adea924af90d8c6f7ae6ea40710aaba99a1a7c592041e52da0422c3f707826641379b1dadfa93987b43ffd59451073e9956a6e50de98ea4cc83'
            'f73ad1c9500e9aeb9898dad7eea58a6afdd34cba9b06147a33746d7dcb88bfdb5d4d6415dea642a133b18ee8a3d217dbbc9de76d1ba6d1df30079d25cf02c069'
            '83c23b54a72ce31ac3e1453a80db5166b6bdb3afc4f75c8c568c003ac278bb9a71250a07a528c8c74c63b2728bd46d193019d4394e2fd2afb5750f82b06baa8c'
            '316fb9585ae6f705e92c9d814187f25499b4244d7660594645a1d04d825018565f557f68ad1bb31cb0d764b4628f31a5feba39b7087dba9af7ff63c241d8fd73'
            '5edafa3656d2765f896d0a1315c90d3d96fd75fcfb70df37f66f617f6f64e82b2c693c60142374397820261aae5eeabf2c5c02a65ce74291042b1ebc0e8f1297'
            'cfbbbf3b43da8aabdfacf5577fd0c86c0b613f45d6e3e734cbedbfec8bb27dbfcff15ca2b2b9f8704d3e44f019464a411f0c191b9aea975c11e523a84f7ae152'
            '92f8e8f9e4509b7d7e8dd8b6d682ae2b82eee4fe6d1c4ca17ac644580a1d1220e89608567c9e0efc47ab1dee13334ad0f3b258179b7161f4e365c68402d3472f'
            '6bc9b1dd4f9dcd81a814a3c729f3a300af27b2d8a21966ac4e654d2c70c1597311243d5e923aed833e03dc082c1234416c724bbbd8cb02df2b7e21d2abef0624'
            '11785a78816e55934068ca2bb33799382daf71d7bb476333045d2aa03b4939e466d2e2327da528bc0ab7db9b701d2ba2d8a38c3f7032771fcf5f35dc62bc3b97'
            '1ff694fb1565944fe9c249abc45716e9abc4ad386a6f98191f36c22ffc8c604eb4a13409d8e8a87357e98eac120c0b988efa05ecb67c04b86ec472ecb451df8d'
            '4516683152c0513919b595f66a34f1150233d0c898aab7d3e5f67ffb417c5c7ba6dcb44e0c26a07fe71850da70305babf2564733db6d27d119a0fc974dc331d2'
            'daed8b0a07f14550ed8bd31944832364c8fe6d33472d5af8cedf9472f96f4dc0f062c0805ab341fded798f7785d68adc15f35dc7fe6c2eedd277b9098ed6623a'
            '58a7db7d1196ed5c6d4be5689553b6baaac1e25aa2f2e52fe140ba78bcdc78893cae54beefd9158a25612a7d723a2ce63cb9a885b14faf9f7b1536f15d268b9d'
            'f53206e7fb478fa35bcdddaf0662a77340b27a3712fdf289da1a9bf1c5488966f4c2f0dd22cd79dd58d0708e9854f2cada469bcc2d9c5ede0b920d09d699e7fe'
            '9d546bcb042d06885068236a8b3b271a330d53fb0bb54a03ea93b8a89740f3c58dc8f5dffab41df58bf21de1ea5026834e18a9c58e50024dd90c10411150a937'
            'cf49d171b3be9e7ae294b55b389194082a6fbc996613560cf22bb51debf401960f3b25a33f74bd4c3c7857f90f364bd840eb313f66e84fbabadbdaebcdb5bc9c'
            '774a0268c268e33c44cb32bddcdca1257414869d9293ca833fea9e6d7377897d38a7bd52c2c5dd93598a8272de019e7fbd0f75930eede45005fc52fb1c3aff5c'
            'aa7a8ddad99fbc80cfa9d311b40811307eb16d699d30e1228a9b0f239183bfe02af67503d017cbb270eaa38580005d2ca48064c444dea09cee0c0b7272aec8b1'
            '8849ab12046f3fa9bfe02d89a4c96585635ee95a086b3c2dcb5a7f35ed8b86afca8f3fc1cd57177d33b9ab8dc1c5f6b9331bce0634bbe806c76ca62a61bede5f'
            'f48efff9c4fcf4a2d347c64ac24db314b266a205956acbee8242cc8103022e091ae9e9ab33327b934dffc206241e9a698f0e33b05a3cf17c1de2de3b0105d143'
            '46c8910be11f54faa1be34c3dbfad151648994a4a3637bc5a290b6bc08d3ce773c3b2d99e98a79201b54b23de04877f9a7a5eafab19436430561f5e0e162d7b9'
            '94999278996805dabccbf04b5dd31b1ef673c06149371e763fa07650798daeceee61181d1edd66fcd709ca8dcc044ca652d0b3d4fe2eec36d1079597b90dd3e2'
            '680b51949b5553e4f7e82a7e853a5abdb27f1d150a41a5956dff316b714ee24185959886650eceaf99aed5b0bd9315d16b5033e032da9772f0fcbfb704118ee3'
            '678308871718987fe10c7a040882ba4d353ab52f385c160622a92fed59b46028fe0fa9a5f070f4b98d42eece02ec33d53a21afeb778e1aceff208a679d85c7cf'
            '11256c252f2e8a5565cf226fe3ebdf08255e32b6aa338809a2592ccfef34dd986213b0e9615012170735992ec49115e0dc0a81c134f9a2afb8c75332c269b517'
            '68dbc7f4426d804681210a37a95d70f345386ed6b6134cadfe18fc5164912a6e426275bc66b59f147468aeb33d1f88da0f39426d274e283f26f5ae3e7fd2f3ba'
            '037cea472c36b6bd9d9a602b802ac903ad0d6618804b825a81e60bb73e46935ec2be9b522d1bbe820b2e20be4750d9fa49e65bcd6495d563558b735593ff173d'
            'ffd8a52a9527b97550138573eea5e88a950cb6f38b1aa085af7e261d76beebb242eecce1e7e4673dd5e32fdde2986d5061613883b34c9ab9e18671ed4b307ded'
            '2f6f429b902d6f53a477af236ab61c88a200df68efee43ccd8bcd7303fd3ef1cbed19e8403b41a62dfcfc2be3657ec281ab06450748e3431851b6cc6d077125b'
            '2a078eb00029799639cceef4264cff3493cf1bf0416ab7614c059c45e8133ac37a7dae5ec9d47d9443519526aa5809b3bd0e76a30011c760cecf3cbe0561cf4f'
            'cb5524e40ba8765a0e335b7ca17c769e7126ee64f8ff84f5bcb3d743b1cb09ccd459f4a817086d733dd31421557ba94066289d309e2a939af01525172858497a'
            '72db3d1f4bf337e296a57be00aa8b121d09f2948f835ba8aa81628b38bdf07cf0c3667432eeada9de11102404f6b106236d2f94bb0813c6a759d7789cc57a1ea'
            '6a21e2b2007a8d05582aa4e9226cca2eedcbbaf5b70500620cf14878ce2993cfc72a8ea8b3ce296858835e584305623a78bcd0944c545f5caaca114beed68304'
            'b9ab62c36e952e6351b8c545a3dee45d06b8d046f156a90e75e709ada7d69c548e89c37ab5765b2acaf199688a005a19ca1bc47dd7da69b6baa8da2c20a225fb'
            '27a634aa47232c642bfc34c51f88cc4d2974d65f9f645eadc5769fdc9360dc491dab367ed0659bf9d4a284c46916b00a9450cec065b9d5f1f8f1cb355e42f9e7'
            '7ad38670f0ba15a1c209230d2fd90d14ca6d911a9a7954aa58671ac19880c540169161a1092de7b124af32516f4f1de632154639f0cf515b6ae1ccf61ffd79a0'
            '79a9b668cf6dac83c5ef65cc9c5c97f5c859506945cf093435b56a45d7310d29f6cd93d6a6d9b1a3c40a5eef6e0977bb6493f619afadb7a0d379dba9c7d28ff2'
            '89823f7731a7615f057b289c8e108dab5937b75ee4c05798b7c3dac43e0fdf2da06a503436f2eefa77ceb41df5b56e44963b30f60f87d01b4854cec5a7906305'
            'c35ae7dd0123e455b38611feb986e32b92161771731c1b1190c183ce0552f12d9efd2679f536fe99a9d60a7c4013ad64391439adb764622736c29d1c8528d87b'
            '668a55c26f86190b0e2017924145caa3c5588b4088f1b34f8939330515622724d457bdd8110d9b0bbf8c014f8cf385d14225f91086c4f1eea22e2d42726c65ba'
            'c244bfe17d3cc18ce17263ffca3155ef27cc29976fb29cebd52dae1e0fb46fe04711e2ab38f53f96f93499ae2b00f804eaa4c0462b8399615959b4011a059255'
            '45edd284aa32b0cffc1eff3e574d9683ba238e5cc21201457dd6b0155c46f1496ee3683d87472215d422beca8da6df79efceb19de50747332662c6771e346dec'
            'e95e9452a563f7db69eb7bca731452749c5caa199ebf0c6a5af38f132b6df65e1b9a684e7f8a3f0e54902a5aa5f4a86e0b40018bc0fd459bb29ca02b4e8c876a'
            '5d76e1ea40e73613241a64b91f49faeb3ca6780d8dab3c1a157e0c52dbed43168f7089d5cd7b322d43fd7cf81e66548ffb9286c1d2b3dc3925f322a1ead08bf2'
            'efee13190c0cbedf5f811052363132f0ace6119e8e3bcef5bb912a3d31d2ac0811ff0eaa38884d7c7f4a1537ccf1dfb6c2a81edc45f69f461dcc893f6206c777'
            'e03c87d765345a5b1d6a7a931f9ce31d6bd4ac658b79eabed0763f8ce90bd9f7268eeec412f6e8f5bf8c6199037859f007caee8b0a8aaca879269777f1c35adb'
            'e4bf6f54a6a8105b0aadf49d1f0d1552120da67b8ff58dd2357a6b3d7a80854765dff791b88241dbc05af0ad5bc12df184132207c60408c0effb5fdc06db18f2'
            '3746954ff8a33065c0c38cfed714600d44dedd57aa7ac22acfa919e6fd42d291d73a237bdc3d2ac9eb2f4e9b0889b62fe1e4b11631a572088b04011787b7d9c6'
            'e22e3cb2a2fe2c86051799304b97924597b17bf3d0b94ab6a5145747486cb93a909c300a292b0ffdbb4c362513546d26f6a7ec16ca2495973f0f1c03a535e7e2'
            'bc00cdd93e7528b7d3d055d9f30c17f8a43d1101a126d208341f89178a4e281679b97c0dfd7ffa0044ae160e61e77d4758895345ef5d541f786fbfa131c93206'
            '26c9784c4c0736b65772ed1763d6d911057a80ab346e2a03455595e14e15562d22bd65ed17b31711d5ed18b728189f7dd5b790fa3ae8ee26b5ecefc8fd35ad3b'
            '444c2fe26e469ac21e167c2ea78ef7a56daf3b60c7c07094a1df4636923bb0375ebce2c0d7fc1160a4355569e2dfaff13845ccc83636dfc7c44849057370c501'
            'a5e6d15b413ba5e0dcdb6488e5c53c069b7da4010e52ec43dfde1becec12475063ec9397ac040e963ed21db35f1bd0cbe65f30f6e7c1f1cdb3e13f5c975f322f'
            '1e2097af872a7d6f6c7b8319174e9ca304a2fdfe8a1072fbd6997e50a31333607c86404abe182e160de06b517d10ef28553c1d5e444c0a1b114d646437f24f50')


# vim:set sw=2 et:
