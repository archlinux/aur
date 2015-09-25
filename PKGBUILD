# Maintainer : ksj <podhorsky.ksj@gmail.com>
# Contributor : Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=firefox-gtk3
pkgver=41.0
pkgrel=2
pkgdesc="Standalone web browser from mozilla.org"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://www.mozilla.org/firefox/"
depends=('desktop-file-utils' 'alsa-lib' 'libxt' 'icu' 'gtk3' 'nss' 'libevent' 'hunspell'
         'startup-notification' 'libjpeg-turbo' 'libvpx' 'dbus-glib' 'hicolor-icon-theme'
         'gstreamer' 'sqlite')
makedepends=('unzip' 'zip' 'diffutils' 'python2' 'yasm' 'mesa' 'imake' 'libpulse'
             'gst-plugins-base-libs' 'inetutils' 'gtk2')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'gst-plugins-good: h.264 video'
            'gst-libav: h.264 video')
install=firefox.install
options=('!emptydirs' '!makeflags')
provides=('firefox')
conflicts=('firefox')
source=(https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz
        mozconfig firefox.desktop firefox-install-dir.patch vendor.js firefox-ppc64le.patch
        firefox-fixed-loading-icon.png firefox-build.patch firefox-build-prbool.patch firefox-debug.patch
        xulrunner-24.0-jemalloc-ppc.patch xulrunner-24.0-s390-inlines.patch aarch64-fix-skia.patch
        mozilla-1160154.patch mozilla-1192243.patch mozilla-1180971.patch mozilla-1190935.patch)

sha256sums=('18abb95e93770ab1cc0794349125aacf073eb04fd8b8a93c7a58312c94bf16fd'
            '5a4f3a40b42b6212a803b8efcd4fc644229b86ca921ff8b4b4b3c030dc3e13b3'
            'c202e5e18da1eeddd2e1d81cb3436813f11e44585ca7357c4c5f1bddd4bec826'
            'd86e41d87363656ee62e12543e2f5181aadcff448e406ef3218e91865ae775cd'
            '4b50e9aec03432e21b44d18c4c97b2630bace606b033f7d556c9d3e3eb0f4fa4'
            '81c59e1d361d018bb0f32bd5a8231dc3b7e9cb75e9bf7af7c71d610ae914e916'
            '68e3a5b47c6d175cc95b98b069a15205f027cab83af9e075818d38610feb6213'
            'b218d44fd498bdc66919f98878a15720d953720c77f282ee8a70a0ae320698ed'
            '531db75865405b30ec7cd20f5e0f2da00bf346dbed144744e1b0d814bd5dcb12'
            '38e0a8881d4ec1d1552f2533729d64093fb30ec2125715ad1bc1f665d64abee6'
            'a1468e528d0362e4bcc4757881156d102b8fdcc76466f88e69774f71efe35a1b'
            '2c995f0d248e7f6fec1d7aa1e8d35d2d7e537afd9c122ffe582857980f641795'
            '07fe3d474f4954ca19ff45ac8df9a8649022e060c0335e56348092d935e952e9'
            'fdc0607a4a40392e94cd7075e16597518532bd4b764890b49a76fd410c3968e1'
            '577d9b99d7852bc7b1501e8a766b88a7c9250764b707d69cae437fc173689ae7'
            '611de41010964a1d0698edad0ea3453b49b57d70b0ab470cb4f44df934b52740'
            '2098a6dfb605da8ef3eb831c12cc6d6dc5b1850b3f2b65138dc2aca7b700ebb0')

prepare() {
  cd mozilla-release

  cp ../mozconfig .mozconfig

# global patche  
  patch -p1 -i ../firefox-install-dir.patch
  patch -p2 -i ../firefox-build.patch
  patch -p2 -i ../xulrunner-24.0-jemalloc-ppc.patch
  patch -p2 -i ../xulrunner-24.0-s390-inlines.patch
  patch -p1 -i ../firefox-build-prbool.patch
  patch -p2 -i ../firefox-ppc64le.patch
  patch -p1 -i ../firefox-debug.patch

# firefox gtk3 patches
  patch -p1 -i ../mozilla-1160154.patch
  patch -p1 -i ../mozilla-1192243.patch
  patch -p1 -i ../mozilla-1180971.patch
  patch -p1 -i ../mozilla-1190935.patch

  patch -p1 -i ../aarch64-fix-skia.patch
 
  mkdir -p "$srcdir/path"

  # WebRTC build tries to execute "python" and expects Python 2
  ln -sf /usr/bin/python2 "$srcdir/path/python"

  # configure script misdetects the preprocessor without an optimization level
  # https://bugs.archlinux.org/task/34644
  sed -i '/ac_cpp=/s/$CPPFLAGS/& -O2/' configure

  # Fix tab loading icon (doesn't work with libpng 1.6)
  # https://bugzilla.mozilla.org/show_bug.cgi?id=841734
  cp "$srcdir/firefox-fixed-loading-icon.png" \
    browser/themes/linux/tabbrowser/loading.png
}

build() {
  cd mozilla-release

  export MOZ_SMP_FLAGS=-j1
  export PATH="$srcdir/path:$PATH"
  export PYTHON="/usr/bin/python2"
  export LDFLAGS="-Wl,--no-keep-memory -Wl,--reduce-memory-overheads"

  make -f client.mk build STRIP=/bin/true MOZ_MAKE_FLAGS=-j2 MOZ_SERVICES_SYNC=1
}

package() {
  cd mozilla-release
  make -f client.mk DESTDIR="$pkgdir" INSTALL_SDK= install

  install -Dm644 ../vendor.js "$pkgdir/usr/lib/firefox/browser/defaults/preferences/vendor.js"

  for i in 16 22 24 32 48 256; do
      install -Dm644 browser/branding/official/default$i.png \
        "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/firefox.png"
  done
  install -Dm644 browser/branding/official/content/icon64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/firefox.png"
  install -Dm644 browser/branding/official/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/firefox.png"
  install -Dm644 browser/branding/official/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/firefox.png"
  install -Dm644 browser/branding/official/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/firefox.png"

  install -Dm644 ../firefox.desktop \
    "$pkgdir/usr/share/applications/firefox.desktop"

  # Use system-provided dictionaries
  rm -rf "$pkgdir"/usr/lib/firefox/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/firefox/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/usr/lib/firefox/hyphenation"

  #workaround for now
  #https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sf firefox "$pkgdir/usr/lib/firefox/firefox-bin"
}
