# Maintainer: Mikhail Swift <mikhail.swift@gmail.com>
pkgname=lazydocker-git
_pkgname=lazydocker
pkgver=0.2.4.r2.gd590b2b
pkgrel=1
pkgdesc='A simple terminal UI for docker and docker-compose, written in Go with the gocui library.'
arch=('x86_64')
url='https://github.com/jesseduffield/lazydocker'
license=('MIT')
options=('!strip' '!emptydirs')
makedepends=('go' 'dep')
conflicts=('lazydocker')
provides=('lazydocker')
source=("${_pkgname}::git+https://github.com/jesseduffield/lazydocker.git#branch=master")
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    mkdir -p gopath/src/github.com/jesseduffield/
    ln -rTsf ${_pkgname} gopath/src/github.com/jesseduffield/lazydocker
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
