# Maintainer: Keon Cachia  <keonfarrugia@gmail.com>
pkgname=kwim
pkgver=0.2.0
_mvzrver=0.3.9
_zigwlver=0.6.0
_xkbver=0.4.0
_clapver=0.12.0
pkgrel=1
pkgdesc="Kewuaa's input manager for River"
arch=('x86_64')
url="https://github.com/kewuaa/kwim"
license=('GPL-3.0-only')
depends=('wayland' 'libxkbcommon' 'river')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
	mvzr-$_mvzrver.tar.gz::https://github.com/mnemnion/mvzr/archive/refs/tags/v$_mvzrver.tar.gz
	zigwl-$_zigwlver.tar.gz::https://github.com/ifreund/zig-wayland/archive/refs/tags/v$_zigwlver.tar.gz
	xkb-$_xkbver.tar.gz::https://github.com/ifreund/zig-xkbcommon/archive/refs/tags/v$_xkbver.tar.gz
	clap-$_clapver.tar.gz::https://github.com/Hejsil/zig-clap/archive/refs/tags/$_clapver.tar.gz)
sha256sums=('334b3f272d3ff0ac1eb40a3d0fa705b86f0ddb487c481df3dd3e6db67010cfad'
            'b726de9b6aa25b776af2975893cd48871a5c91f3cbdc78f540668cebbb8373c6'
            '67fdecba19a5c1b7c2cd98321745fe6cf26a7fdfd5f71140db43c6469b523cc9'
            'e6df77d511cf9402f6ac08455c8d1fb727b6c3d66191e246671f62e5db083c49'
            'f1ef979f8be70a128bc47f5b7e2f6194ec36f0f276cdc058a0a476e5d29fdf08')

makedepends=('zig')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  DESTDIR="build" zig build \
    --summary all \
    --prefix /usr \
    --search-prefix /usr \
    --build-id=sha1 \
    --fork="$srcdir"/zig-xkbcommon \
    --fork="$srcdir"/mvzr-$_mvzrver \
    --fork="$srcdir"/zig-clap-$_clapver \
    --fork="$srcdir"/zig-wayland \
    -Dtarget=native-linux.6.6-gnu.2.40 \
    -Dcpu=baseline \
    -Doptimize=ReleaseSafe

}

check() {
  cd "$srcdir/$pkgname-$pkgver"

    zig build test \
      --summary all \
      --prefix /usr \
      --search-prefix /usr \
      --fork="$srcdir"/zig-xkbcommon \
      --fork="$srcdir"/mvzr-$_mvzrver \
      --fork="$srcdir"/zig-clap-$_clapver \
      --fork="$srcdir"/zig-wayland\
      --build-id=sha1 \
      -Dtarget=native-linux.6.6-gnu.2.40 \
      -Dcpu=baseline \
      -Doptimize=ReleaseSafe
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  cp -r build/* "$pkgdir"
}

# vim:set ts=2 sw=2 et:
