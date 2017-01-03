# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Kazuo Teramoto <kaz.rag@gmail.com>

# Configure what to build. Use "yes" or "no".
_pdf="yes"        # PDF file support
_multimedia="no"  # Multimedia PDF support
_ps="no"          # PS file support
_djvu="no"        # DjVu file support
_dvi="no"         # DVI file support
_tiff="no"        # TIFF file support
_xps="no"         # XPS file support
_comics="no"      # CB[ZR7T] comics file support
_bookmarks="no"   # Bookmarks and annotations support
_previewer="no"   # GNOME Document Previewer support
_thumbnailer="no" # GNOME Thumbnailer support

_pkgname=evince
pkgname=${_pkgname}-light
pkgver=3.22.1
pkgrel=2
pkgdesc="GNOME document viewer, built with minimal dependencies by default but configurable."
url="https://wiki.gnome.org/Apps/Evince"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gnome-icon-theme' 'gtk3' 'libsm')

[[ "${_pdf}"        == "yes" ]] && depends+=('poppler-glib')
[[ "${_multimedia}" == "yes" ]] && depends+=('gst-plugins-base-libs')
[[ "${_ps}"         == "yes" ]] && depends+=('libspectre')
[[ "${_djvu}"       == "yes" ]] && depends+=('djvulibre')
[[ "${_dvi}"        == "yes" ]] && depends+=('texlive-bin')
[[ "${_xps}"        == "yes" ]] && depends+=('libgxps')
[[ "${_comics}"     == "yes" ]] && depends+=('libarchive')
[[ "${_bookmarks}"  == "yes" ]] && depends+=('gvfs')

makedepends=('itstool' 'intltool' 'python')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://download.gnome.org/sources/${_pkgname}/${pkgver:0:4}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('f3d439db3b5a5745d26175d615a71dffa1535235b1e3aa0b85d397ea33ab231c')

build() {
    cd ${_pkgname}-${pkgver}

    _build_cfg=''
    [[ "${_pdf}"         == "yes" ]] && _build_cfg+='--enable-pdf '         || _build_cfg+='--disable-pdf '
    [[ "${_multimedia}"  == "yes" ]] && _build_cfg+='--enable-multimedia '  || _build_cfg+='--disable-multimedia '
    [[ "${_ps}"          == "yes" ]] && _build_cfg+='--enable-ps '          || _build_cfg+='--disable-ps '
    [[ "${_djvu}"        == "yes" ]] && _build_cfg+='--enable-djvu '        || _build_cfg+='--disable-djvu '
    [[ "${_dvi}"         == "yes" ]] && _build_cfg+='--enable-dvi '         || _build_cfg+='--disable-dvi '
    [[ "${_xps}"         == "yes" ]] && _build_cfg+='--enable-xps '         || _build_cfg+='--disable-xps '
    [[ "${_comics}"      == "yes" ]] && _build_cfg+='--enable-comics '      || _build_cfg+='--disable-comics '
    [[ "${_tiff}"        == "yes" ]] && _build_cfg+='--enable-tiff '        || _build_cfg+='--disable-tiff '
    [[ "${_previewer}"   == "yes" ]] && _build_cfg+='--enable-previewer '   || _build_cfg+='--disable-previewer '
    [[ "${_thumbnailer}" == "yes" ]] && _build_cfg+='--enable-thumbnailer ' || _build_cfg+='--disable-thumbnailer '

    ./configure \
        --sysconfdir=/etc \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgname} \
        --localstatedir=/var \
        --with-platform=gnome \
        --disable-debug \
        --disable-maintainer-mode \
        --disable-schemas-compile \
        --enable-viewer \
        ${_build_cfg} \
        --enable-t1lib \
        --disable-nautilus \
        --disable-browser-plugin \
        --disable-gtk-doc \
        --disable-introspection \
        --enable-dbus \
        --without-keyring \
        --with-gtk-unix-print \
        --disable-libgnome-desktop
    make
}

package() {
    cd ${_pkgname}-${pkgver}

    make DESTDIR="${pkgdir}" install
}
