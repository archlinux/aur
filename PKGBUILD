# Maintainer: Hein (Warky Devs) <hein@warky.dev>
pkgname=unitdore
pkgver=0.0.12
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
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/$pkgname-v$pkgver-source.zip")
sha256sums=('13082f3bebdc68d47ecf584e76011c9f501e47f8c4c462a9f19a8f939f729de7')

build() {
    cd "$pkgname-$pkgver"
    export CGO_ENABLED=0
    go build \
        -trimpath \
        -ldflags "-X github.com/warkanum/unitdore/cmd.version=$pkgver" \
        -o "$pkgname" .
}

check() {
    cd "$pkgname-$pkgver"
    go test ./...
}

package() {
    cd "$pkgname-$pkgver"

    # Binary
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Man page
    install -Dm644 docs/unitdore.1 "$pkgdir/usr/share/man/man1/unitdore.1"

    # Default config dir
    install -dm755 "$pkgdir/etc/unitdore"
}
