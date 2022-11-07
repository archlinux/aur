# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=nickvision-money-git
_pkgname=nickvisionmoney
pkgver=2022.10.0.r0.ga9181a4
pkgrel=2
pkgdesc="A personal finance manager"
arch=('x86_64')
url=https://github.com/nlogozzo/$_pkgname
license=('GPL3')
depends=('jsoncpp' 'libadwaita' 'sqlitecpp')
makedepends=('boost' 'cmake' 'git' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

prepare() {
	#fix conflict with geary
	cd $_pkgname
	sed -i 's/edit-symbolic/nick-edit-symbolic/' src/meson.build src/ui/controls/transactionrow.cpp
	mv src/resources/edit-symbolic.svg src/resources/nick-edit-symbolic.svg
}

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson $_pkgname build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
