pkgname=pythia
pkgver=8.2.12
_pkgid=$pkgname`echo $pkgver | tr -d '.'`
pkgrel=1
pkgdesc="Generation of high-energy physics events."
arch=('i686' 'x86_64')
url="http://home.thep.lu.se/Pythia/"
license=('GPL')
makedepends=('autoconf' 'automake' 'make' 'gcc' 'rsync')
provides=$pkgname
source=("http://home.thep.lu.se/~torbjorn/pythia8/$_pkgid.tgz"
'pythia.sh')
md5sums=('0886d1b2827d8f0cd2ae69b925045f40'
'0320534e1be7155cfb8ee19c7f8480cc')
_srcpath=$srcdir/$_pkgid

build(){
	cd $srcdir/$_pkgid
	./configure --enable-shared \
		--enable-64bit \
		--prefix=/usr \
		--cxx-common="-D_GLIBCXX_USE_CXX11_ABI=0 -march=native -mtune=native -Ofast -fPIC" 
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
