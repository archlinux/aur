# Maintainer: Thaodan <theodorstormgrade@gmail.com>
# Contributor: Weng Xuetian <wengxt@gmail.com>


# For common issues regarding GCC and firefox see:
# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=45375

# enable this if you run out of memory during linking
#_lowmem=true

# build with PGO
_pgo=true

_pkgname=firefox
pkgname=$_pkgname-kde-opensuse
pkgver=127.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org with OpenSUSE patch, integrate better with KDE"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://github.com/openSUSE/firefox-maintenance"
depends=('libxt' 'mime-types'
         'dbus-glib' 'hicolor-icon-theme'
         'libevent' 'nss>=3.28.3' 'nspr>=4.10.6' 'hunspell'
	 'sqlite' 'kmozillahelper' 'ffmpeg'
        )

makedepends=('unzip' 'zip' 'diffutils' 'yasm' 'mesa' 'imake'
             'xorg-server-xvfb' 'libpulse' 'inetutils'
             'cargo' 'mercurial' 'llvm' 'clang' 'rust' 'jack'
             'nodejs' 'cbindgen' 'nasm' 'xz'
             'python' 'python-zstandard' 'dump_syms'
             # system av1
             'dav1d' 'aom'
             # system harfbuzz
             'harfbuzz'
             # system graphite
             'graphite'
             # system webp
             'libwebp'
             # system libevent
             'libevent'
             # system icu
             'icu'
             # system libvpx
             'libvpx'
             # gtk
             'gtk3'
             'libnotify'
             'libpulse'
            )
changeslog=$pkgname.changes

# https://bugs.gentoo.org/792705
# needs fixes from GCC 11.2
makedepends+=('gcc>=11.2.0')


optdepends=('networkmanager: Location detection via available WiFi networks'
            'speech-dispatcher: Text-to-Speech'
            'pulseaudio: Audio support'
            'libnotify: Notification integration'
            'xdg-desktop-portal: Screensharing with Wayland')
