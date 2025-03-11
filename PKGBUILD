# Maintainer: a821
# Contributor:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Brice Carpentier <brice@daknet.org>

pkgbase=cairo-git
pkgname=(cairo-git cairo-docs-git)
pkgver=1.18.4.r2.gc1bc9cd32
pkgrel=1
pkgdesc="2D graphics library with support for multiple output devices"
url="https://cairographics.org/"
arch=(x86_64)
license=('LGPL-2.1-only OR MPL-1.1')
depends=(
  bash
  fontconfig
  freetype2
  glib2
  glibc
  libpng
  libx11
  libxcb
  libxext
  libxrender
  lzo
  pixman
  zlib
)
makedepends=(
  git
  gtk-doc
  meson
  valgrind
)
source=("git+https://gitlab.freedesktop.org/cairo/cairo.git")
sha256sums=('SKIP')

pkgver() {
  cd cairo
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/./g'
}

build() {
  local meson_options=(
    -D dwrite=disabled
    -D gtk_doc=true
    -D spectre=disabled
    -D symbol-lookup=disabled
    -D tests=disabled
  )

  arch-meson cairo build "${meson_options[@]}"
  meson compile -C build
}

package_cairo-git() {
  provides=(
    libcairo-gobject.so
    libcairo-script-interpreter.so
    libcairo.so
  )
  provides+=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")
  options+=(!emptydirs)

  meson install -C build --destdir "$pkgdir"

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/gtk-doc
}

package_cairo-docs-git() {
  pkgdesc+=" (documentation)"
  depends=()
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  mv doc/* "$pkgdir"
}
