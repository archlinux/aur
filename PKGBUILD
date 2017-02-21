# Maintainer: Øyvind 'Mr.Elendig' Heggstad <mrelendig@har-ikkje.net>
# Contributor:: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor:: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: orbisvicis <gmail.com>

pkgname=xmonad-contrib-git
pkgver=v0.13.r9.g4c00eb5
pkgrel=1
pkgdesc="Add-ons for xmonad"
arch=('i686' 'x86_64')
url="http://xmonad.org/"
license=('BSD')
depends=('ghc'
         'xmonad-git'
         'sh'
         'haskell-x11>=1.6.1' 'haskell-x11<1.9'
         'haskell-x11-xft>=0.2'
         'haskell-utf8-string'
         'haskell-random'
         'haskell-old-time')
makedepends=('git')
conflicts=('xmonad-contrib')
provides=('xmonad-contrib')
install='xmonad-contrib.install'
options=('staticlibs')
source=('git://github.com/xmonad/xmonad-contrib')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname/-git}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/${pkgname/-git}

  runhaskell Setup.lhs configure --ghc --enable-shared --enable-split-objs --prefix=/usr -fuse_xft \
             --libsubdir=\$compiler/site-local/\$pkgid
  runhaskell Setup build
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd $srcdir/${pkgname/-git}
  install -D -m744 register.sh $pkgdir/usr/share/haskell/${pkgname/-git}/register.sh
  install -m744 unregister.sh $pkgdir/usr/share/haskell/${pkgname/-git}/unregister.sh
  runhaskell Setup.lhs copy --destdir=$pkgdir
  install -D LICENSE $pkgdir/usr/share/licenses/xmonad-contrib/LICENSE
}
