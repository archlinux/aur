# Maintainer:
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Kevin Majewski <kevin.majewski02@gmail.com>

_pkgname="sushi"
pkgname="$_pkgname-git"
pkgver=46.0.r19.ga3955df
pkgrel=1
pkgdesc="A quick previewer for Nautilus"
url="https://gitlab.gnome.org/GNOME/sushi"
license=('GPL-2.0-or-later')
arch=('x86_64')

depends=(
  'evince'
  'gjs'
  'gst-plugins-base-libs'
  'gtksourceview4'
  'libsoup3'
  'webkit2gtk-4.1'
)
makedepends=(
  'git'
  'gobject-introspection'
  'meson'
)
optdepends=(
  'libreoffice: OpenDocument formats'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
