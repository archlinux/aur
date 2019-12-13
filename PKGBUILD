_hkgname=terminal-progress-bar
pkgname=haskell-terminal-progress-bar
pkgver=0.4.1
pkgrel=2
pkgdesc="A simple progress bar in the terminal"
url="http://hackage.haskell.org/package/terminal-progress-bar"
license=('BSD')
arch=('i686' 'x86_64')
depends=('ghc' 'haskell-terminal-size') 
makedepends=('ghc'
		'haskell-base<5'
		'haskell-base>=4.9'
		'haskell-deepseq>=1.4.3'
		'haskell-terminal-size>=0.3.2'
		'haskell-text>1.2'
		'haskell-time>=1.8'
)
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
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/terminal-progress-bar"
}
md5sums=('3ef47403a7147ef6be1e0127dea3c8d7')
