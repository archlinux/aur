# Maintainer: Kyle Shiue <shiue.kyle@gmail.com>
# Maintainer: Ilesh Thiada <ileshkt@gmail.com>
# Contributor: Imperator Storm <ImperatorStorm11@protonmail.com>
pkgname=ferium-git
_pkgname=ferium
pkgver=3.28.7.r3.g7e795a6
pkgrel=1
pkgdesc="Ferium is an easy to use CLI program for downloading and updating Minecraft mods from Modrinth, CurseForge, and GitHub Releases."
arch=("x86_64")
depends=("gcc-libs")
makedepends=("cargo" "git")
provides=("ferium")
conflicts=("ferium-gui-bin" "ferium-bin" "ferium-gui-git" "ferium")
url="https://github.com/theRookieCoder/ferium"
license=('MPL2')
source=('git+https://github.com/theRookieCoder/ferium')
sha256sums=('SKIP')
pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
    cd "$srcdir/ferium"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}
build(){
    cd "$srcdir/ferium"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --no-default-features
}

check() {
    cd "$srcdir/ferium"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --no-default-features
}

package() {
    cd "$srcdir/ferium"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/ferium"
}
