# Maintainer: Jeff Henson <jeff@henson.io>
# Original PKGBUILD: GreyXor <greyxor@protonmail.com>

pkgname=framework-system
pkgver=0.4.3
pkgrel=2
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
b2sums=('fba7e52267a441aa8bf74f9262107588d78f649c516e93cc2ef7cf5f4df0abfa1eb3e2c922a32035844d477ef0d2d19dc768eebf487930cec9419b7561478628')

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
