# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=arcus
pkgver=2.1.0
_pkgver=cf2a4c25d67a0f8d470c333624306e3f88b120b1
pkgrel=1
pkgdesc="Communication library between internal components for Ultimaker software"
url="https://github.com/Ultimaker/libArcus"
arch=('i686' 'x86_64')
license=('GPLv3')
makedepends=('cmake' 'python')
depends=('protobuf3' 'python-protobuf3')
#source=(https://github.com/Ultimaker/libArcus/archive/cf2a4c25d67a0f8d470c333624306e3f88b120b1.zip)
source=(https://github.com/Ultimaker/libArcus/archive/${_pkgver}.tar.gz)

md5sums=('d33a765e9d65fdfd0c37a8e40d4ef819')

build() {
  cd libArcus-${_pkgver}
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DBUILD_EXAMPLES=OFF
  make
}

package() {
  cd libArcus-${_pkgver}/build
  SITE_PACKAGES=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")
  make DESTDIR="${pkgdir}" install
  #mv "${pkgdir}"/usr/lib64/* "${pkgdir}"/usr/lib/.
  #rm -rf "${pkgdir}/usr/lib64"
  mkdir -p "${pkgdir}${SITE_PACKAGES}"
  mv "${pkgdir}"/usr/lib/python3/dist-packages/* "${pkgdir}${SITE_PACKAGES}"/.
  rm -rf "${pkgdir}"/usr/lib/python3
  install -Dm644 "$srcdir/libArcus-${_pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
