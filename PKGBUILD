# Maintainer: Konstantin Gizdov <arch@kge.pw>
# Contributor: Jan Kašpar <jan.kaspar at gmail dot com>
pkgname=xrootd-abi0
_pkgname=xrootd
pkgver=4.4.0
pkgrel=1
pkgdesc="A project that aims at giving high performance, scalable fault tolerant access to data repositories of many kinds."
provides=('xrootd'
          'xrootd-abi0')
conflicts=('xrootd')
arch=('i686' 'x86_64')
url="http://xrootd.org/"
license=('LGPL3')
depends=('bash'
'fuse'
'krb5'
'libxml2'
'python2'
)
makedepends=('make' 'cmake')

source=(
	"http://xrootd.org/download/v$pkgver/xrootd-$pkgver.tar.gz"
)

sha256sums=('f066e7488390c0bc50938d23f6582fb154466204209ca92681f0aa06340e77c8')
build()
{
	cd "$srcdir"

	rm -rf "build"
	mkdir "build"
	cd "build"

	cmake "$srcdir/$_pkgname-$pkgver" -D_GLIBCXX_USE_CXX11_ABI=0 -DCMAKE_INSTALL_PREFIX:PATH=/usr || return 1
	make ${MAKEFLAGS} || return 2
}

package()
{
	cd "$srcdir/build"
	make DESTDIR="$pkgdir/" install

	mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
}