provides=("firefox=${pkgver}")
conflicts=('firefox')
_patchrev=22b224bf3e8c1431d2d9d961ca351cf3c50fdc15
options=('!emptydirs' !lto)
source=(https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz{,.asc}
        mozconfig
        firefox.desktop
        vendor.js
        0001-Bug-1504834-Rough-progress-patch.patch
        0002-Bug-1504834-XULText-AA-fix-BE.patch
        0003-mozilla-bmo998749.patch.patch
        0004-mozilla-libavcodec58_91.patch.patch
        0005-mozilla-silence-no-return-type.patch-to-fix-build-er.patch
        0006-Bug-531915-mozilla-bmo531915.patch.patch
        0007-imported-patch-one_swizzle_to_rule_them_all.patch.patch
        0008-imported-patch-svg-rendering.patch.patch
        0009-Bug-1792159-Add-missing-includes-to-AtomicOperations.patch
        0010-mozilla-s390-context.patch.patch
        0011-bsc-991344-Rpi3-Firefox-crashes-after-a-few-seconds-.patch
        0012-mozilla-fix-aarch64-libopus.patch.patch
        0013-Bug-634334-call-to-the-ntlm_auth-helper-fails.patch
        0014-Make-PGO-use-toolchain.patch
        0015-bmo-1516803-force-one-LTO-partition-for-sandbox-when.patch
        0016-Fix-building-with-PGO-when-using-GCC.patch
        0017-LTO-Only-enable-LTO-for-Rust-when-complete-build-use.patch
        0018-Bug-1516081-Disable-watchdog-during-FDO-train.patch
        0019-Bug-559213-Support-system-av1.patch
        0020-Bug-847568-Support-system-harfbuzz.patch
        0021-Bug-847568-Support-system-graphite2.patch
        0022-Bug-1611386-Reenable-support-for-enable-system-sqlit.patch
        0023-Do-not-use-gconf-for-proxy-settings-if-not-running-w.patch
        0024-Add-KDE-integration-to-Firefox-toolkit-parts.patch
        0025-Add-KDE-integration-to-Firefox.patch
        0026-Imported-patch-firefox-branded-icons.patch.patch
        0027-Allow-Eme-for-arm-and-Aarch64.patch
        0028-Shut-up-warnings-about-future-Rust-version-incompati.patch
        0029-Partially-revert-Bug-1768632-Make-EnumSet-compile-fo.patch
        0030-Bug-1796523-Workaround-source-locations-for-function.patch
        0031-Bug-1822730-Add-basic-blob-protocol-handling-for-blo.patch
        0032-Bug-1862601-Part-12-Add-new-line-break-classes.-r.patch
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
_google_default_client_id=413772536636.apps.googleusercontent.com
_google_default_client_secret=0ZChLK6AxeA3Isu96MkwqDR4


# Mozilla API keys (see https://location.services.mozilla.com/api)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact heftig@archlinux.org for
# more information.
_mozilla_api_key=e05d56db0a694edc8b5aaebda3f2db6a

prepare() {
  cd firefox-$pkgver

  cp "$srcdir/mozconfig" .mozconfig

  echo -n "$_google_api_key" >google-api-key
  echo "ac_add_options --with-google-location-service-api-keyfile=\"$PWD/google-api-key\"" >>.mozconfig

  echo -n "$_google_default_client_id $_google_default_client_secret" >google-oauth-api-key
  echo "ac_add_options --with-google-safebrowsing-api-keyfile=\"$PWD/google-oauth-api-key\"" >>.mozconfig

  echo -n "$_mozilla_api_key" >mozilla-api-key
  echo "ac_add_options --with-mozilla-api-keyfile=\"$PWD/mozilla-api-key\"" >>.mozconfig

  for patch in "$srcdir"/*.patch ; do
    echo "Applying $patch"
    patch -p1 -i "$patch"
  done
}

build() {
  #export CXXFLAGS="${CFLAGS}"
  cd firefox-$pkgver
  export MOZ_SOURCE_REPO="$_repo"
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_APP_REMOTINGNAME=$pkgname
  export CARGO_HOME="$srcdir"/.cargo
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=system

  # LTO needs more open files
  ulimit -n 4096

  export CC=gcc
  export CXX=g++
  export AR="gcc-ar"
  export NM="gcc-nm"
  export RANLIB="gcc-ranlib"

  export MOZ_MAKE_FLAGS="$MAKEFLAGS"
  export MOZ_SMP_FLAGS="$MAKEFLAGS"
  export STRIP=/bin/true

  if [[ -n $_lowmem || $CARCH == i686 ]]; then
    LDFLAGS+=" -Xlinker --no-keep-memory"
  fi

  if [[ -n $_pgo ]]; then
    export DISPLAY=:99
    export MOZ_PGO=1

    export TMPDIR="$srcdir/tmp"
    mkdir -p "$TMPDIR"

    xvfb-run \
      -a \
      -s "-extension GLX -screen 0 1280x1024x24" \
      ./mach build
  else
    ./mach build
  fi
  ./mach buildsymbols
}

package() {
  # The .so dependencies have to be added here so
  # pacman doesn't try to install the build time  dependencies
  # by trying to resolve so names.
  # Doing so makes pacman ask for which have to be installed even thou
  # they are already specificied in makedepends
  depends+=(
    # system av1
    'libdav1d.so' 'libaom.so'
    # system harfbuzz
    'libharfbuzz.so'
    # system icu
    'libicuuc.so'
    'libicui18n.so'
    # system vpx
    'libvpx.so'
    # gtk
    'libgtk-3.so'
  )
  cd firefox-$pkgver

  [[ "$CARCH" == "i686" ]] && cp "$srcdir/kde.js" obj-i686-pc-linux-gnu/dist/bin/defaults/pref
  [[ "$CARCH" == "x86_64" ]] && cp "$srcdir/kde.js" obj-x86_64-pc-linux-gnu/dist/bin/defaults/pref

  DESTDIR="$pkgdir" ./mach install

  install -Dm644 "$srcdir/vendor.js" "$pkgdir/usr/lib/firefox/browser/defaults/preferences/vendor.js"
  install -Dm644 "$srcdir/kde.js" "$pkgdir/usr/lib/firefox/browser/defaults/preferences/kde.js"

  _distini="$pkgdir/usr/lib/firefox/distribution/distribution.ini"
  install -Dm644 /dev/stdin "$_distini" <<END
[Global]
id=archlinux
version=1.0
about=Mozilla Firefox for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$pkgname
app.partner.archlinux=archlinux
END

  for i in 16 22 24 32 48 64 128 256; do
      install -Dm644 browser/branding/official/default$i.png \
        "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/firefox.png"
  done

  install -Dm644 browser/branding/official/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/firefox.png"
  install -Dm644 browser/branding/official/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/firefox.png"

  install -Dm644 "$srcdir/firefox.desktop" "$pkgdir/usr/share/applications/firefox.desktop"

  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$pkgname/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi

  #workaround for now
  #https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sf firefox "$pkgdir/usr/lib/firefox/firefox-bin"

  local sprovider="$pkgdir/usr/share/gnome-shell/search-providers/$pkgname.search-provider.ini"
  install -Dvm644 /dev/stdin "$sprovider" <<END
[Shell Search Provider]
DesktopId=$pkgname.desktop
BusName=org.mozilla.${pkgname//-/}.SearchProvider
ObjectPath=/org/mozilla/${pkgname//-/}/SearchProvider
Version=2
END

}
sha256sums=('ea6b089ff046ca503978fdaf11ea123c64f66bbcdc4a968bed8f7c93e9994321'
            'SKIP'
            'db4650fb8ef2702f14b5075958b9212d6c74a1809a5ccf34de03281738a01b94'
            '4c93b2e1f1675e033ed7910fe5f379626a92903a940697430985bcfdf94afceb'
            'eaad0eee76f89e0a1a241742ec5c8ec9315b096f7b3e0ea302b253b926750aae'
            'c9fc92d2e91d853e91af8263d71960e6c23c9ff005e139e2fa13a255f16a9a64'
            'eb19d9568e8d7705b2a0c4774d4f6a758a910c0e5cf427727feb5884a2a1ee98'
            '4322124dc370ac56063837370a8107e85ca6e0d4037ff71ece5e7b0f55ed8053'
            '2bf113fa4eebe0177bb418c187a5d077c1760bb1b788059f444c483d79df8e4d'
            '6b0c60632691f345969f0b6759428cc2d9fb8f7d7570e6d76141f6855b9bcbf4'
            '999f0f5c198f00943894639d9dd4157f3e078a40e1f8a815aef2dacd5158a67c'
            'bba76c5e13952ef45362f8e53a5c030e0f5d722f8f266228787136a5312330ea'
            'f2fcd4ca82b833f5e5b7e991882e24f09463cd837242b18cf163bc751f2e21d5'
            '766faefbd4898049e9913589962bf839da6785d50f0631b4eac7316f16bf2ea6'
            '1cad951e7ff0073c9b5462fa9c4d8ead78d6d494286092b5d23a6fa5949259ef'
            '385b77d458d02675ad791029fceb0d4168368f7aff68a7a8586f0a36d8a52c46'
            '6145dc18238fca575dbbe65a3c244984cb132c0a08a02520af036bf77144b7c1'
            '1ffdcff3d4e31c5cceddadfa0111c27a34480594238cdf85866ee1073d922910'
            '3144c2f38c9e60ba00f231e7a8051ca41cdc5d9f542c0144f4549f525a8c129f'
            '5ee703cddba6045a03ee882ff70423fe185d009e2c912fc49ef66f7703ea46fe'
            '942c0f66b2ab1123760384accc056b54dab9467d3094d52c9f35b263ddfc4e11'
            'c898be9b4afa0f3fc4542efadd55a5947004a84cf3c8863a870f2ab1b4c7b056'
            '54463246e5cfb36846907ea7924b3e43546ff55980de16517f4ff52e999765de'
            '40302cef8ec83d12b95404ef3338e91a0166351462e4cccb14c192698198c88f'
            'b73389e1da6a8d8de3ebe1bf337c3777f6f815b2fd30102fb7a387d11f1d86f5'
            '7da9a82f78fa3120c3dea8c1b7fe1889e62a3639412bf8b6aa646716e728bcf5'
            '5f2bf078c4424271fb2ff999cf1bd7960faf9022e67f5f50ad0918b7216fb1e9'
            'a983f79d0a9c8b17ce3271250dd61e49a2ea9e70bf526f4f586fb5e17c01fcba'
            '1d7a32f97d0bb54d6da48b5e858c119891888807c82a78146c78798269fb4307'
            '1efc94925aa7ca4d46e94462cb9a1ca64d130209fff70cfe142647f3d20f16b9'
            '6dd444248443d360dcc0d8821d65cd341f3026d44258c0149dbd4e63ea7617b0'
            '8738417b180fcbc59c1314c1bd5da87b53e54851ef6f8e50c53ad597d5bd69d2'
            'faea2c6d22f755657a71996c41f92473015af57d5dee5600d0d2ec3096b49102'
            'c053fab26e784e081018254a875cc2656a34318075753c7c1e40bb2822c5bf53'
            'a3c56cf14d2e4d5f4872091bb5a9b765bcc60b3b1a301bef8e123af7a7182698'
            '8531ed52332e4290b4c1c9552236689cc8b250855ae20365eac44e1cbc7a9504'
            'b08459d49f5fb22353e70f0c96a772ea9aa9e832b6ee9ecb02e564a858f9f52e')
