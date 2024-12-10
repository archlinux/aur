# Maintainer: Fredrik Angelsen <fredrikangelsen@gmail.com>

pkgname=cigale
pkgver=0.5.4
pkgrel=1
pkgdesc="A timesheet generator based on system activity traces"
arch=('x86_64')
url="https://github.com/emmanueltouzery/cigale"
license=('MIT')
makedepends=('cargo' 'gtk3' 'adwaita-icon-theme')
depends=('glibc' 'gcc-libs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('1c22a1e2ed9d6b113727099be9510f0f842a203e82457361cbf247e7c69c20270d1c6fc09e7c3c4c28fcdf7e3529d2bb27dd2b96e9e8960e8e2de2a305736bb5')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="--remap-path-prefix=$srcdir=."
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export RUSTFLAGS="--remap-path-prefix=$srcdir=."
    cargo test --frozen --all-features -- --skip it_can_get_events_for_the_cigale_repo
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    strip "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 com.github.emmanueltouzery.cigale.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.github.emmanueltouzery.cigale.svg"
    install -Dm644 "$startdir/cigale.desktop" \
        "$pkgdir/usr/share/applications/cigale.desktop"
}
