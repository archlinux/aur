# Maintainer: not_anonymous <nmlibertarian@gmail.com>

# Based on gnucash-latest <- aur package
#		^^^^^ Current Maintainer: Neng Xu <neng2.xu2@gmail.com>
#		^^^^^ Contributor: quizzmaster

pkgname=gnucash-git
_pkgname=gnucash
__pkgname=Gnucash
pkgver=2.6.5
#a.r382.gd4e5bdc
_pkgver=2.6.99	# Version reported upon exec of resulting package.
pkgrel=2
pkgdesc="A personal and small-business financial-accounting application - GIT version"
arch=('i686' 'x86_64')
url="http://www.gnucash.org"
license=("GPL")
depends=('aqbanking' 'desktop-file-utils' 'goffice0.8' 'libdbi-drivers' 'libgnomecanvas' \
	 'slib' 'webkitgtk2' 'dconf' 'guile' 'libgnome-keyring' 'sqlite2')
optdepends=('evince: for print preview'
	    'perl-date-manip: for stock information lookups'
	    'perl-finance-quote: for stock information lookups')
makedepends=('git' 'intltool' 'boost' 'swig')
options=('!libtool' '!makeflags' '!emptydirs')
conflicts=('gnucash' 'gnucash-devel' 'gnucash-latest')
provides=('gnucash')
install=gnucash.install
source=("$pkgname::git+https://github.com/${__pkgname}/${_pkgname}.git"
	diff.core-utils.i
	diff.engine.i
	diff.business-core.i
	diff.gnc-html.i)

pkgver() {
	cd "$srcdir/$pkgname"

	( set -o pipefail
	  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "$srcdir/$pkgname"

	./autogen.sh
}

build() {
	cd "$srcdir/$pkgname"

	# Consider using `sed` for this stuff if it is still needed.
	patch -p0 < ../diff.core-utils.i
	patch -p0 < ../diff.engine.i
	patch -p0 < ../diff.business-core.i
	patch -p0 < ../diff.gnc-html.i

	./configure --prefix=/usr --mandir=/usr/share/man --sysconfdir=/etc \
	  --libexecdir=/usr/lib --enable-ofx --enable-aqbanking
#	  --libexecdir=/usr/lib --enable-ofx --enable-aqbanking --disable-dbi
#	  --libexecdir=/usr/lib --disable-schemas-compile --enable-ofx --enable-aqbanking

	make
}

check() {
	cd "$srcdir/$pkgname"

#	make check
	make -i check	# Needed unless locale -a includes en_US, en_GB, fr_FR (& other(s)?). 
}

package() {
	cd "$srcdir/$pkgname"

	make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

	cd src/doc/design

	make DESTDIR="${pkgdir}" install-info

	install -dm755 "${pkgdir}/usr/share/gconf/schemas"
	gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/gnucash.schemas" --domain gnucash \
	  "${pkgdir}"/etc/gconf/schemas/*.schemas
	rm -f "${pkgdir}"/etc/gconf/schemas/*.schemas
}
md5sums=('SKIP'
         '666655b05ae5c410fd22ccbe50899810'
         '98fe83e28d1504d4574b3533e3c85143'
         '45c654c304c7d5ac3e45705a903a596d'
         'efc0fa5ab21327feb7ad0a484e39b6a4')
sha256sums=('SKIP'
            'f95acdcf106bb6b2ab4d164bf8d26d8b1026921797b00d96d17436fbb1eccd9a'
            '5bbf3e656e9b2126ff1d893e7778a36929524cbbd380b341f9aefb12a24567b9'
            'c4510b5b7f6846c6278bae42779a6d29fa6c7e8f7c44784dc32c840ebac32f1e'
            'fccccdadaf8ba86fd8251c44f1ae3117093aabaea178199a94409a481c9c080d')
