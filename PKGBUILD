# Maintainer: Marcelo Garlet Millani <marcelogmillani at gmail dot com>
_hkgname=descrilo
pkgname=haskell-descrilo
pkgver=0.1.0.3
pkgrel=1
pkgdesc='Loads a list of items with fields'
url="http://hackage.haskell.org/package/${_hkgname}"
license=('GPL3')
arch=('i686' 'x86_64') # should work for any arch which haskell may be compiled to
depends=("ghc")
source=( "http://hackage.haskell.org/package/${_hkgname}-${pkgver}/${_hkgname}-${pkgver}.tar.gz" )
#options=('staticlibs')
install=${pkgname}.install
sha256sums=('82479f64aa13a8df7fafcf091ea34ca7044fad2e582489772fb1b46c3645a7a7')

build() {
	cd ${srcdir}/${_hkgname}-${pkgver}

	runhaskell Setup configure -O --enable-split-objs --enable-shared \
		--prefix=/usr --docdir=/usr/share/doc/${pkgname} --libsubdir=\$compiler/site-local/\$pkgid
	# runhaskell Setup configure --prefix=/usr --docdir=/usr/share/doc/${pkgname} -O --enable-shared --libsubdir=\$compiler/site-local/\$pkgid
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
	install -D -m 0644 descrilo.5 ${pkgdir}/usr/share/man/man5/
	gzip ${pkgdir}/usr/share/man/man5/descrilo.5
	rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}

