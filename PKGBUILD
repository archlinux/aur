# Maintainer: Andy Kelk <andy@andykelk.net>
pkgname=yolobox
pkgver=0.9.4
pkgrel=1
pkgdesc="Sandboxing tool for AI coding agents using containers"
arch=('x86_64' 'aarch64')
url="https://github.com/finbarr/yolobox"
license=('MIT')
depends=()
makedepends=('go' 'git')
optdepends=(
    'docker: Container runtime (recommended)'
    'podman: Alternative container runtime'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/finbarr/yolobox/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bd1d37ddd363135a3a87f3828be511982ee168a641884a824750a3c7b7bbbcbb')

build() {
    cd "$pkgname-$pkgver"
    export CGO_ENABLED=1
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    make build
}

check() {
    cd "$pkgname-$pkgver"
    make test
}

package() {
    cd "$pkgname-$pkgver"
    make install PREFIX="$pkgdir/usr"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
