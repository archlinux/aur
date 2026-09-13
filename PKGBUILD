# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=kdotool
pkgver=0.3.0
pkgrel=1
pkgdesc='A xdotool clone for KDE Wayland'
arch=('x86_64')
url='https://github.com/jinliu/kdotool/'
license=('Apache-2.0')
depends=(
    'dbus'
    'glibc'
    'libgcc')
makedepends=(
    'cargo')
source=("https://github.com/jinliu/kdotool/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('78e969941b1861aad849cad9bff7c34d34268912bf8042d5b3e9fbebcbb96f6d')

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
    install -D -m644 "${pkgname}-${pkgver}/completions/kdotool.bash" "${pkgdir}/usr/share/bash-completion/completions/kdotool"
}
