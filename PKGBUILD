# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgbase=libkompass-git
pkgname=(libkompass-git kompass-git)
pkgver=r111.83e736f
pkgrel=1
pkgdesc="a gtk4 wayland desktop shell"
arch=(x86_64)
license=(GPL-3.0-only)
url="https://github.com/kotontrion/kompass"
depends=(
  gtk4
  gtk4-layer-shell
  glib2
  libadwaita
  libnm
  libnma-gtk4
  libastal-meta
  libportal
  slurp
  wf-recorder
)
makedepends=(
  meson
  blueprint-compiler
  dart-sass
  git
  gobject-introspection
  vala
)
source=("${pkgname}::git+https://github.com/kotontrion/kompass.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$pkgname"
  arch-meson build
  meson compile -C build
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
    done
}

package_libkompass-git() {

  provides+=(libkompass.so)
  pkgdesc="a library providing some useful widgets for building desktop shells"

  cd "$pkgname"
  meson install -C build --destdir "$pkgdir"
  
  cd "$pkgdir"

  _pick kompass usr/bin/kompass
}

package_kompass-git() {
  provides+=(kompass)
  depends+=(libkompass-git)
  mv kompass/* "$pkgdir"
}
