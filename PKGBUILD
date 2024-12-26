# Maintainer: taotieren <admin@taotieren.com>

pkgname=adbr-server-git
pkgver=r2.a601e45
pkgrel=2
pkgdesc="ADB Server in pure Rust."
arch=($CARCH)
url="https://github.com/xDvir/ADBRServer"
license=('Apache-2.0')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    gcc-libs
    libusb
)
makedepends=(
    cargo
    git
    pkgconf
)
optdepends=(
    'android-udev: Udev rules to connect Android devices to your linux box'
    'adbr: ADB Client in pure Rust.'
)
backup=()
options=('!strip' '!lto' '!debug')
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
#     pnpm test
# }

package() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable

    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
}
