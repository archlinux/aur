# Maintainer: Rafal Malachowicz <k5hv@archlinux.info>
# Based on dislocker maintained by: mrxx <mrxx at cyberhome dot at>

_pkgname=dislocker
pkgname=$_pkgname-git
pkgver=0.5.1.r0.gbaa97ca
pkgrel=1
pkgdesc="FUSE driver to read/write Windows' BitLocker-ed volumes"
arch=('i686' 'x86_64')
url="https://github.com/Aorimn/dislocker"
license=('GPL2')
depends=('fuse' 'mbedtls' 'ruby')
makedepends=('git' 'cmake')
provides=($_pkgname)
conflicts=($_pkgname)
source=('git+https://github.com/Aorimn/dislocker')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//g'
}

build() {
  cd "$srcdir/${_pkgname}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -Dlibdir=/usr/lib \
        .
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}/" install

  ln -s /usr/bin/dislocker-fuse ${pkgdir}/usr/bin/dislocker
  ln -s /usr/share/man/man1/dislocker-fuse.1.gz ${pkgdir}/usr/share/man/man1/dislocker.1.gz

  install -Dm644 README.md ${pkgdir}/usr/share/doc/${_pkgname}/README
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}
