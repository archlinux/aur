# Maintainer: Andy B. <brofi.archlinux at gmail dot com>

pkgname=xmobar-alsa
pkgver=0.29.5
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
         'haskell-extensible-exceptions' 'haskell-http-conduit')
makedepends=('ghc')
source=(https://github.com/jaor/xmobar/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('bd264f740301b6e1b468f9e7c6ecc02971825238415ba5148c36f180cf40310410c8aaa1f018f237a1b600b167e482178c5e8fc4f104b5c8dc465e0fb7a31d52')

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

