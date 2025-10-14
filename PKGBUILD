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
pkgver=140.4.0
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

sha512sums=('cfce0bdcf6d4599c7b96bccd9fd1390bfb3645db9276a369a30760ce6819850aaa4251869e6bd3c5d8582ea3728b920762c5f16f7ce12ce151c3e74327b8c811'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            'e3d0b037eca64b9527ad3936787a8ae44664f497e893f262132fbfcb789ed917cbbe56651face5025cdbb064cdb9e9216ed7679ca6662ef1cfb0a2d2ad6901f2'
            '1e95d16d59df4bbb1e263b271df65e56e6d720271e5b33fa93b0d101ad6c937b6d729af35c99bb101c29dc587b9bb6eccb2e74daf152b71cb39fbe098f6d549e'
            'f205a978664af11cdd778d3e3b4f3ea205ea7503523a47bd9d4e6d170e776aab94c46562cd83f2919d3d685062cf3673935ebe35315a8ecfdb18674e582cbd84'
            '2b9c3f2e65ad8b8977244b4af38be4c9b284fc84a3e7f22fe467a4e5af0c9eee7c7ca6df3c8923c6fdc38d0b2b11d359af03f44864f02e4a9e28c15217dd4453'
            'f5e7a8698eede85b4ef8cdf239728efda2addfe8c17e3341be6489b559bf09c1ade0dc3b8f296be44427cc1aaf6bf0c6229a8a356ac4267fd7a84d5ec9c80230'
            '95e60d69079db6929f2dd8ace4748248c213b71cfc02dfbb9f8c53ab469e911aa9280562079ae518491e31cf432e33c7933b566aa38765c719afe06db74a0edb'
            '69a7afe79ef9dbef0554ee1d89ec4f6d6bd7e68a82331017c6b0ef5f9d5c6e37df050b27d16b4cfaf00f5fc62ca10640d31846294fffe4bfb69e6f643592c2ec'
            'f920ac93f7145666f92ef9d04fb31d9f1028b87b8e23c2e64c8e56812375814c1de4809ef5594b71d0f9272840358592174dea9c5cb9e009653a4df7fc7e42b7'
            '0a44522eb5926ac24fe6d6967e723e598dada73a8f76591fb7bfdd6b801045f5ead54ba84a4db9c0ba68f37fd8a271ef768f0de34064787a3a0db32dfc0383ce'
            '0d496a619b37c8db427e4a2cfdc956fc72b74306efc2d5777b57123a9c43a6a42fcc76f97736da597c1fb87242f5a8613b73791787a920193063a749c8b25e8a'
            '8c78e159ccabd02342488168c76c98c24483b619d04abbb50fe112976f6425c0d35909477435490611a77946a36f5602258e5c789afe08754f6f6f3bc0819c68'
            'c7a68fab699d338609748cf54556e3f04ddbf760c4f1d7667f2fe397c13500378fee2df6b11afeedcbdf19965269c8050b3419191d5f70ed90b3df489db9b9d5'
            'd7f105ed5b3de377c47fb0f936d617453bd2e8f74e194bb7a410f5bdac0e58f5451d04d07e5f79697271c709efeacce61e2c8e06c39e9532441fde0825a481a5'
            '23976d6dace1b0d83b881ec5c743f13d80a36633233317fbd6bcbb2f079dfa9426351138c9cce0fb982bc3efbe35916679024c1e6d6f70800773f0ec7856da2f'
            '011702fa227d29304cd620fee2ac0b5ec1aed776aa4a2339ccfc367f50e8cd35d41a0cd790a2d89da5676a3ba6a2b44fea35256f77557fecdef4ee94b28f0517'
            '577342d62198d653a3c76fe3b16468ad360f40d8d6eaedc5565abbcf94e01250bc04c9a279e076ea36b7381903562bc77e535efadf699784f361fd68d1f866ba'
            '418a9e624d067d57936d60f3e5dabd1ba599c4e0edf14f68297a8dca48845fe3b80c6df32813860cda6ee23e9c1626bd5be6274b336c2cafb94551a0c9d4a1f0'
            '0e053a7d0250234b3bba834515b15c3fb991c66de36c71eec2ec39e91728e3bad72b5d7272bf503b844121f84d77d5e2adafef72c915f62cfd97b3561461318f'
            'd29321911515335179e5e470b06ef30d017277a59061ffb3e9610c935035d79545206e29d48f5e0c2c5f254dc2812896d86345ba1e77d239312040fb826d2f34'
            '93020fda08370b388d010db4902192f9af674b2007df2eb1bfb8bec64f4733a28078d67157091fdf3085d84b1c55673b719a0286d27c19ccc3c32d93702bf64f'
            '9219eff2f9dd5c30fea752b80c93c0b8474522d788c56f1ef1d38d2b4851154f1661207016417e46766fcaea67c4053ba51c61e6e26f0e227c641236807b48fb'
            '12b48064e57ce63fbfd5debb52a3129147c4b4d7ac8699c01e9638687954ad0ca8eaa8da68f0df49fb496fed2cf62c85e1bf5772bd9a80598d5929401cbcee7f'
            'c38ca1dc660e79eec72fe9e34ed04fb99216122452c44749eaa2ab19e73cbe4355aef78f1efbe67baccd22822330fe133a7557afee4ada9bf62a08e044218aa8'
            '38ae3d401306d2bcfbd93cd7064518814ee337a8794378fff3ab8bf052ca62728282375958e87f94dae692f507cc97be884c71525b112c76231faab3e5f15c6e'
            'f4e8cb9448aa3998f0cf64248539b0a289dd031253c12615f275134dd2467a77996ec8e1430e2ef76e2fb4c79da44a8408539cc8f7aa4ec6c225aa4517c01fb1'
            '595b305237ce35470599df4daba70a0abc885df0b915fa79751239ba734b8f842f75f5beea6462a8dc1ae30699d68dd6c46f49e2202bb60e34d24bb083a6ddab'
            '41f6c7c6e5fba44860a5466baeb3b16c15024f741519284bf81ce97c6bac9ba14fbe2325f026c5a80b3a5fe687d5a4d0a59c6ca80e8bbf84d8468b32be4d611c'
            'd2d606731a5cde75c51a22d414f3062778636c7f8958c8b3f5cc9b129945b08fb8aa8fe39df3c15903da8fbcdc3ac2a427978b715ccc62e9d3ada0da77825336'
            '06c2319fc558edd81d3bc112f45d400c3c2c10906582626d3e5e11c0dd90de651dea26f39a3a575148d1065daec2f7cd85b3ce407abd55886ef2136270267eb3'
            'b67d9aad31a797ae4a5a746739da105de25342f6aade9f1fd68e7f03fffd48c40c72f776770bb2292ad5a9a185d252810529651cd00d014c672ecf9e341e56fb'
            '49ce192bcd6aaa0ba9da142700117a7a885fe240de449287434fce48e52fde63aabdf7a843b9b8e26c18ff6bf33b66c0f75056c86c2098f2a9046b827b7b7750'
            '6dc70404317adbe4fd08f6fb2a22bb03a492b69d1f4b81b14999056999a2d2de1b8c5970e07fa7207d25f95afb90f4af15e4b176af9561f5e000c8ba556ea35a'
            'e51acee31eb240e879b063a66339b57a3adfcc583003ddf3a4d1f095e18a8964ab9e0d64cf1df8e0d7a91609d7fa70e5bdf5b5e8a83b719325eff588c0ba81cf'
            '151e1545241dc99946b989c0c852aa71b6374a067cafce597ed03d33a1e3001ac1bd3161f7adc31dc6911eec08a8b3af09bcce82705b8b0cf03bb7b74f2e7a3c'
            '9e7f2f24e3bbef810ce65a219ee94cac0ca5075188f0ef84540902bdc8f4e6bf11476e879d55e14dfa4caa237249f40dca8c5afefb9fd7c18e9ced5703085433'
            '01fcb4bb5fc1ddd115e54a881ef836c08c9f38e12bf32ca4bddebf429ccc0e4d32edc5663d44b130b15aa6c28c4ddcb7e4814eaf27d5ad3a9781217b7e16fabe'
            'e47760dd44727c97159fe672ca9e3392ab2659ea33834b8e22c068a7537a18d4aa3ba2a1b142e688a67c7fa7b3b7b149b0ee23b753efde00b1d51badd8ea3ddb'
            '304569906a0c16b07ecd22baa4fb11d232349904b8f5a0de8dc90cb7cca6fa6e7d15682ca4d0260f3019cc5e8485bc70c76e925d4ed9ce07337788fe7990c4ff'
            '6519125c61bffe7cc93a1d44a00b4aeb279c7efbffba7a8731c6b738e00d7fe9f2c0e940b18cb93b699daf089b9295734aa20955705b2384f02f41cfcff590ed'
            'c163a7982d99911c1c85ef7d46b67957e10409c9a66b65c96e47808a327efcdad644d0e8748d5e9cd761a1db28274dc7c241c704b74ae1f2dd4267c1a27e347d'
            'dbf6b401b87fc0154ccd4bc06ce5fd2217c2ce22ad167b55cd57642a23af46dce7639e340e14f21fed35c666046eb61ad7a06d0ba2e1ab77f4f308a51b180c5b'
            '09e673d9df3e42db6d51832ff324a88c2bb51848e8248312fd8b917de2a322a8ddfa9ca85433773635afcee6148d8e17a86d5f97341471ac1b70ad6a00c34659'
            'f2e59d7f160a8bb72b087588ef34714f44cd8e2f650ac5ebf30b1c80b9bade23468624add2c4240fbe910a452621653c5d0d452ec811ff59e5556dcd19c0e35a'
            '8bfe2d2caf2962317ec11eb44ac74ba23111a576e231441daf1fe60d5c331445cc7bd644ef15466d8b65822c12f6fa65d0309ffaa91f080aadb127b71e6f6c73'
            'ac7a972ca6b3f7ee95ffb9055a443099b31fadb45eda57be64b9b98c17be5346c2d4f78818cdb24eda108d1360236334e5a697cd5c7bc4038670137346f7ca41'
            '320d12790cdc078d9d9a4d112887c5901f5d1c1cec93e546c21a343fe4c9be7fa39ef43cfbefc6af2c8013eb659d41e95d4c3d5fd04903e9e0d21ce5d1761ac7'
            'bbf446e6116c5692d7be918bc10024eeb36e9e16112ffd2985d6cfdf1e9c043c2a432b40b23f856c8204a22b0fe22fe33dfc9706420b5d470f6d827194e357e9'
            '2b5f3e57d8ff09f2d48acb3f8ee3849e12d7c99e312bead122bed1024e6c2df4c83cc9bdae84056cae1eb88c1aa5d43da822b19fdc2e79bac6969378d736625a'
            'e520950c8cd69f7059d24c1f22d8cfb7db50dfe63c601711ff56950ac6469f12437cc9c5b6653bc8805ca8ae0077daaccc72442e2cbfeebf12ca2bf2cdd9bb21'
            '9d80f45137169ed4bd7da4bae363aa8eeb19e585093705ecfd2c60c8fe9dfd38f9ed74299fee07d9194f0e3d2bba1331534684bc93fa685c6d0860306421950e'
            '658e666734c2bd807011ffaf32c07614ab1fb5ff4daecd31861fb56463cba7088f83cf2a3aaa9695d1ddef22bef45d39108bc84dc37c1ec0b3f4c290c09cacab'
            '6df7ff34b3b70495d1deb611a145ded9769ff84e65160d43d4cffaf0419d4c01ef1b60d02c485d7181ca6192380a2cc11541b4bcfd8b90efa63e45e08fdc7e44'
            'd5e6d80840c0366b25e19d54f4b94feac08ae423a5e8dfe277a726e64714204383f0cf1a24b030cb742513c190905920ac5f83c3dc19562ee1569c08dd861e13'
            'f5b5b1f0f4746d55d4860f539642baab562f67d271141cbc9bfb8eec0151974bcb98b115ae8285feaa3693443874ab86bc69f539a61d54af5234681b838c4612'
            '1ba698a21eb5bebaa7ffc666acfddb05152225227c23c36caac1f9209f243c2179a120d7d114d08edab5db3920f8c4bc39263f4ece29b4107c68f723afe5476e'
            '48d53a34ec4b533244cdb6c003ddd1a2f3dacd5852e642631c714a1efbcf3d2aa35b75e83e1884a1c43048c0170604143fecbd9a253565c224624f432b1097a7'
            '3aa6ebc7fc1e07919b0c0de5af1fa7f30bc8f5a0b0d737dc2b4d60f8ffe9e0b8438e1845aec007b03083fed431ad2de876085641b646e842acd920a77ed4180a'
            'acf49b931f5bca17eaf56e56fd9bcd5d963bfa7baef5fae1259d09e3b20807bbe31528665ff7cf69242f4b44097935b7a6a248eda7e018e378b57ebfa91c01d4'
            '6cda4e5a09b59a883cae4ba30458913183f346eebb0b614e9dd47524ea6b151ba16f7136722e8549a39aadd4faaf0bef92caaf1e5f7fe28b15a265469d095c40'
            '2dabb58462c9444dbad6445a9c536a7bb6aa3a9099537083bd5b6e831cc9754f37202fb535b78c641ae0c02ce9ed1ab52ba9bfc8a1c875f181cdfcb9ea482711'
            '7193b206604ab6f4df3b8244562ba75d8a2105b5a8a5754eaa8a0e83dc668d3f1f16b538ea63bb6dc3e047451cfdd3d480b7b152fd61d0e7d7747a243cc4a561'
            '0ac1a7d5ed2997c74c2c3aa3a8694d56c8dee20aa0907f9dcac7cd71fedd705effc2371c7d471442c2a6b72c74b203d35965a95637984cee984e1bdf8030b0c7'
            'ad6b58a0fa9a08656311de703d8c61e15b60b8e51a95f484eea84c22d1c6dee81c0796d3e6104ad66eeec6b11aa291f417c4d81e6f85f6b81d140553b4b07a8c'
            'bc26311cc89a8e8f3526b90761c572ea4228ca19f366e05d72cf1c784609c7c2e97469d7ad13c70c543987d0fd273b34d421726288da5e184af2d4ee30998201'
            'e2f3116f4d1f1fe6768d962b21640668685a9d822b2bc9bb24b72c8d45de77c8df883414cc7be3002e8b94954d4fbf68102a3c5b1818ac0820218184ece75217'
            'd3a7ef43d0074fdec01ee4d938e46dc586b3b1352e6943e6e95965c44ea9453fc91093f8f55218331f56aa5994ca65a5473f1324991319155d8fe714b93f952c'
            'e15b21e50f8049c0bf31d504e04714df6b3352000e9742db3a024eae8f260e81173a735e3e957857deb4a6416609297d070d4a132c31a7103f71a76293da8b13'
            '7b617ae099a953f9da8f899067402686e0acf5aeab72bd5c97f2f2963fd0f18d55a315a16e1fe1d169b6466935883549c17ecc600a924c71d4335f42c78b0e17'
            'd7e5c3dec2c561b37d545f8af5a9e4f19578a92e8c886815a45a4ed030f7a42ac644aa6a3c0b544bbb0a39fc04a91ec6895dd950f3e289c238b023153586da8a'
            '0f4b78092a126edb71fd6e4caab4fd9a39d8012f7ab1c5d0c29394da7188de04ba573a145b900eb949d5fbd748083a7813e8385c5530ff901dfe5b1e758e2b58'
            'ab03458058fe7ecde328119b0e0917a3cab3adbfe9b37fea72c312ef79114c9e632758cffdaa1c505c8af5eb34a15b5ef19885bf24a4aa96e3ffc13359aa368f'
            '0aa650b39d859e7f9ec5e6b6c1b5af5d3a35b4a2f6f10f49f18b7ec5475cdf6af5a31b926bd1b2211283a38e2d39226476d0d6acf4954d9ccb9400770c9b8f13'
            'fc2aa82446226f22a76cb94d6c0ce7efd370ede9d63b24d7b95d6fa395d52c4342067eb34f6cacc6fef52180535412dbe386af0b04030dc32e35f0c773c548d6'
            'e11cf7074e28b36e6f48584272a2d35f7fcf0399b867136762de78780b0742a5b947e65785d98efcffc9381e0043146c44e0456f2d051baa32c31912d2ee64c7'
            '9ba76512e47c0b35f28eb747c14c5c3062ac38938b79a42c0a30f1bf8613f804d358ddd4ea66b8f735d7309f2ab8593be632778f38257583b99123b107b09724'
            'f9ebe2a41b115e043e4df88f18ff7752088ed8c5e1b99a7a8fabf401661a64ce58bd93bb805f7243f2cc3e7d1b657a8b9372336316588d4aba17f8b7e9abc811'
            'c4a4076bda77850963bed4006cae3399f21fb3a56b969db770658f1e86c4a8f52a1adb5680b538d2c3c648f826059cae15d5732b993de90cdc9b98a5a47541f2'
            '78807b473649231aae0e34f257daa37d93e29833b4ebd2db5e4b75171cc794a67c65a6a1010820a2127dc071630be551eaf4af1b301322ddf22ec5354343c7ba'
            '5708451fcb1a5f88e77283e7bd920cdaabe854151924a155f8ee1adb735ad5257da3377dcc96c13cd4d0df077187d43934ef23cd0f5eee44bda57a86e4ff29b3'
            '51d0c77c45cca328da96f4aca06e2ab8c05cd7272870b9b5239704b52caaffbd45ff2eee4ad8856c7c2f65eedf7c831b99d27b52235f61a500e7725dded5b31a'
            '4ee2e70eff6ba2c5f8060765257157ea06d38b780f3882c449cb4e4339e76850a0b84eb6ee384e9c3f5c801a45317ba76d4e6f90a005945e7e208b4cd5a500df'
            'a549621e77a1e03b0a6b20d143d657bd2b31bc68e5ad633393e662f054b09e31ad556742c7705462dd0e9a7fb7215d2282d1b2a63bbdd914bdae515d12304c1c'
            'f8f171a3591b5ea4c35c52d54031ecebe02433fe13f941c55624ecc52690b328f9dee72561a22a5bd4ae02eeb56f1673f9a47d7e4a8b6439a46b55fca2527737'
            '86402dd9f72332ab12306fde5aeb90abb40ff750bef328065e327fd9285f2cdea8808b7dcfc0c26e9da982b816843d2f821798b1518fd2ac7746e626118dd1ec'
            '07e872200e112844c6d6b828c7f15fab0b719f6da3a26f2915686be32dc1d782d9d1e35bdb033d224abb6eb6500a04371bfc6165a16a375b380261e8262aedb0'
            '3073c24ec36b22c07df6dd17c02cde264fd4e41fae10ad419bf007adb76899a4b0d467610f2d63ac8c8e8a300165a32ec9ac352823747ebb575309d70383d0ec'
            '36233775121b2dab23231fdb1ef83664bb377a11585a1e641ef2ad775c97e70f31e7aaa947fbe4e8b54b0aed55ae38d9f78408366929327bee60d519860d28ac'
            '390b3c44a76d1fb47a9dd17666dd9425b0407737a7c5342584a324db53b47748bdf48dcb2d97015a6ec962df8bfdf59bfeb46c481e453ae7fabd8b8151417abc'
            '21f2e9f5bb9f3745f0664d9f7d2e47434ceabda645e5f7331e442ef31bfbc05ae256d11d393c607fc2c13a8765f6fa246e16372717c61029d2504889515c10c8'
            '8068749061c8f55ba3c62f0844b76570c30b0850fdd01c9b9cff961d82a016c266168c9da6745f8c7f94c93cf9d302c2dda107d0da619f6230f3eed707bbb2f3'
            '8ce6eeaffd7e315e71a30ba06f603a6e82b95f969bc79a36f68310e33c8dcddc964dd4571ef7b4e4e08647c7cecb1f52816c54e54ca1328cd69b0f6b41a6cd86'
            'b63c1c28235abec4af483f7957142d6972c1ada932ddc5cb5ed1489614de938957d41015a40320a091abaa913b85d0952664e242ce579e53ef6f32b3587db81a'
            '85f734fb0fdebd810325c754d5e1316cf1e834ba5374cd82e9295a4e3205cda21910fdffefa57e3be1cf5d9605e763b72b89231708e5cb4f63a529ae2edfd94d'
            '5dfd4c13cd7b770ce434e1bea676c20717372d82b94d89222d00243fc23f46218ccd9c4ae63e3e40b2fa9adbb08d3be15d1e30bff9e64d9362a4f89868449c1b'
            '74791ad7dc92cf1ff3803b0e08918a341fa5763502847e99dced949031c86221af3fbbc8b7865d5e736ee8944a234f3e0589048f7cf2b7f665df9ac761546f63'
            '33116c70803669c7cb0bcdb9ec12d9ae1347c6ed0b846dd2a0f64f3542b6def11b80e4b03cc34d5b6eb79ffcd00804a8b818c99a72959d1e78acfea60a6a2bb0')


# vim:set sw=2 et:
