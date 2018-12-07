
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=haskell-gtk-strut
_hkgname=gtk-strut
pkgver=0.1.2.1
pkgrel=2
pkgdesc="Libary for creating strut windows with gi-gtk."
url=https://hackage.haskell.org/package/gtk-strut
license=('LGPL-2.1')
arch=('i686' 'x86_64')
depends=("ghc-libs" 'haskell-gi-gdk' 'haskell-gi-gtk' 'haskell-text' 'haskell-transformers')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz"
        "https://github.com/IvanMalison/gtk-strut/commit/c27c90a564e3056d28dbd8d3cb81bc306c8872f0.patch")
sha256sums=('61f4d5dda11abadea060a0329f9eb20203117d4395fd0825526613eba3dfbbd4'
            '160fcd1daab1473cada1d4c5b137e0f3f5b99bafd1b9db30cbc7891616ba9aaa')

prepare() {
   cd $_hkgname-$pkgver
   patch -Np1 -i "${srcdir}/c27c90a564e3056d28dbd8d3cb81bc306c8872f0.patch"
}

build() {
	cd "${srcdir}/${_hkgname}-${pkgver}"
	runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" --datasubdir="$pkgname" \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd ${_hkgname}-${pkgver}
    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
    install -d -m755 "${pkgdir}/usr/share/doc/ghc/html/libraries"
    ln -s /usr/share/doc/${pkgname}/html "${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}"
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
