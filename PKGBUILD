# Maintainer: Bolt J Woofson <https://github.com/Woofson>
pkgname=dotdog-git
pkgver=3.0.0.r0.g8fb1ae5
pkgrel=1
pkgdesc="DotDog 🐶 - Modern dotfile compositor with git versioning & NoteDog TUI (formerly Dot Matrix)"
arch=('x86_64')
url="https://github.com/Woofson/dotdog"
license=('MIT')
depends=('gcc-libs' 'oniguruma' 'zstd')
makedepends=('cargo' 'git')
provides=('dotdog' 'dotmatrix' 'dmx')
conflicts=('dotdog')
replaces=('dotmatrix-git')
source=("git+https://github.com/Woofson/dotdog.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/dotdog"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf "3.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/dotdog"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/dotdog"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export ZSTD_SYS_USE_PKG_CONFIG=1
    export RUSTONIG_SYSTEM_LIBONIG=1
    cargo build --release --workspace
}

check() {
    cd "$srcdir/dotdog"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --workspace
}

package() {
    cd "$srcdir/dotdog"
    install -Dm755 "target/release/dotdog" "$pkgdir/usr/bin/dotdog"
    install -Dm755 "target/release/dmx" "$pkgdir/usr/bin/dmx"
    # Legacy symlinks for backwards compatibility
    ln -sf "/usr/bin/dotdog" "$pkgdir/usr/bin/dmxtui"
    ln -sf "/usr/bin/dotdog" "$pkgdir/usr/bin/dmxcli"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
