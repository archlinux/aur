# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Vincent Grande <shoober420@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=pango-git
pkgname=(pango-git pango-docs-git)
pkgver=1.57.0.r9.g0f27f82b
pkgrel=1
epoch=1
pkgdesc="A library for layout and rendering of text"
url="https://www.pango.org/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  cairo
  fontconfig
  freetype2
  fribidi
  glib2
  glibc
  harfbuzz
  libsysprof-capture
  libthai
  libx11
  libxft
  libxrender
)
makedepends=(gobject-introspection help2man git meson gi-docgen glib2-devel python-docutils)
source=("git+https://gitlab.gnome.org/GNOME/pango.git")
sha256sums=('SKIP')

pkgver() {
  cd pango
  git describe --tags | sed 's/-/.r/;s/-/./g'
}

build() {
  local meson_options=(
    -D documentation=true
    -D man-pages=true
    -D sysprof=enabled
  )
  arch-meson pango build "${meson_options[@]}"
  meson compile -C build
}

# Not running checks according to official PKGBUILD

package_pango-git() {
  provides=(pango libpango{,cairo,ft2,xft}-1.0.so)
  conflicts=(pango)

  meson install -C build --destdir "$pkgdir"

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc
}

package_pango-docs-git() {
  pkgdesc+=" (documentation)"
  provides=(pango-docs)
  conflicts=(pango-docs)
  depends=()

  mv doc/* "$pkgdir"
}
