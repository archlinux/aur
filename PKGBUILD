# Maintainer: Daniel Azevedo <daniazevedo77@posteo.net>

pkgname=d77run
pkgver=0.3.0
pkgrel=1
pkgdesc="Minimal GTK4 run-dialog launcher (a rejuvenation of gmrun), with .desktop icon rendering"
arch=('x86_64' 'aarch64')
url="https://github.com/dani-77/d77run"
license=('MIT')
depends=('gtk4' 'glib2' 'gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('48fa3ab623e03e02f9af0b3e026e0959352aaa279a74872237a5df3001346203')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/d77run "$pkgdir/usr/bin/d77run"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 assets/d77run.desktop "$pkgdir/usr/share/applications/d77run.desktop"
    install -Dm644 assets/d77run-icon.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/d77run.svg"
    for size in 16 32 192 512; do
        install -Dm644 "assets/d77run-icon-$size.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/d77run.png"
    done
}
