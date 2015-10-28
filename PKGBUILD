# Maintainer: Alain Kalker <a.c.kalker@gmail.com>
pkgname=libvirt-sandbox
pkgver=0.6.0
pkgrel=1
pkgdesc="An application sandbox toolkit"
arch=('i686' 'x86_64')
url="http://sandbox.libvirt.org/"
license=('LGPL')
depends=('libvirt-glib' 'libselinux' 'cpio')
makedepends=('gobject-introspection' 'intltool')
optdepends=('dhclient: for sandbox network configuration using DHCP'
            'python2-gobject: for virt-sandbox-service')
source=(http://libvirt.org/sources/sandbox/$pkgname-$pkgver.tar.gz{,.asc})
md5sums=('546eb0caaa79d50a723adf58f32da87f'
         '633854ecab0fb2a4f5f4ee958a731daf')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Use python2
  sed -i -e '1s/python/&2/' bin/virt-sandbox-service
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Work around linker error caused by missing static library liblzma.a
  # by disabling LZMA support for now.
  ./configure \
      --prefix=/usr \
      --libexecdir=/usr/lib/$pkgname \
      --sysconfdir=/etc \
      --enable-introspection \
      --without-lzma
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
