# Maintainer: taotieren <admin@taotieren.com>

pkgname=wlink-git
pkgver=0.1.1.r7.g057724f
pkgrel=1
pkgdesc="wlink - WCH-Link(RV) command line tool"
arch=($CARCH)
url="https://github.com/ch32-rs/wlink"
license=('Apache-2.0' 'MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    gcc-libs
    glibc
    libusb
    systemd-libs
)
makedepends=(
    git
    rust
)
backup=()
options=('!strip' '!debug')
install=
source=("${pkgname}::git+$url.git")
sha256sums=('SKIP')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}/"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --exclude=nightly --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cd "${srcdir}/${pkgname}/"
    cargo build --release --all-features
}

check() {
    cd "${srcdir}/${pkgname}/"
    # Tests need nightly features
    RUSTC_BOOTSTRAP=1 cargo test --release
}

package() {
    cd "${srcdir}/${pkgname}/"
    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/udev/rules.d/50-wlink.rules" <<EOF
SUBSYSTEM=="usb" ATTR{idVendor}="1a86" ATTR{idProduct}=="8010" MODE:="0666"
SUBSYSTEM=="usb" ATTR{idVendor}="4348" ATTR{idProduct}=="55e0" MODE:="0666"
SUBSYSTEM=="usb" ATTR{idVendor}="1a86" ATTR{idProduct}=="8012" MODE:="0666"
EOF
}
