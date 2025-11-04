# Maintainer: artist for XLibre

_pkgname=xorgxrdp
pkgname=xlibre-$_pkgname
pkgver=0.10.4
pkgrel=1
pkgdesc="XLibre drivers for xrdp"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/neutrinolabs/xorgxrdp"
license=('X11')
depends=('glibc' 'xlibre-xserver')
makedepends=('libxfont2' 'nasm' 'xorg-server-devel' 'xrdp')
conflicts=($_pkgname)
provides=($_pkgname)
options=('staticlibs')
source=("https://github.com/neutrinolabs/xorgxrdp/releases/download/v$pkgver/xorgxrdp-$pkgver.tar.gz"{,.asc})
sha256sums=('c2585c73916d68123320c3b3d077d3596c50d71466dbd59e780ca247f9124f14'
            'SKIP')
validpgpkeys=('61ECEABBF2BB40E3A35DF30A9F72CDBC01BF10EB')  # Koichiro IWAO <meta@vmeta.jp>

build() {
  cd "$_pkgname-$pkgver"

  ./bootstrap

  CFLAGS="$CFLAGS -ffat-lto-objects $(pkgconf --cflags-only-I libdrm)"
  sed -i 's|moduledir=`pkg-config xorg-server --variable=moduledir`|moduledir="/usr/lib/xorg/modules/xlibre-25.0"|' configure
  ./configure \
    --prefix="/usr"

  make
}

check() {
  cd "$_pkgname-$pkgver"

  #make check
}

package() {
  cd "$_pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/$_pkgname"
}

