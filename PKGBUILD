# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Igor Saric <karabaja4 at gmail dot com>

pkgbase=gdk-pixbuf2-noglycin
pkgname=(
  gdk-pixbuf2-noglycin
  gdk-pixbuf2-noglycin-docs
)
pkgver=2.44.6
pkgrel=2
pkgdesc="An image loading library, without glycin"
url="https://gitlab.gnome.org/GNOME/gdk-pixbuf"
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
  fix-xpm.diff
)
b2sums=('e24fa06f587e81a4b5f5a265a1e449ab0c8d0ae75296cba1bfb8359ae72e3148b16c8b94767ae4ab20dd4017559e18133e43084a63557fa2af7f9deafec6cc28'
        '5a00d34888e207d70d02369015d029f4c0450fc5a02b4b257de8e5df04380dc550723f351433859224c96c3c6390896f2166673af65e8a09eb57024f5a34301b'
        '191e30637ce99e32a95905c1640bd5c3f53f58a9c14ac06220108612fa9eb5107948af98c94eccd769e025493c3845d34744f87f303b7dd8d1990e52b81d5c1a')

prepare() {
  cd gdk-pixbuf
  patch -p1 -i ../fix-xpm.diff
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
    -D thumbnailer=enabled
    -D tiff=enabled
    -D legacy_xpm=enabled
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
