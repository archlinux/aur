# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>
# https://github.com/brokenpip3/my-pkgbuilds
# Contributor: Kris Nóva <kris@nivenly.com> R.I.P.

pkgbase=falco
pkgname=falco
provides=(falco)
conflicts=(falco-bin)
backup=('etc/falco/falco_rules.yaml'  'etc/falco/falco.yaml')
pkgver=0.37.1
pkgrel=1
pkgdesc="Cloud native runtime security. Modern ebpf and config files"
arch=(x86_64)
license=(Apache)
makedepends=(cmake git c-ares jq grpc yaml-cpp clang linux-headers llvm bpf automake gcc)
url="https://github.com/falcosecurity/falco"
_rules_tag="falco-rules-3.0.1"
source_x86_64=(
    "falco-${pkgver}.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
    "git+https://github.com/falcosecurity/rules#tag=${_rules_tag}"
    "falco-modern-bpf.service"
)
sha256sums_x86_64=('f602bd025ff2997ecce1bd1f479592ab666276912d72212ab8d1fffd38ab8c94'
                   'SKIP'
                   '0709add709184db8a275a5c7c6b6b4123b6dc418e72f7c9d4ab6dcc1d5ab2644')

prepare() {
    cd "${srcdir}/falco-${pkgver}"
    [[ -d build ]] || mkdir build
    [[ -d skeleton ]] || mkdir skeleton
    cd skeleton
    cmake .. -DUSE_BUNDLED_DEPS=false \
        -DBUILD_FALCO_MODERN_BPF=ON \
        -DCREATE_TEST_TARGETS=Off \
        -DFALCO_VERSION=${pkgver}
    make ProbeSkeleton
}

build() {
    cd "${srcdir}/falco-${pkgver}/build"
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_BUNDLED_DEPS=false \
        -DBUILD_FALCO_MODERN_BPF=ON \
        -DMODERN_BPF_SKEL_DIR=${srcdir}/falco-${pkgver}/skeleton/skel_dir \
        -DBUILD_DRIVER=Off \
        -DBUILD_BPF=Off \
        -DFALCO_VERSION=${pkgver}
    make falco -j6
}

package() {
    install -Dm755 "${srcdir}/falco-${pkgver}/build/userspace/falco/falco" "${pkgdir}/usr/bin/falco"
    install -Dm644 "${srcdir}/falco-${pkgver}/falco.yaml" "${pkgdir}/etc/falco/falco.yaml"
    install -Dm644 "${srcdir}/rules/rules/falco_rules.yaml" "${pkgdir}/etc/falco/falco_rules.yaml"
    install -d "${pkgdir}/etc/falco/rules.d"
    sed -i 's#probe: ${HOME}/.falco/falco-bpf.o#probe: /usr/share/falco/falco-bpf.o#' "${pkgdir}/etc/falco/falco.yaml"
    install -Dm644 "falco-modern-bpf.service" "${pkgdir}/usr/lib/systemd/system/falco-modern-bpf.service"
}
