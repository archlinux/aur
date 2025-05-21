# Maintainer: GreyXor <greyxor@protonmail.com>

pkgname=framework-system-git
pkgver=0.4.2.r11.ga879e74
pkgrel=1
arch=('x86_64')
pkgdesc='Tool to interact with the framework system (git development version)'
url='https://github.com/FrameworkComputer/framework-system'
license=('MIT')
depends=(
    "libusb"
	"gcc-libs"
	"glibc"
	"systemd-libs"
)
makedepends=(
	"git"
	"cargo"
	"pkg-config"
)
OPTIONS=(!lto)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/FrameworkComputer/framework-system.git")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname}"
	export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features -p framework_tool
}

package() {
	cd "$srcdir/${pkgname}"
	install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/framework_tool"
	install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "LICENSE.md"
}
