# Maintainer: Donald Carr <d@chaos-reins.com>

_pkgname="reterminatevt"
pkgname="$_pkgname-git"
pkgver=1.2026.06.02.r0.g53f14df
pkgrel=1
pkgdesc="https://www.reddit.com/r/linux/comments/1srbr7m/config_vtn_in_2026/"
url='https://gitlab.freedesktop.org/n3rdopolis/reterminatevt'
license=('GPL2')
arch=('x86_64')

depends=(
  'cage'
  'kanshi'
  'foot'
  'foot-terminfo'
)

makedepends=(
  'cmake'
  'git'
  'meson'
)

provides=("$_pkgname=${pkgver%.g*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  arch-meson "${_meson_args[@]}" "$_pkgsrc" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs --no-rebuild --suite reterminatevt
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$_pkgsrc/COPYING.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
