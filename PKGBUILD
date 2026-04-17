# Maintainer: Keon Cachia <keonfarrugia@gmail.com>

pkgname=kwm
pkgdesc="Kewuaa's window manager for the River compositor"
pkgver=0.2.2
_xkbver=0.3.0
_mvzrver=0.3.8
_mvzrkwimver=0.3.7
_xkbkwimver=0.4.0
_clapver=0.11.0
_fcftver=2.0.0
_pixmanver=0.3.0
_kwimver=0.1.4
_zigwlver=0.5.0
pkgrel=1
arch=('x86_64')
url="https://github.com/kewuaa/kwm"
license=('GPL-3.0')
depends=('wayland'
	 'river'
	 'pixman'
	 'fcft'
	 'libxkbcommon')
optdepends=('swaybg: Default wallpaper manager'
	    'foot: Default terminal emulator'
	    'wmenu: Default launcher')
makedepends=('zig'
	     'wayland-protocols')
install=kwm.install
source=($pkgname-$pkgver::"$url"/archive/refs/tags/v$pkgver.tar.gz
	xkb-$_xkbver.tar.gz::https://codeberg.org/ifreund/zig-xkbcommon/archive/v$_xkbver.tar.gz
	xkb-$_xkbkwimver.tar.gz::https://codeberg.org/ifreund/zig-xkbcommon/archive/v$_xkbkwimver.tar.gz
	mvzr-$_mvzrver.tar.gz::https://github.com/mnemnion/mvzr/archive/refs/tags/v$_mvzrver.tar.gz
	mvzr-$_mvzrkwimver.tar.gz::https://github.com/mnemnion/mvzr/archive/refs/tags/v$_mvzrkwimver.tar.gz
        fcft-$_fcftver.tar.gz::https://git.sr.ht/~novakane/zig-fcft/archive/v$_fcftver.tar.gz
	pixman-$_pixmanver.tar.gz::https://codeberg.org/ifreund/zig-pixman/archive/v$_pixmanver.tar.gz
	kwim-$_kwimver.tar.gz::https://github.com/kewuaa/kwim/archive/refs/tags/v$_kwimver.tar.gz
	zigwl-$_zigwlver.tar.gz::https://codeberg.org/ifreund/zig-wayland/archive/v$_zigwlver.tar.gz
	clap-$_clapver.tar.gz::https://github.com/Hejsil/zig-clap/archive/refs/tags/$_clapver.tar.gz
)
sha256sums=('66e34df0d47a7a3225a1a03a63d1b92f1813b785d430ef09ad7db45894438688'
            '1e185423e6b23ed9729614e66751ab7522db4487df4e0dcc7a2b06375aacda23'
            'e6df77d511cf9402f6ac08455c8d1fb727b6c3d66191e246671f62e5db083c49'
            '3df80b786c847d7c147ccb42689f53e886b2c153d67e40b5f9481538537331d0'
            '9f9a28b2f6af44b004cd968fc639dbe6dc088355950a24614622f2ec462c851b'
            'bff418e0a888b9a4299d212769e31631f0f8d7cfd9daeded021ec1699ef0af5b'
            'cd7fe3415d4d58685a94fdedd308e9994a37f012828940cfb603461de7f2c6ad'
            '0f0a5048e8b568f21e2bc7f34dc0e627ce570f3b37903704dbfbc2932c1cc4f9'
            'fa9705e83613b5555d7117ce5c602f10591d6598e69a73fba2e6039200db4f4b'
            '7c359dec441866e025065ae9ca706ece72bcf4e8a25fbe31719b1e92ff389648')
noextract=("${source[@]:1}")
provides=("kwim")
conflicts=("kwim")

prepare() {
  zig fetch --global-cache-dir ./zig-global-cache "./${source[1]%%::*}"
  zig fetch --global-cache-dir ./zig-global-cache "./${source[2]%%::*}"
  zig fetch --global-cache-dir ./zig-global-cache "./${source[3]%%::*}"
  zig fetch --global-cache-dir ./zig-global-cache "./${source[4]%%::*}"
  zig fetch --global-cache-dir ./zig-global-cache "./${source[5]%%::*}"
  zig fetch --global-cache-dir ./zig-global-cache "./${source[6]%%::*}"
  zig fetch --global-cache-dir ./zig-global-cache "./${source[7]%%::*}"
  zig fetch --global-cache-dir ./zig-global-cache "./${source[8]%%::*}"
  zig fetch --global-cache-dir ./zig-global-cache "./${source[9]%%::*}"
}

check(){
  cd "$srcdir/$pkgname-$pkgver"
  zig build test \
      --summary all \
      --prefix /usr \
      --search-prefix /usr \
      --global-cache-dir "$srcdir"/zig-global-cache \
      --system "$srcdir"/zig-global-cache/p \
      --build-id=sha1 \
      -Dtarget=native-linux.6.6-gnu.2.40 \
      -Dcpu=baseline \
      -Doptimize=ReleaseSafe 
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="build" zig build \
    --summary all \
    --prefix /usr \
    --search-prefix /usr \
    --global-cache-dir "$srcdir"/zig-global-cache \
    --system "$srcdir"/zig-global-cache/p \
    --build-id=sha1 \
    -Dtarget=native-linux.6.6-gnu.2.40 \
    -Dcpu=baseline \
    -Doptimize=ReleaseSafe
 }

package(){
  cd "$srcdir/$pkgname-$pkgver"

  cp -r build/* "$pkgdir"
}
