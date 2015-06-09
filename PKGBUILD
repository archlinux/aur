# Maintainer: bitwave <aur [at] oomlu [d0t] de>
# Contributor: Bráulio Barros de Oliveira <brauliobo@gmail.com>
# Contributor: Nezmer <me at nezmer.info>
pkgname=spim
pkgver=8.0
pkgrel=2
pkgdesc="A MIPS32 simulator"
arch=(i686 x86_64)
url="http://pages.cs.wisc.edu/~larus/$pkgname.html"
license=('custom:BSD')
groups=('emulators')
depends=('libxaw')
makedepends=('bison' 'flex' 'm4' 'imake')
conflicts=(xspim)
provides=(xspim)
source=(http://www.cs.wisc.edu/~larus/SPIM/${pkgname}-${pkgver}.tar.gz)
sha1sums=('979b91e0acb792310593d31aa65e49cccec73036')

build() {	
  cd $srcdir/$pkgname-$pkgver/$pkgname
	sed -i 's|usr/local|usr|g' Makefile || return 1
	make -j1 || return 1
  cd ../x$pkgname

  sed -i 's|\"\*font:		|//\"\*font:		|' $srcdir/$pkgname-$pkgver/x$pkgname/x$pkgname.c
	sed -i 's|usr/local|usr|g' Makefile || return 1
	sed -i 's|usr/local|usr|g' Imakefile || return 1

  xmkmf
	make -j1 || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver/$pkgname
		install -Dm644 README $pkgdir/usr/share/licenses/$pkgname/README
		make EXCEPTION_DIR=${pkgdir}/usr/lib/spim BIN_DIR=${pkgdir}/usr/bin install || return 1
  		make MAN_DIR=${pkgdir}/usr/share/man install-man || return 1
  	cd ../x$pkgname
  	make EXCEPTION_DIR=${pkgdir}/usr/lib/spim BIN_DIR=${pkgdir}/usr/bin install || return 1

	#Adding README as a license!
	install -Dm644 $srcdir/$pkgname-$pkgver/README $pkgdir/usr/share/licenses/$pkgname/README
}