# Maintainer: Øyvind 'Mr.Elendig' Heggstad <mrelendig@har-ikkje.net>
# Contributor:: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor:: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: orbisvicis <gmail.com>

pkgname=xmonad-contrib-git
pkgver=v0.17.0.r89.g41ca7998
pkgrel=1
pkgdesc="Add-ons for xmonad"
arch=('x86_64')
url="http://xmonad.org/"
license=('BSD')
depends=('ghc'
         'xmonad-git'
         'sh'
         'haskell-x11>=1.10' 'haskell-x11<1.11'
         'haskell-x11-xft>=0.2'
         'haskell-utf8-string'
         'haskell-random'
         'haskell-old-time')
makedepends=('git')
conflicts=('xmonad-contrib')
provides=('xmonad-contrib')
source=('git+https://github.com/xmonad/xmonad-contrib')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname/-git}"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname/-git}"
  runhaskell Setup.lhs configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
             --prefix=/usr -fuse_xft --libsubdir=\$compiler/site-local/\$pkgid \
             --docdir=/usr/share/doc/${pkgname}
  runhaskell Setup build
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd "${pkgname/-git}"
  install -Dm 744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname/-git}.sh"
  install -Dm 744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname/-git}.sh"
  runhaskell Setup.lhs copy --destdir="${pkgdir}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
