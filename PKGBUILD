# Maintainer: Lex Black <autumn-wind@web.de>

_pkgname=labwc
pkgname=labwc-wlroots-018-git
pkgver=0.7.3.r0.g307f1991
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox (git version) (Highly experimental bleeding edge wlroots version)'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL2')
depends=('libpng' 'librsvg' 'pango' 'seatd' 'wayland' 'xorg-xwayland' 'libwlroots-0.18.so')
makedepends=('git' 'meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
conflicts=(labwc)
provides=(labwc)
source=("git+https://github.com/labwc/${_pkgname}.git"
        'https://github.com/labwc/labwc/pull/1641.patch'
        'labwc-atomic-modesetting-tearing.patch')
md5sums=('SKIP'
         '7c887bb6f2353015532eafab57f752c5'
         '3bd35a28d16413dc70f045eb673503d5')

prepare() {
  cd "$_pkgname"
  patch -Np1 -i "$srcdir/1641.patch"
  patch -Np1 -i "$srcdir/labwc-atomic-modesetting-tearing.patch"
}

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson -Dman-pages=enabled "$_pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
