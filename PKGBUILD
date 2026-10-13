# Maintainer: mestik78 <https://github.com/Mestik78>
pkgname=hyprgrid-git
pkgver=0.1.0.r2.gc60bbd3
pkgrel=1
pkgdesc="Ultra-fast 3D workspace grid manager for Hyprland (Monitor × Row × Column)"
arch=('x86_64')
url="https://github.com/Mestik78/hyprgrid"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
provides=('hyprgrid')
conflicts=('hyprgrid')
source=("git+https://github.com/Mestik78/hyprgrid.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/hyprgrid"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || \
    printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "${srcdir}/hyprgrid"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}/hyprgrid"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${srcdir}/hyprgrid"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "${srcdir}/hyprgrid"
    install -Dm755 target/release/hyprgrid "${pkgdir}/usr/bin/hyprgrid"
    install -Dm644 hyprgrid.example.toml "${pkgdir}/usr/share/hyprgrid/config.example.toml"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
