# Maintainer: Jiachen Yang <farseerfc@gmail.com>

_pkgname=fcitx-rime-config
pkgname=$_pkgname-git
pkgver=0.0.0.r24.165646d
pkgrel=1
pkgdesc="GUI config tool for fcitx-rime"
arch=(x86_64 i686)
url="https://github.com/xuzhao9/fcitx-rime-config"
license=('GPL')
depends=('fcitx-qt4' 'fcitx-rime')
makedepends=('cmake' 'git')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+https://github.com/xuzhao9/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "0.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "$_pkgname"
	echo 'include( ${QT_USE_FILE} )' >> CMakeLists.txt
	mkdir -p build
}

build() {
	cd "$_pkgname/build"
	cmake ..
	make
}

package() {
	cd "$_pkgname/build"
	make DESTDIR="$pkgdir" install
}
