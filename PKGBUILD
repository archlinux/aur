# Maintainer: Hein (Warky Devs) <hein@warky.dev>
pkgname=unitdore
pkgver=0.0.3
pkgrel=2
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
backup=('etc/unitdore/units.yaml')
source=("$pkgname-$pkgver.zip::$url/archive/v$pkgver.zip")
sha256sums=('SKIP')

build() {
    cd "$pkgname-v$pkgver"
    export CGO_ENABLED=0
    go build \
        -trimpath \
        -ldflags "-X main.version=$pkgver" \
        -o "$pkgname" .
}

check() {
    cd "$pkgname-v$pkgver"
    go test ./...
}

package() {
    cd "$pkgname-v$pkgver"

    # Binary
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Man page
    install -Dm644 docs/unitdore.1 "$pkgdir/usr/share/man/man1/unitdore.1"

    # Default config dir
    install -dm755 "$pkgdir/etc/unitdore"
}
