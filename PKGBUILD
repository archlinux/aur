# Maintainer:
# Contributor: jaxer (contact via AUR messaging)

## links
# https://fprint.freedesktop.org
# https://gitlab.freedesktop.org/libfprint/libfprint

## basic info
_pkgname="libfprint"
pkgname="${_pkgname}-spectre2024-patched-git"
pkgver=1.94.8.r4.g09ec6e6
pkgrel=1
pkgdesc="Library for fingerprint readers patched for HP Spectre 2024"
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
source=("$_pkgsrc"::"git+$url.git"
	"hp_spectre_x360_14_eu0_fingerprint.patch")
sha256sums=('SKIP'
	'ba7454c3dfdbd3239a3da7f30c290e63b1a3b7a2b00dde2a98b44c3a8c000d0e')

prepare() {
  cd "${_pkgsrc}"
  patch -p1 < "${srcdir}/hp_spectre_x360_14_eu0_fingerprint.patch"
}

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


package() {
  DESTDIR="$pkgdir" meson install -C build
}

