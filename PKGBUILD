# Maintainer: taotieren <admin@taotieren.com>

pkgname=rusbmux
pkgver=0.2.1
pkgrel=1
pkgdesc="A usbmuxd replacement in pure Rust"
arch=($CARCH)
url="https://github.com/abdubanna/rusbmux"
license=('Apache-2.0 OR MIT')
provides=(${pkgname} usbmuxd)
conflicts=(${pkgname} usbmuxd)
replaces=()
depends=(
    libgcc
)
makedepends=(
    git
    rust
    pkgconf
)
backup=()
options=('!lto')
install=${pkgname}.install
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('9ecf99582d0ea9b2c39b69c32d4066c4b6747cfd00dcaa41614050de56a30caf')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}/"
    # cargo update -w
    cargo fetch --locked --target host-tuple
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_PROFILE_RELEASE_LTO=false
    cargo build --release --features bin --locked
}

# check() {
#     cd "${srcdir}/${pkgname}/"

#     export RUSTUP_TOOLCHAIN=stable
#     cargo test --all-features
# }

package() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    install -vDm0644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -vDm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm0755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin/"
    install -vDm0644 "systemd/rusbmux.service" -t "$pkgdir/usr/lib/systemd/system/"
}
