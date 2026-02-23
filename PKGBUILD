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
pkgver=140.8.0
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

sha512sums=('3baca73c5c264884afa4b1d76ded4417119640e1161b8fed4ca406f0ec44e7f685258f5085f473dc9eff9057a6548a9b59cec3c696358dd1032503aa75f91d05'
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
            'a8335db2d65d9bd76302732cd2c255a204d6f3880d5ea4841d1cb25dcb88a4c881d8e141b41e0e3cd4c1496e582e29a7cfcd7a159ed638467fb609bee542b9c0'
            '40f869d7698a0ab6b3ec613987a50e34de9abc5515c49f85d65e4196f9b3756bb06cad6a70a22a718dcbf13c0cc147217727101366553a505f047809d5a60ece'
            'de61a15083f162a7a49ec86d66aa31c2ac150e0b63d55e41939f6569858303f63699fc177b74e1fa300effe753ed890ec47c4ca57e2df4bb9942154bf526b122'
            '56f17b2e17472c366578c42588e3105ca4af6ddff680021b683fbccc24cf4ccbe2c3c1be34af0d18d3b1f32a0ccb31e30274e1acb35cb11d233260c3799431ca'
            'f91425ece35da1dc644d7f5eae632a7d517d43a325114b860a52dd3759fd3127fe79833638e889151991ecb251fdfab65a79da00c342e0b097c3118f0616fe4d'
            '2eb2be8dc2f04e16989aefb2be20f1490d051e11ac16af2a244a14e3a90b7e575cd1a258800a844f8b00ac76e629b315acb8c8dcf8a62dba294eb73a9c7d4f9d'
            '1702967115e1df19b2a3644ee5cf84d6ec1da982dbeefeaddd23fabab130a016c7c60d32e4581f401b84fb1d2a67e24fccfa80951899b4ccf13ede02d592ddf0'
            '44000d6475ba524eed7d541ee3ebc7ef2c4734213a5b887534b528aa00efc826595763e94c670726657cb421ca785aa47d07c17cc121187ead884af533dcc15f'
            'aa837999cdac1676881eca05baaadd8c61526761730440ec3cb2db8f2badf41b4f533604a0d2257bfbc8423a7db4ed4e633a07b2052a6bf75bd5cf6905c2903e'
            '0621cab1c06215caefeec6aef75dbeb9a8bfa4f5141f93546ea43b56e35ebb4bb448e84fd3735dd12822ee16941deec1abb0874aefdcdce9bf073b0684d24336'
            'f8d24701eb437e162c2228821967b51735c94213be05ae5a177b5bc8a481937c251eb91d3d0b6b5eac0ac8d20b21db9e8adf2cdcf1f46b331b294ef08c04b054'
            'c5b7943be1f38cdcf11e7be1e4e2803317b49374b146130c0baaeccd6023c922803a03589de4cf16bb80499958125d0a40bc3cac112dcde565850d9a27e84809'
            'abd7aef35e933231dab2079c46a7b86952d3da95111c8774af491b059efbe432a47d055a8ec00df00762d62df35ac7a30166ee3008add1c24d0493e4b39f357f'
            'a42ecbbc87cb99c907605bb04114f202e956f56895c51324d5d49d232f87601f39d5db706738cba0dde425f412ba05a2aac8e5b9e32203e19a2788c57e49f882'
            'a86fb4e74ad726ce9cfae0de2d6eb8878e12e13519451038a8fc12fa615fbfad1e6562ad30728ca4613d052e4f709b99f87ca41d9f6990bd141ebc2d0567a4d9'
            '76c30c0ef14796e75691e87fdbb3f16d75ec5fb0d3df703761d4ee23db3af04302dc02cacaf44f54aee4d9e704be8aacad9596b785c25e863404d4f2f8aee7ca'
            '1d22e4fe44f73f89fdb07571dff646bc00b4daa28f48eddb5192a14f0c807a3dd0a0766c976d3153e7250c41a8a006216c2434d0a58181afef6e37e88e30da3a'
            '0e36521e68423657ae42f70c3b1165dbd92151dfd99caa90d7824f702536307cf181fe71d2685b5c0d4250eb46cb82058f43c7de8e8248f60d44235a1a2338e3'
            'a2f5136eaf53509baff062f9cfae82e84d64f921375eb7f5d092553716545b7b7827df3c2ca220ba4b74c5579da2eeb0001e9f5e2685243ffcf9cda8dd3b65d9'
            '330afbd26a7ed10959611124b2644f7dde01b650076bb6b60b527e4d907c59c18076a41c0ab0442a3bacdb4eb340a62e84ea525ff4af9d957f4ae78f1db42135'
            '3b4c7b30c482246f490c90334ae64ae82b0fdacec89f22c8cc6ca6f564159ea66b22299416d038eca8039292fa81aff8bfc461313c6e7d0ec20144d57b613a99'
            '8b070d4c892d9a992a4d01176fe2d6bc89ebceda5f76fe135eb5a752565fdfabae8d4f8a01df40952134c0b00871cd691071efb7b4f7811f7bea82cfd379d864'
            '8605d62368e04b60a724687da3eb425466c44884cefb7221ea5415998d1c23f73ab0249e4e85e5912c08b2d04a72b7fb0c96c12c4c0a347f168224036f401987'
            'd820751f24ccb6d12a79d1d132cb442bc5de83fe9744ee80fe702d0beca051662b2a87f4e077654db6402cbb2c642faeb32624b0d74c7f3d1c760b49e586c3ec'
            '1adbb344d7bb3e9305d596007097c7b6c1714442f84cf3842af2606a739e8c04576812ea7aa76979df9913817e7e8b88426692c2c17e530058a45f424846d7da'
            'a8154a01632793143a8b3aefb2015c6241a7fb308645ee99f926c56dc1f8f16bb25d30f0df5b13992663a8fd310a4e86e3892a098e0484facf2484f589683424'
            '58e888cafec87a9ab28e3c26fdb0db9b5e2d2bdd6f3d8c43da1575f5bc8d21bffa05bcdcb6aa6ad2ab17592556452126b9324a667e3884d018b07457da366e99'
            'b63362b65afbd437aa614a0ac5877f5f254b2fc8f1420f516d7e548ecd5fb596441d0d9445e433e801ef226ccb485fd848d0941440c93647edac7bb505a455d1'
            'f48cb2410b48c029aef2f047cf1fce688e748f841e17752596e65148ce439f81daeefd6aa304c5bea75f44480cbdb62fb534e4a9e83c9735a1388bb7a2431a3b'
            'f92e34db8898344cd38f1eb603fbe5f2efc83bc9120cb60cf2c80a497ad20c553bdb79bce76b16972bb15362c4c8a11925e3f66553e4b57b9cb578084897c336'
            '6baf0b584379f90cc95c035adeaaafd83912b6005aea8c6a5523bcc400b5a81f16570a495aea2e40c12fdc2c8332e2cbd4f3280257ae04f2578d02721390bf30'
            '28b3ef5b3bf1a9a67c2e54f1251cc72f2a6fc7a638813354e5b04a92ac7bde0d85dc7e60983f89d0ceb0bebcf12c0f5ef2a182541db2e135371b81a4a4fcb603'
            'c49b2e7eea39ac2f4f08c9038bd3ef7f4bf7ab6ae113ea16f86a3d2e7452329bb8f265583e310078e10b4f6434ea129009607f294d9a0476753fe8a0da248d13'
            '49047ee0b2d73985496ad0889bc6ebeeee960dd36150a268f680bc0f524c7d37ff56eccf153a314020a24c6724a194e47465f84117f7d1f9b75991267d0028d7'
            '8e86021bbb5fd7452039f1c5cdc39af5a871f114a64165a073a91e6cf267b57f7522d63fe25e353549cbb8da4147a2aeaabab3cfa8538dad478f884c1942d978'
            '58730e0ec87c8eadabde327694cf77bf2e6c5ecc54f83a562acc85ca23efc0a8df8b4d78d87c16f9bc502b67236b16c8c5c8628f6073a7eeea5800de6f2a2ea2'
            '6562f2935f4d059e6dce29cf7d9d43de8d33cdcf2ca2abbf837ba86280778b738c06e6b312a134b8f17f58f47a6e190560079ab18e107c79d6f4be083eb856be'
            'e3cd6b40e8e50193424b694fa44163f8113537377ce3e213475b91fdbeb99c10a8a3c637242252945f8136861f471928c00bd3c162536582a604caa684a5888d'
            'a9051afcf5d996d3519cb673922266f0a6d2506067e5da67ced850998b38656218f10db78ba59d9814048a981b4b669a5ba0ce58ad8a15428876c38fe04f15f8'
            '7a9cd174a69638467bf7a231873d3852bf85d608602b8ca29e2dd6046e3c9e8f30810dc74d0bc6b2f7b78aa262da6940f8a0f4722d04bd3368a3a98314a3a2e9'
            '28ae46db45d138f81fce33a7dfd4976d3d2cb996cd5a67d3a290b73ffaee738bbf2b66a72ead8d69ce756c50676bf0475312e06fd98d09b7a7fd5abb4787f49b'
            'f5191aca424160623ed5b3e934164b5495a2bb2df0849484cef8aff9edba25100a0727c97a3a6a2dadae9d2e57197fa6b2b140eb450073d6d403646df7e98f1e'
            '725414c87a2a20093ea6d65427c679a0740f223631b91b1655ba5ef9b865ce3e09fca0a5b26898049864589742dfe0e693a29b636e60a3dafe71920aef2e2895'
            'bfc9ec703bdaa29eb64309a962175a480e70a129089ff808320fb19912da941f42a0c86458e9dfd76194d88b25ed537aff2295a598c668615d0835087946e2c6'
            '196c044211c6e30c76e66f0675f9c54f0f3b707e4c7adddd8634c2887daf08c323f46b178b5e5096c3da3ffdbc43d0f070048515d67fb5cfa8373462da961f3a'
            '1b54bf8b2e9ae42d6c5c62eb09fc3194e15553f579325efb3ddcbd62f1d0990e6567a06816ab8031ef3df0704924aea666e04a25fdde231bbc65fa5e0da8f230'
            'eef92991047cb9cce61087ed30cf4caad5d43bddbb1856cc4865289a14a5c938a727c83ddee5fbd27e530ffc23f160df6dc95d54ea996ef3bfaf885a4a40507a'
            '6f0b3ac37b01b2f34907afbde41316330854e4c7879aceffda6c86cfd85573bd9977180a70544e7c9c639f4a8999d206cbb55debd8844e4a87eccb4c99426594'
            '642910bb481920a3a7e1ce1bcf4a6591d9740e4e5dc5491832661fb21869a2def62eff10d110e70d7f5d87efcb2224517d791ac0e70b15e04a8f143080f87264'
            '7b6755cabe8338eb31d1bc0ab83697a82cd8fce5c475356eccb045e20da355e430cfb8cce2cd04aa6de0907fba913c83d229433a1cb115e2d77d855a5521c0de'
            '463028876ff3b48f84e39fb736714368efc020f1a143843a8aa09a19d47d73fc495b1777f7074e42757d42de65b35e3e5e063d3b5b2b81cc8aa4806562298130'
            '16bb707b84a65064bb1c9e407b5f6c42f3b2230cee1eb8244eaef51880d5945b6780d676391eb2caf855a3863ea26646b04e83e3b663ae759b2a66320ed447cb'
            'a5dd42cd6189062d411185ee9d45092bfc8fee7c67dd2e14a458dab41f7636bf3f9916bb8dc8650ce9f27ba917c7850a6a824f282505ae702be570b2f46b688b'
            '54a7d749341edda44a4ca344d156f4364454bbf8392b4d7a2fbe5812238cd135511e191c1a819d296fa6855ae0def6a44c381e82cf1125b8490bc8f6fbc0a542'
            'd66bb2da7ba03fce859d24ca922add5a82775140fae31142c1647aef3eecbe00efd85d44daa405d3476928a9ef455ba5ee541713588c2fa8562c430345474a7e'
            '8d9570cbf4194e763e36ec44e49b18538c9a8545cf27a43327201378c9e652dbca51797e353d1c0bc30bc1cbfffc6d1533ba235c0882b55411d362941410ed15'
            '5843128167aa92e36a2deebbaf25175e2070accee4c1d2a4874e5dc8bb184aa816797395629d106e1957f1455cccce90a0769d8f8b6b300f43f5712f51e7cbbf'
            '43ac4082b0ca300b4d034af5c152f07fd8d8d127f4b6f9867e6e13b8ca8bef9f19d74d9a1de5aa18c90fec4d5f275cf38509228099ff37426818ab0d1829b657'
            '1c4d575836a4e8ac81bece8b214e959e58bd17a45b1790b9bc25e71c16f09a362ffafb5e2e896bfbb551a8a12a61027a94a4a65a0c32288b4e4af5d53330828e'
            'b3ac6b69dd3f33c0bf402639c34dfc720865538149e0d23df37bf539b2275c5523d79072f543751adc10ddb05325ec95b39eada6d838d11390ec171075f9dc1f'
            'a614f9c228f78261fc18e66a7a3458a05b07068e3e692545835bdc195c66e7f89cdc80d0beef51d6c3b7ee73c31ad44c7dc275a362d80f76c711ff68c326fd7a'
            '6de54242742aba6886b40ab29ac3a7d13153cdc9fa8b671fef74130401413fab87687c188f823006acb1b08a529a9ae6f22a98f9b100521a8f6ab5436a19324f'
            'a21c1d5b6436fce65818bc7ca5cb34e320226c03279541522c3f5c2819954cf4cdc0c45b3773bc2e3406b84b9f0a7bd94bd4327f9306afa9a76f2925d2abc848'
            '46ecb9c232881647258f2e8f8de4328960aeb21228f83fce20d7d39214e285700720e3a86ffb2926d584d5b8961fdece77119213deeb58be099a19ea24120d9a'
            'dc119a660cfacd26628f2ecbe63baa3e7e52f8dd104733af344262e39a12d67a31270b337e8f37b5aa43bb26a50c4382165605ce32011e3653c5b7765cba9950'
            '7f78810d1e54d212294c9329788c7549541cda0efdc4921cf23a302c1e06b8ce56cfac389a5abf58d6823333daa713efbaa6630e0f2ef35905251d3d5e4441db'
            '764460a90f03d86589fb98097ec72cc8830b8c0f88b14c73d05cc6fc7b67848e74b403dfaf5fd4874f979e8fca3452df942020e8c4ad010b1130c55db594e8c8'
            '357787925b350a2504a3b3bbe42ce308c525ffcb8f8ebbf7472de69a6a0556b13f59586a7b044c24356689685244ab14bc88ba8235a6a17f08c67fad44a401c1'
            '18621bf715dae8ddbf9d946e4588ffc36f422c247ab7a69437587d8648a1a0a8d902dd5c3fa9580baa99ad98434bbda8fe274b9d3e9f7656a3e8b40fbc840601'
            'bfa87046f26b1a0c994f6045f71f1b3d41de2bae1089fd65e43ea926a1697fd21c778ca71bec8884ad7fa96a24774e137ef49f3e64cd884434df29673f1c5101'
            '4990ef4eeb9ff505a4e2c67146b355f878d0b83a5b214ce2f4d1d5d86d3c667336293df461725f684810ea8d5ba2bf33923b73f9cbc75e4833c6a6f461781d69'
            '54e0b5e70e9744ad9730436e10302d1b6dfcfd35a136a41f0c36dcaf81707fa25515924a73baa2290b15b02aea467c9f879feedede973bcd05c1ed97df35a2ee'
            '79a5a3334d4d5be6c19c4ef3e52a5da6b470a44dacab8b2e16a4dd73c652912bbb47e2ac2879b52d7460b4745d40d13c23f2da7f3c178c5d951cda2066c6545b'
            '2b18e426959ba7161eb7a8a4407681ba35b2ab53cdc3d7a82341e64531374cd2f7b6eb381192538e7d1504b7dc467066d02a8b600d65505c877924777ade4e2c'
            'ba2682a73089a33d6a6ccb8ac70d2f795f60d9e7d6a363e33e9aae45147a0944f33c15d3ff7d216179ab492b22d06b807a6d236bf0f81362a2ebbaf26f64cf6a'
            '31b3885dfee6275446a9cf0023af1b9d215516ee6c75c21b2081c0511f41ad08b7044e153b9650fbf3c25c8aa38ee6d50cd3aae0aeede2e5b853c8303abd5c82'
            'b33bbbd26e4cb9b1ad4b30916a495f889b8788333f8182cd4f9f915d7bc1a5c8cc051abf0cf7b7ef0af6e4433eefd024249fa0c56ac4adb09241161e22d05bb5'
            '522c2e4a8daf3efc41b7d52d672a0042c29558a3ce74fbc50e7637d05c6d96302092e799f353294aaad9f45909ece2d5c542dcbe1bee98a54602021a7a648aa6'
            'fb90408bde050b5eb3cfa190bf8f3fc4712d3a5931b362080bad67735455e7efc4af633a10b9b1380ce1f6461e127ab48b98ff048cbdc766c14e67810ee12bdf'
            '593b4a40dbdc584d192951f36aff191010822aae08bf649ab37632d78ac51a37a9b011e71b7b13bcdd12713e160a6a3931b7cdcfbcf8d400d2a391ce22300420'
            '768650233627307073df800d30669468e6a7ce2f400addfd8b9e68b6cf15337caecb6365a94aba7650cbde1e902315f572549624ca2a052551a5ee5bce8598a5'
            '31ee81d767b112faa59c93aa05bd8ea36d97df979af13d3b5d18a4e03245c621062e58ad268d0f7fe67b42fb5e817473723e13b46a34529cd2babfd31d4a2295'
            '70e5568b975d6c9852ae869ba06ba9a1a73ec52a64547d8e8b32e2fc231b343eccde171b984ed61f3d1d25bb9581e658065bdd5cfffbebbf2d08087dddf56363'
            'a4f91fedde9855013d35b0c8ea21e752415f137076597920304612405c71e603ec7729d2d46f162496e58c62d8bdf12ffd52349ba24012fd948f3312d22896f4'
            'b291df537f2f043c60714d381218074bf67c6696f8faf6d5621aa9294845d6f4cbc509137f19c29d55547f46162d0120a1c524bda5b6002782fa3bca92ff2d31'
            'ff3f962c0014bbb744e1dbefc6db65c73131d4ac8b1f314f7a82a5a775eb09caeca24f1c08180c5cb1a9e9995c8110df384a0c07a933d1a6f14842233eb02598'
            'e33b7a0023b460504c1327927d45c7115a4a98cd04d5cbfa38ecd1eb9dfbc263b6395ce9b9bf295954aed528433e7df73561f0a6b48a6fc11a27b79e60201d90'
            'c0376b1c3adf18cf93da0d9303c92e1952cb0c374b0b3a1b21a895541a3d1e9d9c969f6f4e5f7412404bbd9b85262a3df0b373f96d1fe4806bac2532000013b3'
            '072c7d3ebb171bd9be82b70232aceeb5cd8ad80c000c9c5bf44df97e8a70b04dade9a516e5bf8047d209c401400b9d60a290deb6c4ae0f24aa8bad7f6fb7e5e7'
            'cb63a2ad57d819ac17ded9dbe65cbb73009fe149dd131d6ed5a9f2a9d513bc121e9267d1e308af9e79fe9d51385519472a183bf7425cbf6537c72b71dcb2e0c6'
            'e3dd70bb4dfbe3915a5357a0b716292042a8d0cf01f18f9b50bfc60ee21a420baf78e49d4cf168450c89776d2ec98caf9ea72e6cd6d04a48a80f86bab91e1a98'
            'd2053ab4ebec388bca8f22009636520f85539499ef13299dddf1ca32278ed5f7bdf9b6b0b67621d6a0219aa073fad37820a0916545aaeec2f49e507edacccb52'
            '0c2d5b8121fee3e30a11e0ce9beca3bf4e36d06dfbcb18e59c585fb38eec233c951107ddad0ea2508f6714d81c3a812540dd104ce385ec49d197b3448c174a8a'
            'bb0ac20b97b8272a8ef041c1a3f7fbbac510886163115d4981f29dbf1cfedfef8abdc96d381a2dbf9675c823fe5f1285b8dfbecd7a5fd0a614918323974ab1f5'
            'f8ac0773fcd77b6daec1016d50589a6139261db3fc32eb45baf0097e2276fc414ca783c52f816468ab514363da4b90e0f33ac7b4f847fbd48c410942894424ae'
            'a6cf29d586170508031ba18f0b7a8cd4c0d931b29ad819b371c08534528d4d7346a0c142dc397a6469d65ea38ada7d84bbb9c041002ba687ad4d80decf9bec25')


# vim:set sw=2 et:
