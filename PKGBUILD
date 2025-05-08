# Maintainer: GreyXor <greyxor@protonmail.com>

pkgname=framework-system-uefi-git
pkgver=v0.4.1.r0.gd515b02
pkgrel=1
arch=('x86_64')
pkgdesc='UEFI Shell tool to interact with the framework system (git development version)'
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
	"mtools"
	"cargo-nightly"
	"pkg-config"
)
OPTIONS=(!lto)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/FrameworkComputer/framework-system.git")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname}"
    rustup target add x86_64-unknown-uefi
    export RUSTUP_TOOLCHAIN=nightly
    # Can't be built with cargo! That's why we need to exclude it in the other commands.
    make -C framework_uefi
}

package() {
	cd "$srcdir/${pkgname}"
    install -Dm644 "framework_uefi/build/x86_64-unknown-uefi/boot.efi" \
    "$pkgdir/usr/share/framework_tool_uefi/framework_uefi.EFI"
}
