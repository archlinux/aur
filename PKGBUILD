# Maintainer: Øyvind 'Mr.Elendig' Heggstad <mrelendig@har-ikkje.net>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: shild <shildv@gmail.com>

pkgname=xmonad-git
pkgver=v0.11.r44.g577d5ae
pkgrel=2
pkgdesc="Lightweight X11 tiled window manager written in Haskell"
arch=('i686' 'x86_64')
url="http://xmonad.org/"
license=('BSD')
depends=('ghc=7.10.1' 'gmp' 'haskell-x11=1.6.1.2' 'sh' 'haskell-mtl=2.2.1'
         'haskell-utf8-string=1' 'haskell-extensible-exceptions=0.1.1.4'
         'haskell-setlocale')
makedepends=('gendesk')
optdepends=('xorg-xmessage: for displaying visual error messages')
conflicts=('xmonad')
provides=('xmonad')
install='xmonad.install'
source=('git://github.com/xmonad/xmonad.git'
        'xmonad.svg')
md5sums=('SKIP' '72bfa5e62e4e44fe7fa59b6a7593d993')
options=('staticlibs')

pkgver() {
  cd "${pkgname/-git}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"
  ghc-pkg list
  gendesk --pkgname "${pkgname/-git}" --pkgdesc "$pkgdesc"

  cd $srcdir/${pkgname/-git}

  runhaskell Setup.lhs configure --ghc --enable-shared --enable-split-objs --prefix=/usr \
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

  #runhaskell util/GenerateManpage.hs

  install -D -m644 man/xmonad.1 $pkgdir/usr/share/man/man1/xmonad.1

  install -D -m644 LICENSE $pkgdir/usr/share/licenses/xmonad/LICENSE

  install -D -m644 $srcdir/xmonad.svg $pkgdir/usr/share/pixmaps/xmonad.svg

  install -D -m644 $srcdir/xmonad.desktop $pkgdir/usr/share/xsessions/xmonad.desktop
}
