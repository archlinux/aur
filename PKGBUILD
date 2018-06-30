# Maintainer: Andy B. <brofi.archlinux at gmail dot com>

pkgname=xmobar-alsa
pkgver=0.26
pkgrel=3
pkgdesc="A Minimalistic Text Based Status Bar compiled with ALSA"
url="https://hackage.haskell.org/package/xmobar"
license=('BSD')
arch=('i686' 'x86_64')
conflicts=('xmobar')
depends=('haskell-alsa-core>=0.5.0' 'haskell-alsa-mixer>0.2.0.2' 'libxft'
         'libxinerama' 'libxrandr' 'libxpm' 'ghc-libs' 'haskell-x11'
         'haskell-x11-xft' 'haskell-utf8-string' 'haskell-network-uri'
         'haskell-hinotify' 'haskell-regex-base' 'haskell-regex-compat'
         'haskell-http' 'haskell-dbus0.10' 'haskell-libmpd' 'haskell-iwlib'
         'wireless_tools')
makedepends=('ghc')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/jaor/xmobar/archive/${pkgver}.tar.gz
        hinotify-0.3.10.patch::https://github.com/jaor/xmobar/commit/fb0a23f395445540f865ae00b33e75e0175db4ef.patch)
sha512sums=('c67c1552f7183a6f33b472f19686cda41cca27c0de89a8d0dcb1f8ea008aea85a143d75608d4392a1a1c9933737a6cbe881cff9ddd13f632d581cd0e10ca8d4d'
            '53b7cca689386e976383ebbe56db877fb01896a5dfcb1e4e4e5424a9ce1ef7cc75a38dbed2bdb23e9521357c1e5945a7b58f70df07029fd38e398c6ca4891264')

prepare() {
  cd xmobar-$pkgver
  patch -p1 -i ../hinotify-0.3.10.patch
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

