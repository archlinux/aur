# Maintainer: Your Name <your@email.com>
pkgname=wallity-git
pkgver=r20.08008c6
pkgrel=1
pkgdesc="A desktop wallpaper manager built with Rust and Iced for Wayland/Hyprland"
arch=('x86_64')
url="https://github.com/asce4s/wallity-iced"
license=('MIT')
depends=('wayland' 'gcc-libs')
makedepends=('cargo' 'git')
provides=('wallity')
conflicts=('wallity')
source=("${pkgname}::git+https://github.com/asce4s/wallity-iced.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "${pkgname}"
    install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/wallity"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
    install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}/" README.md
}
