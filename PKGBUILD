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
pkgver=128.3.1
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

sha512sums=('c5c1a2e951e0dbb1259a0f77a26b8678bfa4a4c7e909f8fcd5c6d0f807625926824ed235e114d9bab5e289232efaaf4c6691764db64860161ebc9bece9200f0c'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '7e213b54f0c502f3dfa1561cbc0c00cfb374678da18aeb514fd606b5e4948fe6169c787167b0f869c8c3501a50339ddb832aedf5d359fb4ec78866c29403303d'
            '2f0f6a22bde70af4c1a5ce495c3fc88c7f08bdb911fbef0db9a1176a9716f668cda8ecadd3cb73d35b28b7bc7255087201e50fd8afdfa72796284c315a61ba4a'
            'fc24abeeb18fe078c3231f216de0c4cf9bee36036dbbdfeda9b9eae7516871ed7eb246f02f0ba0a2b770fb05d8ca9b680f701331e53820c5e8042814f7811aec'
            '046df98eb50849fd82651aa67a8f04b8cc91929a75232a2722a1648bc99cbc82a037851348f4772ba499942c83ae7070c2c942047a3c6838d486c9fb88c94cb9'
            'f1705e7aef8c24ab7f3c2ebcb71e9697959f7a15d6a8c400dc68a0ed09a3b3dada8f8f0c681343a99da20cdd88610151433d81df04d4b58471dba2ea34fbf3c1'
            '5ab53b6be6a5dbd8ba3aa6ef4a52b5fd6e660a87cf3467687c37b51e73a494d520d0c1aef46b029dd4ed5c4c335a58678f5e1a6a66c50a105c71f950eb317550'
            '8b75da75504a66a4b4dbbb9ceec892c423483557604594ef9ae3b2a819e4c3b52b2f2a7f0e42ad25a9175a42b86fa05783c8434ae53f3af55040812889965cbd'
            '00685393b82d71c021c8e87d6f2dbd0967dc5b2d89877f4a7681452473cb4f577df25bcb22f2af0a23047770dbef19b14282726748943488c803dd2e89bcd192'
            '198c5132738a782989d68f0ec7933e24a23b69745438b0f1ff36bd3c5e9ab86698619f3862aea385ad0435416dccaaff13eb283b51b0ae9d04705aba2c1bef46'
            '9d5c01a18ec9080e7c15df54eb2303685333943264035208a1ce29f76da980068c55d9c06828356fef188f1e9bfe1ba05567efc69b677117abd61b1dddf7f55a'
            'fe099381c4def9dab4c66a81d1c80421df0ab998647bd9564bdd3a67e43ae42ebf01211f1cfc334937da581d9f937af4889a5a4ecf12fa230047deebe9d8aba6'
            '55ae0831a864d3538c0bc19990afbe2af3c6e5cf2c3de00f6764cfb4945c840d34e44e42f840bb64caae184622c944c8a7fd2d347ded0ca2deae63b8940d3f88'
            'd94f4c307c1ce6e1aa4de082c4fcefdbdaf595858844a81cc68bacd56712e9ff25b501372a3369440c1e47e508351fcfd82bf83a9c783c330c487ad2e2e9d328'
            'f66f446cd83add03f08b77041de28945a1e3098721a2769e65f1f6289eb0a00d6bfa9400025dadcfd3d178addca66484eafdf4116fc5d0ff0fc0c244639f48bc'
            'd55d5a9abdd7d3e26198ccfb3dc633a05d4d1b80b31b02a3f64e12421022e3f10229b76a78f87cd322beb43d862b5fa682960a38a8fb4ada3decc75109994f6e'
            '02a5a4d5d217964c7abdd630b06cadc2ce7789684434bec8bbe415dff5943bf45d7741070c457f9da99273361ac1c7de8bed0b8a627c6f3820d6f8004e27bfff'
            '280a743eb2e1a2a6682dbc3d74ae5ac071ec3a74be9ec972824f618ad4c09238f44b685fd0d8850fe4457249f606c900e33950727f00eee32e5975b6cf9c96dc'
            'd1b8c6fc15ddf6332a035676a08bf45044676f130502e12d66c84e754a3d082e9fef7bc3e85f93a834c67b497d7b2e023f5d2884b44466d02e52c8cb32162ad8'
            '7f149fb7d015353e7f723dddb3cef9227360b270329394fa58fb7f10d14e4ce86eb5ef587ded6e03fa9d0ad7f7fe27685fa1311a66d1e4160cdb207eb9624774'
            '9b7498c8a3c2cad79d2e6d82e16b8b8411ba3b6083b113a205a42e9d3534c8b49c5ede082abe94b9ce3e279eb3b764fdb26df0af16258e2fb63585e637b26244'
            '6d94c52d5c64bebf0bc16c964ea4722560af47e0ace0ff5445602daba96c5b78f072b7c15ae7a86ed64b1a10893ea5271d7f672a54e242c3f1c342f94a3221a7'
            '97b501c3038a6b05404491af0d497b3d4c4a115e508d7a7dfab3b51d5c5d09bf9908e990dc8e92c0ebb85fe32af4200543d94a091387eb592d077c78d31b9bad'
            '77915add30f8c1db9d5e8fe5538e79e6d0a9ea8a38e54a328ca46313c8a4b0d537a316fcd06d1a1834684b8505f63145afbbd594f8fdfd26b0171f119de689e7'
            '4a8d293666640a6f1f927963b562578dca581aa4085f0fd3a1f748468a8cbd74539e2023783c076430d9e7f72fd563db544c351be6092bba42ec2b3dc54eea95'
            '4a4726e3948b4449402cdb488d44d27d5b7d5b34e8bac5c58a9a2c4db7c930ae2699af02af547a611cc8a07db99a77b4270db13f660c4204955658d0fc8860ed'
            'efd55dacb7b7caeae258e389d1112a3dd2e6f5389972990c11f9f686e881e524fc98c7e79dd50a22760ed0ec3dbe01c54b8a891d249a3bd34cd24a22f6087e79'
            '62ad5bd92bc57ef7a6dcb754b2375efb92a74eaa8ab249188cbc9881f5c90369e2b1cf96461b84fcf4d5731ee7fabdc6f4e8c407198b470953c9a74a1018f049'
            'e6d1fd58ea4c75c98b5daf3ec45c780668586516a95b262034cd02e11345b6b3af415b050c43401d84b63f21668db63a855d11f83774c5017e9475aff53f16ea'
            '0fabae5149d9bcf61aa6826766d7b74f879d175e021398247ce4bf2daf0c85415a9038949fdacf62392e2b2b3b4f2142c482e341fed45f594534734c49afd697'
            '39dc9b1a1eb3675cf6731b0a9092d975d3312cc4fc0b1d934fba50f50995fd697abfc112869f9668800df18c7ea88bb15deb6e6903ad298fdccee63c65118004'
            'd37e0a4135bb7dd87ff4f7b7b5f24c9b9ad64139a103242604a98372ac13f426f2fa8cb2e001384bf8cda71fb8edb59e4d4e5624ce1fcf5788c1c77196eb246b'
            '8b0649b9e48b17127f0c9ac13c02ec42ef395c0814cae2b57687c9be737723b8f5cf9adb22fe5d027b76998ebb48208a935eb15f45ed712f0351191f2a6c21ec'
            'b3ac5a0c56e363a48f6bd635579a28343122c54209d6b2ce0fe1ed9f16d53280bb7adf95815bfefa4a546c632af00a0568e8be63a9d3a86a20de34df7af65753'
            'd315f85734998d128a24acd12a9f5b5eb12b15f02571a008366eff1ac866ecb47a0c4f86f30ba71aac3d9e1cfb6041bfd138ea8abee7bb9e7e11bc7df4fc4adb'
            '8a67c3aae5a489a346a05bc560ead85ff7a5873d9850c9edee0f2cdb2649e3f90699208769c5099c347731b8b4f24ffbef011a9542c3977173211ce5e60ffcfc'
            'b31105128926a84d10bfade01854c510b32b0dc53520f997e04a17fef37e100faede0d726153b6f2b112d65d2516da2869b3cbdb7e4668b0975cfc6cada10e8b'
            '778a39c1d3bf353477f1f2c7b82d646b06c987faffd83a22f19fd344e95c07cfc7bc7bc4860f598e11c370c8fde85630e51eca763357fae006e1f776fca91d65'
            '1f55ab73cab99ede1d959d37f8a1789bd221419020961e103047dc47b87ef613efcc1723e1e9cc0aabaae9e9fcda89a92940763450d21a035778c7224ca30fcf'
            'c916e24ab33f5851a2df1c0a5c938e505dff236048139d66956e57a2b1aa7b7d1e75090dc226594de899863ca8438cd55d63cd7ea59abeb33b1d94816b804108'
            'eef8e07280292360a6499577589cd7df3957300c6bf515b48a232cb354fde1b1aa3348830cceeb29d28243b413eb77c04e484622e68d9d81c71f0fe81340fff3'
            'afbdb6ce8e7defbb87a3118c635b24d9fc447228d25875c1cba7ec68e8f1fcc49333cdc2f09b01207701259f96f832e5b277d1a10308467f427289ef33362b29'
            'fc5454cca5c8fe47c90ad895bffc40b397b34bf142d20212e3891364c6fe7398b1c85023a1bd6cdebcd7a089f0bf1e86e16abef6d140377f03a72222ce4fe99a'
            '4f7e8e596d4250d97ed70433da03dd1d8d58290ba0833831e7dd85c4587278fb47d2f8f68aae146a7bdf63a5f640434e5a9ff19732367bbf21a87aedc02a7e58'
            '46d0613305dead46179dbc81282c7494b16981005f59ca8d360bc1445cb5dcf7904d282313862e1ab479fe71f109a15cd05e5a7ff1ae801ed3918639246ee4ea'
            'ff967ea9b551890b3073e73ad501effd1d2f1e7da65f8ee4b57d44186634c8f8344e3a6fc0456015969c523af2f15881b0f1c2da1cc1f4dd7c0624789651a910'
            '5c6dc0f9d6adb80ac7b7989af0ff53d2f877586de63b86eef24428f1f89b38a4102b639b6f802fa30b7df07fbca7f9d4ac8f4a47d454aff160bdf56391c3fb61'
            '63e6a9cfda694030dbb0f9be3f6aecd9f90ee9ac0f41257e24495e3658e7478ee0f6e54d7ba7a52a653d115d725298263350d488d73333c3509c10b4e8bc4758'
            '6faaeec614d999418005055bebbb290bed6260c43150938ecf0b745fa08b6dfadf5420a364da9cc173475ff520fc14733263731b3345856b259110e4ee8dcc7c'
            '4b405da69ff132998ea8f0bfd7b3ecdc700d20bd63446fafe5549e8dc89a5b04ab0a212364c1a88fb32c478ecdb1daeb8d09f1cd59185d8c48fae82cdd697e19'
            '4b5fe6a336f5b5f247f152f7e26d45855589d61ba241a2a00f1e74fba1f2c6af9d3d111868914554d11b8cd42d254a405796e9f9fb1bedd2319bf126d559e5fa'
            '63fa755a52d36c17b3dd0fc6a17e2d1ba6fe63edad635798f260a75910924d2fccc41cfcc3ad45a093568e6262b1d73d34bc7204f42c2147d387f187ff4305e9'
            '81c83c2385c484f9c2b72c2bfbe5c3f21c72b84445b39266ff3b9b9bbbbb7c5569521ed0677a91f4166f8d10b4f8861eba3c151f92cb8615561db4d9494c4d38'
            '9140d452c443ec95bbdd41a027b374bb2011a69d106e6b2ed65447000aa68a23cd556d16e118befaf5877225a3297a8c157f83fd7b7b48cc27300d007749bdeb'
            'c21994c37cc5226bf60f6db4e97c99746d0f7cb2718110ff28a2a6e429a09b6b4a121f9f79402b82f12ab380e89af878b0544d68ef3d8cb9ccea8f3f80c7fdca'
            '8866419e7077fc459428ebe3e5ca78c43aeea5b3d774823046dcd79146b4c814bb519b49834b24067030b1e5a3ddfdddd52269624c453accf35b40b4ee6ab84d'
            '8400188699de5a94572ed5b6b2ff2a82a736b8ef7a99f6c9b594c9194ac6ad9aa8dd2baf833c5e46140e0df65560b84adcc0f25f57817623aeb46dc3cd5f3ab9'
            '2e6f6ecc16ca5d4e24c587784271ae17855ba931be46be67110a808a0749a1cebca987316ee17d20abfaf87c4e92bfa4d53071988323e38124ff3f1af819579c'
            '1dc40cc3ec888817d67ece438cfdb5944cbeb5e54c8ae4a30b49b3e8430577cfd88ae728f6ac2c07644f938525214f959ab3aad109deeee4d45470eb7fb5c9e2'
            'a826530fa83d99a2749a7ad8f256f42f769520c4ab62320fc602822eccc802a1808a157502f45fb7b2d69b11a56fc9e466e03f35a6b3dee0d80fb27019b58211'
            '11d581f395ba22dae6830173f3a189bee4bfbfe8c152ed52603010053914cb132216065417bdc2abcee659657b08f12b0c8958a47b3ccde74cda9d1d8841d4f9'
            'fb7bf53ea84e5b6d91afe42cfcb9e8304e06cf57b4ec7e2f85f8fc7fc1a36558d05d9fd28eb661f82682f3b14a062a6bfe31cccb63ae7a8297de6d2e48df5d38'
            'f7f2262a100e537efa9d8871427259ca82a21df4a2521f91d215ceb93f41308aa327ed45c4d8959baa828828f0d8fb25f0d23edcbfa7a6f204fa8655a9e6b45d'
            'c77e6688031c677bb87981dbc0bc9f791f79eee204843af18d9ab58b5c31fe04e284247d76c5feaee0ad4b93f1abde14d7dcf6d56258e33a23ed270a19105d59'
            '5dfb44cae5d56556233188deebff3916739996e72807b047bbb19734274e4d9aed9c10b513bf6c85c9f10d2e75ee4871a5e097a9b404317b986da06d351d78db'
            'aecf0af03246ce46a55d400d4a537e56c276f087e3aa5b0ef0dcf7581ed1286f1c9f0934d809d7d2a3a05ef19d9494c2a374b8e93c1d231e004174d2a75ce62e'
            'e660819c3fbfb5187f3b1615eb010ec795191baf20b7ee3790ce8e7f219d2c415539610bd00c9676298133e1c5aa22ecb3a9e01eb7e9e13bdf10be4660c757e3'
            '5c1c3b3a9e7f861ba3912998e559980dd30e36945f4730b9aae500233f4ef4b33821dcbc6c745a39c04ce072ea8bbca328e4407ca0e781575e68443f6f6b56fb'
            '0f7ab657b82e04e5f9aa7c9ea4311f459d0e1e33623deec6e7610055674918d34d9caa67355072d3b58fb75bef9dbe36795c364b76a49d37ee7cea27651baf51'
            'b4d3d62bf5d4ca3eea1d016a1dac4994bfa75cfc8ff22f7f9ac365f0593045fc83c6939f10663138ebb272d89c6eb2ac68b26f97aab4beb51b011ddbed7f7ed9'
            '91732ea8a5d0cb8b1dcb75ddfb43a78dc8905552ec296eb5561a0f135ad7cd4f04bc5c1e55c46fe0e75b72c8540a3d26e158e1dad3b1a82df5aecd651f7e470a'
            '821705eb271738da2a43c83a68702c7bf02d926905b3db26645ab1300dad0ec0a51a9b9dd3c17080408595f02aa1d7bf669e5d7e9aa105171bf878938ebb0cb9'
            '5aba1febc78dc5219e4bfd8f8ec3e487f62e0444286434e70cace14f1c6703efb20e22351b9f44732644b3258470abf50ed533029760eb4a6768c35851f71775'
            'aa0b0cd4c17b027a07e942b22abbafaae11c42c8ca01729777de8e219b338470bf4e5ffe2ef216cd3fa635e479c517f30b504fcd6df7ad9978a519199a8cff24'
            '1da34c1e28840b95e3cbe55a853791e81232e81f838b3791825d7fd831985f47e29ffd101c40d5bfa8526fd5909e20d06cb9b3d4c5ac3495bb0fa91aabd28e84'
            '427f424e45cb1377d9cbf45f4eadf369d06f7b7c83e85b411407a33fbbf421ac5e76cd85ff824a5eb8f12752b515c97001f64149121d7857efd686c614b879de'
            '8b11467fa145a4262ffb3af23566a809ba5a7058a016d8783abd61a7586e9f586baa8e72e213f5bccafe654a75be9897af59081f8cba1c9a188bdc400df8a051'
            'e76e88b5850f203e03fd4d1efe48fa5a3636a4090d14770c6aef0aa13495fca3695aafb463fdfa58316de9d8e62deb8f2b5786a63a1aac1e3921da92cc1e3fa7'
            '5139bd2a258f4ba7d3db176d017d193332876cbb7de5be935b6339adc9b9a1850cb61f48d089e7bcad909278be9a1ad35339b5c40bfd351cd7b2e044cbf5a5e1'
            '8991676cb3d908d57d347be61ac4eef55e5ff74d35f7aa411d1ce099f705b4d6ea37a6f5798cee8e4be986169164e41b41c58181207a8301cf9b589c1a548036'
            '3c5463896e97b518806a134410dbb720d711b032d92526133e40039c5b8307566f496e03014c2c46cc7878a0db9a825885568e1177432ff15664d9f7bbda502e'
            '1aa7980bb1a026d2a0dbfc14d3204c41361a9343e84fe32cfc1595041f812bc7b193eeaac9194d46c9f5607c1129e57295cf96288151bcfc1cb67e5714adb8e6'
            '7d05296ef804e89fb1a2fdb59da572caf5479655270368f12ccf2c2108a2695d92cfb09a8e19315b20465734fdd57e25c9f397a3ab65fc222d1f52d51f788301'
            'cae11f08e9229415417dc9222f524f3bbaf477b903c4154e2eb63dab28a90e05c02f4477a171f88e33956e7331f68b35dbadad44a6e247449f4f754f858de2a9'
            'e6cf3b8b0ad0f23bacd9d2979d4f819e70fbcd52997daf79e0c53769af7bf296dd5205da05537df0c8c4772ec92bfb987b9a19d12abd94fbd0af097d668f7082'
            'b41f43a84e5039957b2c6afdd7dc7a54b66f460b727d3862075c3244ac0f1a986ff6d9421c3b503c45998e27ce8559036525a8133fab4834875174df72135728'
            '009c6b0947fed95a3d24024ae673df15f8573f139fe81ccc8d30b3e50952117623fa58d6b094c83b0ce0c28e6da327b67329bb4f1d1071f573396437b179c08c'
            'a79d992dec998466123f620ccd1c741c0720a2ad7dc9d31146c4160a1a1c282a0207d854fab532c6fda9f9195618bdd864a39822563870d2da037cfdb89f7a38'
            'bf9b9f5f9239007fa3244799ac0084cc5992157613496bcbf15c67fee23637b0e08e162bcc1552a5e42528b3d8b9c0219ae61ac1de3214c1c74316648d158358'
            '1e9e7cfcfc9fead32037994f3569c48417784626dd3713a8b0eceb45b65d9fe441ea84ed89db5b882ea4460e8d891486e9dc460bcf323807b7e67a8ed5f1d6f9'
            '0c29eb62924dbf8178c70b8b410ae4a2f54f52cde6182463ae486b32441d8865d1a463d75ce982ba06037c01d4af47693277a5b0dfeec8198fb94be708b8864e'
            '8585316d7c1a48a2f4205c7c622c1f3ed1b55bff96deb59e991a9dc9e0ce6048f87895b8838fddf31ecf73772cba2d21e22cca4efa4f8a821a5d8f3d03b77000'
            '3e7b63185c5f79ebf8e5d2c7973a66333acbe86e34c8c31925e494f99a37bdfa130a335f8e8b123c2f1dcd5de2ebec1eeaec5e676e42011b3497acc78489e74a'
            '130f56dc615e979a4e168533be72c37ddaed1155140c39503eac5498d68683ed81088895d29172aa7ed2ddb912f409a5e08d1b590a00a252431f5dbcf3132491'
            '3d969044933b2eb79c32c68cb247d617b9ab07411b6838b2261ed29bfe7357bd272aee4158abaf841e31a22cdf12cd4aee26bc79b089a70d76f2ccd716e0eb76'
            '7f136bba190419ed5a0fbef9f960cd52eddb077b897b41b09086dd067a376b27d572961a6e4545f6de2d69b738fdfc2c90154b867863c731726826f48a5286fd'
            'da06ee72e5857e61f50dd806dbe1a816191ba81c7b5f8093cb4aac319c6410829e0d838609357775720fe17854b75e1e9bb9e757ae21d20e336c284cb6d6f573')


# vim:set sw=2 et:
