# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>
# Contributor: julien <paci79@free.fr>

pkgname=microperl
_pkgbasename=perl
pkgver=5.20.0
pkgrel=1
pkgdesc="Practical Extraction and Report Language - compact (very limited) single executable"
arch=('i686' 'x86_64')
license=('GPL' 'PerlArtistic')
url="http://www.perl.org"
depends=('coreutils' 'glibc')
options=('strip' '!buildflags')

###You don't want to uncomment the line below this, really!##
#provides=('perl')

source=(http://www.cpan.org/src/5.0/$_pkgbasename-$pkgver.tar.gz
	perl5.20_fix-microperl-makefile.patch)
md5sums=('406ec049ebe3afcc80d9c76ec78ca4f8'
	 '2544059be91d5e9e4110f160b8a95ac7')

prepare() {
	cd "$srcdir/$_pkgbasename-$pkgver"
	sed -i 's/usr\/local/usr/g' uconfig{,64}.sh
	sed -i 's/perl5\/5.20/perl5/g' uconfig{,64}.sh
	sed -i "s/unknown/$CHOST/g" uconfig{,64}.sh
	patch -p2 -i ../perl5.20_fix-microperl-makefile.patch
}

build() {
	cd "$srcdir/$_pkgbasename-$pkgver"
	if [ "$CARCH" = "x86_64" ]; then
	  make -f Makefile.micro regen_uconfig64
	else
	  make -f Makefile.micro regen_uconfig
	fi
	make -f Makefile.micro
}

check() {
	cd "$srcdir/$_pkgbasename-$pkgver"
	make -f Makefile.micro microtest
}

package() {
	cd "$srcdir/$_pkgbasename-$pkgver"	
	strip microperl
	install -Dm755 microperl "$pkgdir/usr/bin/microperl"
}
