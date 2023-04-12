# Maintainer: sakura <sakuramail at(@) tutanota dot(.) com>

pkgname=catchme-git
_pkgname=catchme
pkgver=v1.0.r58.g6bbe98a
pkgrel=1
url='https://gitlab.com/kurenaiz/catchme'
pkgdesc="mpc-like cli for mpv with no runtime dependencies"
arch=('x86_64')
license=('GPL3')
makedepends=('git' 'musl')
source=("${_pkgname}::git+https://gitlab.com/kurenaiz/catchme.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	my_home="${XDG_CONFIG_HOME:-$HOME/.config}"
	mkdir -vp "$my_home/catchme"

	echo "Created $my_home/catchme folder"
	cp -v config.def.h config.h
	echo "Copied config.def.h to config.h"
}

build() {
	cd "${srcdir}/${_pkgname}"
	make BUILD_MODE=RELEASE
}

package() {
	cd "$srcdir/${_pkgname}"
	make PREFIX="/usr" DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm0644 catchme.desktop $pkgdir/usr/share/applications/catchme.desktop
	install -Dm0755 start $pkgdir/usr/share/catchme/start
}
