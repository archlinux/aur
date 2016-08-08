# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=arcus
pkgver=2.1.3
pkgrel=2
pkgdesc="Communication library between internal components for Ultimaker software"
url="https://github.com/Ultimaker/libArcus"
arch=('x86_64')
arch=('any')
license=('GPLv3')

makedepends=('cmake')
depends=('python' 'protobuf3' 'python-sip')
source=(https://github.com/Ultimaker/libArcus/archive/${pkgver}.tar.gz)

md5sums=('1f405773a2a97890abbd6b499fb36afc')

build() {
  cd libArcus-${pkgver}
  mkdir -p build
  cd build
  
  cmake .. \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=Release \
  -DBUILD_EXAMPLES=OFF 

  make
}

package() {
  cd libArcus-${pkgver}/build
  make DESTDIR="${pkgdir}" install
  
  SITE_PACKAGES=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")
  mkdir -p "${pkgdir}$(dirname $SITE_PACKAGES)"
  mv "${pkgdir}/usr/lib/python3/dist-packages" "${pkgdir}${SITE_PACKAGES}"
  rm -rf "${pkgdir}/usr/lib/python3"
  mv "${pkgdir}"/usr/lib64/* "${pkgdir}"/usr/lib/.
  rm -rf "${pkgdir}/usr/lib64"

  install -Dm644 "${srcdir}/libArcus-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
