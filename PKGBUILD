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
pkgver=140.3.1
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

sha512sums=('a9302d99d7f07f4b250aa214635814964dd083204268e05fe877a3d8330b9c0caa6c29ed19da71bd88979b7cf39ed52f17698968b0da5b0d7430b6764b43b6cc'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '5cf84dffd58d5eb36edae65eb599c0b444bc915044c82ecba51c178b8482d00be70ec4941b721b33a157e233e803c55db9f9f52ff3eb50be8c448c0a8acb0b4a'
            '074273c8364c36364571c5400c1ed0e683088eba3e0f652036e99674075f41460368dd61c16fbc4a1a5a74d2d7d626cfc2068f67e863d0a8c8e2a39d37fc6742'
            'e4d0d2d38e5bc7111845525884ccaec82479e45d804462ee846f75defbb8bd569df4bbcbe45422532c09a80c57004718c68696be4961c455c3bbccd40004cfa4'
            '42c1d73bacfb7642faf870f67749a30cb68353198198691d1cc07eb014468c04615ac226fe7dd356d54fcdf530d94cffbe2c8f1847b1ae9f3d7689c2333bed2f'
            '9eb5944ee1485ba858036e54e0f60e6d33914717e7cc6ab20d89b060e5de25dfcf1fb8c51cb54e51881c804209fe821d91b71c3f681ed50af77ff794261bd8ab'
            '20c69cad45a447e320fbca5027980e67814871d29dbfffea0f87e9250d1ee18f8c2c209e256dc89c8119177de446dba1bdee5a789c564f110768fbef29edbdda'
            '25b5ad9f6839b9e6885c88805bac583333a090a2d9540dae9239302998614264a590c4b4ab71c0d6b2cc861f3f81d73b05a1bae9754f10963aa384299a203005'
            '0361337c53d4ad940e688b82ccffabf86b52b5fbd24a59b174fe54a31f1f7662b6c6a157560c16afa487488c1c86ffe68f3e23acc1533c2e82b0f1a4b546a131'
            '5ff9ffaed70493c485ca34fb11253a1c8f4ad95d5e5408b5d0425a2d5a711cb499b16e97e21987196b17cd01bd61c27fea2e6cb8a39f995d571059ed1f80d1be'
            '8b43a146fe2f9b9e38133f18e59a556db48c6d5bd392956e9836ed61bbf61e43719e17cc74a3ffaae3c2c87bded573d71c0aac3ad548e9a0b08e3a474e00cc77'
            'f7d5a26e703e14be00a3609c42acc963de0758ea9d11380036e90028a88c72a69fb113f23b66cef43af908a39fc07e035cce9e451099c8c3058638b490144f97'
            '6e497d5d3253fcf35b0477116ed01b6e5e4356ec49cdf26c57e68e04d3d0099b7b8e242b2eb75daa0ba0ddc4a44dfabd51283763bfd6afb49cf49e194364b49c'
            '0345def8339d41df850a5d42bc4705d20deb2c0e3fe722c413d0787dc305799942e511ec5caab0524dd1b2251885c420a68f7353694d0aa2408cac0e71d624d1'
            'f9b1b458654ae40a67d51fbe24c2e80eb8c3c62068263f7a9e19fcd61e655ff44b37979edaeadfc038a29f749283cdc2c878c7019e01645eb4747ae97761d818'
            '2a9aa250be0e72467cc11e4440ba970576c0a681b4d5abf3eaddef315af7ada77cce5ec68660a4030ff206e4f5c276829b224fe229ab1fd3adc71e1ba71966fd'
            '745703108064f85e169431a5ddedce3fc16a3dd8d8e5a0e824111452a7770eb34868b1722df681227cc0307ca50806a7422091b1715bcf2962deaea3525766fc'
            '34022284ec07451193bd84fe4daf4bf9ef7869fd8049084cbe7a8afe37bbcf31b8b7eeba3eb30f17ea2643f23cebb8926df1c1bf77f8fb6f7fdf95bfdc2740b9'
            'eadfab64d9b9fe634ed520cc8a7382247286820c78bd8d516d503971a47ffee174f673f83586ea67cbd894b682d57dfd0ef0acc76dbad9ce0a42234c55905740'
            '38da8c5fee3945d3bfd1bb5595ebfb70a9efbbddf3301d2219fc21b68a08963050cd898ca4cb561a8115846cacc2c63ceab3471395927bb87a49ab69a8b63809'
            'c69441ab32d81411318bf90f023f457b99c0b487cb17be7fe9b639b054fe24115f784698b612f47f56f02616208ab110aede4500a13a80be2d1c4756eb1e9ba5'
            '2f38890d859cf86d07a04a43bbfc7e9f1dee638290e8399bfaf184ef76521a436d9a7869151ea608e191c159e93b26b023555518641209a040b25f0a70153394'
            'c08f983e1878fd69d416eca838552cfb8ee4505504166c5dd40a5eb7271d57b57ee5dd41d5db3dacaf532f97b9da4c05672b55102f36f270adc8c30e0333d2f7'
            'f7971de62973eaae6dbdd95943fe4fcaf60d8d439896810576b25bdc52b63575b62f3d2b6b4d1230a6febd8a6374fb65046be9cbaaf469ce690c8dc0d3582b78'
            'b751397de3c56eb3fd39f7488756aa49103824e7538da79d321b65a7c93bb58b17e14babd4ea7bcacff5252e0fdca6044dbe74b99092c549f6368f00f887741c'
            '44a8a0ff8e9b524fd0f6ff6aff28376944b8bc4d7f95cf0645a35939d55f584a3a5d57a8e44f83ea4f971010fcc4dc81bbf1b4d17eca718f932b118ad4f740bd'
            'e9ce5b0c6691a3906a25f83ea37cc95e782fe6fbf7aef745b52d5bc1cbb24fbec4082825b3da86a3dcf6b70ecc67ee8bfacc72ce0887c5eddfa1b93451558044'
            'b2c7c0e94bb978b6de770b6df3ac86dd0b11c558e0d7c1c3888618b0df2c72ddca515ff4848e0d4a33b6762c962af633d28186cbd5b967f3e2cc007bb40738ea'
            '3ee8138f1a170f4aaa2fb5705bc6bfd15ded528787048bc22838476d097cb5ca50886db9682b175b93f9e17e0f84bfd34096e276beddc551adc59b1884a7d595'
            '33efe7c1b093f714acb6dd0eaef38cf42203a735b2967de24f2733fe84517ad836ffaa48470ced704ab8c44667ee60caf3d1d3b6999ae773cb63d617851392c6'
            '5e2f8dc448e6c1fcff65834befd631af12ccee5fe568053bc55b16570176c30c85e235489bfe80bac0049264a2e26839df6cce6627468f29d7267d69d41b211f'
            '657c4d66a211759ce095a598f0e0a5e375e4ca60d0851f968c39ef5b31b3132ae919e36b814cee10a3da0b97c60a8b3dc39ccc0971ddb264d774f0e37812c0bf'
            '0c68e1f4b5477d396f2c8107b5d58b76f773a93a6fa91048fb0dfbd704f65d167ab4e1a6fe2508713cf4fe5a9d8301361e9f266eb00988f8d48ab847434d510e'
            '4cb14b14a0792a7b0db812f9218cdaa73a0dc79887cf2e008a9b3d5f1b01ed10d58eb55164bfef1c7288de8f2636021f8e3ed59e053a949eb0ad10f95d30beb6'
            '3465debf3d74c5a365f0db4dff4a981e4dba96d383718fe83fefc860d68cea859b0d477e260af10c1afccd97c81deebfe8d2bb68e521b8d368aebf27b13504dd'
            '3e2039fefae48c38a49cf124167da96b6023940f369cb7a77b326d5f6d25df24cd9a8138712c7bee24f279c24a3afc001480b57a8944f5a4a66ba59a1d145fb0'
            '8a0cdef6419809e368f5c313b361cfb07c243282d24bac93c7e1fd89a51248ff240edc143c464691daa81a38612bf3fece9f9e5e532e8d5a376a134f62c8725d'
            'e51d6bd9e17a027331cabdc68cf38b99ebe0ecd97bcde56858e45f83af946d9b197cf5be4230a5826d78b972fac9e4d51254dec2cae87c0722922ed75dd4a483'
            '278d043da2625ab1e8644cc0c13b6c1dc705e1acb6376d54d7f9167d763f6f2dba98fe8e33501245922962fa24bcfe6bd0cc87cc4ddb8c1c478a409754d06bb5'
            '0d3d88fc56abddc49dc6c150c7f386684d2dd9c6821d088f27517e1843bf05b31e49e1b52c75034907175f7696bed99f3d3eea378df20ebff5ab0145707c6882'
            '3763780ddf876cfe087c5c9153e01efeb83a31d54fe897cd084216f327c9eaf0bc872ada8ff6edd8d01f2cbe1ed4d65695597b9f043d41c92c296563f857d755'
            '27313d4a12584370eca7ce12d1b878b55edfa9f4995b84e6b5ad7bb8f4373c1136d1f61b0f3ab06866f4e973506a0f1694ade1c05111e2429266eb02f6dd0554'
            'ec1716c5a1ea40423e443a0342072bfea2455cadc7df82b936f154117f328d8dfc2139d9f0f67556c3fca5a04cca89982deb85528da8abbc8c0f9e7eeadda7cc'
            'bd65d40ba366c4f4296da579c63157f01ff72d0352e4876b1ce29aa98c95dcaf0ac126e672133bb8b4de44c344e2c4ba510ed19200c8cd6b79fca6c064337a88'
            'a18e778a1e93c583cae12d9d8f4bfc1b2f04ae9f1dbfcf65cc1b60051775ef9f15a8ad289efb6894e95f5485741f46c9f7f63668936c4036954134ee08ac1052'
            '6ae37aa0db624b78b163a55dcd4d9263a53ea12183b8572a54fca0d4d464a3ab4f0c6ff13b54668b96d986718e6abed32c3c4e87ebe0ced109c89ff25cec56a2'
            '880fc2d9d59cf9ce4666e3c91ef1fc0ba76a4c936f3b6c7e116bdf3717e2842bfa2314935b39a7afba6bb32f889aca4921328067a391e11214a3d69c0203ac4d'
            'ecb5bbdd1ba1a348b14c1f6c32b2ece49b4395d6119ca624c7fba3e67cde4f1653dcd3d02b7b03f061d0988d7924830cd22fa2e95e034085a4aab9de20954f7f'
            '720a61f68815924e7462171a77d2783a5047d9139daa42cf4c84fb69a9c0685281a4516af09066495b976249b9fba107a6e701d7965e3cf781d85625491e7e6e'
            '0496f3925b3d7c0fa3cf03d9240de4f9ee989d77056d55cef60b337b6f1bcd60f2d150df1075ddefb6688cf4aa9c75520161046dd75f83705ea0647cecdafd87'
            '70d7c5c1da59ca1a3ae61d7a2fccf8a8a3628835b3539b9ce346b0cff971ac9742dd8f5c3a4421c024ed8276657ddb5da17da87497e4c13de8765e2971ec977c'
            'b37f5b1281bac2ebd970c68786d4ada6a93f0b383610c5c88eb3279213c60d54fd2fa7d31fe1cbfd39581716d226a099848cf566259793ddbb2c7a4bb80e6a00'
            '88cf649ce273aee175b5fd6ab34045559096dc80a94087bf17b6ffdff22d7e0dd01a30d2ce5444704d81110b0ff775bedee5f7eb218e14e875292c0318c6b5eb'
            'cced9e738b8529009b19f70a8105c9f780c976e19218d55a84bc1d88361f46dc5325e6529d05db7200351a7ff007adde4c09d95b4aaeab5f5caba1aeb2aa46a1'
            '6935ac289af15eb48ab42c8fe69f83270408b6bce4e7e0ec25ff298eb0e73cda7863cd5825eca286c4e2febc83835e1651425f194620785c111e5dc72b8f3aa1'
            '1d8397e75c2eb032d8543f44bffff527287ca79caeb7f3c834694df6b0ac6a078c432ee055e7aa55ca8e3181eff0b12ce9cea5de37a0966712340c0cc65e636b'
            '1d28066d32fc590a238954b79bff3a33b9d9f8c8761317c68798831be51ad909baab68ff23fb5173758a0f013065ffb9397c41f364b55dd242446310fc054c9f'
            'ea359a07c2b7496f670dfed21549e4af9909aa21a809c954bd0482e74ac00ef17d7ca32756c57fa414efd711ff1c777be049ca041a584f9dcc6064c192c756a7'
            'dc50755a016c407154fc74dbb0a291a925772a13ca3b4121e53bb4e1d377fb0ff6cc7390b71f31e031738d87f92c2278ac8bf436a86fc07b0ee8f73c7f61b5d7'
            '030d2699320aa8ca703dbada4b1a2f42fec3ae2bfb5f9d7b54e70194826d896fec37a4b7a9945c18a1bd953f60177164658328004e541657a1f662e10b2d8705'
            'c7d1602324ffcf3db50d662945ea9a0426a8d2d428e2f63b27a00d4935b69da350d0c0bfe2eb3a45916952b189543cbc1af85e8609a2e20fa630aa4dd659946c'
            'a63e802dbaab59999ee391ad7132571c4261c48a55007c2e69c501c84c7a0533c32f282f7f43fc187ace0193fa67ded2ce93ef0c4da0d995176c8940c8d01a4a'
            '5ee05eb0b72413f11177adb651f386ce697cffa3e1e07ad5103cfb7b8de285aea946f3292a340b86215702b3758324a4aad0e5fbb301d6630f32f01cad6a6028'
            'd208f93586d22c4c29622bb2061dfc45195f72d3cae382e58d262cc847113f9d8ca5e45b8269add4d815d6547cf02d4f6c4b6e2e795a46b33dbeb6cb36d6ecf8'
            '98e15812f436c2feaf2f2339e63cdd4ebb1ad6497f317bec128c2790418fbfa8b8d968646b3f07a9b21bfa99eeaec6842b7cdccc60544fc41c72b5985263eb39'
            'd46ac57428e367b76a93e36ac17ab92d4fd6f8a8842da998ab528aa0527bf9053c1c9b9e73ebd16f23b1c6329a266de921ff28e9d8d96da2203ca47e37297981'
            'e6745d8cab994a89a7ef8d973da52fbbf65e6c5fff4e6a705d95fcedf7ce2cfcc3911f79a03921dc5dde6f8bce969e53a5368ed3455ae7b750e1791d8c329f59'
            '035357af0ce21fa641db0256545a80bf9b2571b8128e95a185516e42e5c11cfbd8f61d4ad30224decdf993dd0a4b830977e40ef0a3bf049b336697cdda9f98e2'
            '94b4ab762b6a96c4c8fde46c64db8ccdc9805114c748261a5b772492c564017634594d7d3fbd1824f82d8e880385bb390846f8d0d5ab4f9e97d4f0c5a3fff823'
            '8e22700a3c3f78d8ede1e0a38029cf21ee476c29c1c2ab77a7d4eb59c078894d895b84e17fba1ca25bc891f155c3f97521bcd1d0b5716744dc0e5f22557085bf'
            '4c1cfa3bdea2b3664e5f979ed840fbfad6225bbd67c3b62b1fa02e877fb4e104315ad690033a4278db53ef504e56cec7d125dda1597228b89e005bdf32dc5c41'
            '208d2bfb82594a336fdf4f3d26d509ff232c59c203cf1427f4733e264e2aeb0b2f5410d2ee47904b300d0396aed9ae895015b222f805b5ca86382a41b4420e96'
            '97a7fb2fe9a1cd4367bcaef63f292f3b7325a4207b347e86719f158885eb1f3590665e71cfc8a494ce17d1c2f08f9aa170949727108188fa9147b84a80ef1eab'
            '1f8ce94cbf86cfb80d749fe84b48afaafa774aee41d6e830226d4193d6ebedf34ea508df4ce6c3f466fcba0d43b6d67dea3ebdc6bef13eb51216c06335731c56'
            '9c75f5e8095a551a7e9d06294d2ac02f196311a1ef816c8cae312bbf63222970244ebe6561dba980f5a794e59fcd528624949f97a7693e977d4bcd81aa4b8a93'
            '8347ab8fdec849032d4429eb2ce40346867fd98df30401ce21890a4cb5de116e3ce440cfdf35ba35e6f0f3222541d11eb4802b39843498c3c4cb049805b1e823'
            '9bede0546f26daaa552141c21840e59ac7d4ba1d5bda6c635d147afbb872912d00a0a9033471f1c1f0727ff8004fb025322b59c9b71746cd632b613500f57e1b'
            '2e0e8bf8a5a9f9f36d8bc0657619cbe8d9d671691a8d23494d3db83df1b88cfc98140ed93a76424e484a1d1c08f7a442f2158187e9830ee9095d5640a88662bf'
            'cd68046d71de6471df59ef765a7c2576a627f93776b02ac63b6bc5806dacafd60fcd50cf9f6944de133c776f9f05a2ecad7070fce3f20071f03f3271cfe00d98'
            'a4251c1c3c254fb07f4c5fbd6ee2f18b45256308cda20a3ddf55f80dedf9a51db33d7159a5299347561673888dc251f8e76d9d87090c8eafdfa743535c11b383'
            '302ba773919d48070a139f75a04aac091be1ad5991fc3d2b2b1d0ecaa848987353557b80512aa0e1bd4d46e6ce42dfe2729a2f1a713d7d09d7fbdd12390a7b0f'
            '7879d283707b1d73057e3bf3ec382eb31bc1e604fcc9270548bd7ab095d97c0f9a8cee7b29b7b5c76ef640f45fd00e3942443bf14b20d701ea10cf92756e803b'
            'a24d8e35c61efa16be6aff9eba3ebef2ceb37585dd3948a7b8c090361047c63e80f854fdda7720920ab94fe4fd823d4d1d823cf3a08d3045fbeb003c9cd1a41c'
            'aec286ba8e0673bd74e42525b49fe4044332b88e1849f30bcda569a674b972c33fd0bdab9d9d625bf5b7a35d417322942a584cfa639113850081ef5e4e53220c'
            '3086498ea4ee78daeff59f851572bacc409cd018f8a7fccef58845cf413d291157215597d0b554db6c5bf39a0c21dc268c9286be80c9610c948c9fab0256e470'
            '24d269940b001f20867006a27c976fbe079e387fbf7d80f623126a2093244bd974f6e070ad11a4d46871b9fedabc4d335387c0237c5975223b64fc92e99721d1'
            '156a35b8472719c66f20b75a758d16bf063f7371f1b89154dcc57f1cbe29e9b6db9efa55cd17eea784e7e173b3006f64f3a492219da4e8d40c4994d9b537c470'
            '8f7a3f4705071e18569d516c71b55ea2c1f00d5bd78946f4e2b034cbf832ea5dfd47e86360b185fe4607263f753136aca317f222093f6cd1cd60c6d56cd5b54a'
            '1214323a6e6ff14bf6d47cc201ccc6a35ad3a8b1a590a8def5fac26bce51030c3200cf6560c752538972de218a9d2a226392d86dafe060755d06fa16ac1c1c24'
            '37db2d0eca11f3f684edf25588e791450c7c162384f2ab641c846655bcd33533caa5eb9e27d87f62612a91059ece25b516a8534ebe2ee124327366fc5201f841'
            '32023773df68958fcb4abe620ceb975e0319d9212205ea3d5e5745852956b04c93842bd9429ea31b25e1bdc8ca561aed8f8cde671696165b27ebcd7a09d86ab0'
            '94167f389c5b0672c55d380110d31f82c587141d88b1fde86d764d6da1645ace7047048a73f6139ef257003d13671cd7ecb71a19899e0cd00f44651e67b6b50c'
            'ddfbd774305f355754d512b874d419fedf9e1c88baf61e87a4b8b075c5b70009cb175bbec6e014f70b87e1cdf47624f21789e3c93a80ece7d0455d4713e13672'
            '52048018306eace2428605149bc642cb75c46cf3b4c275d614a731fbce4cf4076a95798b8310be7ab5fc71ae22d98f3622ea8f0f75c5948f1e74cbabcb8701dc'
            'af1fe21dbf477f6d638fed60d3dff6a460ef7a5fc4b6ff3bc98c6ab66139ef53b8f9e38736ce365e09149e306458b469e3862fb58ee63aeb51fe698888b82431'
            '0d9f1879b8edb8a871d011d89a6f0aeb7e900fca1d53ac9262f68facdc030f535edb5a297cae4234f70a794cbd4c95f43cccf7a03d4bc680cfeccad55d7f4a9b'
            'ef47196b8fa9f92bfd609823e41f95e207b6dd29963d9733276fead5b597698c1f9127d5c96cdc1d3333dfa7f1a845b0b6693e2cc8be349a8fbf13a9daeb301d')


# vim:set sw=2 et:
