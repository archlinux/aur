# Maintainer: Andy Kelk <andy@andykelk.net>
pkgname=yolobox
pkgver=0.13.1
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
sha256sums=('4b9560d68154bbf76b409764969527e0d218c236c26c740c9cd52b3e22b94950')

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
