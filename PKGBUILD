# Maintainer: Aditya Hebballe <adityahebballe@proton.me>

pkgname=material-gnome-manager-git
_pkgname=Material-Gnome-Manager
pkgver=0.1.0.r3.gaf457a6
pkgrel=1
pkgdesc='GTK4/Libadwaita manager for the Material GNOME theme'
arch=('any')
url='https://github.com/AdityaHebballe/Material-Gnome-Manager'
license=('MIT')

depends=(
  'git'
  'gtk4'
  'libadwaita'
  'python'
  'python-gobject'
)

makedepends=(
  'git'
  'meson'
)

optdepends=(
  'matugen: generate color palettes from wallpapers or images'
)

provides=('material-gnome-manager')
conflicts=('material-gnome-manager')

source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  local version revision commit
  version="$(sed -nE "s/.*version: '([^']+)'.*/\1/p" meson.build | head -n 1)"
  revision="$(git rev-list --count HEAD)"
  commit="$(git rev-parse --short HEAD)"

  printf '%s.r%s.g%s' "$version" "$revision" "$commit"
}

build() {
  arch-meson "$srcdir/$_pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
