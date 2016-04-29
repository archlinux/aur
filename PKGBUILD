# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=opencascade7
pkgver=7.0.0
pkgrel=1
pkgdesc="Open CASCADE Technology, 3D modeling & numerical simulation, version 7"
url="http://www.opencascade.org"
arch=('i686' 'x86_64')
license=('custom')
makedepends=('cmake')
depends=('gl2ps' 'freeimage' 'tk' 'ftgl' 'libxmu' 'vtk' 'mesa')
optdepends=('intel-tbb')
source=(https://dl.dropboxusercontent.com/u/333226/opencascade-7.0.0.tgz)
md5sums=('fa1458aba1ce96c85d7876b35a04af6c')
provides=('opencascade')
conflicts=('opencascade' 'oce')

prepare(){
  cd opencascade-${pkgver}
  mkdir -p build
  cd build
  flags=""
  flags="$flags -DCMAKE_BUILD_TYPE=Release"
  flags="$flags 3RDPARTY_VTK_INCLUDE_DIR=/opt/vtk6/include"
  flags="$flags 3RDPARTY_VTK_LIBRARY_DIR=/opt/vtk6/lib"
  #flags="$flags -DUSE_GL2PS=ON"
  #flags="$flags -DUSE_FREEIMAGE=ON"
  #flags="$flags -DUSE_TBB=ON"
  #flags="$flags -DUSE_VTK=ON"
  #flags="$flags -DUSE_TBB=OFF"
  #flags="$flags -DUSE_TBB=ON"
  cmake $flags ..
}

build() {
  cd opencascade-${pkgver}/build
  make
}

package() {
  cd opencascade-${pkgver}/build
  make DESTDIR="${pkgdir}" install
  install -Dm644 ${srcdir}/opencascade-${pkgver}/LICENSE_LGPL_21.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE_LGPL_21.txt"
  install -Dm644 ${srcdir}/opencascade-${pkgver}/OCCT_LGPL_EXCEPTION.txt "$pkgdir/usr/share/licenses/$pkgname/OCCT_LGPL_EXCEPTION.txt"
  
  #install -m644 -D "${srcdir}/99_oce.conf" -t "${pkgdir}/etc/ld.so.conf.d"
  install -m755 -D "${srcdir}/opencascade-${pkgver}/build/env.sh" -t "${pkgdir}/etc/profile.d"
}

# vim:set ts=2 sw=2 et:
