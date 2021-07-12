# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libglade
pkgver=2.6.4
pkgrel=8
pkgdesc="Allows you to load glade interface files in a program at runtime"
arch=(x86_64)
license=('LGPL')
depends=('gtk2>=2.16.0' 'libxml2>=2.7.3')
makedepends=('python2' 'pkgconfig')
optdepends=('python2: libglade-convert script')
install=glade.install
source=(https://download.gnome.org/sources/${pkgname}/2.6/${pkgname}-${pkgver}.tar.bz2
	libglade-2.0.1-nowarning.patch)
url="http://www.gnome.org"
sha256sums=('64361e7647839d36ed8336d992fd210d3e8139882269bed47dc4674980165dec'
            '423c12af1c73442caa851a0b8db33b00fa4b778b1b422a4e8ac33d121d043008')
options=(!lto)

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../libglade-2.0.1-nowarning.patch
}

build() {
  cd $pkgname-$pkgver
  PYTHON=/usr/bin/python2 ./configure --sysconfdir=/etc --prefix=/usr --localstatedir=/var

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
  install -m755 libglade-convert "${pkgdir}/usr/bin/"
}
