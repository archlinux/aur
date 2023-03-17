# Maintainer: su226 <thesu226 at outlook dot com>
# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=gimp
pkgname=${_pkgname}-devel-noconflict
pkgver=2.99.14
pkgrel=2
pkgdesc="GNU Image Manipulation Program (Development version, doesn't conflict with gimp 2.0)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://www.gimp.org/"
license=('GPL' 'LGPL')
depends=('gtk3' 'lcms2' 'libwmf' 'icu' 'enchant' 'libgexiv2' 'librsvg' 'desktop-file-utils'
         'libexif' 'libgudev' 'openjpeg2' 'poppler-glib' 'poppler-data' 'openexr' 'mypaint-brushes1'
         'babl>=0.1.78' 'gegl>=0.4.36' 'cairo' 'python-gobject' 'appstream-glib' 'libxmu' 'graphviz')
makedepends=('appstream' 'intltool' 'libxslt' 'glib-networking'
             'alsa-lib' 'curl' 'ghostscript' 'libxpm'
             'libheif' 'libwebp' 'libmng' 'iso-codes' 'aalib' 'zlib' 'libjxl'
             'gjs'  'luajit' 'meson' 'gobject-introspection'
             'gi-docgen' 'xorg-server-xvfb' 'vala' 'highway' 'yelp-tools')
checkdepends=('xorg-server-xvfb')
optdepends=('gutenprint: for sophisticated printing only as gimp has built-in cups print support'
            'alsa-lib: for MIDI event controller module'
            'curl: for URI support'
            'ghostscript: for postscript support'
            'libxpm: XPM support'
            'libheif: HEIF support'
            'libjxl: JPEG XL support'
            'libwebp: WebP support'
            'libmng: MNG support'
            'iso-codes: Language support'
            'aalib: ASCII art support'
            'zlib: Compression routines'
            'gjs: JavaScript scripting support'
            'luajit: LUA scripting support'
            'lua51-lgi: LUA scripting support')
provides=("${_pkgname}=${pkgver}")
source=(https://download.gimp.org/pub/gimp/v${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz
        linux.gpl
        babl-0.1-name-change-meson.patch::https://gitlab.gnome.org/GNOME/gimp/-/commit/04a78154e1af5e30dcedde6dbaa321be3f0e24b1.patch)
sha256sums=('313a205475d1ff03c5c4d9602f09f5c975ba6c1c79d8843e2396f9fe2abdf7a8'
            '1003bbf5fc292d0d63be44562f46506f7b2ca5729770da9d38d3bb2e8a2f36b3'
            'e012d022fe53eaf4cd2fc08f07cb0377fb14c8f791e42d13027983e41f7f4fc2')

prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 -i ../babl-0.1-name-change-meson.patch
}

build() {
  arch-meson "${_pkgname}-${pkgver}" build \
    -Dgi-docgen=enabled \
    -Dg-ir-doc=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm 644 "${srcdir}/linux.gpl" "${pkgdir}/usr/share/gimp/2.99/palettes/Linux.gpl"
  mv "${pkgdir}/usr/share/icons/hicolor/16x16/apps/gimp.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/gimp-2.99.png"
  mv "${pkgdir}/usr/share/icons/hicolor/22x22/apps/gimp.png" "${pkgdir}/usr/share/icons/hicolor/22x22/apps/gimp-2.99.png"
  mv "${pkgdir}/usr/share/icons/hicolor/24x24/apps/gimp.png" "${pkgdir}/usr/share/icons/hicolor/24x24/apps/gimp-2.99.png"
  mv "${pkgdir}/usr/share/icons/hicolor/32x32/apps/gimp.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/gimp-2.99.png"
  mv "${pkgdir}/usr/share/icons/hicolor/48x48/apps/gimp.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/gimp-2.99.png"
  mv "${pkgdir}/usr/share/icons/hicolor/64x64/apps/gimp.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/gimp-2.99.png"
  mv "${pkgdir}/usr/share/icons/hicolor/256x256/apps/gimp.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/gimp-2.99.png"
  mv "${pkgdir}/usr/share/icons/hicolor/scalable/apps/gimp.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/gimp-2.99.svg"
  mv "${pkgdir}/usr/share/metainfo/org.gimp.GIMP.appdata.xml" "${pkgdir}/usr/share/metainfo/org.gimp.GIMP-2.99.appdata.xml"
  sed -i 's/org.gimp.GIMP/org.gimp.GIMP-2.99/g' "${pkgdir}/usr/share/metainfo/org.gimp.GIMP-2.99.appdata.xml"
  sed -i 's/gimp.desktop/gimp-2.99.desktop/g' "${pkgdir}/usr/share/metainfo/org.gimp.GIMP-2.99.appdata.xml"
  mv "${pkgdir}/usr/share/applications/gimp.desktop" "${pkgdir}/usr/share/applications/gimp-2.99.desktop"
  sed -i 's/^\(Name.*\)/\1 (devel)/g' "${pkgdir}/usr/share/applications/gimp-2.99.desktop"
  sed -i 's/Icon=gimp/Icon=gimp-2.99/g' "${pkgdir}/usr/share/applications/gimp-2.99.desktop"
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
