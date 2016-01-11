# Contributor: Jan Kašpar <jan.kaspar at gmail dot com>
pkgname=castor-client
pkgver=2.1.15
pkgrel=20
pkgdesc="Client for CERN Advanced STORage manager."
arch=('i686' 'x86_64')
url="http://castor.web.cern.ch/castor/"
license=('EU DataGrid software license')
depends=()

makedepends=('cmake' 'python2')

source=(
	"http://castorold.web.cern.ch/castorold/DIST/CERN/savannah/CASTOR.pkg/$pkgver-*/$pkgver-$pkgrel/castor-$pkgver-$pkgrel.tar.gz"
	"patch_python2"
	"bash-completion"
)

md5sums=(
	'01ee111cd16281c720da684df96b2612'
    'c1bcb4b41ad2a00f1d454ba721b6c5a4'
    '417cc791dcd0d1964a8900ef9c475c6a'
)


build()
{
	cd "$srcdir/castor-$pkgver-$pkgrel"

	export MAJOR_CASTOR_VERSION=2.1
	export MINOR_CASTOR_VERSION=15.20

	patch -p1 < "../patch_python2"

	mkdir -p "build"
	cd "build"
	cmake .. -DCOMPILE_SERVER:STRING=0 || return 1
	make || return 2
}

package()
{
	cd "$srcdir/castor-$pkgver-$pkgrel"

	cd "build" || return 1
	make DESTDIR="$pkgdir/" LIBDIR="/usr/lib" EXPORTMAN="$pkgdir/usr/share/man" install || return 2
	mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"


	mkdir -p "$pkgdir/etc/bash_completion.d"
	cp "../../bash-completion" "$pkgdir/etc/bash_completion.d/castor"
}

