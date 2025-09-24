# Maintainer: Torben <git at letorbi dot com>
# Contributor:  Vincent Grande <shoober420 at gmail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens at gmail dot com>
# Contributor: Ionut Biru <ibiru at archlinux dot org>

pkgbase=gdk-pixbuf2-git
pkgname=(
  gdk-pixbuf2-git
  gdk-pixbuf2-docs-git
)
pkgver=2.44.2.r1.gbeb152174
pkgrel=1
pkgdesc="An image loading library"
url="https://wiki.gnome.org/Projects/GdkPixbuf"
arch=(x86_64)
license=(LGPL-2.0-or-later)
depends=(
  glib2
  glibc
  glycin
  shared-mime-info
)
makedepends=(
  gi-docgen
  git
  glib2-devel
  gobject-introspection
  meson
  python-docutils
)
source=(
  "git+https://gitlab.gnome.org/GNOME/gdk-pixbuf.git"
  gdk-pixbuf-query-loaders.hook
)
b2sums=('SKIP'
        '5a00d34888e207d70d02369015d029f4c0450fc5a02b4b257de8e5df04380dc550723f351433859224c96c3c6390896f2166673af65e8a09eb57024f5a34301b')

pkgver() {
  cd gdk-pixbuf
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd gdk-pixbuf
}

build() {
  local meson_options=(
    -D android=disabled
    -D builtin_loaders=all
    -D documentation=true
    -D gif=disabled
    -D glycin=enabled
    -D gtk_doc=true
    -D installed_tests=false
    -D introspection=enabled
    -D jpeg=disabled
    -D man=true
    -D others=enabled
    -D png=disabled
    -D thumbnailer=disabled
    -D tiff=disabled
  )

  arch-meson gdk-pixbuf build "${meson_options[@]}"
  meson compile -C build
}

#check() {
#  meson test -C build --print-errorlogs || :
#}

package_gdk-pixbuf2-git() {
  optdepends=(
    "libheif: Load .avif, .heic and .heif"
    "libopenraw: Load .arw, .cr2, .crw, .dng, .erf, .mrw, .nef, .orf, .pef and .raf"
    "libwmf: Load .apm and .wmf"
  )
  provides=(
    gdk-pixbuf2
    libgdk_pixbuf-2.0.so
  )
  conflicts=(gdk-pixbuf2)
  install=gdk-pixbuf2.install

  meson install -C build --destdir "$pkgdir"

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
}

package_gdk-pixbuf2-docs-git() {
  pkgdesc+=" (documentation)"
  depends=()
  provides=(gdk-pixbuf2-docs)
  conflicts=(gdk-pixbuf2-docs)

  mv doc/* "$pkgdir"
}

# vim:set ts=2 sw=2 et:
