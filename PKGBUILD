# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Igor Saric <karabaja4 at gmail dot com>

pkgbase=gdk-pixbuf2-noglycin
pkgname=(
  gdk-pixbuf2-noglycin
  gdk-pixbuf2-noglycin-docs
)
pkgver=2.44.4
pkgrel=1
pkgdesc="An image loading library, without glycin"
url="https://wiki.gnome.org/Projects/GdkPixbuf"
arch=(x86_64)
license=(LGPL-2.0-or-later)
depends=(
  glib2
  glibc
  libjpeg-turbo
  libpng
  libtiff
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
  "git+https://gitlab.gnome.org/GNOME/gdk-pixbuf.git#tag=$pkgver"
  gdk-pixbuf-query-loaders.hook
)
b2sums=('c25b8070b944aaa3c27301dce8a991b8525a764c32e5ec673933de611ce7acb4f7963405ac715e5deb7a547b22352676fa024f77dd4a9e1cb821495f61f4cb26'
        '5a00d34888e207d70d02369015d029f4c0450fc5a02b4b257de8e5df04380dc550723f351433859224c96c3c6390896f2166673af65e8a09eb57024f5a34301b')

prepare() {
  cd gdk-pixbuf
}

build() {
  local meson_options=(
    -D android=disabled
    -D builtin_loaders=all
    -D documentation=true
    -D gif=enabled
    -D glycin=disabled
    -D gtk_doc=true
    -D installed_tests=false
    -D introspection=enabled
    -D jpeg=enabled
    -D man=true
    -D others=enabled
    -D png=enabled
    -D thumbnailer=disabled
    -D tiff=enabled
  )

  arch-meson gdk-pixbuf build "${meson_options[@]}"
  meson compile -C build
}

package_gdk-pixbuf2-noglycin() {
  optdepends=(
    "libheif: Load .avif, .heic and .heif"
    "libjxl: Load .jxl"
    "libopenraw: Load .arw, .cr2, .crw, .dng, .erf, .mrw, .nef, .orf, .pef and .raf"
    "librsvg: Load .svg, .svgz and .svg.gz"
    "libwmf: Load .apm and .wmf"
    "webp-pixbuf-loader: Load .webp"
  )
  provides=(
    libgdk_pixbuf-2.0.so
    gdk-pixbuf2
  )
  conflicts=(
    gdk-pixbuf2
  )
  install=gdk-pixbuf2-noglycin.install

  meson install -C build --destdir "$pkgdir"

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
}

package_gdk-pixbuf2-noglycin-docs() {
  pkgdesc+=" (documentation)"
  depends=()
  provides=(
    gdk-pixbuf2-docs
  )
  conflicts=(
    gdk-pixbuf2-docs
  )

  mv doc/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
