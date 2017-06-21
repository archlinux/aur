# Maintainer: Øyvind 'Mr.Elendig' Heggstad <mrelendig@har-ikkje.net>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: shild <shildv@gmail.com>

pkgname=xmonad-git
pkgver=v0.13.r5.g2e63127
pkgrel=2
pkgdesc="Lightweight X11 tiled window manager written in Haskell"
arch=('i686' 'x86_64')
url="http://xmonad.org/"
license=('BSD')
depends=('ghc'
         'sh'
         'gmp'
         'haskell-x11>=1.8' 'haskell-x11<1.9'
         'haskell-mtl'
         'haskell-utf8-string>=0.3' 'haskell-utf8-string<1.1'
         'haskell-extensible-exceptions'
         'haskell-setlocale')
makedepends=('gendesk' 'git')
optdepends=('xorg-xmessage: for displaying visual error messages')
conflicts=('xmonad')
provides=('xmonad')
install='xmonad.install'
source=('git://github.com/xmonad/xmonad.git'
        'xmonad.svg')
md5sums=('SKIP'
         '72bfa5e62e4e44fe7fa59b6a7593d993')
options=('staticlibs')

pkgver() {
  cd "${pkgname/-git}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  gendesk --pkgname "${pkgname/-git}" --pkgdesc "$pkgdesc"
}

build() {
  cd "$srcdir"/${pkgname/-git}
  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic \
    --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
    --libsubdir=\$compiler/site-local/\$pkgid
  runhaskell Setup build
  runhaskell Setup haddock
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd "$srcdir"/${pkgname/-git}
  install -D -m744 register.sh $pkgdir/usr/share/haskell/${pkgname/-git}/register.sh
  install -m744 unregister.sh $pkgdir/usr/share/haskell/${pkgname/-git}/unregister.sh
  runhaskell Setup.lhs copy --destdir=$pkgdir

  install -D -m644 man/xmonad.1 $pkgdir/usr/share/man/man1/xmonad.1
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/xmonad/LICENSE
  install -D -m644 $srcdir/xmonad.svg $pkgdir/usr/share/pixmaps/xmonad.svg
  install -D -m644 $srcdir/xmonad.desktop $pkgdir/usr/share/xsessions/xmonad.desktop

  install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
  ln -s /usr/share/doc/$pkgname/html "$pkgdir/usr/share/doc/ghc/html/libraries/$pkgname"

  find "$pkgdir"/usr/lib -name "*.a" -delete
}
