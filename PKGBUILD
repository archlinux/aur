# Maintainer: xiretza <xiretza+aur@gmail.com>
_pkgname=openelp
pkgname=${_pkgname}-git
pkgver=r54.0d1a16e
pkgrel=2
pkgdesc="An open source EchoLink proxy for Linux and Windows"
arch=(i686 x86_64 armv7h)
url="https://github.com/cottsay/openelp"
license=('BSD')
depends=(pcre2)
makedepends=(git cmake pcre2 doxygen)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=(etc/ELProxy.conf)
source=("${_pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgname}"
	mkdir -p build
	cd build
	cmake -D CMAKE_INSTALL_PREFIX=/usr ..
	make
}

check() {
	cd "$srcdir/${_pkgname}/build"
	make -k check
}

package() {
	cd "$srcdir/${_pkgname}/build"
	make DESTDIR="$pkgdir/" install
	chmod go-r "$pkgdir/etc/ELProxy.conf"
	install -Dt "$pkgdir/usr/share/licenses/$pkgname/" ../LICENSE
}
