# Maintainer: Mikhail Swift <mikhail.swift@gmail.com>
pkgname=lazydocker
pkgver=0.2.4
pkgrel=1
pkgdesc='A simple terminal UI for docker and docker-compose, written in Go with the gocui library.'
arch=('1686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/jesseduffield/lazydocker'
license=('MIT')
makedepends=('go' 'dep')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jesseduffield/lazydocker/archive/v${pkgver}.tar.gz")
sha1sums=('0b4ded9bee5a4227e6ccfdf085a135b623a5a9c1')

prepare() {
    mkdir -p gopath/src/github.com/jesseduffield/
    ln -rTsf ${pkgname}-${pkgver} gopath/src/github.com/jesseduffield/lazydocker
    export GOPATH="${srcdir}/gopath"
    cd gopath/src/github.com/jesseduffield/lazydocker
    dep ensure
}

build() {
    export GOPATH="${srcdir}/gopath"
    cd gopath/src/github.com/jesseduffield/lazydocker
    go build \
        -gcflags=all=-trimpath=${PWD} \
        -asmflags=all=-trimpath=${PWD} \
        -ldflags=-extldflags=-zrelro \
        -ldflags=-extldflags=-znow \
        -ldflags "-s -w -X main.version=${pkgver}" \
        -o ${pkgname} \
        main.go
}

check() {
    export GOPATH="${srcdir}/gopath"
    cd gopath/src/github.com/jesseduffield/lazydocker
    ./test.sh
}

package() {
    install -Dm755 gopath/src/github.com/jesseduffield/lazydocker/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
