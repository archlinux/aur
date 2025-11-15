# Maintainer: artist for XLibre <artist4xlibre@proton.me>

_pkgname=xorgxrdp
pkgname=xlibre-$_pkgname
pkgver=0.10.4
pkgrel=2
pkgdesc="XLibre drivers for xrdp"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/neutrinolabs/xorgxrdp"
license=('X11')
depends=('glibc' 'xlibre-xserver')
makedepends=('libdrm' 'libxfont2' 'nasm' 'xlibre-xserver-devel' 'xrdp')
conflicts=($_pkgname)
provides=($_pkgname)
options=('staticlibs' '!debug')
source=("$url/releases/download/v$pkgver/xorgxrdp-$pkgver.tar.gz"{,.asc}
        configure_ac.patch
        xrdpkeyb_rdpKeyboard_c.patch)
sha256sums=('c2585c73916d68123320c3b3d077d3596c50d71466dbd59e780ca247f9124f14'
            'SKIP'
            'dead2ecd59e2a58f05c3b5df65cdc97a2423098f55d8df2129be6221c1b0f158'
            'bcb7a8bfe940eb18d6b12f80eb31406319008df4f3c134dc6c0dbd29c37b0002')
validpgpkeys=('61ECEABBF2BB40E3A35DF30A9F72CDBC01BF10EB')   # Koichiro IWAO <meta@vmeta.jp>

prepare() {
  cd "$_pkgname-$pkgver"
  patch -Np0 -i ../configure_ac.patch
  patch -Np0 -i ../xrdpkeyb_rdpKeyboard_c.patch
}

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

  #make check   # Requires X Display
}

package() {
  cd "$_pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/$_pkgname"
}

