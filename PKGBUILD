# Maintainer: Lex Black <autumn-wind@web.de>

_pkgname=labwc
pkgname=labwc-hdr-metadata-git
pkgver=0.20.0.r1.g579e5329
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox (HDR metadata test)'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL-2.0-only')
depends=('libpng' 'librsvg' 'libsfdo' 'pango' 'seatd' 'ttf-font' 'wlroots-hidpi-xprop-hdr-metadata-git' 'wayland')
makedepends=('git' 'meson' 'scdoc' 'wayland-protocols' 'xorg-xwayland')
optdepends=("bemenu: default launcher via Alt+F3"
            "xorg-xwayland: X11 support")
conflicts=(labwc-git labwc)
provides=(labwc-git labwc)
source=("git+https://github.com/labwc/${_pkgname}.git"
        'labwc-format-check.patch'
        'labwc-wlroots021.patch')
md5sums=('SKIP'
         'd632d08efedc7edf4ad2967f0030c5c6'
         '3307da7662ace4b73aa2dbd545b5422c')


pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  patch -Np1 -i ../labwc-format-check.patch
  patch -Np1 -i ../labwc-wlroots021.patch
}

build() {
  arch-meson -Dman-pages=enabled "$_pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
