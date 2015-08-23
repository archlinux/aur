# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=arcus
pkgver=15.06.03
pkgrel=1
pkgdesc="Communication library between internal components for Ultimaker software"
url="https://github.com/Ultimaker/libArcus"
arch=('i686' 'x86_64')
license=('GPLv3')
makedepends=('cmake' 'python')
depends=('protobuf3' 'python-protobuf3')
source=(https://github.com/Ultimaker/libArcus/archive/${pkgver}.tar.gz)
md5sums=('c61fafaa82f71cef5e0f6780688f853e')

build() {
  cd libArcus-${pkgver}
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DBUILD_EXAMPLES=OFF
  make
}

package() {
  cd libArcus-${pkgver}/build
  SITE_PACKAGES=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}"/usr/lib64/* "${pkgdir}"/usr/lib/.
  rm -rf "${pkgdir}/usr/lib64"
  mkdir -p "${pkgdir}${SITE_PACKAGES}"
  mv "${pkgdir}"/usr/lib/python3/dist-packages/* "${pkgdir}${SITE_PACKAGES}"/.
  rm -rf "${pkgdir}"/usr/lib/python3
  #install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
