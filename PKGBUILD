# Maintainer: Leif Warner <abimelech@gmail.com>
_hkgname=idris
pkgname=idris
pkgver=0.9.20
pkgrel=1
pkgdesc="Functional Programming Language with Dependent Types"
url="http://www.idris-lang.org/"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedpends=('ghc' 'cabal-install' 'chrpath' 'inotify-tools')
depends=('gmp' 'libffi' 'zlib' 'gcc')
provides=('idris')
conflicts=('idris-git')
source=(http://hackage.haskell.org/packages/archive/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('cbb1205173893ad8987057b286a3418d')
install=${pkgname}.install
build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    # I've heard this can cause a problem in the past. If necessary, do a
    # cabal update manually and comment it out here.
    cabal update

    cabal sandbox init
    cabal install --only-dependencies
    cabal configure -O  --prefix=/usr --docdir=/usr/share/doc/${pkgname} -fFFI -fGMP

    binPath=${srcdir}/${pkgname}-${pkgver}/dist/build/${pkgname}/${pkgname}

    cabal build

    # This build often weirdly keeps the file open even after the
    # process returns, && doesn't work. So, wait for it:
    inotifywait -e close $binPath

    # Remove bogus rpath data that points to temp build dir
    chrpath -d $binPath
}
package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${pkgname}
    cabal copy --destdir=${pkgdir}
    rm -r ${pkgdir}/usr/lib
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -D -m644 ${pkgdir}/usr/share/doc/${pkgname}/html/man/${pkgname}.1 ${pkgdir}/usr/share/man/${pkgname}.1
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
