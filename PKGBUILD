# Contributor: Jan Kašpar <jan.kaspar at gmail dot com>
pkgname=castor-client
pkgver=2.1.13
pkgrel=5
pkgdesc="Client for CERN Advanced STORage manager."
arch=('i686' 'x86_64')
url="http://castor.web.cern.ch/castor/"
license=('EU DataGrid software license')
depends=()
makedepends=('make' 'imake' 'python2')

source=(
	"http://castorold.web.cern.ch/castorold/DIST/CERN/savannah/CASTOR.pkg/$pkgver-*/$pkgver-$pkgrel/castor-$pkgver-$pkgrel.tar.gz"
	"patch"
	"bash-completion"
)

md5sums=('349c28c8fbe79db4e97fe4317345eb1b'
         'a81accc58483b0b8e92e82a29b609715'
         '417cc791dcd0d1964a8900ef9c475c6a')


build()
{
	cd "$srcdir/castor-$pkgver"

	export MAJOR_CASTOR_VERSION=2.1
	export MINOR_CASTOR_VERSION=13.5

	patch -p1 < "../patch"
	
	export LDFLAGS=""
	export IMAKECPP="/usr/bin/cpp"

	./configure || return 1
	make client || return 2
}

package()
{
	cd "$srcdir/castor-$pkgver"
	make DESTDIR="$pkgdir/" LIBDIR="/usr/lib" EXPORTMAN="$pkgdir/usr/share/man" installclient

	mkdir -p "$pkgdir/etc/bash_completion.d"
	cp "../bash-completion" "$pkgdir/etc/bash_completion.d/castor"
}

