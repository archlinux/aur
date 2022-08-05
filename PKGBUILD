# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=cilium-git
pkgver=1.12.0.rc2.r868.g27e83cd271
pkgrel=1
pkgdesc="API-aware Networking and Security for Containers based on BPF"
arch=('x86_64')
url="https://cilium.io/"
license=('Apache')
depends=('docker' 'iproute2' 'clang')
makedepends=('go' 'lib32-glibc' 'bazel' 'ninja' 'docker')
optdepends=('consul' 'etcd')
conflicts=()
source=("${pkgname}::git+https://github.com/cilium/cilium")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
    cd "${srcdir}/${pkgname}"

    install -m755 -d "${srcdir}/go/src/github.com/cilium/"
    ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/cilium/cilium"
}

build() {
    cd "${srcdir}/go/src/github.com/cilium/cilium"

    echo "${pkgver}" > VERSION
    export GOPATH="${srcdir}/go"
    export CFLAGS="-Werror"

    make PKG_BUILD=1 V=1 build
}

package() {
    cd "${srcdir}/go/src/github.com/cilium/cilium"

    make DESTDIR="${pkgdir}" PKG_BUILD=1 V=1 -i install

    install -m755 -d "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 contrib/systemd/cilium.sysusers \
        "${pkgdir}/usr/lib/sysusers.d/cilium.conf"
    install -Dm644 contrib/systemd/*.{service,mount} \
        "${pkgdir}/usr/lib/systemd/system/"
}
