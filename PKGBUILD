# Maintainer: Andy B. <brofi.archlinux at gmail dot com>

pkgname=xmobar-alsa
pkgver=0.29.4
pkgrel=1
pkgdesc="A Minimalistic Text Based Status Bar compiled with ALSA"
url="https://hackage.haskell.org/package/xmobar"
license=('BSD')
arch=('i686' 'x86_64')
conflicts=('xmobar')
depends=('haskell-alsa-core>=0.5.0' 'haskell-alsa-mixer>=0.3.0' 'libxft'
         'libxinerama' 'libxrandr' 'libxpm' 'ghc-libs' 'haskell-x11'
         'haskell-x11-xft' 'haskell-utf8-string' 'haskell-network-uri'
         'haskell-hinotify' 'haskell-stm' 'haskell-parsec'
         'haskell-parsec-numbers' 'haskell-mtl' 'haskell-regex-base'
         'haskell-regex-compat' 'haskell-http' 'haskell-dbus' 'haskell-libmpd'
         'haskell-iwlib' 'wireless_tools' 'haskell-text' 'haskell-async'
         'haskell-extensible-exceptions')
makedepends=('ghc')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/jaor/xmobar/archive/${pkgver}.tar.gz)
sha512sums=('d56ce2ec6014f9bd1d224980524d91c0f72030d4559c001dfbc049902931541b9abd3c8f055cacc10fd3e7cdd067686cdc4f15fcdc37d4c50dfc59d6edcb036e')

prepare() {
  cd xmobar-$pkgver
  sed -i -e 's/==.*0.3/== 0.4/' -e 's/< *4.12/<5/' -e 's/< *2.5/<3/' xmobar.cabal
}

build() {
    cd xmobar-$pkgver

    runhaskell setup configure -O \
        --enable-shared \
        --prefix=/usr \
        --enable-executable-dynamic \
        --disable-library-vanilla \
        --flags="with_utf8 with_xft with_iwlib with_xpm with_inotify with_mpd with_dbus with_mpris with_alsa"
    runhaskell setup build
}

package() {
    cd xmobar-$pkgver
    runhaskell setup copy --destdir="$pkgdir"
    install -Dm 644 license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

