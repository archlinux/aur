# Maintainer: Sricharan <sricharanandra7@gmail.com>
pkgname=radiochat-tui-git
_pkgname=radiochat
pkgver=r1.09a79e9  # This is a placeholder; makepkg updates it automatically
pkgrel=1
pkgdesc="E2EE Terminal Chat Client (radiochat)"
arch=('x86_64' 'aarch64')
url="https://github.com/sricharanandra/radiochat-tui"
license=('MIT')
depends=('gcc-libs' 'libxcb') # libxcb is needed for clipboard support
makedepends=('cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')
pkgver() {
    cd "$srcdir/radiochat-tui"
    # Generates version based on latest git commit (e.g., r42.g123abc)
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
    cd "$srcdir/radiochat-tui"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}
build() {
    cd "$srcdir/radiochat-tui"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}
package() {
    cd "$srcdir/radiochat-tui"
    # Installs the binary to /usr/bin/radiochat
    install -Dm755 target/release/radiochat "$pkgdir/usr/bin/radiochat"
}
