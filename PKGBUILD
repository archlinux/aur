# Maintainer: Keon Cachia <keonfarrugia@gmail.com>

pkgname=kwm
pkgdesc="Kewuaa's window manager for the River compositor"
pkgver=0.3.0
_xkbver=0.3.0
_mvzrver=0.3.10
_clapver=0.11.0
_fcftver=2.0.0
_pixmanver=0.3.0
_zigwlver=0.6.0
pkgrel=1
arch=('x86_64')
url="https://github.com/kewuaa/kwm"
license=('GPL-3.0-only')
depends=('wayland'
	 'kwim' #AUR
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
	xkb-$_xkbver.tar.gz::https://github.com/ifreund/zig-xkbcommon/archive/refs/tags/v$_xkbver.tar.gz
	mvzr-$_mvzrver.tar.gz::https://github.com/mnemnion/mvzr/archive/refs/tags/v$_mvzrver.tar.gz
        fcft-$_fcftver.tar.gz::https://github.com/kewuaa/zig-fcft/archive/refs/tags/v$_fcftver.tar.gz
	pixman-$_pixmanver.tar.gz::https://github.com/ifreund/zig-pixman/archive/refs/tags/v$_pixmanver.tar.gz
	zigwl-$_zigwlver.tar.gz::https://github.com/ifreund/zig-wayland/archive/refs/tags/v$_zigwlver.tar.gz
)
sha256sums=('156d0df46bbe16296fb19b2f579f1690644eee0fb63d0159696892ff3ba14449'
            '492b670d9bddc596184b2ec46d06dbcafdfb9c4b6b6fa7ad9ba98a4d2f921d59'
            '6787c7e66ca68e259e032d3134cd4125d29b173460b5a47f2fb9379d2c5f1eec'
            'ea0993edc2eead34ebc5091fa19e380f4dd8ee95cfbf82027e69de6a0cda1b72'
            'b09b4d733430d3341c9fa340b13b84da058068764b9239452b5161c015ac3b08'
            'd9804e50f9fa549ad0aed751fbbb5fbc52110d57971b59ecab34ff11f08b0230')


check(){
  cd "$srcdir/$pkgname-$pkgver"
  zig build test \
      --summary all \
      --prefix /usr \
      --search-prefix /usr \
      --fork="$srcdir"/zig-xkbcommon-$_xkbver \
      --fork="$srcdir"/mvzr-$_mvzrver \
      --fork="$srcdir"/zig-fcft-$_fcftver \
      --fork="$srcdir"/zig-wayland-$_zigwlver \
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
    --fork="$srcdir"/zig-xkbcommon-$_xkbver \
    --fork="$srcdir"/mvzr-$_mvzrver \
    --fork="$srcdir"/zig-fcft-$_fcftver \
    --fork="$srcdir"/zig-wayland-$_zigwlver \
    --build-id=sha1 \
    -Dtarget=native-linux.6.6-gnu.2.40 \
    -Dcpu=baseline \
    -Doptimize=ReleaseSafe
 }

package(){
  cd "$srcdir/$pkgname-$pkgver"

  cp -r build/* "$pkgdir"
}
