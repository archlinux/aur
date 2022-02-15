# Maintainer: Andy Bao <contact at andybao dot me>
pkgname=onetun
pkgdesc="Access your WireGuard network from any device, without root access or having to install WireGuard locally."
pkgver=0.3.0
pkgrel=1
arch=('x86_64' 'i686' 'pentium4' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/aramperes/onetun"
license=('MIT')
makedepends=('cargo')
source=(
    "$url/archive/v$pkgver.tar.gz"
    "$pkgname@.service"
    "$pkgname.target"
    "example.conf"
)
sha256sums=(
    'aecbcdcfc24655170c8255729f0414f1b8054b9f424a1aa1116ea51a4a17e92f'
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
