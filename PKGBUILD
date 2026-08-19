# Maintainer: Cedric Krause <cedware-dev@protonmail.com>
pkgname=bountui
pkgver=0.17.0
pkgrel=23
pkgdesc="A terminal-based user interface for interacting with HashiCorp Boundary"
arch=("any")
url="https://github.com/Cedware/bountui"
license=("GPL-3.0")
groups=()
depends=()
makedepends=("cargo")
checkdepends=()
optdepends=()
provides=("bountui")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/Cedware/bountui/archive/refs/tags/v0.17.0.tar.gz")
noextract=()
sha256sums=('4f47857c9b0dd1bc6be01a8d33393e4552ff89b0d785652b162c2dd904c0eb75')
validpgpkeys=()

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CFLAGS="" CXXFLAGS=""
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build(){
    cd "$srcdir/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CFLAGS="" CXXFLAGS=""
    # Stamp the package version for a correct `bountui --version` output and
    # mark the build as package-managed so the self-updater stays disabled —
    # updates are delivered by pacman.
    export BOUNTUI_VERSION="$pkgver"
    export BOUNTUI_PACKAGE_MANAGER="pacman"
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
