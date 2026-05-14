# Maintainer: Keon Cachia  <keonfarrugia@gmail.com>
pkgname=kwim
pkgver=0.1.5
_mvzrver=0.3.7
_zigwlver=0.5.0
_xkbver=0.4.0
_clapver=0.11.0
pkgrel=1
pkgdesc="Kewuaa's input manager for River"
arch=('x86_64')
url="https://github.com/kewuaa/kwim"
license=('GPL-3.0')
depends=('wayland' 'libxkbcommon' 'river')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
	mvzr-$_mvzrver.tar.gz::https://github.com/mnemnion/mvzr/archive/refs/tags/v$_mvzrver.tar.gz
	zigwl-$_zigwlver.tar.gz::https://codeberg.org/ifreund/zig-wayland/archive/v$_zigwlver.tar.gz
	xkb-$_xkbver.tar.gz::https://codeberg.org/ifreund/zig-xkbcommon/archive/v$_xkbver.tar.gz
	clap-$_clapver.tar.gz::https://github.com/Hejsil/zig-clap/archive/refs/tags/$_clapver.tar.gz)
sha256sums=('7185de4fc213ec1a7a394e2ed25612c56ce329d95d7f4d3b3809dd594d26c5c3'
            '9f9a28b2f6af44b004cd968fc639dbe6dc088355950a24614622f2ec462c851b'
            'fa9705e83613b5555d7117ce5c602f10591d6598e69a73fba2e6039200db4f4b'
            'e6df77d511cf9402f6ac08455c8d1fb727b6c3d66191e246671f62e5db083c49'
            '7c359dec441866e025065ae9ca706ece72bcf4e8a25fbe31719b1e92ff389648')

noextract=("${source[@]:1}")
makedepends=('zig=0.15.2')

prepare() {
  zig fetch --global-cache-dir ./zig-global-cache "./${source[1]%%::*}"
  zig fetch --global-cache-dir ./zig-global-cache "./${source[2]%%::*}"
  zig fetch --global-cache-dir ./zig-global-cache "./${source[3]%%::*}"
  zig fetch --global-cache-dir ./zig-global-cache "./${source[4]%%::*}"
}


build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  DESTDIR="build" zig build \
    --summary all \
    --prefix /usr \
    --search-prefix /usr \
    --global-cache-dir ../zig-global-cache \
    --system ../zig-global-cache/p \
    --build-id=sha1 \
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
      --global-cache-dir ../zig-global-cache \
      --system ../zig-global-cache/p \
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
