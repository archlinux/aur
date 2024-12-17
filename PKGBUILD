# Maintainer: Lexi <@alexis@fearness.org> (a fediverse address)

pkgname=catgirl-engine
cratename=catgirl-engine
pkgdesc="A game engine for cool moddability and procedurally generated data"
arch=('any')
url="https://github.com/foxgirl-labs/catgirl-engine"
license=(Zlib)
pkgver=0.14.44
cratever=0.14.44
pkgrel=1
conflicts=(catgirl-engine-git)
source=($cratename-$cratever.tar.gz::https://static.crates.io/crates/$cratename/$cratename-$cratever.crate)
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

    cd "$cratename-$cratever"
    rustup install $RUSTUP_TOOLCHAIN
    cargo +$RUSTUP_TOOLCHAIN fetch --locked --target "$CARCH-unknown-linux-gnu"
}

# Builds files
build() {
    export RUSTFLAGS="-L/usr/lib -lzstd"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$cratename-$cratever"
    cargo +$RUSTUP_TOOLCHAIN build --frozen --release
}

# Checks built files
check() {
    export RUSTUP_TOOLCHAIN=stable

    cd "$cratename-$cratever"
    cargo +$RUSTUP_TOOLCHAIN test --frozen --release
}

# Packages built files
package() {
    cd "$cratename-$cratever"

    # Install Engine
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$cratename"

    # Setup Helper Files
    sed -i "s/\${engine_path}/\/usr\/bin\/$cratename/" "resources/linux/install/game-engine.desktop"

    # Install Helper Files
    install -Dm0755 -t "$pkgdir/usr/share/icons/$cratename.svg" "resources/assets/vanilla/texture/logo/logo.svg"
    install -Dm0755 -t "$pkgdir/usr/share/applications/$cratename.desktop" "resources/linux/install/game-engine.desktop"
}
