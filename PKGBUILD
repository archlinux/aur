# Maintainer: Nathan Sasser <fyrexdesign@outlook.com>

pkgname=labfyre-git
pkgver=0
pkgrel=1
pkgdesc="A wayland stacking and tiling compositor (Labwc fork)"
arch=('x86_64' 'aarch64')
url="https://github.com/FyreX-opensource-design/labFyre"
license=('GPL-2.0-only')
depends=(
  'wayland'
  'wayland-protocols'
  'libxkbcommon'
  'libdrm'
  'libxml2'
  'glib2'
  'cairo'
  'pango'
  'libinput'
  'pixman'
  'libpng'
  'librsvg'
)
makedepends=(
  'meson'
  'git'
  'scdoc'
  'wayland-protocols'
  'xcb-util-wm'
  'xcb-util-keysyms'
)
optdepends=(
  'xorg-xwayland: X11 application support'
)
# wlroots and libsfdo are handled as meson subprojects
source=("git+https://github.com/FyreX-opensource-design/labFyre.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/labFyre" || cd "$srcdir"/*/
  git describe --tags --long 2>/dev/null | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g' || echo "0.0.0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/labFyre" || cd "$srcdir"/*/
  arch-meson build/ \
    --prefix=/usr \
    --mandir=/usr/share/man
  meson compile -C build/
}

package() {
  cd "$srcdir/labFyre" || cd "$srcdir"/*/
  DESTDIR="$pkgdir" meson install -C build/
}

