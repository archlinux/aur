# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=go-bindata-hashicorp
_pkgname=go-bindata
_commit=bf7910af899725e4938903fb32048c7c0b15f12e
pkgver=3.0.7+bf7910af
pkgrel=5
pkgdesc="A small utility which generates Go code from any file (Hashicorp version)"
arch=('x86_64')
url='https://github.com/hashicorp/go-bindata'
license=('CC0 1.0')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/hashicorp/go-bindata#commit=${_commit}")
sha512sums=('SKIP')
provides=('go-bindata')
conflicts=('go-bindata')

prepare() {
    mkdir -p "${srcdir}/src/github.com/hashicorp/"
    mv "${srcdir}/${_pkgname}" "${srcdir}/src/github.com/hashicorp/go-bindata"
}

build() {
    export GO111MODULE=off
    cd "${srcdir}/src/github.com/hashicorp/go-bindata/go-bindata"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    GOPATH="${srcdir}" go build
}

package() {
    cd "${srcdir}/src/github.com/hashicorp/go-bindata/go-bindata"
    install -Dm755 "go-bindata" "${pkgdir}/usr/bin/go-bindata"
    install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
