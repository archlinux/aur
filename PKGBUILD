# Maintainer: Leif Warner <abimelech@gmail.com>
_hkgname=xmonad-extras
pkgname=xmonad-extras-darcs
pkgver=20110814
pkgrel=1
pkgdesc="Third party extensions for xmonad with wacky dependencies"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=('darcs')
provides=('xmonad-extras')
conflicts=('xmonad-extras')
depends=('haskell-x11>=1.4.3' 'haskell-containers' 'haskell-directory' 'haskell-mtl' 'haskell-old-locale' 'haskell-old-time' 'haskell-process' 'haskell-random' 'haskell-unix' 'haskell-xmonad-contrib'
# Uncomment the following two lines for XMonad.Actions.Volume
'haskell-parsec' 
'haskell-split' 
# Uncomment this for XMonad.Prompt.MPD
# 'haskell-libmpd' 
# Uncomment this for XMonad.Util.WindowPropertiesRE
# 'haskell-regex-posix' 
# Uncomment these two lines for XMonad.Actions.Eval & XMonad.Prompt.Eval
# 'haskell-hint'
# 'haskell-network' 
# Uncomment these two lines for XMonad.Config.Alt
# 'haskell-hlist' 
# 'haskell-template-haskell' 
)
options=('staticlibs')
source=()
install=${pkgname}.install

_darcsmod="xmonad-extras"
_darcstrunk="http://code.haskell.org"

build() {
    cd ${srcdir}
    if [[ -d ${srcdir}/$_darcsmod/_darcs ]]
    then
      msg "Retrieving missing patches"
      cd $_darcsmod
      darcs pull -a $_darcstrunk/$_darcsmod
    else
      msg "Retrieving complete sources"
      darcs get --set-scripts-executable $_darcstrunk/$_darcsmod
      cd $_darcsmod
    fi
    runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } --enable-split-objs \
       --prefix=/usr --docdir=/usr/share/doc/${pkgname} --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register   --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}
package() {
    cd ${srcdir}/${_hkgname}
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${pkgname}/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh
    install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
