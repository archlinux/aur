# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=ginkgo-git
pkgver=2.1.4.r9.gbbefe12
pkgrel=1
pkgdesc="BDD Testing Framework for Go"
arch=('x86_64')
url="http://onsi.github.io/ginkgo/"
license=('MIT')
depends=()
makedepends=('go')
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/onsi/ginkgo.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
    cd "${srcdir}/${pkgname}"

    mkdir -p "${srcdir}/go/src/github.com/onsi"
    ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/onsi/ginkgo"
}

build() {
    cd "${srcdir}/go/src/github.com/onsi/ginkgo"

    mkdir -p build

    export GOPATH="${srcdir}/go"
    go build \
        -trimpath -modcacherw -ldflags "-s -w" \
        -o build/ginkgo ./ginkgo
}

package() {
    cd "${srcdir}/go/src/github.com/onsi/ginkgo"

    install -Dm755 build/ginkgo "${pkgdir}/usr/bin/ginkgo"
}
