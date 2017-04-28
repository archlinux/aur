# Maintainer: Christophe Robin <crobin@nekoo.com>

pkgname=infrakit-git
pkgver=v0.4.1.r77.gce06e23
pkgrel=2
pkgdesc="A toolkit for creating and managing declarative, self-healing infrastructure."
arch=('x86_64')
url="https://github.com/docker/infrakit"
license=('Apache')
depends=('libvirt')
makedepends=('go' 'make' 'git' 'libvirt')
source=("${pkgname}::git+ssh://git@github.com/docker/infrakit.git" "discovery.patch")
md5sums=('SKIP'
         '243888bff971a8bd63e389a415abede5')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    mkdir "${srcdir}/go" || true
    export GOPATH="${srcdir}/go"
    export PATH="${GOPATH}/bin:${PATH}"
    mkdir -p "${GOPATH}/src/github.com/docker" || true
    cd "${GOPATH}/src/github.com/docker"
    ln -sfT "${srcdir}/${pkgname}" infrakit
    cd infrakit

    patch -p1 < "${srcdir}/discovery.patch"

    make get-tools
}

build() {
    export GOPATH="${srcdir}/go"
    export PATH="${GOPATH}/bin:${PATH}"
    cd "${GOPATH}/src/github.com/docker/infrakit"
    make binaries
}

package() {
    install -d "${pkgdir}/usr/bin"

    for artifact in "${GOPATH}/src/github.com/docker/infrakit/build/"*; do
        install -D -m755 "$artifact" "${pkgdir}/usr/bin/$( basename "$artifact" )"
    done
}
