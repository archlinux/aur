# Maintainer: Artem Klevtsov <a.a.klevtsov@gmail com>

_pkgbase=fancon
pkgname=fancon-git
pkgver=0.23.7.r1.5a773a8
pkgrel=1
pkgdesc="A Linux fan control daemon"
arch=('x86_64')
url="https://github.com/hbriese/${_pkgbase}"
license=('Apache')
provides=("${_pkgbase}")
depends=()
depends=('lm_sensors' 'grpc' 'boost-libs')
makedepends=('clang>=9.0' 'cmake>=3.13' 'boost' 'protobuf' 'libx11' 'pstreams' 'libxnvctrl')
source=("${_pkgbase}::git+https://github.com/hbriese/${_pkgbase}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  rm -rf "${srcdir}/${_pkgbase}/build"
  mkdir "${srcdir}/${_pkgbase}/build"
  cd "${srcdir}/${_pkgbase}/build"
  export CC=clang
  export CXX=clang++
  export CCACHE_DISABLE=1
  cmake -DNVIDIA_SUPPORT=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        ..
  make
}

package() {
  cd "${srcdir}/${_pkgbase}/build"
  make DESTDIR="${pkgdir}" install
  
  cd "${srcdir}/${_pkgbase}/debian"
  install -Dm 644 fancon.service "${pkgdir}/usr/lib/systemd/system/fancon.service"
  install -Dm 644 fancon-resume.service "${pkgdir}/usr/lib/systemd/system/fancon-resume.service"
    install -Dm 644 fancon-nvidia.service "${pkgdir}/usr/lib/systemd/system/fancon-nvidia.service"
}
