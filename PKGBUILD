# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Co-Maintainer: Jeb Rosen <jeb@jebrosen.com>
# Based on gnucash-latest <- aur package
#		^^^^^ Maintainer: Neng Xu <neng2.xu2@gmail.com>
#		^^^^^ Contributor: quizzmaster
# Updated w/ help of gnucash-gtk3-git <- aur package
#		^^^^^ Maintainer: Jeb Rosen <jeb@jebrosen.com>
#		^^^^^ Contributor: Juergen Hoetzel <juergen@archlinux.org>
#		^^^^^ Contributor: Mark Schneider <queueRAM@gmail.com>

pkgname=gnucash-git
_pkgname=gnucash
__pkgname=Gnucash
pkgver=3.7.r132.g9661a77f3
#.r84.g451bbd53d
pkgrel=1
pkgdesc="A personal and small-business financial-accounting application - GIT version"
arch=('i686' 'x86_64')
url="http://www.gnucash.org"
license=("GPL")
depends=('aqbanking' 'boost-libs' 'guile' 'libdbi' 'webkit2gtk')
optdepends=('evince: for print preview'
	    'perl-date-manip: for stock information lookups'
	    'perl-finance-quote: for stock information lookups')
makedepends=('git' 'boost' 'cmake' 'swig' 'gtest' 'gmock' 'libdbi-drivers' 'mariadb-libs' 'postgresql-libs' )
options=('!emptydirs')
conflicts=('gnucash' 'gnucash-devel' 'gnucash-latest' 'gnucash-gtk3-git' 'gnucash-python' 'gnucash-xbt')
provides=('gnucash')
install=gnucash.install
source=("$pkgname::git+https://github.com/${__pkgname}/${_pkgname}.git")

pkgver() {
	cd "$srcdir/$pkgname"

	( set -o pipefail
	  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/$pkgname"

	mkdir -p build
	cd build
	cmake .. \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DHAVE_GWEN_GTK3=ON \
		-DCOMPILE_GSCHEMAS=OFF \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo

	make VERBOSE=1
}

#check() {
#	cd "$srcdir/$pkgname"
#
##	make check
#	make -i check	# Needed unless locale -a includes en_US, en_GB, fr_FR (& other(s)?). 
#}

package() {
	cd "$srcdir/$pkgname/build"

	make DESTDIR="${pkgdir}" install

	# Delete the gnucash-valgrind executable because the source files
	# are not included with the package and the executable is hardlinked
	# to the location that it was built at.
	rm -f "${pkgdir}"/usr/bin/gnucash-valgrind
}
md5sums=('SKIP')
sha256sums=('SKIP')
