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
pkgver=107.0
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
             'xorg-server-xvfb' 'libpulse' 'inetutils' 'autoconf2.13'
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
_patchurl=https://raw.githubusercontent.com/openSUSE/firefox-maintenance/$_patchrev
_repo=https://hg.mozilla.org/mozilla-unified
source=("hg+$_repo#tag=FIREFOX_${pkgver//./_}_RELEASE"
        mozconfig
        firefox.desktop
        vendor.js
        0001-Bug-1005535-Get-skia-GPU-building-on-big-endian.patch
        0002-Allow-to-override-build-date-with-SOURCE_DATE_EPOCH.patch
        0003-Bug-1504834-Rough-progress-patch.patch
        0004-Bug-1504834-XULText-AA-fix-BE.patch
        0005-Fix-top-level-asm-issue.patch
        0006-mozilla-bmo998749.patch.patch
        0007-mozilla-s390x-skia-gradient.patch.patch
        0008-mozilla-libavcodec58_91.patch.patch
        0009-mozilla-silence-no-return-type.patch-to-fix-build-er.patch
        0010-Bug-531915-mozilla-bmo531915.patch.patch
        0011-imported-patch-one_swizzle_to_rule_them_all.patch.patch
        0012-imported-patch-svg-rendering.patch.patch
        0013-Bug-1792159-Add-missing-includes-to-AtomicOperations.patch
        0014-mozilla-s390-context.patch.patch
        0015-bsc-991344-Rpi3-Firefox-crashes-after-a-few-seconds-.patch
        0016-mozilla-fix-aarch64-libopus.patch.patch
        0017-Bug-634334-call-to-the-ntlm_auth-helper-fails.patch
        0018-Make-PGO-use-toolchain.patch
        0019-bmo-1516803-force-one-LTO-partition-for-sandbox-when.patch
        0020-Fix-building-with-PGO-when-using-GCC.patch
        0021-LTO-Only-enable-LTO-for-Rust-when-complete-build-use.patch
        0022-Bug-1516081-Disable-watchdog-during-FDO-train.patch
        0023-Bug-559213-Support-system-av1.patch
        0024-Bug-847568-Support-system-harfbuzz.patch
        0025-Bug-847568-Support-system-graphite2.patch
        0026-Bug-1611386-Reenable-support-for-enable-system-sqlit.patch
        0027-Bug-1419151-Add-Unity-menubar-support.patch
        0028-Do-not-use-gconf-for-proxy-settings-if-not-running-w.patch
        0029-Add-KDE-integration-to-Firefox-toolkit-parts.patch
        0030-Add-KDE-integration-to-Firefox.patch
        0031-Imported-patch-firefox-branded-icons.patch.patch
        0032-Bug-1807652-Rename-some-methods-to-not-conflict-with.patch
        0033-Allow-Eme-for-arm-and-Aarch64.patch
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
  cd mozilla-unified

  cp "$srcdir/mozconfig" .mozconfig

  echo -n "$_google_api_key" >google-api-key
  echo "ac_add_options --with-google-location-service-api-keyfile=\"$PWD/google-api-key\"" >>.mozconfig

  echo -n "$_google_default_client_id $_google_default_client_secret" >google-oauth-api-key
  echo "ac_add_options --with-google-safebrowsing-api-keyfile=\"$PWD/google-oauth-api-key\"" >>.mozconfig

  echo -n "$_mozilla_api_key" >mozilla-api-key
  echo "ac_add_options --with-mozilla-api-keyfile=\"$PWD/mozilla-api-key\"" >>.mozconfig

  for patch in "$srcdir/*.patch" ; do
    echo "Applying $patch"
    patch -p1 -i "$patch"
  done
}

build() {
  #export CXXFLAGS="${CFLAGS}"
  cd mozilla-unified
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
  cd mozilla-unified

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
}
md5sums=('SKIP'
         '9530b0395a095c0b47ee42d0996ec163'
         'a26a061efb4def6572d5b319d657f1d6'
         '4c23d9c0a691d70919beb1dafbbecbd3'
         'e48cd51c49f5b8b1595f9cd8f55ce819'
         '6945bb71f87e01743a6736fbdb845cfd'
         '954e7d1ff4452e3c8895a186ff815383'
         'f6e793369b22bd607403d9b9f0565a3c'
         '8df09195607f90a097f21d35dc4d9c30'
         'a1b878f2e22f096ad907630aa873698f'
         '3256d35703c9a2857503921eb10c3dd7'
         'efe01b463d50e30de15c03f391e0b366'
         'ab2a8a5aa3aa2b52f7102466aab7eb7e'
         '63a6be4970c5a999adad40f9e021c366'
         '1c1ce911bbbe548f130e6fca5e136bdd'
         '831c2ccaf07c68cf4f9008692475c1d9'
         'cc679a9a9abbb9e8a33800b4cb5f4deb'
         '8c0af75143b8f8d4b86e0f438bd8ccc8'
         'e13a08af8fa75cfebd2ca5d509784046'
         '379b26ef4582c6d15ab61c7944540c7f'
         '7ee193a7b8230b68036f6db5d188f7fc'
         '9266d9fa0c39e30ae2e9c93b3d7822e7'
         '101080a6f3639db7c36dcf1218a83d1a'
         '39a5aa662bd007d0562beaeae4edc175'
         'a067121f85949a76e709d53871f09834'
         '12f66e9f224381e73aa7e7fb6c535c13'
         'ad886aed59f72e6f1ad470ab4e96ebd8'
         'b69acf75b1649f965ac1637e34356038'
         'd1dfbcdc4951a5d279071323160fe856'
         '3db73a1168751e27a66d7564a9492312'
         'b30750c85f239ba19b6b0ba308e86990'
         '401a4da2cadcaf12546cb495d63407e4'
         '42ce462dcbdaaed8ffb45b1b5d10a49d'
         'f792d0ce1e4f3f260862ec70295f2f81'
         'bc7676460d246f57e8f4e5db1850eaf8'
         '1bc91fa92a1a7ce337ec9b398290f5e8'
         '15a701ef094073919c43701ef4b8b85f')
