# Maintainer: Andy B. <brofi.archlinux at gmail dot com>

pkgname=xmobar-alsa
pkgver=0.28.1
pkgrel=1
pkgdesc="A Minimalistic Text Based Status Bar compiled with ALSA"
url="https://hackage.haskell.org/package/xmobar"
license=('BSD')
arch=('i686' 'x86_64')
conflicts=('xmobar')
depends=('haskell-alsa-core>=0.5.0' 'haskell-alsa-mixer>0.2.0.2' 'libxft'
         'libxinerama' 'libxrandr' 'libxpm' 'ghc-libs' 'haskell-x11'
         'haskell-x11-xft' 'haskell-utf8-string' 'haskell-network-uri'
         'haskell-hinotify' 'haskell-stm' 'haskell-parsec'
         'haskell-parsec-numbers' 'haskell-mtl' 'haskell-regex-base'
         'haskell-regex-compat' 'haskell-http' 'haskell-dbus' 'haskell-libmpd'
         'haskell-iwlib' 'wireless_tools' 'haskell-text')
makedepends=('ghc')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/jaor/xmobar/archive/${pkgver}.tar.gz)
sha512sums=('8b485fc18e83ace54a16b241d25504658b6d07cb94bbe67d0f1a4c33d1b2cdf1d2ceaced5d96b19e1fca893482124281c85d9424fc2d6e019f8e4feb41be1cc0')

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

