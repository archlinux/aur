# Maintainer: Jat <chat@jat.email>

_pkgname=xorgxrdp
pkgname=xorgxrdp-glamor
pkgver=0.2.15
pkgrel=1
pkgdesc="Xorg drivers for xrdp, with glamor enabled. Only works on Intel and AMD GPUs."
arch=('i686' 'x86_64')
url="https://github.com/neutrinolabs/xorgxrdp"
license=('MIT')
provides=('xorgxrdp')
conflicts=('xorgxrdp')
depends=('libepoxy' 'libglvnd')
makedepends=('nasm' 'xorg-server-devel' 'xrdp')
options=('staticlibs')
source=("https://github.com/neutrinolabs/xorgxrdp/releases/download/v$pkgver/xorgxrdp-$pkgver.tar.gz"{,.asc}
        'glamor.patch')
sha256sums=('fde7ba96b6fc34ffdeaef9fc5a86c7f1f21cf82efd9df005f206f2d25b2afa37'
            'SKIP'
            '2d9f0b6a223aa65d553c07356d7862193af04a7afac792c28822a6304306a2f4')
validpgpkeys=('61ECEABBF2BB40E3A35DF30A9F72CDBC01BF10EB')  # Koichiro IWAO <meta@vmeta.jp>

build() {
  cd "$_pkgname-$pkgver"

  # https://github.com/neutrinolabs/xrdp/issues/1029#issuecomment-724105386
  patch --forward --strip=1 --input="${srcdir}/glamor.patch"
  CFLAGS+=" $(pkgconf --cflags libdrm)" \
  LDFLAGS+=' -L/usr/lib/xorg/modules -lglamoregl -Wl,-rpath,/usr/lib/xorg/modules' \
  ./configure --prefix="/usr" --enable-glamor
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
