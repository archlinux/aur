# Maintainer: Marcelo Garlet Millani <marcelogmillani at gmail dot com>
_hkgname=simtreelo
pkgname=haskell-simtreelo
pkgver=0.1.1.0
pkgrel=1
pkgdesc='Loads data organized in a tree'
url="http://hackage.haskell.org/package/${_hkgname}"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('ghc')
source=( "http://hackage.haskell.org/package/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz" )
sha256sums=('820e7189bb824c3480bb5492ddaf04a3b8200fea747084ab35e15ad46815f8c8')
install=${pkgname}.install

build() {
	cd ${srcdir}/${_hkgname}-${pkgver}

	runhaskell Setup configure -O --enable-split-objs --enable-shared \
       --prefix=/usr --docdir=/usr/share/doc/${pkgname} --libsubdir=\$compiler/site-local/\$pkgid
	# runhaskell Setup configure --prefix=/usr --docdir=/usr/share/doc/${pkgname} -O --enable-shared --enable-split-objs --libsubdir=\$compiler/site-local/\$pkgid
	runhaskell Setup build
	runhaskell Setup haddock
	runhaskell Setup register   --gen-script
	runhaskell Setup unregister --gen-script
	sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}
package() {
	cd ${srcdir}/${_hkgname}-${pkgver}
	runhaskell Setup copy --destdir=${pkgdir}
	install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${pkgname}/register.sh
	install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh
	mkdir -p ${pkgdir}/usr/share/man/man5
	install -D -m 0644 simtreelo.5 ${pkgdir}/usr/share/man/man5/
	gzip ${pkgdir}/usr/share/man/man5/simtreelo.5
	rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}

