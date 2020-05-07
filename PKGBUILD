# Maintainer: Artem Klevtsov <a.a.klevtsov@gmail com>

pkgname=fancon
pkgver=0.20.1
pkgrel=1
pkgdesc="A Linux fan control daemon"
arch=('x86_64')
url="https://github.com/hbriese/${pkgname}"
license=('Apache')
depends=('lm_sensors' 'grpc' 'boost-libs')
makedepends=('clang>=9.0' 'cmake>=3.13' 'boost' 'protobuf' 'libx11' 'pstreams' 'libxnvctrl')
source=("https://github.com/hbriese/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('fb78409417d3a8d623bc2da3f12fab8f42ea62e49f191b200af818185f4304cd7ddb0bc91e580c54c145d95d1d691a2def54c097bdd4192a860ec52d2b53c47a')
conflicts=("${pkgname}-git")

build() {
  rm -rf "${srcdir}/${pkgname}-${pkgver}/build"
  mkdir "${srcdir}/${pkgname}-${pkgver}/build"
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  export CC=clang
  export CXX=clang++
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DNVIDIA_SUPPORT=ON \
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
}
