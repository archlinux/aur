# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gammy-git
pkgver=0.9.64.r4.gf42577a
pkgrel=3
pkgdesc="Adaptive screen brightness/temperature tool."
arch=('x86_64')
url="https://getgammy.com"
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('git' 'imagemagick')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Fushko/gammy.git'
        'https://github.com/Fushko/gammy/pull/119.patch')
sha256sums=('SKIP'
            '8b96a361c39351cde45d73947f55ad1d64b98c43617dad5a3c901c6c668ba1ed')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	# fix gcc11 compilation error
	patch -Np1 -i $srcdir/119.patch
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake \
		QMAKE_CFLAGS="$CFLAGS" \
		QMAKE_CXXFLAGS="$CXXFLAGS" \
		QMAKE_LFLAGS="$LDFLAGS"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir" install
}
