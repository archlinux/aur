pkgname=hailort
pkgver=4.20.0
pkgrel=1
pkgdesc="Hailo AI accelerator runtime for Hailo AI PCIe devices"
arch=('aarch64' 'x86_64')
url="https://hailo.ai/"
license=('GPL-2.0')
depends=('hailo-pci')
makedepends=('cmake' 'gcc')
provides=('libhailort.so')
source=("https://github.com/hailo-ai/hailort/archive/v${pkgver}.tar.gz")
sha256sums=('dc083fe415bfa85a2c2d8e90e6b4256ba5c23432527452f21d1878ec22730458')

build() {
  cd hailort-${pkgver}

  cmake -DCMAKE_BUILD_TYPE=MinSizeRel -DCMAKE_INSTALL_PREFIX=/usr -B.rel .
  cd .rel
  make all
}

package() {
  cd hailort-${pkgver}/.rel

  # cmake files
  make DESTDIR=${pkgdir} install
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
