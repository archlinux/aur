_hkgname=bytestring-progress
pkgname=haskell-bytestring-progress
pkgver=1.4
pkgrel=2
pkgdesc="A library for tracking the consumption of a lazy ByteString"
url="http://hackage.haskell.org/package/bytestring-progress"
license=('BSD')
arch=('i686' 'x86_64')
depends=('ghc') 
makedepends=('ghc'
		'haskell-base<5'
		'haskell-base>=4.0'
		'haskell-bytestring'
		'haskell-time>=1.1'
		'haskell-time<2.0'
		'haskell-terminal-progress-bar>=0.4.0'
)
#'haskell-terminal-progress-bar<0.3.0' # seems to work fine with latest version
options=('strip')
source=(https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)

build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$pkgname \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
	
	runhaskell Setup build
	runhaskell Setup register --gen-script
	runhaskell Setup unregister --gen-script
	sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
	sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh	
}

package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
	install -Dm 744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
	install -Dm 744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
	runhaskell Setup copy --destdir="${pkgdir}"
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/bytestring-progress"
}
md5sums=('29e27a426a3ae09047e35d9e380d0d29')
