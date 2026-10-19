# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Igor Saric <karabaja4 at gmail dot com>

pkgbase=gdk-pixbuf2-noglycin
pkgname=(
  gdk-pixbuf2-noglycin
  gdk-pixbuf2-noglycin-docs
)
pkgver=2.44.8
pkgrel=1
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
)
b2sums=('d553cb0654965cb153cd38385d39d6edafc5b9890661a7fce14713d40f53129057c4ba81970774bd449029a52aa3b06033a22dc9cfe5c263eb87f35095251340'
        '4f355d2059b4ca21ea1c26d0ff8696206ee28cc06564bc5a3bbbff44b5146df2eb52bee91f02a1129b582db8e78bb5b6824ee4080d8df6a0aaf7b6db018caf31')

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
