# Maintainer: Sajeev Ramasamy <thorion3006 [at] gmail [dot] com>

pkgname=rofi-lbonn-wayland-only-git
pkgver=1.7.5.wayland1.r37.ge861df39
pkgrel=1
pkgdesc='A window switcher, application launcher and dmenu replacement with only wayland support'
arch=('x86_64')
url='https://github.com/lbonn/rofi'
license=(MIT)
depends=('pango' 'pangomm' 'cairomm' 'glibmm' 'gdk-pixbuf2' 'librsvg' 'libxdg-basedir' 'startup-notification' 'wayland')
makedepends=('git' 'meson' 'wayland-protocols' 'check')
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
  local meson_options=(-Dwayland=enabled -Dcheck=disabled -Dxcb=disabled)

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


