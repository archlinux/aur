# Maintainer: Vladimir Bauer <vbauerster at gmail dot com>

pkgname=getparty
pkgdesc='HTTP download manager with multi-parts'
pkgver=1.28.0
pkgrel=1
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/vbauerster/${pkgname}.git"
license=('BSD-3-Clause')
provides=("${pkgname}")
conflicts=("${pkgname}-bin")
depends=('glibc')
makedepends=('git' 'go')
source=("${pkgname}::git+${url}#tag=v${pkgver}")
b2sums=('7ea235223efab6e87c21cda8657e3e1339f193d2dd924a336816b9d9af8dda34171bf25d66892592ab3c4cf471526c2f6a0830c58e0bd09a57a608a91666ad65')

build() {
    local _commit _flags
    _commit=$(git -C "${pkgname}" rev-parse --short "v${pkgver}")
    _flags=(
    -linkmode=external
    -X=main.version="${pkgver}"
    -X=main.commit="${_commit}"
    )
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

    go build -C "${pkgname}/cmd/${pkgname}" -ldflags="${_flags[*]}"
}

check() {
    go test -C "${pkgname}" ./...
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "${pkgname}/cmd/${pkgname}/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgname}/LICENSE"
}
