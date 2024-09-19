# Maintainer: Adam Perkowski <adas1per@protonmail.com>
pkgname=linutil-git
_pkgname=linutil
pkgver=2024.09.19.r30.gc3eea0d
pkgrel=1
pkgdesc="Chris Titus Tech's Linutil is a distro-agnostic toolbox designed to simplify everyday Linux tasks."
arch=('x86_64')
url="https://github.com/ChrisTitusTech/$_pkgname"
license=('MIT')
source=("git+https://github.com/ChrisTitusTech/$_pkgname")
sha256sums=(SKIP)
makedepends=(rustup)
depends=('git' 'pacman' 'glibc' 'gcc-libs')
optdepends=('ttf-nerd-fonts-symbols: symbols and icons')
conflicts=($_pkgname)
provides=($_pkgname)

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable

    cd "$_pkgname"

    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$_pkgname"

    cargo build --frozen --release --all-features
}

package() {
    cd "$_pkgname"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}
