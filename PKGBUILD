# Maintainer: sakura <sakuramail at(@) tutanota dot(.) com>

pkgname=catchme-git
_pkgname=catchme
pkgver=v1.0.r12.ga00618c
pkgrel=1
pkgdesc="mpc-like cli for mpv with no runtime dependencies"
url='https://gitlab.com/kurenaiz/catchme'
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
	mkdir -p "$my_home/catchme"

	echo "Created $my_home/catchme folder"
	sed -i include/config.h -e "s|/home/sakura/.config/|$my_home|"
	echo "Changed catchme home to '$my_home'"
}

build() {
	cd "${srcdir}/${_pkgname}"
	make BUILD_MODE=RELEASE
}

package() {
	cd "$srcdir/${_pkgname}"
	make PREFIX="/usr" DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
