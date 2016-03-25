# Maintainer: Stefano Campanella <stefanocampanella1729@gmail.com>
pkgname=pythia
pkgver=8.2.15
_pkgid=$pkgname`echo $pkgver | tr -d '.'`
pkgrel=1
pkgdesc="Generation of high-energy physics events."
arch=('i686' 'x86_64')
url="http://home.thep.lu.se/Pythia/"
license=('GPL')
makedepends=('rsync')
provides=('$pkgname')
source=("http://home.thep.lu.se/~torbjorn/pythia8/$_pkgid.tgz"
'pythia.sh')
md5sums=('b4653133e6ab1782a5a4aa66eda6a54b'
         '0320534e1be7155cfb8ee19c7f8480cc')
_srcpath=$srcdir/$_pkgid

build(){
	cd $srcdir/$_pkgid
	./configure --enable-shared \
		--prefix=/usr \
		--cxx-common="-D_GLIBCXX_USE_CXX11_ABI=0 -fPIC" 
	make ${MAKEFLAGS}
}

package() {
	for _bin in `ls $srcdir/$_pkgid/bin`
	do
		install -D -m 755 $srcdir/$_pkgid/bin/$_bin $pkgdir/usr/bin/$_bin
	done
	install -D $srcdir/pythia.sh $pkgdir/etc/profile.d/pythia.sh
	rsync -rlp $srcdir/$_pkgid/include/* $pkgdir/include/
	rsync -rlp $srcdir/$_pkgid/lib/* $pkgdir/usr/lib/
	rsync -rlp $srcdir/$_pkgid/share/* $pkgdir/usr/share/
	rsync -rlp $srcdir/$_pkgid/examples $pkgdir/usr/share/Pythia8/
}
