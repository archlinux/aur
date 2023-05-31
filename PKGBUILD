
pkgname=python2-dbus
_pkgname=dbus-python
# Do NOT update this further. Support for Python 2 was dropped with dbus-python 1.3.0
pkgver=1.2.18
pkgrel=3
pkgdesc="Python bindings for DBUS (Legacy Python 2 version)"
url="https://www.freedesktop.org/wiki/Software/DBusBindings"
arch=(x86_64)
license=('GPL' 'LGPL')
depends=('dbus' 'glib2' 'python2')
makedepends=('autoconf-archive' 'automake')
source=(https://dbus.freedesktop.org/releases/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('92bdd1e68b45596c833307a5ff4b217ee6929a1502f5341bae28fd120acf7260')

prepare() {
  cd $_pkgname-$pkgver
  autoreconf -vfi
}

build() {
  cd $_pkgname-$pkgver

  ./configure --prefix=/usr PYTHON_VERSION=2
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="${pkgdir}" install

  # dbus-python.h and dbus-python.pc are also provided by the dbus-python package in the official
  # repositories and shipping them in both packages would result in a collision. Since v1.3.0 dropped
  # support for Python 2 we can't just depend on the right version of dbus-python and expect the
  # files to stay compatible either.
  # Simply stop shipping them entirely and pray nobody actually needs them from us.
  rm -r "${pkgdir}/usr/include"
  rm -r "${pkgdir}/usr/lib/pkgconfig"
}
