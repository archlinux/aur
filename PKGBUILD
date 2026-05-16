# Maintainer: Andy Kelk <andy@andykelk.net>
pkgname=yolobox
pkgver=0.17.0
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
sha256sums=('9b31656389c847a0f87ba8055ae7ab7c20d9c9e1cab11e7dd7ffff7891a2d841')

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
