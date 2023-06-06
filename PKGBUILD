#Maintainer: Daniel Madmon : danielmadmon@protonmail.com
_pkgname=tasker-git
_pkgver=0.0.3
_pkgnamegit=tasker-0.0.3
pkgname=$_pkgname
pkgver=$_pkgver
pkgrel=1
pkgdesc="a package for executing commands on time basis"
arch=('x86_64')
url="https://github.com/DanielMadmon/tasker"
license=('GPL3')
depends=('libthemis' 'kwallet')
makedepends=('cargo' 'git')
provides=("tasker-git=0.0.3")
conflicts=(tasker-git)
source=("https://github.com/DanielMadmon/tasker/archive/refs/tags/v0.0.3.tar.gz")
sha256sums=('SKIP')
#user service should not have user section
#make sure --user service is loaded after kde/gnome keyring (kwalletd5)
#make a loop inside tasker that tries to get the keys only after keyring is running
prepare() {
    cd "${srcdir}/${_pkgnamegit}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${_pkgnamegit}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}
package() {
    cd "${srcdir}/${_pkgnamegit}/"
    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "${pkgdir}/usr/bin/" {} +
}