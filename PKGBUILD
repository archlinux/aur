# Maintainer: Marcelo Garlet Millani <marcelogmillani at gmail dot com>
_hkgname=simtreelo
pkgname=haskell-simtreelo
pkgver=0.1.1.3
pkgrel=1
pkgdesc='Loads data organized in a tree'
url="http://hackage.haskell.org/package/${_hkgname}"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('ghc')
source=( "http://hackage.haskell.org/package/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz" )
sha256sums=('093e3ea93cc7e4e86830aa45fe9042bb238ebc03e8fcfea4e351e19ed1371291')
install=${pkgname}.install

build() {
	cd ${srcdir}/${_hkgname}-${pkgver}

	runhaskell Setup configure -O --enable-shared --prefix=/usr \
	--docdir=/usr/share/doc/${pkgname} --libsubdir=\$compiler/site-local/\$pkgid \
			 --ghc-option -dynamic
	# runhaskell Setup configure --prefix=/usr --docdir=/usr/share/doc/${pkgname} -O --enable-shared --enable-split-objs --libsubdir=\$compiler/site-local/\$pkgid
	runhaskell Setup build
	runhaskell Setup haddock --haddock-options "--optghc -dynamic"
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

