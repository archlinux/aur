# Maintainer: su226 <thesu226 at outlook dot com>
# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=gimp
pkgname=${_pkgname}-devel-noconflict
_pkgver=3.0.0-RC3
pkgver=${_pkgver/-RC/rc}
pkgrel=1
pkgdesc="GNU Image Manipulation Program (Development version, doesn't conflict with gimp 2.0)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://www.gimp.org/"
license=('GPL' 'LGPL')
depends=(appstream-glib atk 'babl>=0.1.110' cairo fontconfig freetype2 gdk-pixbuf2 'gegl>=0.4.54' libgexiv2 glib2 glib-networking gtk3 gvfs harfbuzz json-glib libarchive bzip2 libjpeg xz libmypaint libpng poppler-glib librsvg libtiff lcms2 mypaint-brushes1 pango poppler-data python-gobject python zlib libxmu)
makedepends=(alsa-lib cfitsio iso-codes ghostscript aalib libheif libilbm libjxl libmng libwebp libwmf libxcursor libxpm openexr openjpeg2 qoi-headers vala meson gobject-introspection appstream glib2-devel)
# 'gutenprint: for sophisticated printing only as gimp has built-in cups print support' # GIMP 2.0 only
# 'graphviz: "Show Image Graph" in "File > Debug" menu' # Unstable branches only
optdepends=('alsa-lib: for MIDI event controller module'
            'cfitsio: FITS format support'
            'iso-codes: Language selection'
            'ghostscript: PostScript support'
            'aalib: ASCII art support'
            'libheif: HEIF support'
            'libilbm: Amiga ILBM support'
            'libjxl: JPEG XL support'
            'libmng: MNG support'
            'libwebp: WebP support'
            'libwmf: WMF support'
            'libxcursor: X11 cursor support'
            'libxpm: X11 pixmap support'
            'openexr: OpenEXR support'
            'openjpeg2: JPEG 2000 support'
            'darktable: Importing RAWs'
            'rawtherapee: Importing RAWs'
            'xdg-utils: Sending email with xdg-email'
            'gdb: Debugger'
            'lldb: Debugger'
            'gjs: JavaScript scripting support'
            'xdg-desktop-portal: Screenshot and color-picking on Wayland')
provides=("${_pkgname}=${pkgver}")
source=(https://download.gimp.org/pub/gimp/v${_pkgver%.*}/${_pkgname}-${_pkgver}.tar.xz
        linux.gpl)
sha256sums=('61fb527cf22d093a3f3501884796ababd3c30dd7f0e354dbdc041bef0f7e38ec'
            '1003bbf5fc292d0d63be44562f46506f7b2ca5729770da9d38d3bb2e8a2f36b3')

prepare() {
  cd "${_pkgname}-${_pkgver}"
}

build() {
  local meson_options=(
    -Dgi-docgen=disabled # enabled by default, depends on gi-docgen
    # -Dg-ir-doc=false # disabled by default, depends on yelp-tools
    -Dheadless-tests=disabled # enabled by default, depends on xorg-server-xvfb
    # -Dwebkit-unmaintained=true # disabled by default (unmaintained), depends on webkit2gtk (4.0)
    # -Dlua=true # disabled by default (experimental), depends on luajit and lua51-lgi
  )

  arch-meson "${_pkgname}-${_pkgver}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm 644 "${srcdir}/linux.gpl" "${pkgdir}/usr/share/gimp/3.0/palettes/Linux.gpl"
  mv "${pkgdir}/usr/share/icons/hicolor/16x16/apps/gimp.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/gimp-devel.png"
  mv "${pkgdir}/usr/share/icons/hicolor/22x22/apps/gimp.png" "${pkgdir}/usr/share/icons/hicolor/22x22/apps/gimp-devel.png"
  mv "${pkgdir}/usr/share/icons/hicolor/24x24/apps/gimp.png" "${pkgdir}/usr/share/icons/hicolor/24x24/apps/gimp-devel.png"
  mv "${pkgdir}/usr/share/icons/hicolor/32x32/apps/gimp.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/gimp-devel.png"
  mv "${pkgdir}/usr/share/icons/hicolor/48x48/apps/gimp.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/gimp-devel.png"
  mv "${pkgdir}/usr/share/icons/hicolor/64x64/apps/gimp.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/gimp-devel.png"
  mv "${pkgdir}/usr/share/icons/hicolor/256x256/apps/gimp.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/gimp-devel.png"
  mv "${pkgdir}/usr/share/icons/hicolor/scalable/apps/gimp.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/gimp-devel.svg"
  mv "${pkgdir}/usr/share/metainfo/org.gimp.GIMP.appdata.xml" "${pkgdir}/usr/share/metainfo/org.gimp.GIMP-devel.appdata.xml"
  sed -i 's/org.gimp.GIMP/org.gimp.GIMP-devel/g' "${pkgdir}/usr/share/metainfo/org.gimp.GIMP-devel.appdata.xml"
  sed -i 's/gimp.desktop/gimp-devel.desktop/g' "${pkgdir}/usr/share/metainfo/org.gimp.GIMP-devel.appdata.xml"
  mv "${pkgdir}/usr/share/applications/gimp.desktop" "${pkgdir}/usr/share/applications/gimp-devel.desktop"
  sed -i 's/^\(Name.*\)/\1 (devel)/g' "${pkgdir}/usr/share/applications/gimp-devel.desktop"
  sed -i 's/Icon=gimp/Icon=gimp-devel/g' "${pkgdir}/usr/share/applications/gimp-devel.desktop"
  rm "${pkgdir}/usr/share/man/man1/gimp-console.1"
  rm "${pkgdir}/usr/share/man/man1/gimp.1"
  rm "${pkgdir}/usr/share/man/man1/gimptool.1"
  rm "${pkgdir}/usr/share/man/man5/gimprc.5"
  rm "${pkgdir}/usr/bin/gimp"
  rm "${pkgdir}/usr/bin/gimp-console"
  rm "${pkgdir}/usr/bin/gimp-test-clipboard"
  rm "${pkgdir}/usr/bin/gimptool"
  rm "${pkgdir}/usr/lib/gimp-debug-tool"
}
