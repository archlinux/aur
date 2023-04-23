# Maintainer: Jat <chat@jat.email>

_pkgname=xorgxrdp
pkgname=xorgxrdp-glamor
pkgver=0.9.19
pkgrel=1
pkgdesc="Xorg drivers for xrdp, with glamor enabled. Only works on Intel and AMD GPUs."
arch=('i686' 'x86_64')
url="https://github.com/neutrinolabs/xorgxrdp"
license=('MIT')
provides=('xorgxrdp')
conflicts=('xorgxrdp')
depends=('xorg-server')
makedepends=('nasm' 'xorg-server-devel' 'xrdp')
options=('staticlibs')
source=("$url/releases/download/v$pkgver/xorgxrdp-$pkgver.tar.gz"{,.asc}
        'glamor.patch')
sha256sums=('c1cf4c583c28a24ce814c147d387b8f4d255877f2e365372c69c6f076ddb1455'
            'SKIP'
            '10d289d1a11c9a5a8b4c6af534c2f9e7900ae2b4351860a063ba572010d95912')
validpgpkeys=('61ECEABBF2BB40E3A35DF30A9F72CDBC01BF10EB')  # Koichiro IWAO <meta@vmeta.jp>

prepare () {
  cd "$_pkgname-$pkgver"

  # https://github.com/neutrinolabs/xrdp/issues/1029#issuecomment-724105386
  patch -p1 -i"$srcdir/glamor.patch"
}

build () {
  cd "$_pkgname-$pkgver"

  ./configure --prefix="/usr" --enable-glamor
  make
}

package () {
  cd "$_pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
