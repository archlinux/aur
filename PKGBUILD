# Maintainer: yasuo-ozu <yasuo@ozu.email>

pkgname=qbsolv
pkgver=0.2.10
pkgrel=1
pkgdesc='A decomposing solver that finds a minimum value of a large quadratic unconstrained binary optimization (QUBO) problem'
arch=('x86_64')
url='https://github.com/dwavesystems/qbsolv'
license=('APACHE')
depends=()
optdepends=()
makedepends=(cmake make)
options=()
source=("git+https://github.com/dwavesystems/${pkgname}")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  cat setup.py|sed -ne '/^\s*version='\''.*'\'',$/p' | sed -e 's/^.*'\''\(.*\)'\'',$/\1/'
}

build() {
  cd "${pkgname}"
  mkdir -p build
  cd build
  cmake -DQBSOLV_BUILD_CMD=ON ..
  make preinstall
}

package() {
  cd "${pkgname}/build"
  /usr/bin/cmake -DCMAKE_INSTALL_PREFIX=${pkgdir} -P cmake_install.cmake
  install -Dm755 qbsolv "${pkgdir}/usr/bin/qbsolv"
  install -Dm644 libqbsolv.a "${pkgdir}/usr/lib/libqbsolv.a"
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
