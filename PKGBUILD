# Maintainer: Vladimir Bauer <vbauerster at gmail dot com>

pkgname=getparty
pkgdesc='HTTP download manager with multi-parts'
pkgver=1.25.2
pkgrel=1
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/vbauerster/${pkgname}.git"
license=('BSD-3-Clause')
provides=("${pkgname}")
conflicts=("${pkgname}-bin")
depends=('glibc')
makedepends=('git' 'go')
source=("${pkgname}::git+${url}#tag=v${pkgver}")
b2sums=('2fa969d9afe063ea8d8cde86502f1e0b5e9136360f2482e3c29f1aad03a1e96271d15de1d01b426a22d3acc278efcaa3216ace1aad65634210fa4bd78b72bbdf')

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
