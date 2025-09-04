# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=gimp
pkgname=${_pkgname}-devel
pkgver=3.1.4
pkgrel=1
pkgdesc='GNU Image Manipulation Program (development release)'
url='https://www.gimp.org/'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
license=('GPL-3.0-or-later')
depends=(
  # Core deps
  'appstream-glib'
  'babl'
  'cairo'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'gdk-pixbuf2'
  'gegl'
  'glib2'
  'glibc'
  'gtk3'
  'harfbuzz'
  'hicolor-icon-theme'
  'iso-codes'
  'json-glib'
  'lcms2'
  'libgexiv2'
  'libmypaint'
  'libunwind'
  'mypaint-brushes'
  'pango'
  'python-gobject'
  'zlib'

  # Plugins deps
  'aalib'
  'bzip2'
  'libgudev'
  'libheif'
  'libjpeg-turbo'
  'libjxl'
  'libmng'
  'libpng'
  'librsvg'
  'libtiff'
  'libwebp'
  'libwmf'
  'libx11'
  'libxcursor'
  'libxext'
  'libxfixes'
  'libxmu'
  'libxpm'
  'openexr'
  'openjpeg2'
  'poppler-data'
  'poppler-glib'
  'xz'
)
makedepends=(
  'alsa-lib'
  'appstream'
  'cfitsio'
  'ghostscript'
  'gi-docgen'
  'git'
  'gjs'
  'glib2-devel'
  'gobject-introspection'
  'gtk-doc'
  'gvfs'
  'intltool'
  'libilbm'
  'luajit'
  'meson'
  'qoi'
  'vala'
)
optdepends=(
  'alsa-lib: for MIDI event controller module'
  'cfitsio: for FITS support'
  'ghostscript: for PostScript support'
  'gjs: for JavaScript scripting support'
  'gutenprint: for sophisticated printing only as gimp has built-in cups print support'
  'gvfs: for HTTP/S support (and many other schemes)'
  'libilbm: ILBM support'
  'luajit: LUA scripting support'
  'lua51-lgi: LUA scripting support'
)
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
source=("https://download.gimp.org/pub/gimp/v${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz"
        'linux.gpl'
)
sha256sums=('060df415a85bb18bfeca65dceb7377b191b47832f2b608a6fc433e08da2cbcb7'
            '1003bbf5fc292d0d63be44562f46506f7b2ca5729770da9d38d3bb2e8a2f36b3')

build() {
  local meson_options=(
    --buildtype=plain
    --prefix=/usr
    --sysconfdir=/etc
    --libexecdir=/usr/bin \
    -Dopenmp=enabled
    -Dcheck-update=no
    -Dbug-report-url='https://aur.archlinux.org/packages/gimp-devel'
    -Dopenexr=enabled
    -Dheadless-tests=disabled # enabled by default, depends on xorg-server-xvfb
    -Dlua=true
  )

  arch-meson ${_pkgname}-${pkgver} build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
