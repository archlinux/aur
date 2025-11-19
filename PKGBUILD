pkgname=pulsebench
pkgver=1.2.1
pkgrel=1
pkgdesc="PulseBench - multi-threaded CPU benchmarking tool"
arch=('x86_64')
url="https://github.com/hent83722/PulseBench"
license=('MIT')
depends=()
makedepends=('cmake' 'git' 'pkg-config')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('d1cc37a63ab2ba00e1682c06d16e5142d2b1b8280602bbeb143f89a646247090d222aef4f7d3db7a2acaacd20f10912dab6af98d64aae07fd3e5c363d251391e')

build() {
  cd "${srcdir}/PulseBench-${pkgver}"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF
  make -j$(nproc)
}

package() {
  cd "${srcdir}/PulseBench-${pkgver}"
  # install binary
  install -Dm755 build/pulsebench "${pkgdir}/usr/bin/pulsebench"

  # docs and examples
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  if [ -d examples ]; then
    mkdir -p "${pkgdir}/usr/share/${pkgname}/examples"
    cp -r examples/* "${pkgdir}/usr/share/${pkgname}/examples/"
  fi
  if [ -d scripts ]; then
    mkdir -p "${pkgdir}/usr/share/${pkgname}/scripts"
    cp -r scripts/* "${pkgdir}/usr/share/${pkgname}/scripts/"
  fi
  # license
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
