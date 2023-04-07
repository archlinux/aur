# Maintainer: Curve <curve dot platin at gmail dot com>

url="https://github.com/Curve/AltServer-Linux"
pkgname=altserver-linux-curve-git
pkgdesc='AltServer for Linux'
_pkgname=AltServer-Linux
pkgver=r41.7e601b6
pkgrel=3

makedepends=('git' 'cmake' 'ninja' 'zlib')
depends=('boost' 'python3' 'avahi' 'libcorecrypto-git' 'openssl')

source=("git+https://github.com/Curve/${_pkgname}")
sha256sums=('SKIP')

conflicts=('altserver')
provides=('altserver')
license=('AGPL3')
arch=('any')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  git submodule update --init --recursive
  mkdir -p build
  cd build
  cmake -GNinja -DBUILD_SHARED_LIBS=OFF -DCMAKE_BUILD_TYPE=Release ..
  ninja
}

package() {
  install -Dm 755 "${srcdir}/${_pkgname}/build/altserver-linux" "${pkgdir}/usr/bin/altserver"

  # install license
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/${_pkgname}/LICENSE"
}
