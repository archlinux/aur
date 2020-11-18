# Maintainer: bratekarate <bratekannkarate at gmail dot com>
# Contributer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributer: Vlad M. <vlad@archlinux.net>
# Contributer: euclio
# Contributer: Cedric Girard <girard.cedric@gmail.com>
# Contributer: Colin Woodbury <colingw@gmail.com>

pkgname=xmobar-alsa-git
pkgver=0.36.r12.gea1096f
pkgrel=1
pkgdesc='Minimalistic Text Based Status Bar. Fork with alsa enabled.'
url='https://hackage.haskell.org/package/xmobar'
license=('custom:BSD3')
arch=('x86_64')
depends=('libxft' 'libxinerama' 'libxrandr' 'libxpm' 'ghc-libs' 'haskell-x11'
         'haskell-x11-xft' 'haskell-utf8-string' 'haskell-network-uri'
         'haskell-hinotify' 'haskell-stm' 'haskell-parsec' 'haskell-parsec-numbers'
         'haskell-mtl' 'haskell-regex-base' 'haskell-regex-compat'
         'haskell-http' 'haskell-dbus' 'haskell-libmpd' 'haskell-iwlib'
         'wireless_tools' 'haskell-text' 'haskell-async' 'haskell-alsa-core'
         'haskell-alsa-mixer' 'haskell-extensible-exceptions')
makedepends=('git' 'ghc')
conflicts=('xmobar' 'xmobar-git')
provides=('xmobar')
source=(${pkgname}::git+https://github.com/jaor/xmobar.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed -E 's|\.r0\.\w+$||'
}

prepare() {
  cd ${pkgname}
  sed -i -e 's/==.*0.3/== 0.4/' -e 's/< *4.12/<5/' -e 's/< *2.5/<3/' xmobar.cabal
}

build() {
  cd ${pkgname}
  runhaskell setup configure -O \
    --enable-shared \
    --prefix=/usr \
    --enable-executable-dynamic \
    --disable-library-vanilla \
    --flags="with_utf8 with_xft with_iwlib with_xpm with_inotify with_mpd with_dbus with_mpris with_alsa"
  runhaskell setup build
}

package() {
  cd ${pkgname}
  runhaskell setup copy --destdir="${pkgdir}"
  install -Dm 644 license "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
