# Maintainer:
# Contributor: Timothy Gu <timothygu99@gmail.com>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>

## links
# https://fprint.freedesktop.org
# https://gitlab.freedesktop.org/libfprint/libfprint

## basic info
_pkgname="libfprint"
pkgname="$_pkgname-git"
pkgver=1.94.7.r29.g3f70bde
pkgrel=1
pkgdesc="Library for fingerprint readers"
url="https://gitlab.freedesktop.org/libfprint/libfprint"
license=('LGPL-2.1-or-later')
arch=('x86_64')

depends=(
  libgudev
  libgusb
  nss
  pixman
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  meson
)
checkdepends=(
  python
  python-cairo
  python-gobject
  umockdev
)

provides=(
  "$_pkgname=$pkgver"
  'libfprint-2.so'
)
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' --exclude='*_*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _meson_opts=(
    -Ddrivers=all
    -Dinstalled-tests=false
  )

  arch-meson "$_pkgsrc" build "${_meson_opts[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
