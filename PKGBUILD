# Maintainer: Jeff Henson <jeff@henson.io>
# Original PKGBUILD: GreyXor <greyxor@protonmail.com>

pkgname=framework-system
pkgver=0.4.5
pkgrel=1
arch=('x86_64')
pkgdesc='Tool to interact with the framework system'
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
	"jq"
)
OPTIONS=(!lto)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('91c2042f633b8b598131e17fe91628cc443d392e0b2a199d205f963ebf8e422f99a4db08a072b28554205127819b43322809c9d33a44c135b3a606f2c012b6d3')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo build --release -p framework_tool
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	TARGET_DIR="$(cargo metadata --format-version 1 --no-deps | jq -r '.target_directory')"
	install -Dm0755 -t "${pkgdir}/usr/bin/" "${TARGET_DIR}/release/framework_tool"
	install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "LICENSE.md"
}
