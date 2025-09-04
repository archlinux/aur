# Maintainer: Thomas Girod <tgirod@altu.fr>
# Contributor: Chris Arndt <aur -at- chrisarndt -dot- de>

pkgname=overwitch
pkgver=2.2
pkgrel=1
pkgdesc='JACK client for Overbridge devices'
arch=(x86_64)
url='https://dagargo.github.io/overwitch/'
license=(GPL-3.0-only)
depends=(glibc gtk4 hicolor-icon-theme)
makedepends=(
  gettext
  jack
  json-glib
  libsamplerate
  libsndfile
  systemd-libs
  libusb
)
optdepends=(
  'systemd-libs: for overwitch system service'
)
checkdepends=(cunit)
source=("https://github.com/dagargo/overwitch/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('c54227b712c1bb233cb451e7c88d76529477f1551d60edae5a87d6bf788030ea')

build() {
  cd $pkgname-$pkgver
  autoreconf --install
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  depends+=(
    libcairo.so
    libcairo-gobject.so
    libgdk_pixbuf-2.0.so
    libgio-2.0.so
    libglib-2.0.so
    libgobject-2.0.so
    libgraphene-1.0.so
    libgtk-4.so
    libharfbuzz.so
    libjack.so
    libjson-glib-1.0.so
    libpango-1.0.so
    libpangocairo-1.0.so
    libsamplerate.so
    libsndfile.so
    libusb-1.0.so
    libvulkan.so
  )
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
  install -vDm 644 udev/*.rules -t "$pkgdir"/usr/lib/udev/rules.d
  install -vDm 644 udev/*.hwdb -t "$pkgdir"/usr/lib/udev/hwdb.d/
  install -vDm 644 AUTHORS README THANKS -t "$pkgdir"/usr/share/doc/$pkgname
  rm -v "$pkgdir"/usr/share/$pkgname/THANKS
}
