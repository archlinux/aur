# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=gr-keyfob-git
pkgver=r15.d7e10aa
pkgrel=2
pkgdesc="Transceiver for Hella wireless car key fobs"
arch=('i686' 'x86_64')
url="https://github.com/bastibl/gr-keyfob"
license=('GPL')
depends=('git')
makedepends=('cmake')
source=("${pkgname}::git+https://github.com/bastibl/gr-keyfob")

sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"

	mkdir -p "$srcdir/$pkgname/build"
	cd build

	cmake .. -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$pkgname/build"

	make DESTDIR="${pkgdir}" install

	if test -d "${pkgdir}"/usr/lib64; then
		mkdir -p "${pkgdir}"/usr/lib
		mv -fv "${pkgdir}"/usr/lib64/* "${pkgdir}"/usr/lib/
		rmdir "${pkgdir}"/usr/lib64
	fi
}
