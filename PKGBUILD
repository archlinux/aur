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
pkgver=1.7.5.wayland1.r42.g5d4a3e14
pkgrel=1
pkgdesc='A window switcher, application launcher and dmenu replacement (fork with Wayland support)'
arch=('x86_64' 'aarch64')
url='https://github.com/lbonn/rofi'
license=(MIT)
depends=('check' 'librsvg' 'libxdg-basedir' 'libxkbcommon-x11' 'startup-notification'
         'wayland' 'xcb-util-cursor' 'xcb-util-wm' 'xcb-util-xrm')
makedepends=('git' 'meson' 'wayland-protocols')
optdepends=('i3-wm: use as a window switcher')
provides=('rofi')
conflicts=('rofi')
source=("$pkgname::git+$url.git#branch=wayland"
        "git+https://github.com/sardemff7/libgwater.git"
        "git+https://github.com/sardemff7/libnkutils.git")
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  git -C $pkgname describe --long | sed 's/\([^-]*-g\)/r\1/;s/[-+]/./g'
}

prepare() {
  git -C $pkgname submodule init
  git -C $pkgname config submodule.externals/vendor/libgwater.url "$srcdir/libgwater"
  git -C $pkgname config submodule.externals/vendor/libnkutils.url "$srcdir/libnkutils"
  git -C $pkgname -c protocol.file.allow=always submodule update
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

