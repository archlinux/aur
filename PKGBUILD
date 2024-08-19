# Maintainer:
# Contributor: Alexander Lutsai <s.lyra@ya.ru>

_pkgname="swaylock-fprintd"
pkgname="$_pkgname-git"
pkgver=r314.ffd639a
pkgrel=2
pkgdesc='Screen locker for Wayland with integrated fingerprint support via fprintd'
url='https://github.com/SL-RU/swaylock-fprintd'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('MIT')

depends=(
  'cairo'
  'dbus'
  'fprintd'
  'gdk-pixbuf2'
  'libxkbcommon'
  'pam'
  'wayland'
)
makedepends=(
  'git'
  'glib2-devel'
  'meson'
  'scdoc'
  'wayland-protocols'
)

provides=('swaylock')
conflicts=('swaylock')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgsrc"
  # Fix ticket FS#31544, sed line taken from gentoo
  sed -i -e 's:login:system-auth:g' "pam/swaylock"
}

build() {
  arch-meson build "$_pkgsrc"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "${pkgname%-git}/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
