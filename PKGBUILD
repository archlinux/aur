# Maintainer: Woofson <https://github.com/Woofson>
pkgname=dotmatrix-git
pkgver=0.4.2.r10.g02e7bd0
pkgrel=1
pkgdesc="Dotfile management and versioning tool with TUI and GUI"
arch=('x86_64')
url="https://github.com/Woofson/dotmatrix"
license=('MIT')
depends=('gcc-libs' 'libxcb' 'libxkbcommon' 'libgl' 'oniguruma' 'zstd')
makedepends=('cargo' 'git')
provides=('dotmatrix')
conflicts=('dotmatrix')
source=("git+https://github.com/Woofson/dotmatrix.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/dotmatrix"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/dotmatrix"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/dotmatrix"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Use system zstd and oniguruma
    export ZSTD_SYS_USE_PKG_CONFIG=1
    export RUSTONIG_SYSTEM_LIBONIG=1
    cargo build --release
}

check() {
    cd "$srcdir/dotmatrix"
    export RUSTUP_TOOLCHAIN=stable
    cargo test
}

package() {
    cd "$srcdir/dotmatrix"
    install -Dm755 "target/release/dotmatrix" "$pkgdir/usr/bin/dotmatrix"
    install -Dm755 "target/release/dmgui" "$pkgdir/usr/bin/dmgui"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
