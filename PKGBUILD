# Maintainer: Keon Cachia <keonfarrugia@gmail.com>

pkgname=rill-git
_pkgname=rill
pkgdesc="A minimalist scrolling window manager for River"
pkgver=0.7.0.r14.g262527e
pkgrel=1
arch=('x86_64' 'aarch64')
_zigwlver=0.7.0
_xkbver=1.13.2
_translate_cver=2.0.2
url="https://codeberg.org/lzj15/rill"
license=('MIT')
depends=('wayland' 'river' 'libxkbcommon')
makedepends=('zig'
	     'wayland-protocols'
	     'git')
install=rill.install
source=(git+$url.git
       	zig-wayland-$_zigwlver.tar.gz::https://github.com/ifreund/zig-wayland/archive/refs/tags/v$_zigwlver.tar.gz
	translate_c-$_translate_cver.tar.gz::https://codeberg.org/ziglang/translate-c/archive/$_translate_cver.tar.gz
       )
sha256sums=('SKIP'
            'cd94ef70ea67683be799aba3f9dc7df2a31ae77f6d192e04b5c1ac1569930c76'
            '0055bf8e96089eccb2bd231798d26526b8c99bb0f8c387282f711507b64813c8')

provides=("$_pkgname")
conflicts=("$_pkgname")
optdepends=('alacritty: Default terminal emulator'
	    'wireplumber: Default audio manager'
	    'awww: Default wallpaper manager'
	    'wl-clip-persist: Used in default configuration')


pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
  ls
  cd "$srcdir/$_pkgname"
  DESTDIR="build" zig build \
    --summary all \
    --prefix /usr \
    --search-prefix /usr \
    --build-id=sha1 \
    -Dtarget=native-linux.6.6-gnu.2.40 \
    -Dcpu=baseline \
    -Doptimize=ReleaseSafe \
    --fork="$srcdir/zig-wayland-${_zigwlver}" \
    --fork="$srcdir/translate-c"
}
package() {
  cd "$srcdir/$_pkgname"
  cp -a build/* "$pkgdir"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

# vim:set ts=2 sw=2 et:
