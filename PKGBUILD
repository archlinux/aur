# Maintainer: Michael Dorst <m@mdorst.net>
pkgname=dotconfig
pkgver=0.2.0
pkgrel=1
sha256sums=('a6fee6135ca2e025615d387b41739fddc65253d3dd886282c4065d20d321f6c4')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A tool for symlinking configuration files from a central repository to their respective locations on the system in a repeatable, configurable way."
url="https://github.com/mfdorst/dotconfig"
source=(${pkgname}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
license=('MIT')
_archive="${pkgname}-${pkgver}"

# Generated in accordance to https://wiki.archlinux.org/title/Rust_package_guidelines.
# Might require further modification depending on the package involved.
prepare() {
    cd "${_archive}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${_archive}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${_archive}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "${_archive}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
