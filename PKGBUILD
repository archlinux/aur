# Maintainer: Jat <chat@jat.email>

_pkgname=xorgxrdp
pkgname=xorgxrdp-glamor
pkgver=0.2.16
pkgrel=3
pkgdesc="Xorg drivers for xrdp, with glamor enabled. Only works on Intel and AMD GPUs."
arch=('i686' 'x86_64')
url="https://github.com/neutrinolabs/xorgxrdp"
license=('MIT')
provides=('xorgxrdp')
conflicts=('xorgxrdp')
depends=('xorg-server')
makedepends=('nasm' 'xorg-server-devel' 'xrdp')
options=('staticlibs')
source=("https://github.com/neutrinolabs/xorgxrdp/releases/download/v$pkgver/xorgxrdp-$pkgver.tar.gz"{,.asc}
        'glamor.patch')
sha256sums=('e6b5f3df44cbf147dcbbc326cdd08c95fe28dba80c2a216e046fe42d962f9215'
            'SKIP'
            '2fd812f4e7cb649d9af4c75b0115b31154e8ac5b8d95c601251f515b177cb847')
validpgpkeys=('61ECEABBF2BB40E3A35DF30A9F72CDBC01BF10EB')  # Koichiro IWAO <meta@vmeta.jp>

prepare () {
  cd "$_pkgname-$pkgver"

  # https://github.com/neutrinolabs/xrdp/issues/1029#issuecomment-724105386
  patch -p1 -i"${srcdir}/glamor.patch"
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
