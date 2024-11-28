# Maintainer: Lexi <@alexis@fearness.org> (a fediverse address)

pkgname=catgirl-engine
pkgdesc="A game engine for cool moddability and procedurally generated data"
arch=('any')
url="https://github.com/lexi-the-cute/catgirl-engine"
license=(Zlib)
pkgver=0.14.37.alpha
cratever=0.14.37-alpha
pkgrel=1
conflicts=(catgirl-engine-git)
source=($pkgname-$cratever.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$cratever.crate)
b2sums=("SKIP")
options=(!strip !debug)
makedepends=(
    "rustup"
    "cargo"
    "sed"
)
optdepends=(
    "wayland: Graphics display server"
    "xorg-server: Graphics display server"
)

# Generated in accordance to https://wiki.archlinux.org/title/Rust_package_guidelines.
# Might require further modification depending on the package involved.
prepare() {
    export RUSTUP_TOOLCHAIN=stable

    cd "$pkgname-$cratever"
    rustup install $RUSTUP_TOOLCHAIN
    cargo +$RUSTUP_TOOLCHAIN fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTFLAGS="-L/usr/lib -lzstd"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$pkgname-$cratever"
    cargo +$RUSTUP_TOOLCHAIN build --frozen --release
}

check() {
    export RUSTUP_TOOLCHAIN=stable

    cd "$pkgname-$cratever"
    cargo +$RUSTUP_TOOLCHAIN test --frozen --release
}

package() {
    cd "$pkgname-$cratever"

    # Install Engine
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"

    # Setup Helper Files
    sed -i "s/\${engine_path}/\/usr\/bin\/$pkgname/" "resources/linux/install/game-engine.desktop"

    # Install Helper Files
    install -Dm0755 -t "$pkgdir/usr/share/icons/$pkgname.svg" "resources/assets/vanilla/texture/logo/logo.svg"
    install -Dm0755 -t "$pkgdir/usr/share/applications/$pkgname.desktop" "resources/linux/install/game-engine.desktop"
}
