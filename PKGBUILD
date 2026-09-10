# Maintainer: taotieren <admin@taotieren.com>

pkgname=luatos-tools
pkgver=0.3.0
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
sha256sums=('010b1496c539bee4d28ec8fef84f6896b1312a2c5e729a25c3a6b98363092da1')

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
    install -vDm644 /dev/stdin ${pkgdir}/usr/lib/udev/rules.d/71-luatos-tools-eigencomm.rules <<EOF
# This file should be copied to /etc/udev/rules.d on GNU/Linux OS and derived
# Add permission to all user to have complete acces to eeprom programmers
# EigenComm
SUBSYSTEM=="usb", ATTRS{idVendor}=="17d1", ATTRS{idProduct}=="0001", TAG+="uaccess"
EOF
}
