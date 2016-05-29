# Maintainer: Stefano Campanella <stefanocampanella1729@gmail.com>
pkgname=pythia
pkgver=8.2.19
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
md5sums=('3459b52b5da1deae52cbddefa6196feb'
         '667320ba29e8238f1b6b903ab23e19e7')
_srcpath=$srcdir/$_pkgid

build(){
	cd $srcdir/$_pkgid
  ./configure --prefix=/usr \
    --enable-shared \
    --with-python-bin=/usr/bin/ \
    --with-python-include=/usr/include/python3.5m/ \
    --with-python-lib=/usr/lib/ \
    --cxx-common='-D_GLIBCXX_USE_CXX11_ABI=0 -fPIC -O3 -march=native' 
	make ${MAKEFLAGS}
}

package() {
	for _bin in `ls $srcdir/$_pkgid/bin`
	do
		install -D -m 755 $srcdir/$_pkgid/bin/$_bin $pkgdir/usr/bin/$_bin
	done
	install -D $srcdir/pythia.sh $pkgdir/etc/profile.d/pythia.sh
	rsync -rlp $srcdir/$_pkgid/include/* $pkgdir/usr/include/
	rsync -rlp $srcdir/$_pkgid/lib/* $pkgdir/usr/lib/
	rsync -rlp $srcdir/$_pkgid/share/* $pkgdir/usr/share/
	rsync -rlp $srcdir/$_pkgid/examples $pkgdir/usr/share/Pythia8/
}
