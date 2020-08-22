# Maintainer: Leif Warner <abimelech@gmail.com>
pkgname=xmonad-extras-git
pkgver=r154.b2772a5
pkgrel=1
pkgdesc="Third party extensions for xmonad with wacky dependencies"
url="http://hackage.haskell.org/package/xmonad-extras"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=('git')
provides=('xmonad-extras')
conflicts=('xmonad-extras')
depends=('haskell-x11>=1.4.3' 'haskell-containers' 'haskell-mtl' 'xmonad-contrib'
# Uncomment the following line for XMonad.Actions.Volume
'haskell-alsa-mixer' 
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
source=('git://github.com/xmonad/xmonad-extras')
md5sums=('SKIP')

pkgver() {
  cd xmonad-extras
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/xmonad-extras"
    runhaskell Setup configure -O --enable-executable-dynamic --enable-shared --disable-library-vanilla -fwith_sound \
       --prefix=/usr --docdir=/usr/share/doc/${pkgname} --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup register   --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}
package() {
    cd "$srcdir/xmonad-extras"
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/register/${pkgname}.sh
    install -D  -m744 unregister.sh ${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
