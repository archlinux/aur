# Maintainer : ksj <podhorsky.ksj@gmail.com>
# Contributor : Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=firefox-gtk3
pkgver=43.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://www.mozilla.org/firefox/"
depends=('desktop-file-utils' 'alsa-lib' 'libxt' 'icu' 'gtk3' 'nss' 'libevent' 'hunspell'
         'startup-notification' 'libjpeg-turbo' 'libvpx' 'dbus-glib' 'hicolor-icon-theme'
         'gstreamer' 'sqlite')
makedepends=('unzip' 'zip' 'diffutils' 'python2' 'gtk2' 'yasm' 'mesa' 'imake' 'libpulse'
             'gst-plugins-base-libs' 'inetutils')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'gst-plugins-good: h.264 video'
            'gst-libav: h.264 video')
install=firefox.install
options=('!emptydirs' '!makeflags')
provides=('firefox')
conflicts=('firefox')
source=(https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz
        mozconfig firefox.desktop vendor.js firefox-fixed-loading-icon.png)

sha256sums=('a5b16741dcce9344ca71e39e0efb0e7e1336ca5160cb9b6b12f8985f402d8fea'
            '26c7aca32b4799f2aeb9dbc0e88133252453424bf56662c92333dda676243695'
            'c202e5e18da1eeddd2e1d81cb3436813f11e44585ca7357c4c5f1bddd4bec826'
            '4b50e9aec03432e21b44d18c4c97b2630bace606b033f7d556c9d3e3eb0f4fa4'
            '68e3a5b47c6d175cc95b98b069a15205f027cab83af9e075818d38610feb6213')

prepare() {
  cd firefox-$pkgver

  cp ../mozconfig .mozconfig

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
  cd firefox-$pkgver

  export MOZ_SMP_FLAGS=-j1
  export PATH="$srcdir/path:$PATH"
  export PYTHON="/usr/bin/python2"
  export LDFLAGS="-Wl,--no-keep-memory -Wl,--reduce-memory-overheads"

  make -f client.mk build STRIP=/bin/true MOZ_MAKE_FLAGS=-j2 MOZ_SERVICES_SYNC=1
}

package() {
  cd firefox-$pkgver
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
