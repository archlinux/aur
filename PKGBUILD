# Maintainer: Qiu Wenbo <qiuwenbo@gnome.org>

pkgbase=papers
pkgname=(
  papers
  papers-lib-docs
)
pkgver=45.0+r484+g4d43a1c7
pkgrel=1
pkgdesc="Document viewer (PDF, PostScript, XPS, djvu, dvi, tiff, cbr, cbz, cb7, cbt)"
url="https://apps.gnome.org/Papers/"
arch=(x86_64)
license=(GPL)
depends=(
  dconf
  djvulibre
  gsettings-desktop-schemas
  gsfonts
  gst-plugins-base-libs
  gtk4
  gvfs
  libarchive
  libgxps
  libadwaita
  libsecret
  libspectre
  exempi
  poppler-glib
)
makedepends=(
  appstream-glib
  gi-docgen
  git
  gobject-introspection
  meson
  yelp-tools
  rust
  libnautilus-extension
)
source=("git+https://gitlab.gnome.org/GNOME/Incubator/papers.git#branch=main")
b2sums=('SKIP')

pkgver() {
  cd papers
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd papers
}
  
build() {
  local meson_options=(
    -D ps=enabled
  )

  arch-meson papers build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
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

package_papers() {
  provides=(libpps{document,view}-4.0.so)
  groups=(gnome)

  meson install -C build --destdir "$pkgdir"

  _pick lib-docs "$pkgdir"/usr/share/doc/lib*
}

package_papers-lib-docs() {
  pkgdesc+=" (library API documentation)"
  depends=()

  mv lib-docs/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:

