# Maintainer: willemw <willemw12@gmail.com>
# Contributor: tinywrkb <tinywrkb@gmail.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Maxim Baz <rofi at maximbaz dot com>
# Contributor: Anatol Pomozov
# Contributor: Benjamin Chrétien <chretien + aur [at] lirmm [dot] fr>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Rasi <rasi@xssn.at>
# Contributor: Sean Pringle <sean.pringle@gmail.com>
# Contributor: SanskritFritz (gmail)

pkgname=rofi-lbonn-wayland-git
pkgver=1.7.3.wayland1.r51.g1e8c22b4
pkgrel=1
pkgdesc='A window switcher, application launcher and dmenu replacement (fork with Wayland support)'
arch=('x86_64')
url='https://github.com/lbonn/rofi'
license=(MIT)
depends=('check' 'librsvg' 'libxdg-basedir' 'libxkbcommon-x11' 'startup-notification'
         'wayland' 'xcb-util-cursor' 'xcb-util-wm' 'xcb-util-xrm')
makedepends=('git' 'meson' 'wayland-protocols')
optdepends=('i3-wm: use as a window switcher')
provides=('rofi')
conflicts=('rofi')
source=("$pkgname::git+$url.git#branch=wayland")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long | sed 's/\([^-]*-g\)/r\1/;s/[-+]/./g'
}

prepare() {
  git -C $pkgname submodule update --init
}

build() {
  local meson_options=(-Dwayland=enabled -Dcheck=enabled)

  arch-meson $pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() {
  LC_ALL=C meson test -C build
}

package() {
  meson install -C build --destdir="$pkgdir"

  install -Dm644 $pkgname/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm755 $pkgname/Examples/*.sh -t "$pkgdir/usr/share/doc/rofi/examples/"
}

