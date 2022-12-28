# Maintainer: Lex Black <autumn-wind@web.de>

_pkgname=labwc
pkgname=labwc-git
pkgver=0.6.0.r66.g63632cf
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox (git version)'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL2')
depends=('pango' 'seatd' 'wayland' 'xorg-xwayland')
makedepends=('git' 'meson' 'scdoc' 'wayland-protocols')
makedepends+=('vulkan-headers' 'xorgproto') # for latest compatible wlroots
optdepends=("bemenu: default launcher via Alt+F3")
conflicts=(labwc)
provides=(labwc)
source=("git+https://github.com/labwc/${_pkgname}.git")
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  meson subprojects download wlroots --sourcedir="$_pkgname"
}

build() {
  arch-meson -Dman-pages=enabled "$_pkgname" build --force-fallback-for=wlroots
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
