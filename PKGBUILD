# Maintainer: Jeff Henson <jeff@henson.io>
# Original PKGBUILD: GreyXor <greyxor@protonmail.com>

pkgname=framework-system
pkgver=0.4.4
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
b2sums=('fa9bbda4060a2346c7c94639ed60a2311ab0ae44944a74abd525ac59bfd4447e727eedbe77634031b7729e06440952301aa1403eee3fa3cfbb8c98b6285ec2ff')

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
