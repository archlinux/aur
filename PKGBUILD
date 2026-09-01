# Maintainer: Vladimir Bauer <vbauerster at gmail dot com>

pkgname=getparty
pkgdesc='HTTP download manager with multi-parts'
pkgver=1.28.1
pkgrel=1
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/vbauerster/${pkgname}.git"
license=('BSD-3-Clause')
provides=("${pkgname}")
conflicts=("${pkgname}-bin")
depends=('glibc')
makedepends=('git' 'go')
source=("${pkgname}::git+${url}#tag=v${pkgver}")
b2sums=('c5cc49647eab56e232462e536bedb3d5609759078e0d792c99bb0b39083215b8eb9ba2d580cf2ea857e4fecc69ebc1d00f8aff28aa862ecf9c55b247132796fe')

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
