# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=gimp
pkgname=${_pkgname}-devel
pkgver=3.0.0rc1
pkgrel=1
pkgdesc="GNU Image Manipulation Program (Development version)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://www.gimp.org/"
license=('GPL-3.0-or-later')
depends=('appstream-glib' 'babl>=0.1.110' 'cairo' 'desktop-file-utils' 'enchant'
         'gegl>=0.4.50' 'graphviz' 'gtk3' 'icu' 'lcms2' 'libexif' 'libgexiv2'
         'libgudev' 'librsvg' 'libwmf' 'libxmu' 'mypaint-brushes1' 'openexr'
         'openjpeg2' 'poppler-data' 'poppler-glib' 'python-gobject')
makedepends=('aalib' 'alsa-lib' 'appstream' 'cfitsio' 'curl' 'ghostscript'
             'gi-docgen' 'gjs' 'glib2-devel' 'glib-networking' 'gobject-introspection'
             'highway' 'intltool' 'iso-codes' 'libheif' 'libilbm' 'libjxl'
             'libmng' 'libwebp' 'libxpm' 'libxslt' 'luajit' 'meson' 'qoi-headers'
             'vala' 'zlib')
             # 'xorg-server-xvfb' # needed for -Dheadless-tests=enabled
             # 'yelp-tools' # needed for -Dg-ir-doc=true
optdepends=('aalib: ASCII art support'
            'alsa-lib: for MIDI event controller module'
            'cfitsio: FITS support'
            'curl: for URI support'
            'gjs: JavaScript scripting support'
            'ghostscript: for postscript support'
            'iso-codes: Language support'
            'libheif: HEIF support'
            'libilbm: ILBM support'
            'libjxl: JPEG XL support'
            'libmng: MNG support'
            'libwebp: WebP support'
            'libxpm: XPM support'
            'lua51-lgi: LUA scripting support'
            'luajit: LUA scripting support'
            'qoi-headers: QOI image support'
            'zlib: Compression routines')
# 'gutenprint: for sophisticated printing only as gimp has built-in cups print support' # GIMP 2.0 only
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
source=("https://download.gimp.org/pub/gimp/v${pkgver%.*}/${_pkgname}-${pkgver/rc/-RC}.tar.xz"
        'linux.gpl')
sha256sums=('b3d0b264c5e38e789faaf3417003397f3240014c59c7f417f9ca3bd39c5ffb66'
            '1003bbf5fc292d0d63be44562f46506f7b2ca5729770da9d38d3bb2e8a2f36b3')

build() {
  local meson_options=(
    # -Dg-ir-doc=false # disabled by default, depends on yelp-tools -- was causing build errors on 3.0 RC1
    -Dheadless-tests=disabled # enabled by default, depends on xorg-server-xvfb
    -Dlua=true # disabled by default for release (flagged as experimental)
  )

  arch-meson "${_pkgname}-${pkgver/rc/-RC}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"

  install -Dm 644 "${srcdir}"/linux.gpl "${pkgdir}/usr/share/gimp/${pkgver%.*}/palettes/Linux.gpl"
}
