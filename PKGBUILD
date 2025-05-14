# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
pkgname=paml
pkgver=4.10.9
pkgrel=1
pkgdesc="Phylogenetic analysis by maximum likelihood. https://doi.org/10.1093/molbev/msm088"
arch=('x86_64')
url="http://abacus.gene.ucl.ac.uk/software/"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('make')
source=("https://github.com/abacus-gene/paml/archive/refs/tags/v${pkgver}.zip"
	"mcmctree78.patch::https://github.com/abacus-gene/paml/pull/78.patch")
sha256sums=('7f71fb83fe57532e96e00dba3f7e3b5c746e170337ac0f91566de77163923f48'
            'bbd4f1ad72beb315e17616eef19599fd238f35a5da1caf3fac149efec285fb29')
prepare(){
	cd "$pkgname-$pkgver"/
	patch -p1 < $srcdir/mcmctree78.patch
	mkdir -p bin
}
build() {
	cd "$pkgname-$pkgver"/src
#	gcc -O3 -o baseml baseml.c tools.c
#	gcc -O3 -o basemlg basemlg.c tools.c
#	gcc -O3 -o codeml codeml.c tools.c
#	gcc -O3 -o pamp pamp.c tools.c
#	gcc -O3 -o mcmctree mcmctree.c tools.c
#	gcc -O3 -o evolver evolver.c tools.c
#	gcc -O3 -o yn00 yn00.c tools.c 
#	gcc -O3 -o chi2 chi2.c 
	make -f Makefile -j1
	ls -lF
	rm *.o
	mv baseml basemlg codeml pamp mcmctree evolver yn00 chi2 ../bin
}

package() {
	mkdir -p $pkgdir/usr/{bin,share/{$pkgname,licenses/$pkgname}}
	cd "$pkgname-$pkgver"
	cp bin/* $pkgdir/usr/bin
	cp -r doc/ $pkgdir/usr/share/$pkgname
	cp    LICENSE $pkgdir/usr/share/licenses/$pkgname
	cp -r Technical $pkgdir/usr/share/$pkgname
}

