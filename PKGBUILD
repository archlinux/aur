# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=jolt
pkgver=1.2.0
pkgrel=1
pkgdesc='TUI-based battery and energy monitor.'
arch=('x86_64' 'aarch64')
url='https://github.com/jordond/jolt'
license=('MIT')
makedepends=('cargo')
provides=('jolt')
conflicts=('jolt-git' 'jolt-bin')
options=(!lto)
install='jolt.install'
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
    'jolt.install'
    "$pkgname-$pkgver.tar.gz.asc"
    'jolt.install.asc')
sha256sums=('c6756b84349a6f253d81eb9ad6074f9b94461043c053b1b7ce5f86c2e1bed04d'
            '08972ab4d23a67622d2177988338c7a4a4341b4f1557b359f30b7512fb277fff'
            'SKIP'
            'SKIP')
validpgpkeys=('EF4B4CB5DFB8822216A473B1597AB12E66262898')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/jolt"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/user/" assets/jolt.service
}

# vim: ts=4 sw=4 et:
