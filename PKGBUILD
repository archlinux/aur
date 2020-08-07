# Maintainer: Artem Klevtsov <a.a.klevtsov@gmail com>

pkgname=fancon
pkgver=0.23.1
pkgrel=1
pkgdesc="A Linux fan control daemon"
arch=('x86_64')
url="https://github.com/hbriese/${pkgname}"
license=('Apache')
depends=('lm_sensors' 'grpc' 'boost-libs')
makedepends=('clang>=9.0' 'cmake>=3.13' 'boost' 'protobuf' 'libx11' 'pstreams' 'libxnvctrl')
source=("https://github.com/hbriese/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('8733f45e618cd1aac38926a4ef6edbb155009f38431c01759917422c67e3fbf032a0b8e257ba55eb00702890c14332d600cac64d136bc0843dae1ede31e6020d')
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
