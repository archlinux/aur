# Maintainer: João Miguel <jmcf125 at openmailbox dot org>
# (with the help of cabal2arch ;-)
_hkgname=HSH
pkgname=haskell-hsh
pkgver=2.1.2
pkgrel=1
pkgdesc="Library to mix shell scripting with Haskell programs"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('LGPL')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc' 'haskell-missingh>=1.0.0' 'haskell-bytestring>=0.9.1.10' 'haskell-directory>=1.1.0.0' 'haskell-filepath>=1.2.0.0' 'haskell-hslogger' 'haskell-mtl>=2.0.1.0' 'haskell-process>=1.0.1.5' 'haskell-regex-base>=0.93.2' 'haskell-regex-compat>=0.93.1' 'haskell-regex-posix>=0.94.4' 'haskell-unix>=2.4.2.0' 'haskell-base<5')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz directory.patch orphans.patch process.patch)
install=${pkgname}.install
sha256sums=(788a7f25336e7fe9c7d38b68bb4cc0030712fc47e0cdf282267dea1e46b0da9f 78f32f4e3109ef478d33135624940484eaa3c269f80e3ec602ba0c2864ff0354 819c1dae6ebcc5ff89115c87c48bb4ba6cb3f4b4f91ca5a08455487007ea6dee 325b18dd5c81da298f3afa976e8488e4edab14a1c9e5e23f577a4412f6693e34)
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    # Yes, 3 patches, 3 different problems, 3 files
    patch -p2 -i "$srcdir/directory.patch"   # needed since System.Directory 1.2.6
    patch -p2 -i "$srcdir/process.patch"     # needed since System.Process 1.3.0
    patch -p2 -i "$srcdir/orphans.patch"
    # \---> part of the point of HSH is having all those orphan instances (also, an open world assumption is implied), those specific warnings are just noise
    runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } --enable-split-objs --enable-shared \
       --prefix=/usr --docdir=/usr/share/doc/${pkgname} --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register   --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}
package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${pkgname}/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh
    install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}
    runhaskell Setup copy --destdir=${pkgdir}
}
