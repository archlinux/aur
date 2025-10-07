# Maintainer: Andy Bao <contact at andybao dot me>
pkgname=onetun
pkgdesc="Access your WireGuard network from any device, without root access or having to install WireGuard locally."
pkgver=0.3.10
pkgrel=1
arch=('x86_64' 'i686' 'pentium4' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/aramperes/onetun"
license=('MIT')
makedepends=('cargo')
# Disable LTO as it breaks build: https://github.com/briansmith/ring/issues/1444#issuecomment-1813262575
options=(!lto)
source=(
    "$url/archive/v$pkgver.tar.gz"
    "$pkgname@.service"
    "$pkgname.target"
    "example.conf"
)
sha256sums=(
    'a93ae32024dcf32002392f2b9fa7ca9b7d2d898b5e9e75511d2624b03aca60d5'
    'SKIP'
    'SKIP'
    'SKIP'
)

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked --target-dir=target
}

package() {
    install -Dm644 "$pkgname@.service" -t "$pkgdir/usr/lib/systemd/system/"
    install -Dm644 "$pkgname.target" -t "$pkgdir/usr/lib/systemd/system/"
    install -Dm755 "example.conf" -t "$pkgdir/usr/share/$pkgname/"

    cd "$pkgname-$pkgver"
    install -dm0700 "$pkgdir/etc/$pkgname/"
    install -Dm755 "target/release/onetun" "$pkgdir/usr/bin/onetun"
}
