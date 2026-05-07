# Maintainer: Keon Cachia <keonfarrugia@gmail.com>

pkgname=rill-git
_pkgname=rill
pkgdesc="A minimalist scrolling window manager for River"
pkgver=b063485
pkgrel=1
arch=('x86_64' 'aarch64')
_zigwlver=0.6.0
_xkbver=0.4.0
url="https://codeberg.org/lzj15/rill"
license=('MIT')
depends=('wayland' 'river' 'libxkbcommon')
makedepends=('zig'
	     'wayland-protocols')
install=rill.install
source=(git+$url.git
       	zig-wayland-$_zigwlver.tar.gz::https://github.com/ifreund/zig-wayland/archive/ref/tags/v$_zigwlver.tar.gz
	zig-xkbcommon-$_xkbver.tar.gz::https://github.com/ifreund/zig-xkbcommon/archive/refs/tags/v$_xkbver.tar.gz
       )
sha256sums=('SKIP'
            '1235629f55dfb12aea85c8d5cf1b7138bdfb3262966e66a36260714a9a9ea0cd'
            'bff568b83a19630dc7cb27950e03337925d0d71b4fb0676bc6ebe2d31d1db032')

noextract=("${source[@]:1}")
provides=("$_pkgname")
conflicts=("$_pkgname")
optdepends=('alacritty: Default terminal emulator'
	    'wireplumber: Default audio manager'
	    'awww: Default wallpaper manager'
	    'wl-clip-persist: Used in default configuration')


pkgver() {
  cd "$srcdir/$_pkgname"
  printf "$(git rev-parse --short=7 HEAD)"
}
build() {
  cd "$srcdir/$_pkgname"
  DESTDIR="build" zig build \
    --summary all \
    --prefix /usr \
    --search-prefix /usr \
    --build-id=sha1 \
    -Dtarget=native-linux.6.6-gnu.2.40 \
    -Dcpu=baseline \
    -Doptimize=ReleaseSafe \
    --fork="$srcdir/zig-wayland-v${_zigwlver}" \
    --fork="$srcdir/zig-xkbcommon-${_xkbver}"

  # For some reason zig-wayland doesn't get renamed properly and has a v.
}
package() {
  cd "$srcdir/$_pkgname"
  cp -a build/* "$pkgdir"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

# vim:set ts=2 sw=2 et:
