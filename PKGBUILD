# Maintainer: Leif Warner <abimelech@gmail.com>
_gitname=Idris-dev
pkgname=idris-git
pkgver=v0.11.r118.cf0b54e
pkgrel=1
pkgdesc="Functional Programming Language with Dependent Types"
url="http://www.idris-lang.org/"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=('ghc' 'haskell-annotated-wl-pprint>=0.7'  'haskell-ansi-terminal<0.7' 'haskell-ansi-wl-pprint<0.7' 'haskell-base64-bytestring<1.1' 'haskell-binary<0.8' 'haskell-blaze-html' 'haskell-blaze-markup' 'haskell-bytestring' 'haskell-cheapskate<0.2' 'haskell-containers' 'haskell-deepseq' 'haskell-directory' 'haskell-filepath' 'haskell-fingertree<0.2' 'haskell-haskeline<0.8' 'haskell-mtl' 'haskell-network' 'haskell-optparse-applicative' 'haskell-parsers<0.13' 'haskell-pretty' 'haskell-process' 'haskell-safe' 'haskell-split<0.3' 'haskell-text' 'haskell-time' 'haskell-transformers' 'haskell-transformers-compat>=0.3' 'haskell-trifecta<1.6' 'haskell-uniplate<1.7' 'haskell-unix' 'haskell-unordered-containers<0.3' 'haskell-utf8-string' 'haskell-vector' 'haskell-vector-binary-instances<0.3' 'haskell-zip-archive' 'haskell-zlib' 'haskell-libffi' 'haskell-terminal-size' 'haskell-ieee754')
depends=('ncurses' 'gmp' 'libffi' 'zlib' 'gcc')
options=('staticlibs')
provides=('idris')
conflicts=('idris')
source=("git://github.com/idris-lang/${_gitname}.git")
md5sums=('SKIP')
install=${pkgname}.install


pkgver() {
  cd $_gitname
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd $_gitname
    runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } --enable-split-objs --enable-shared \
       --prefix=/usr --docdir=/usr/share/doc/${pkgname} --libsubdir=\$compiler/site-local/\$pkgid -fFFI -fGMP
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register   --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}
package() {
    cd $_gitname
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${pkgname}/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh
    install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}

