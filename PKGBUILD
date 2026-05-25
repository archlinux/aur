pkgname=libsingularity-git
_pkgname=libsingularity

pkgver=0.1.0.r0.g0000000
pkgrel=1

pkgdesc="GTK4 application and widget framework for the Singularity Desktop Environment"
arch=('x86_64' 'aarch64')

url="https://github.com/singularityos-lab/libsingularity"
license=('LGPL-2.1-only')

depends=(
  'gtk4'
  'gtk4-layer-shell'
  'libgee'
  'json-glib'
  'libpeas-2'
  'libsoup3'
)

makedepends=(
  'git'
  'meson'
  'vala'
  'gobject-introspection'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

source=("git+https://github.com/singularityos-lab/libsingularity.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  local version
  version=$(grep -m1 -oP "version:\s*'\K[^']+" meson.build)

  printf "%s.r%s.g%s" \
    "$version" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson "$srcdir/$_pkgname" build

  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dm644 \
    "$srcdir/$_pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
