# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgbase=xwayland-run
pkgver=0.0.4
pkgrel=1
pkgdesc="Set of small utilities revolving around running Xwayland"
pkgname=($pkgbase $pkgbase-cage $pkgbase-gnome-kiosk $pkgbase-kwin $pkgbase-mutter)
arch=(any)
url="https://gitlab.freedesktop.org/ofourdan/$pkgbase"
license=(GPL-2.0-or-later)
depends=(
  python
  xorg-xauth
)
makedepends=(
  meson
)
optdepends=(
  'xorg-xwayland: X11 server'
)
options=(!debug)
source=($url/-/archive/$pkgver/$pkgbase-$pkgver.tar.gz)
b2sums=('31eae9fbb1a4f8ce112400ccd2e00e28fa78cb880949ac9b291998dddbe1caeb4eb97dec249189ea6b6ba2cb9e87d9687766815bcba5a2cd4f4ea0fca8b27ca2')

_build_and_install() {
  arch-meson $pkgbase-$pkgver $1 -Dcompositor=$1
  meson configure  $1 --no-pager
  meson compile -C $1
  meson install -C $1 --destdir "$pkgdir"
}

for _p in "${pkgname[@]}"; do
  _waycom=$([[ "$_p" == "$pkgbase" ]] && echo "weston" || echo "${_p#$pkgbase-}")
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    pkgdesc+=\" (${_waycom^})\"
    optdepends+=(\"$_waycom: Wayland compositor\")
    _build_and_install $_waycom
  }"
done
