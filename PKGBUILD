# Maintainer: Kris Nóva <kris@nivenly.com>

pkgbase=falco-ebpf
pkgname=(falco-ebpf)
pkgver=0.31.0
pkgrel=1
pkgdesc="Cloud native runtime security. eBPF (Perf Buffer)"
arch=(x86_64)
url="https://falco.org/"
license=(Apache)
makedepends=(cmake git c-ares jq grpc yaml-cpp)
checkdepends=()
optdepends=()
backup=()
options=()
source=("falco-${pkgver}.tar.gz::https://github.com/falcosecurity/falco/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0c7d88bfa2ec8e17e6e27158fabfb1d05982ede3138138b44a0f3ac6ffba5545')

prepare() {
  cd "falco-${pkgver}"
  [[ -d build ]] || mkdir build
}

build() {
  cd "falco-${pkgver}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_BUNDLED_DEPS=false \
    -DBUILD_BPF=ON

  make bpf
}

package() {
    cd "falco-${pkgver}/build"
    mkdir -p /usr/share/falco
    cp driver/bpf/probe.o ${pkgdir}/falco.o
    echo ""
    echo "********************************"
    echo "INSTALLED TO: $pkgdir/falco.o"
    echo "********************************"
    echo ""
}
