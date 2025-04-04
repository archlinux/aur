# Maintainer: ftk

_pkgname=spectro-cam-rs
pkgname=${_pkgname}-git
pkgdesc="A cross-platform GUI for webcam-based spectrometers."
pkgver=0.2.0.r92
pkgrel=1
arch=('x86_64' 'i686' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/DerFetzer/${_pkgname}"
license=('Apache-2.0 OR MIT')
makedepends=('cargo' 'git')
depends=()
options=('!lto')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')


pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).r$(git rev-list --count HEAD)"
}


prepare() {
    cd "${srcdir}/${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}/${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "${srcdir}/${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "${srcdir}/${_pkgname}/target/release/${_pkgname}"
}
