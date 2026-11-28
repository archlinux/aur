# Maintainer: Israel Roldan <israel.alberto.rv@gmail.com>
#
# Builds the release tarball of the tag v${pkgver} and installs the
# command line tool, without GTK:
#   - /usr/bin/bose-connect-app-linux
#
# The window is the bose-connect-gui package.
#
# Test locally from this directory: `makepkg -si`.
# After changing this file: `makepkg --printsrcinfo > .SRCINFO`.

pkgname=bose-connect-cli
pkgver=0.8.0
pkgrel=1
pkgdesc="Control Bose Bluetooth headphones and speakers from the command line"
arch=('x86_64' 'aarch64')
url="https://github.com/airvzxf/bose-connect-app-linux"
license=('AGPL-3.0-or-later')
depends=(
    'bluez'
    'gcc-libs'
    'glibc'
)
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('115c6625bfd74c48cf889b30fd268a6fffc511a2eb09ccce7c45cc7d5da0e430')

_srcdir="bose-connect-app-linux-${pkgver}"

prepare() {
    cd "${_srcdir}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${_srcdir}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release -p bose-connect-cli
}

check() {
    cd "${_srcdir}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release -p bose-connect -p bose-connect-cli
}

package() {
    cd "${_srcdir}"

    install -Dm755 target/release/bose-connect-app-linux -t "${pkgdir}/usr/bin/"

    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 README.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
