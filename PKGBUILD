# Maintainer: taotieren <admin@taotieren.com>

pkgname=luatos-tools-git
pkgver=0.3.0.r0.g98048da
pkgrel=3
pkgdesc="A CLI for building, flashing, and debugging LuatOS firmware on EC618 / EC7xx modules"
arch=($CARCH)
url="https://github.com/yuzhan-tech/luatos-tools"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
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
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

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
    install -Dm0755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin/"
    install -vDm644 /dev/stdin ${pkgdir}/usr/lib/udev/rules.d/71-luatos-tools-eigencomm.rules <<EOF
# This file should be copied to /etc/udev/rules.d on GNU/Linux OS and derived
# Add permission to all user to have complete acces to eeprom programmers
# EigenComm
SUBSYSTEM=="usb", ATTRS{idVendor}=="17d1", ATTRS{idProduct}=="0001", TAG+="uaccess"
EOF
}
