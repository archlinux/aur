# Maintainer: taotieren <admin@taotieren.com>

pkgname=luatos-tools
pkgver=0.2.0
pkgrel=1
pkgdesc="A CLI for building, flashing, and debugging LuatOS firmware on EC618 / EC7xx modules"
arch=($CARCH)
url="https://github.com/yuzhan-tech/luatos-tools"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    glibc
    libgcc_s.so
    systemd-libs
)
makedepends=(
    git
    rust
    pkgconf
)
optdepends=(
    "ch343ser-dkms"
    "libftdi: A library to talk to FTDI chips"
)
backup=()
options=('!lto')
install=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('c054fcfe9a5a38965aeb08cc65bb2b5afc605f7999911286f4ef956142b1e70c')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}/"
    cargo update -w
    cargo fetch --locked --target host-tuple
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

# check() {
#     cd "${srcdir}/${pkgname}/"

#     export RUSTUP_TOOLCHAIN=stable
#     cargo test --all-features
# }

package() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    install -Dm0644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm0755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin/"
}
