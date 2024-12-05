# Maintainer: Lexi <@alexis@fearness.org> (a fediverse address)

pkgname=catgirl-engine-git
enginename=catgirl-engine
pkgdesc="A game engine for cool moddability and procedurally generated data"
arch=('any')
license=(Zlib)
url="https://github.com/foxgirl-labs/catgirl-engine"
pkgver=v0.14.40.r0.ge34977d
pkgrel=1
provides=("catgirl-engine=${pkgver%%.r*}")
conflicts=(catgirl-engine)
repo=("https://github.com/foxgirl-labs/$enginename.git")
# source=("git+https://github.com/foxgirl-labs/catgirl-engine.git")
# b2sums=("SKIP")
options=(!strip !debug)
depends=()
makedepends=(
    "git"
    "git-lfs"
    "rustup"
    "cargo"
    "sed"
)
optdepends=(
    "wayland: Graphics display server"
    "xorg-server: Graphics display server"
)

# Automatically updates pkgver variable
pkgver() {
    cd "$enginename"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# Prepares for building
prepare() {
    export RUSTUP_TOOLCHAIN=stable

    clone

    cd "$enginename"
    rustup install $RUSTUP_TOOLCHAIN
    cargo +$RUSTUP_TOOLCHAIN fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

# Clones repo to workaround lack of git+lfs support
clone() {
    rm -rf $enginename --preserve-root=all
    git clone --recursive $repo $enginename
}

# Builds files
build() {
    export RUSTFLAGS="-L/usr/lib -lzstd"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$enginename"
    cargo +$RUSTUP_TOOLCHAIN build --frozen --release
}

# Checks built files
check() {
    export RUSTUP_TOOLCHAIN=stable

    cd "$enginename"
    cargo +$RUSTUP_TOOLCHAIN test --frozen --workspace
}

# Packages built files
package() {
    cd "$enginename"

    # Install Engine
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$enginename"

    # Setup Helper Files
    sed -i "s/\${engine_path}/\/usr\/bin\/$enginename/" "resources/linux/install/game-engine.desktop"

    # Install Helper Files
    install -Dm0755 -t "$pkgdir/usr/share/icons/$pkgname.svg" "resources/assets/vanilla/texture/logo/logo.svg"
    install -Dm0755 -t "$pkgdir/usr/share/applications/$pkgname.desktop" "resources/linux/install/game-engine.desktop"
}
