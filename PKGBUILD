# Maintainer: Your Name <your@email.com>
pkgname=k-shrink
pkgver=1.0.0
pkgrel=1
pkgdesc="Wayland clipboard daemon that automatically compresses copied images"
arch=('x86_64' 'aarch64')
url="https://github.com/GKaszewski/k-shrink"
license=('MIT')
depends=('wayland')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d26601148005821c03454ea91828e5af6f3506baa1b5860b220aaac5c305cc5d')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/k-shrink" "$pkgdir/usr/bin/k-shrink"

    # systemd user service (AUR path uses /usr/bin/k-shrink)
    install -Dm644 "contrib/k-shrink.service" "$pkgdir/usr/lib/systemd/user/k-shrink.service"
    sed -i 's|%h/.cargo/bin/k-shrink|/usr/bin/k-shrink|' \
        "$pkgdir/usr/lib/systemd/user/k-shrink.service"

    # man page
    install -Dm644 "man/k-shrink.1" "$pkgdir/usr/share/man/man1/k-shrink.1"
    gzip -9 "$pkgdir/usr/share/man/man1/k-shrink.1"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
