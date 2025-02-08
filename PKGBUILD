# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>
# https://github.com/brokenpip3/my-pkgbuilds
# Contributor: Kris Nóva <kris@nivenly.com> R.I.P.

pkgbase=falco-probe-ebpf
pkgname=falco-probe-ebpf
pkgdesc="Cloud native runtime security - eBPF probe"
pkgver=0.40.0
pkgrel=1
arch=(x86_64)
license=(Apache)
depends=(falco-bin)
makedepends=(cmake git c-ares jq grpc yaml-cpp clang linux-headers llvm nlohmann-json cpp-httplib cxxopts)
url="https://github.com/falcosecurity/falco"
source_x86_64=(
    "falco-${pkgver}.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
    "falco-ebpf.service"
)
sha256sums_x86_64=('8009dc87263ebd9c55811ef2f90f0a4c0faf494baef1edf1f91c83d701e751f1'
                   '79705a952d3cc7f646bcdce6e79419996271959668b9e59ca734255114c70de0')
install="falco-ebpf.install"

prepare() {
    cd "${srcdir}/falco-${pkgver}"
    [[ -d build ]] || mkdir build
}

build() {
    cd "${srcdir}/falco-${pkgver}/build"
    cmake .. \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_BUNDLED_DEPS=false \
        -DBUILD_BPF=ON
    make bpf
}

package() {
    install -Dm644 "${srcdir}/falco-${pkgver}/build/driver/bpf/probe.o" "${pkgdir}/usr/share/falco/falco-bpf.o"
    install -Dm644 "${srcdir}/falco-ebpf.service" "${pkgdir}/usr/lib/systemd/system/falco-ebpf.service"
}
