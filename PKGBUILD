# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=ubus-git
pkgver=r325.d1d9ddf
pkgrel=1
pkgdesc='OpenWrt ubus library - system bus'
url='https://git.openwrt.org/project/ubus.git'
arch=('i686' 'x86_64' 'armv7h')
license=('LGPL 2.1')

depends=(
	'libubox'
	'lua'
)
makedepends=(
	'git'
	'cmake'
	'gcc'
	'make'
	'pkg-config'
	'patch'
)
provides=(
	'libubus'
	'ubus'
)
conflicts=(
	'libubus'
	'ubus'
)

gitbranch="master"

source=("${pkgname}::git+https://git.openwrt.org/project/ubus.git#branch=${gitbranch}" "001-lua-5_4.patch")
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd "${pkgname}"
  	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${pkgname}"

	patch -p1 -i "$srcdir/001-lua-5_4.patch"
}

build() {
	cd "${pkgname}"

	cmake CMakeLists.txt \
		-DCMAKE_INSTALL_PREFIX=/usr

	make
}

package() {
	cd "${pkgname}"

	make DESTDIR="$pkgdir" install

	install -d ${pkgdir}/usr/bin
	mv ${pkgdir}/usr/sbin/* ${pkgdir}/usr/bin/
	rm -Rf ${pkgdir}/usr/sbin/
}
