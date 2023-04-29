# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=ffuf-git
pkgver=2.0.0.r6.g5fd821c
pkgrel=1
pkgdesc="A fast web fuzzer written in Go."
arch=('x86_64')
license=('MIT')
depends=()
makedepends=('go' 'git')
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/ffuf/ffuf.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
    cd "${srcdir}/${pkgname}"

    mkdir -p "${srcdir}/go/src/github.com/ffuf"
    ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/ffuf/ffuf"
}

build() {
    cd "${srcdir}/go/src/github.com/ffuf/ffuf"

    mkdir -p build

    export GOPATH="${srcdir}/go" GO111MODULE="auto"

    go build -trimpath -modcacherw -ldflags "-s -w" \
        -o build/ffuf .
}

package() {
    cd "${srcdir}/go/src/github.com/ffuf/ffuf"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 build/ffuf "${pkgdir}/usr/bin/ffuf"
}
