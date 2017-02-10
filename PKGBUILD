# Maintainer: Frantisek Fladung

_pkgname=wld
pkgname=$_pkgname-ametisf-git
pkgver=156.cf2d563
pkgrel=1
pkgdesc='A primitive drawing library targeted at Wayland - ametisf fork'
arch=('i686' 'x86_64')
license=('MIT')
url='https://github.com/ametisf/wld'
depends=('wayland' 'libdrm' 'fontconfig' 'pixman' 'intel-gpu-tools')
makedepends=('git' 'tup')
provides=('wld')
conflicts=('wld')
source=('git+https://github.com/ametisf/wld.git')
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
	cd $_pkgname
	echo "ENABLE_DEBUG=0" >> config.tup
	echo "ENABLE_STATIC=0" >> config.tup
	tup init
	tup upd
}

package() {
	cd $_pkgname
	mkdir -p $pkgdir/usr/{include/wld,lib,share/licenses/$pkgname}
	install -m 644 drm.h pixman.h wayland.h wld.h $pkgdir/usr/include/wld
	install -m 755 libwld.so.0.0 $pkgdir/usr/lib
	ln -sT libwld.so.0.0 $pkgdir/usr/lib/libwld.so.0
	ln -sT libwld.so.0.0 $pkgdir/usr/lib/libwld.so
	install -m 644 COPYING $pkgdir/usr/share/licenses/$pkgname
}
