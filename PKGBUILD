# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=celestia
pkgver=1.6.2.2
pkgrel=2
pkgdesc="Real-time space simulation"
arch=(x86_64)
license=(GPL)
url="https://celestia.space"
depends=('gtk2' 'libtheora' 'lua53' 'gtkglext' 'freeglut' 'libxmu' 'glu' 'libjpeg-turbo' 'mesa')
options=('!makeflags')
source=("https://github.com/CelestiaProject/Celestia/archive/$pkgver/$pkgname-$pkgver.tar.gz"
  celestia-fix-desktop.patch::"https://github.com/CelestiaProject/Celestia/commit/6a4a0573.patch")
sha512sums=('a67cc296a3f176bbe74e9c0bf8d83f6a78cc045edb23fbb870ff42dfd0b53a87af83b57ec35d378338f5dc321ead0d719a350a36036cdc3a2817f9c4b0d89ad2'
            'ebecc20e12cce61952d0a8f20bdbfbe4394a12e456e2805d421027465758c281a3ef65a3ad797fca92b5ad8061d627dd6ea490dd1b68ac3390526b68715cdf38')

prepare() {
  cd Celestia-${pkgver}
  patch -p1 <../celestia-fix-desktop.patch # Fix executable name in desktop file
  autoreconf -vi
}

build() {
  cd Celestia-${pkgver}
  ./configure --prefix=/usr \
    --with-lua=/usr \
    --datadir=/usr/share \
    --with-gtk \
    --disable-rpath \
    --with-lua
  make
}

package() {
  cd Celestia-${pkgver}

  make DESTDIR="${pkgdir}" MKDIR_P='mkdir -p' install
}
