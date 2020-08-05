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
sha512sums=('b3a4e5fd253c850befde8200618d041ab09dc0d3f0c19547920d0e104df9a34f730656313bf9d4b02e7464faeba518a8a881b7a8f89f42483a332d0b37455910')
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

