# Maintainer: Kosa Matyas <kosa03matyas@gmail.com>
pkgname=hyprkcs-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A fast, minimal Hyprland keybind cheat sheet written in Rust/GTK4"
arch=('x86_64')
url="https://github.com/kosa12/hyprKCS"
license=('MIT')
depends=('gtk4' 'libadwaita' 'glibc' 'gcc-libs')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm755 "target/release/hyprKCS" "$pkgdir/usr/bin/hyprKCS"
}
