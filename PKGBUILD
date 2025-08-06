# Maintainer: snit <snit@cock.li>

_pkgname=pi-im
pkgname="${_pkgname}-wayland"
pkgver=3.1a_r
pkgrel=1
provides=("${_pkgname}")
pkgdesc='Experimental and extremely weird XMPP client written in Go. No solicitors.'
url="https://github.com/sunglocto/${_pkgname}"
arch=('x86_64')
license=('AGPL')
makedepends=('go')

source=("https://github.com/sunglocto/${_pkgname}/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha256sums=('e59ee05e0f2becc6f43c3397d75ed166c5523969eecda32b9b9ac774003faa66')

prepare() {
    cd "${_pkgname}-${pkgver//_/-}/"
    mkdir -p 'build/'
}

build() {
    cd "${_pkgname}-${pkgver//_/-}/"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'

    go build -tags wayland -o "${_pkgname}" .
}

package() {
    cd "${_pkgname}-${pkgver//_/-}/"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
