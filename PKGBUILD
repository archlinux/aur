# Maintainer: Artem Klevtsov <a.a.klevtsov@gmail com>

pkgname=fancon
pkgver=0.23.0
pkgrel=1
pkgdesc="A Linux fan control daemon"
arch=('x86_64')
url="https://github.com/hbriese/${pkgname}"
license=('Apache')
depends=('lm_sensors' 'grpc' 'boost-libs')
makedepends=('clang>=9.0' 'cmake>=3.13' 'boost' 'protobuf' 'libx11' 'pstreams' 'libxnvctrl')
source=("https://github.com/hbriese/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('f7a202adff04985e1063d0cd3cec8c36045fec0a0556d764a4b690bbbc4f96f779898d6e5d8c13d22be809b35644ab3c79ddca7a9e504ee473e38e6b3f16c432')
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

