# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=vcat
pkgver=0.3
pkgrel=3
pkgdesc="Outputs a video on a 256-color enabled terminal with UTF-8 locale"
arch=('i686' 'x86_64')
url="https://github.com/libcg/vcat"
license=('BSD')
depends=('ffmpeg')
source=("vcat-$pkgver.tar.gz::https://github.com/libcg/vcat/archive/$pkgver.tar.gz"
        "vcat-0.3-ffmpeg.patch::https://github.com/libcg/vcat/commit/bbb6c8c4127f49b966caa8d21e4c9b418e74a286.patch")
sha256sums=('ae948e9c43801d8c1d3c0f12d023d38d082b1525debbb92b400a59d7c893b3bb'
            'bc02d5dfa8a38b1cbdb94114386ec11559722db9d5b7c5d3ab2326c0240a6527')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../vcat-0.3-ffmpeg.patch
  sed -i 's|CCFLAGS=|CCFLAGS=$(CPPFLAGS) $(CFLAGS) |' Makefile
  sed -i 's|LDFLAGS=|LDFLAGS+=|' Makefile
  head -n 28 vcat.c > LICENSE
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 vcat "$pkgdir"/usr/bin/vcat
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
