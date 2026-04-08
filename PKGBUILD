# Maintainer: Hein (Warky Devs) <hein@warky.dev>
pkgname=unitdore
pkgver=0.0.6
pkgrel=1
pkgdesc="A door you open and close for container units — manage containers via systemd"
arch=('x86_64' 'aarch64')
url="https://git.warky.dev/wdevs/unitdore"
license=('MIT')
depends=('systemd')
optdepends=(
    'podman: Podman container runtime support'
    'docker: Docker container runtime support'
)
makedepends=('go')
source=("$pkgname-$pkgver.zip::$url/archive/v$pkgver.zip")
sha256sums=('9fdeae5ce80a95fc4692ff5d0de5aa04f14ce9cd49d106fd5ede838132eb9324')

build() {
    cd "$pkgname"
    export CGO_ENABLED=0
    go build \
        -trimpath \
        -ldflags "-X github.com/warkanum/unitdore/cmd.version=$pkgver" \
        -o "$pkgname" .
}

check() {
    cd "$pkgname"
    go test ./...
}

package() {
    cd "$pkgname"

    # Binary
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Man page
    install -Dm644 docs/unitdore.1 "$pkgdir/usr/share/man/man1/unitdore.1"

    # Default config dir
    install -dm755 "$pkgdir/etc/unitdore"
}
