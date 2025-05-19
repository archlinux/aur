# Maintainer: Amish <contact@via.aur>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
pkgname=procmail
pkgver=3.24
pkgrel=5
pkgdesc="Mail processing and sorting program"
arch=('x86_64' 'aarch64')
url="https://github.com/BuGlessRB/procmail"
license=('GPL-2.0-or-later')
source=("procmail-${pkgver}.tar.gz::https://github.com/BuGlessRB/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        procmail-3.24-gcc-14-fix.patch)
sha256sums=('514ea433339783e95df9321e794771e4887b9823ac55fdb2469702cf69bd3989'
            '1813e5cfe2c3763f825bef085d4cce05984b8d855f0ed49f9873c8df33f1587d')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i "${srcdir}"/procmail-3.24-gcc-14-fix.patch
}

build() {
  cd $pkgname-$pkgver
  yes n | make CFLAGS0="${CFLAGS} -std=gnu89 ${LDFLAGS}" LOCKINGTEST="/tmp ."
}

package() {
  cd $pkgname-$pkgver
  make BASENAME="${pkgdir}"/usr MANDIR="${pkgdir}"/usr/share/man install
  install -D -m644 Artistic "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -d -m755 "${pkgdir}"/usr/share/doc/${pkgname}/examples
  install -m644 examples/* "${pkgdir}"/usr/share/doc/${pkgname}/examples/
}
