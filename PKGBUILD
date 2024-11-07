# Maintainer: Lexi <@alexis@foxgirl.land> (a fediverse address)

pkgname=catgirl-engine-git
pkgdesc="A game engine for cool moddability and procedurally generated data"
arch=('any')
license=(Zlib)
url="https://github.com/lexi-the-cute/catgirl-engine"
pkgver=v0.14.15.r1.gbffb0bb
pkgrel=1
provides=("catgirl-engine=${pkgver%%.r*}")
conflicts=(catgirl-engine)
source=("git+https://github.com/lexi-the-cute/catgirl-engine.git")
b2sums=("SKIP")
options=(!strip !debug)
depends=()
makedepends=(
    "git"
    "rustup"
    "cargo-nightly"
    "sed"
)
optdepends=(
    "wayland: Graphics display server"
    "xorg-server: Graphics display server"
)

# Automatically updates pkgver variable
pkgver() {
    cd "catgirl-engine"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# Prepares for building
prepare() {
    export RUSTUP_TOOLCHAIN=nightly
    cd "catgirl-engine"
    rustup install nightly
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

# Builds files
build() {
    export RUSTFLAGS="-L/usr/lib -lzstd"
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    cd "catgirl-engine"
    cargo build --frozen --release
}

# Checks built files
check() {
    cd "catgirl-engine"
    cargo test --frozen --workspace
}

# Packages built files
package() {
    cd "catgirl-engine"
    sed -i "s/\${engine_path}/\/usr\/bin\/catgirl-engine/" client/assets/resources/catgirl-engine.desktop
    mv client/assets/vanilla/texture/logo/logo-1024x1024-color.png client/assets/vanilla/texture/logo/catgirl-engine.png

    install -Dm0755 -t "$pkgdir/usr/share/icons" "client/assets/vanilla/texture/logo/catgirl-engine.png"
    install -Dm0755 -t "$pkgdir/usr/share/applications/" "client/assets/resources/catgirl-engine.desktop"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/catgirl-engine"
}
