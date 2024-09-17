# Maintainer: xihale <xihale.top@qq.com>
# Reference: https://aur.archlinux.org/packages/motrix

## usr/libions
: ${_pkgtype:=-electron}

pkgname="imfile$_pkgtype"
pkgver=1.1.2
pkgrel=3
pkgdesc="A full-featured download manager"
arch=("arm" "x86_64" "i686")
license=("MIT")
depends=("electron>=21")
makedepends=("nodejs")
url="https://github.com/imfile-io/imfile-desktop/"

source=(
	imfile
	imfile.desktop
	"https://github.com/imfile-io/imfile-desktop/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=(
	"8132176e95ccdd1b09e8e6bf9c653e48f425532f84027d25bb022a9fc3abc5b6"
	"eca6961cf9d367c2733af7e8176aeaa81c5b20c12be132ec5baa3f030c7d034b"
	"fb6d4e43083a27fca46acf69bb61f1c54ee4620031f9e5b1a76822e2a99783e5"
)

build() {

	cd ${srcdir}/imfile-desktop-${pkgver}

	# build
	if [ -x "$(command -v bun)" ]; then
		bun install
		bun run build:dir
	elif [ -x "$(command -v pnpm)" ]; then
		pnpm install
		pnpm run build:dir
	elif [ -x "$(command -v yarn)" ]; then
		yarn install
		yarn run build:dir
	elif [ -x "$(command -v npm)" ]; then
		npm install
		npm run build:dir
	else
		echo "\033[0;31mPlease install at least one of 'bun', 'pnpm', 'yarn' or 'npm' to build."
		exit
	fi

}

package() {

	cd ${srcdir}/imfile-desktop-${pkgver}/release/linux-unpacked/resources

	install -Dm 644 app.asar ${pkgdir}/usr/lib/${pkgname}/app.asar
	install -Dm 755 engine/aria2c ${pkgdir}/usr/lib/${pkgname}/engine/aria2c
	install -Dm 644 engine/aria2.conf ${pkgdir}/usr/lib/${pkgname}/engine/aria2.conf

	# binary wrapper
	install -Dm 775 ${srcdir}/imfile ${pkgdir}/usr/bin/imfile

	# desktop enrty
	install -Dm 644 ${srcdir}/imfile.desktop ${pkgdir}/usr/share/applications/imfile.desktop

	# icons
	install -Dm 644 ${srcdir}/imfile-desktop-${pkgver}/build/256x256.png ${pkgdir}/usr/share/icons/imfile.png

}
