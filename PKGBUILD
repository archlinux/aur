# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=kdotool
pkgver=0.2.1
pkgrel=2
pkgdesc='A xdotool clone for KDE Wayland'
arch=('x86_64')
url='https://github.com/jinliu/kdotool/'
license=('Apache-2.0')
depends=(
    'dbus'
    'gcc-libs'
    'glibc')
makedepends=(
    'cargo')
source=("https://github.com/jinliu/kdotool/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('655d4c3d760ab3fdfa3798831c75c7dd7b4be1fe20a808fd18f2835a261d5bd5')

prepare() {
    export RUSTUP_TOOLCHAIN='stable'
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')" --manifest-path="${pkgname}-${pkgver}/Cargo.toml"
}

build() {
    export RUSTUP_TOOLCHAIN='stable'
    export CARGO_TARGET_DIR='target'
    cargo build --release --frozen --all-features --manifest-path="${pkgname}-${pkgver}/Cargo.toml"
}

check() {
    export RUSTUP_TOOLCHAIN='stable'
    export CARGO_TARGET_DIR='target'
    cargo test --frozen --all-features --manifest-path="${pkgname}-${pkgver}/Cargo.toml"
}

package() {
    find target/release -maxdepth 1 -type f -executable ! -name 'lib*' -exec install -D -m755 -t "${pkgdir}/usr/bin" {} +
}
