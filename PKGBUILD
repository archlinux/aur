# Maintainer: Rui Shi <1229408499@qq.com>
pkgname=linglong-git
pkgver=1.3.16.r4.g146909b
pkgrel=1
epoch=0
pkgdesc='Container application toolkit of deepin'
arch=('x86_64')
url='https://github.com/linuxdeepin/linglong'
license=('LGPL3')
depends=(
	'qt5-base'
	'glib2'
	'bash'
	'gcc-libs'
	'yaml-cpp'
	'glibc'
	'ostree'
	'curl'
	'fuse-overlayfs'
	'shared-mime-info'
	'erofs-utils'
	'desktop-file-utils'
	'linglong-box'
)
makedepends=(
	'cmake'
	'gtest'
	'git'
	'pkg-config'
	'systemd'
	'docopt'
	'qt5-websockets'
)
provides=('linglong')
conflicts=('linglong')
install=$pkgname.install
source=("linglong::git+https://github.com/linuxdeepin/linglong.git#branch=release/1.3" "add_sanitize.patch")
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd linglong
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd linglong
	mkdir -vp build
	patch --forward --strip=1 --input="${srcdir}/add_sanitize.patch"
}

build() {
	cd linglong/build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	cmake --build . -j$(nproc)
}

package() {
	cd linglong/build
	env DESTDIR="$pkgdir/" cmake --install .
	mv "$pkgdir/lib/systemd/system" "$pkgdir/usr/lib/systemd/"
	mv "$pkgdir/usr/etc/linglong" "$pkgdir/etc/"
	rm -rf "$pkgdir/lib"
	rm -rf "$pkgdir/usr/etc/"
}
