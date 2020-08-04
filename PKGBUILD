# Maintainer: tinywrkb <tinywrkb@gmail.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Maxim Baz <rofi at maximbaz dot com>
# Contributor: Anatol Pomozov
# Contributor: Benjamin Chrétien <chretien + aur [at] lirmm [dot] fr>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Rasi <rasi@xssn.at>
# Contributor: Sean Pringle <sean.pringle@gmail.com>
# Contributor: SanskritFritz (gmail)

_gitname=rofi
pkgname=rofi-lbonn-wayland-git
pkgver=1.3.1.r1315.g498fd2fc
pkgrel=1
pkgdesc='A window switcher, application launcher and dmenu replacement (Wayland fork)'
arch=(x86_64)
url="https://github.com/lbonn/$_gitname"
license=(MIT)
depends=(libxdg-basedir startup-notification libxkbcommon-x11 xcb-util-wm xcb-util-xrm librsvg wayland)
makedepends=(check git meson wayland-protocols)
optdepends=('i3-wm: use as a window switcher')
provides=(rofi)
conflicts=(rofi)
source=("${_gitname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_gitname
  git submodule update --init
}

build() {
  arch-meson \
    -Dwayland=enabled \
    -Dcheck=enabled \
    $_gitname build
  meson compile -C build
}

check() {
  LC_ALL=C meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  cd $_gitname
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -dm755 "$pkgdir/usr/share/doc/$_gitname/examples"
  install -Dm755 Examples/*.sh "$pkgdir/usr/share/doc/$_gitname/examples"
}
