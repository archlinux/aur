# Maintainer: Carson Rueter <swurl at swurl dot xyz>
# Contributor: tinywrkb <tinywrkb@gmail.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Maxim Baz <rofi at maximbaz dot com>
# Contributor: Anatol Pomozov
# Contributor: Benjamin Chrétien <chretien + aur [at] lirmm [dot] fr>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Rasi <rasi@xssn.at>
# Contributor: Sean Pringle <sean.pringle@gmail.com>
# Contributor: SanskritFritz (gmail)

_gitname=rofi
pkgname=rofi-lbonn-wayland
pkgver=1.7.5+wayland1
_pkgver="${pkgver/_/-}"
pkgrel=1
pkgdesc='A window switcher, application launcher and dmenu replacement (Wayland fork)'
arch=(x86_64)
url="https://github.com/lbonn/$_gitname"
license=(MIT)
depends=(libxdg-basedir startup-notification libxkbcommon-x11 xcb-util-wm xcb-util-xrm librsvg wayland xcb-util-cursor)
makedepends=(check meson wayland-protocols git)
checkdepends=(ttf-font)
optdepends=('i3-wm: use as a window switcher')
provides=(rofi)
conflicts=(rofi)
source=("${_gitname}::git+${url}.git#branch=wayland")
sha256sums=('SKIP')

prepare() {
  cd $_gitname
  git checkout ${_pkgver}
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
