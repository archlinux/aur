# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>

pkgname=vx68k-git
pkgver=2.alpha.1.r15.gdba943d
pkgrel=1
pkgdesc="Virtual X68000 - emulator of Sharp X68000 implemented in C++"
arch=('i686' 'x86_64')
depends=('libvm68k')
makedepends=('git' 'make' 'pkg-config' 'autoconf' 'automake')
#checkdepends=('cppunit')
url="https://www.vx68k.org/vx68k"
license=('GPL3')
source=(${pkgname%-git}::git+https://bitbucket.org/kazssym/vx68k.git)
sha256sums=('SKIP')
provides=('vx68k')
conflicts=('vx68k')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# This repo doesn't have tags as of this writing, so we take the version
	# from configure.ac:
	verpart=$(tr -d '\n' < configure.ac | grep -oP 'AC_INIT\(\s*\[[^\]]+\]\s*,\s*\[\K[^\]]+')
	# for the revcount, just use number of commits in the branch:
	revpart=$(git rev-list --count HEAD)

	hash=$(git rev-parse --short HEAD)

	echo "${verpart//-/.}.r${revpart}.g${hash}"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	# configure looks for the wrong package, fix
	sed -i 's/PKG_CHECK_MODULES(\[LIBVM68K\], \[vm68k\])/PKG_CHECK_MODULES([LIBVM68K], [libvm68k])/' configure.ac
}

build() {
	cd "$srcdir/${pkgname%-git}"

	autoreconf
	./configure --prefix=/usr
	make
}

# configure looks for cppunit, but it's never used, and make check doesn't do anything.
# this might change in future?
#check() {
#	cd "$srcdir/${pkgname%-git}"
#	make check
#}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir" install
}
