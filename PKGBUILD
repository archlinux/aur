# Maintainer: Luka Perkov <luka.perkov@sartura.hr>

pkgname=rpcd-git
_gitname=rpcd
pkgver=r126.e64cbdd
pkgrel=1
pkgdesc='OpenWrt ubus RPC backend server'
url='http://git.openwrt.org/?p=project/rpcd.git;a=summary'
arch=('i686' 'x86_64')
license=('ISC')
depends=('libubox-lua-git' 'ubus-lua-git' 'uci-lua-git')
makedepends=('git' 'cmake' 'gcc' 'make' 'patch' 'pkg-config')
conflicts=('rpcd' 'rpcd-git')
provides=('rpcd')
source=('git://git.openwrt.org/project/rpcd.git' '001-install-headers.patch' '002-rpcd-location.patch')
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "$_gitname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_gitname"

	patch -p1 -i "$srcdir/001-install-headers.patch"
	patch -p1 -i "$srcdir/002-rpcd-location.patch"
}

build() {
	cd "$_gitname"

	cmake CMakeLists.txt \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DIWINFO_SUPPORT=NO

	make
}

package() {
	cd "$_gitname"

	make DESTDIR="$pkgdir" install

	install -d "$pkgdir"/usr/lib/rpcd/
	mv "$pkgdir"/usr/lib/file.so "$pkgdir"/usr/lib/rpcd/
}
