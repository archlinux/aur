# Maintainer: xiota / aur.chaotic.cx
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Kevin Majewski <kevin.majewski02@gmail.com>

_pkgname="sushi"
pkgname="$_pkgname-git"
pkgver=45.0.r3.gcd171b4
pkgrel=1
pkgdesc="A quick previewer for Nautilus"
url="https://gitlab.gnome.org/GNOME/sushi"
arch=(x86_64)
license=(GPL2)

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
  'gst-plugins-bad: Codecs for media support'
  'gst-plugins-good: Codecs for media support'
  'gst-plugins-ugly: Codecs for media support'
  'libreoffice: OpenDocument formats'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' 2>/dev/null \
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
  meson install -C build --destdir "${pkgdir:?}"
}
