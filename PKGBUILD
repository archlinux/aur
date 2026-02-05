# Maintainer: lawliet <https://github.com/laewliet>
pkgname=make-your-choice
pkgver=2.5
pkgrel=1
pkgdesc="Dead by Daylight server region selector for Linux"
arch=('x86_64')
url="https://github.com/laewliet/make-your-choice"
license=('custom')
depends=('gtk4' 'polkit')
makedepends=('cargo' 'git')
source=("git+https://github.com/laewliet/make-your-choice.git#tag=v${pkgver/_/-}")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname/linux"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname/linux"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$srcdir/$pkgname/linux"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "$srcdir/$pkgname"
    
    # Install binary
    install -Dm755 "linux/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    
    # Install desktop file
    install -Dm644 "linux/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    
    # Install icon
    install -Dm644 "linux/icon.ico" "$pkgdir/usr/share/pixmaps/$pkgname.ico"
    
    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
