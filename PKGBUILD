# Maintainer: Gustavo Rehermann <rehermann6046@gmail.com>
# Contributor: Vincent Grande <shoober420@gmail.com>
# Contributor: grimi <grimi at poczta dot fm>
# Contributor: Chromaryu <knight.ryu12@gmail.com>
_PKGNAME="libxmp"

pkgname="lib32-$_PKGNAME-git"
pkgver=4.6.0.r18.gd6a3ec81
pkgrel=1
pkgdesc="Library that supports over 90 module formats (Amiga, Atari, ..)"
arch=('i686' 'x86_64')
url="http://xmp.sourceforge.net/"
license=('GPL')
depends=('lib32-glibc')
makedepends=('git' 'autoconf')
conflicts=("lib32-$_PKGNAME")
provides=("lib32-$_PKGNAME")
source=("git+https://github.com/cmatsuoka/$_PKGNAME.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_PKGNAME"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/'$_PKGNAME'-*//;s/-/./g'
}

build() {
	export CFLAGS="$CFLAGS -m32"
	export CXXFLAGS="$CXXFLAGS -m32"
	export LDFLAGS="$LDFLAGS -m32"

	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

	cd "$srcdir/$_PKGNAME"
	autoconf
	./configure --prefix=/usr --libdir=/usr/lib32
	make
}

package() {
	cd "$srcdir/$_PKGNAME"
	make DESTDIR="$pkgdir" install

	rm -rf "${pkgdir}"/usr/{include,share,bin}
}
