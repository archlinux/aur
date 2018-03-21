# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributer: Vlad M. <vlad@archlinux.net>
# Contributer: euclio
# Contributer: Cedric Girard <girard.cedric@gmail.com>
# Contributer: Colin Woodbury <colingw@gmail.com>

pkgname=xmobar-git
pkgver=0.25+18+g14122cd
pkgrel=1
pkgdesc='Minimalistic Text Based Status Bar'
url='https://hackage.haskell.org/package/xmobar'
arch=('x86_64')
license=('custom:BSD3')
depends=('libxft' 'libxinerama' 'libxrandr' 'libxpm' 'ghc-libs' 'haskell-x11'
         'haskell-x11-xft' 'haskell-utf8-string' 'haskell-network-uri'
         'haskell-hinotify' 'haskell-stm' 'haskell-parsec' 'haskell-mtl'
         'haskell-regex-base' 'haskell-regex-compat' 'haskell-http'
         'haskell-dbus' 'haskell-libmpd' 'haskell-iwlib' 'wireless_tools'
         'haskell-text')
makedepends=('git' 'ghc')
conflicts=('xmobar')
provides=('xmobar')
source=(${pkgname}::git+https://github.com/jaor/xmobar.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --tags --always|sed 's|-|+|g'|sed -r 's|v(.+)|\1|'
}

build() {
  cd ${pkgname}
  runhaskell setup configure -O \
    --enable-shared \
    --prefix=/usr \
    --enable-executable-dynamic \
    --disable-library-vanilla \
    --flags="with_utf8 with_xft with_iwlib with_xpm with_inotify with_mpd with_dbus with_mpris"
  runhaskell setup build
}

package() {
  cd ${pkgname}
  runhaskell setup copy --destdir="${pkgdir}"
  install -Dm 644 license "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
