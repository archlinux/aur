# Maintainer: Artem Klevtsov <a.a.klevtsov@gmail com>

pkgname=fancon
pkgver=0.23.7
pkgrel=1
pkgdesc="A Linux fan control daemon"
arch=('x86_64')
url="https://github.com/hbriese/${pkgname}"
license=('Apache')
depends=('lm_sensors' 'grpc' 'boost-libs')
makedepends=('clang>=9.0' 'cmake>=3.13' 'boost' 'protobuf' 'libx11' 'pstreams' 'libxnvctrl')
source=("https://github.com/hbriese/fancon/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('a4fc9962e8af43bc67681ecb58db2a0372774120e963be477f88a4618773ac46ed24f79dcb2e3ece3119d70711d63a303a166e67a7fa213858fae831081dff56')
conflicts=("${pkgname}-git")

build() {
  rm -rf "${srcdir}/${pkgname}-${pkgver}/build"
  mkdir "${srcdir}/${pkgname}-${pkgver}/build"
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  export CC=clang
  export CXX=clang++
  cmake -DNVIDIA_SUPPORT=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  
  cd "${srcdir}/${pkgname}-${pkgver}/debian"
  install -Dm 644 fancon.service "${pkgdir}/usr/lib/systemd/system/fancon.service"
  install -Dm 644 fancon-resume.service "${pkgdir}/usr/lib/systemd/system/fancon-resume.service"
  install -Dm 644 fancon-nvidia.service "${pkgdir}/usr/lib/systemd/system/fancon-nvidia.service"
}
