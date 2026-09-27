# Maintainer: Vladimir Bauer <vbauerster at gmail dot com>

pkgname=getparty
pkgdesc='HTTP download manager with multi-parts'
pkgver=1.28.2
pkgrel=1
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/vbauerster/${pkgname}.git"
license=('BSD-3-Clause')
provides=("${pkgname}")
conflicts=("${pkgname}-bin")
depends=('glibc')
makedepends=('git' 'go')
source=("${pkgname}::git+${url}#tag=v${pkgver}")
b2sums=('e7ef3c416f8cd8299756acd6e695ee5c58771101cc06a4f157f7ed7c9c30a7e6660f56fed78f7c4e0d5aaf74dc5be3370c97eec9e29eb3c406668b69277a0ee8')

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
