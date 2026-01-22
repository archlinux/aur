# $Id$
# Maintainer: Emanuel Fernandes <efernandes@tektorque.com>
# Contributor: Mauro Fruet <maurofruet@gmail.com>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=evince-git
pkgver=48.alpha+185+g5c540656
pkgrel=1
pkgdesc="Document viewer (PDF, PostScript, XPS, djvu, dvi, tiff, cbr, cbz, cb7, cbt)"
url="http://projects.gnome.org/evince/"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  cairo
  dconf
  djvulibre
  exempi
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gnome-desktop-4
  gtk4
  hicolor-icon-theme
  libadwaita
  libarchive
  libgxps
  libsecret
  libspectre
  libsynctex
  libtiff
  pango
  poppler-glib
)
makedepends=(
  appstream-glib
  gi-docgen
  git
  glib2-devel
  gobject-introspection
  meson
  texlive-bin
  yelp-tools
)
optdepends=('texlive-bin: DVI support')
provides=(evince libev{document,view}4.so)
conflicts=(evince)
options=('!emptydirs')
source=($pkgname::"git+https://gitlab.gnome.org/GNOME/evince.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/-/+/g'
}

build() {
  local meson_options=(
    -D ps=enabled
  )

  # Work around kpathsea build failure with GCC 15
  CFLAGS+=" -DHAVE_STRING_H -DHAVE_STDLIB_H"

  arch-meson "$pkgname" build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
