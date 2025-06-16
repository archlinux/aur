pkgname=hailort
pkgver=4.21.0
pkgrel=2
pkgdesc="Hailo AI accelerator runtime for Hailo AI PCIe devices"
arch=('aarch64' 'x86_64')
url="https://hailo.ai/"
license=('MIT AND LGPL-2.1-only')
depends=('hailo-pci')
makedepends=('cmake' 'gcc')
provides=('libhailort.so')
source=("https://github.com/hailo-ai/hailort/archive/v${pkgver}.tar.gz")
sha256sums=('7b5afd35d68dc4231a0731f30263f55c0f4c5a4aad72b960bbdb872f8c65b4ea')

build() {
  cd hailort-${pkgver}

  cmake \
    -DCMAKE_BUILD_TYPE=MinSizeRel \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -B.rel .
  cd .rel
  make all
}

package() {
  cd hailort-${pkgver}/.rel

  # cmake files
  make DESTDIR=${pkgdir} install/strip
  # tool
  install -Dvm 755 ${pkgname}/${pkgname}cli/${pkgname}cli ${pkgdir}/usr/bin/${pkgname}cli
  # lib
  install -Dvm 755 ${pkgname}/lib${pkgname}/src/lib${pkgname}.so.${pkgver} \
     ${pkgdir}/usr/lib/lib${pkgname}.so.${pkgver}
  cd ${pkgdir}/usr/lib
  ln -s lib${pkgname}.so.${pkgver} lib${pkgname}.so
  # c++ includes
  cp -ar ${srcdir}/hailort-${pkgver}/${pkgname}/lib${pkgname}/include ${pkgdir}/usr/
}
