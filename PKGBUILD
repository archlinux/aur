# Maintainer: Øyvind 'Mr.Elendig' Heggstad <mrelendig@har-ikkje.net>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: shild <shildv@gmail.com>

pkgname=xmonad-git
pkgver=v0.14.2.r5.g3d1720c
pkgrel=1
pkgdesc="Lightweight X11 tiled window manager written in Haskell"
arch=('x86_64')
url="http://xmonad.org/"
license=('BSD')
depends=('ghc'
         'sh'
         'gmp'
         'haskell-x11>=1.8' 'haskell-x11<1.10'
         'haskell-mtl'
         'haskell-utf8-string>=0.3' 'haskell-utf8-string<1.1'
         'haskell-extensible-exceptions'
         'haskell-setlocale')
makedepends=('gendesk' 'git')
optdepends=('xorg-xmessage: for displaying visual error messages')
conflicts=('xmonad')
provides=('xmonad')
source=('git://github.com/xmonad/xmonad.git'
        'dynamic-compilation.patch'
        'xmonad.svg')
md5sums=('SKIP'
         'b2e645bb5aa91c64f85004806e049b8d'
         '72bfa5e62e4e44fe7fa59b6a7593d993')
options=('staticlibs')

pkgver() {
  cd "${pkgname/-git}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  gendesk --pkgname "${pkgname/-git}" --pkgdesc "$pkgdesc"
  cd "$srcdir"/${pkgname/-git}
  patch -p1 -i "${srcdir}/dynamic-compilation.patch"
}

build() {
  cd "$srcdir"/${pkgname/-git}
  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir="/usr/share/doc/${pkgname}" --datasubdir="$pkgname" \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
  runhaskell Setup build
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd "$srcdir"/${pkgname/-git}

  install -Dm 744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname/-git}.sh"
  install -Dm 744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname/-git}.sh"

  runhaskell Setup.lhs copy --destdir="${pkgdir}"

  # Requires pandoc, regex-posix, Pretty and cabal
  #runhaskell util/GenerateManpage.hs

  install -Dm 644 man/xmonad.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/xmonad"
  install -Dm 644 "$srcdir/xmonad.svg" -t "${pkgdir}/usr/share/pixmaps"
  install -Dm 644 "$srcdir/xmonad.desktop" -t "${pkgdir}/usr/share/xsessions"
}
