# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Vincent Grande <shoober420@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=pango-git
pkgname=(pango-git pango-docs-git)
pkgver=1.50.8.r7.g4b5905aa
pkgrel=1
epoch=1
pkgdesc="A library for layout and rendering of text"
url="https://www.pango.org/"
arch=(x86_64)
license=(LGPL)
depends=(cairo libxft harfbuzz fribidi libthai)
makedepends=(gobject-introspection help2man git meson gi-docgen)
source=("git+https://gitlab.gnome.org/GNOME/pango.git")
sha256sums=('SKIP')

pkgver() {
  cd pango
  git describe --tags | sed 's/-/.r/;s/-/./g'
}

build() {
  arch-meson pango build -D gtk_doc=true
  meson compile -C build
}

#Not running checks according to official PKGBUILD
#check() {
#  meson test -C build --print-errorlogs
#}

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
