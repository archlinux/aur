# Maintainer: Keon Cachia <keonfarrugia@gmail.com>

pkgname=kwm
pkgdesc="Kewuaa's window manager for the River compositor"
pkgver=0.2.1
_xkbver=0.3.0
_mvzrver=0.3.7
_fcftver=2.0.0
_pixmanver=0.3.0
pkgrel=2
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
source=("$url"/archive/refs/tags/v$pkgver.tar.gz
	xkb-$_xkbver.tar.gz::https://codeberg.org/ifreund/zig-xkbcommon/archive/v$_xkbver.tar.gz
	mvzr-$_mvzrver.tar.gz::https://github.com/mnemnion/mvzr/archive/refs/tags/v$_mvzrver.tar.gz
        fcft-$_fcftver.tar.gz::https://git.sr.ht/~novakane/zig-fcft/archive/v$_fcftver.tar.gz
	pixman-$_pixmanver.tar.gz::https://codeberg.org/ifreund/zig-pixman/archive/v$_pixmanver.tar.gz)
sha256sums=('72ba72eef4a6dd776bd05b4ccd61ce8606ce5ee0ee184ffdc199befa8737b71a'
            '1e185423e6b23ed9729614e66751ab7522db4487df4e0dcc7a2b06375aacda23'
            '9f9a28b2f6af44b004cd968fc639dbe6dc088355950a24614622f2ec462c851b'
            'bff418e0a888b9a4299d212769e31631f0f8d7cfd9daeded021ec1699ef0af5b'
            'cd7fe3415d4d58685a94fdedd308e9994a37f012828940cfb603461de7f2c6ad')
noextract=("${source[@]:1}")
# For whatever reason putting this in source breaks the package, so just let Zig handle it
_zigwl_source="git+https://codeberg.org/ifreund/zig-wayland?ref=main#f2480d25764a50ed2fe29f49e4209c074a557f46"


prepare() {
  zig fetch --global-cache-dir ./zig-global-cache "./${source[1]%%::*}"
  zig fetch --global-cache-dir ./zig-global-cache "./${source[2]%%::*}"
  zig fetch --global-cache-dir ./zig-global-cache "./${source[3]%%::*}"
  zig fetch --global-cache-dir ./zig-global-cache "./${source[4]%%::*}"

  # Get Zig Wayland
  zig fetch --global-cache-dir ./zig-global-cache "${_zigwl_source}"
}

check(){
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

package(){
  cd "$srcdir/$pkgname-$pkgver"

  cp -r build/* "$pkgdir"
}


