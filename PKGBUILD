# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: Lex Black <autumn-wind@web.de>

_pkgname=labwc
pkgname=labwc-wlroots-018-git
pkgver=0.7.2.r51.gd00711bc
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox (git version) (Highly experimental bleeding edge wlroots version)'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL2')
depends=('libpng' 'librsvg' 'pango' 'seatd' 'wlroots-git' 'wayland' 'xorg-xwayland')
makedepends=('git' 'meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
conflicts=(labwc)
provides=(labwc)
source=("git+https://github.com/labwc/${_pkgname}.git"
        '1641.patch'
        'wlroots-0.18.patch')
md5sums=('SKIP'
         'af5bd9abff47c2b9bbcb8d756eb1f8f7'
         'fc09b9336adb1b709cceba71a56b6020')

prepare() {
  cd "$_pkgname"
  patch -Np1 -i "${srcdir}/1641.patch"
  patch -Np1 -i "${srcdir}/wlroots-0.18.patch"
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
