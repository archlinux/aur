# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgname=warp-plus
pkgver=1.2.4
pkgrel=1
pkgdesc="An open-source implementation of Cloudflare's Warp, enhanced with Psiphon integration"
arch=('x86_64')
url="https://github.com/bepass-org/warp-plus"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d28fe34748aac494d75cd25da12469e829fcdc6d9cfcdaabfbed200279dfd351')

prepare() {
    cd "${pkgname}-${pkgver}"
    mkdir -p build
}

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build ./cmd/...
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 build/warp-{plus,scan} -t "${pkgdir}/usr/bin"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
