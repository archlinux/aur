# Maintainer: TBK <aur at jjtc dot eu>
# Contributor: TBK <aur at jjtc dot eu>

pkgname=libqtolm-git
pkgver=f2d8e23
pkgrel=1
pkgdesc='A Qt wrapper for libolm'
url='https://gitlab.com/b0/libQtOlm'
arch=('any')
license=('GPL-3.0-or-later')
depends=('qt5-base' 'libolm')
makedepends=('cmake' 'git')
source=("$pkgname::git+https://gitlab.com/b0/libQtOlm.git")
b2sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git rev-parse --short HEAD | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$pkgname"
	sed -i 's/utils.h/utilities.h/g' CMakeLists.txt libQtOlm.pri main.cpp

	cd lib
	mv utils.h utilities.h
	sed -i 's/utils.h/utilities.h/g' account.cpp groupsession.cpp pk.cpp session.cpp
}

build() {
	cd "$srcdir/$pkgname"
	cmake -B build \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DBUILD_SHARED_LIBS=true .
	make -C build
}

package() {
	cd "$srcdir/$pkgname"
	make -C build DESTDIR="$pkgdir" install
}
