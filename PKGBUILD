# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: 3V0LU710N <db_eee-at-hotmail-dot-com>

_name=libusb
pkgname=lib32-libusb-git
pkgver=1.0.24
pkgrel=1
pkgdesc="A cross-platform user library to access USB devices (32-bit)"
arch=('x86_64')
url="http://libusb.info/"
license=('LGPL2.1')
depends=('lib32-glibc' 'libusb')
provides=('libusb-1.0.so' 'lib32-libusb')
conflicts=(lib32-libusb)
makedepends=('gcc-multilib')
source=("git+https://github.com/libusb/libusb.git")
sha512sums=('SKIP')

pkgver() {
  cd libusb
  git describe --tags | sed 's/-/+/g'
}

build() {
  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd libusb
  ./bootstrap.sh
  ./configure --prefix=/usr \
              --libdir=/usr/lib32 \
              --disable-static
  make
}

package () {
  cd libusb
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/include
  install -vDm 644 {AUTHORS,ChangeLog,NEWS,README,TODO} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
