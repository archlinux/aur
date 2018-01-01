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
pkgver=2.7.3
#.r1.g310442ffe
pkgrel=1
pkgdesc="A personal and small-business financial-accounting application - GIT version"
arch=('i686' 'x86_64')
url="http://www.gnucash.org"
license=("GPL")
depends=('aqbanking' 'libdbi-drivers' 'libgnomecanvas' 'boost-libs' \
	 'slib' 'webkit2gtk' 'libgnome-keyring' 'sqlite2')
optdepends=('evince: for print preview'
	    'perl-date-manip: for stock information lookups'
	    'perl-finance-quote: for stock information lookups')
makedepends=('git' 'intltool' 'boost' 'swig' 'gtest' 'gmock' 'gconf')
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

prepare() {
	cd "$srcdir/$pkgname"

	# add -O to the boost c++11 compatibility detection so that -D_FORTIFY_SOURCE doesn't cause an error
	sed -i '/CXXFLAGS="-Werror -std=gnu++11 $BOOST_CPPFLAGS"/s/-Werror/-Werror -O/' configure.ac

	./autogen.sh
}

build() {
	cd "$srcdir/$pkgname"

	# Consider using `sed` for this stuff if it is still needed.

	./configure --prefix=/usr --mandir=/usr/share/man --sysconfdir=/etc \
	  --libexecdir=/usr/lib --disable-schemas-compile --enable-ofx --enable-aqbanking \
	  --disable-error-on-warning	

	make
}

#check() {
#	cd "$srcdir/$pkgname"
#
##	make check
#	make -i check	# Needed unless locale -a includes en_US, en_GB, fr_FR (& other(s)?). 
#}

package() {
	cd "$srcdir/$pkgname"

	make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

	cd libgnucash/doc/design

	make DESTDIR="${pkgdir}" install-info

	install -dm755 "${pkgdir}/usr/share/gconf/schemas"
	gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/gnucash.schemas" --domain gnucash \
	  "${pkgdir}"/etc/gconf/schemas/*.schemas
	rm -f "${pkgdir}"/etc/gconf/schemas/*.schemas

	# Delete the gnucash-valgrind executable because the source files
	  # are not included with the package and the executable is hardlinked
	  # to the location that it was built at.
	rm -f "${pkgdir}"/usr/bin/gnucash-valgrind
}
md5sums=('SKIP')
sha256sums=('SKIP')
