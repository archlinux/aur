# Maintainer: taotieren <admin@taotieren.com>

pkgname=wchisp-git
pkgver=0.2.2.r27.g87ebd0b
pkgrel=1
pkgdesc="WCH ISP Tool in Rust"
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/ch32-rs/wchisp"
license=('GPL-2.0')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(cargo)
makedepends=(git
    libusb
    rust)
backup=()
options=('!strip' '!lto')
install=
source=("${pkgname}::git+$url.git")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}/"
    git tag --delete nightly
}

pkgver() {
    cd "${srcdir}/${pkgname}/"
    git describe --long --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
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
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/udev/rules.d/50-wchisp.rules" <<EOF
SUBSYSTEM=="usb" ATTR{idVendor}="1a86" ATTR{idProduct}=="8010" MODE:="0666"
SUBSYSTEM=="usb" ATTR{idVendor}="4348" ATTR{idProduct}=="55e0" MODE:="0666"
SUBSYSTEM=="usb" ATTR{idVendor}="1a86" ATTR{idProduct}=="8012" MODE:="0666"
EOF
}
