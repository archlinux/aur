# Maintainer: José Augusto ( a.k.a starlord ) <joseaugusto.881@outlook.com>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
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
_previewer="no"   # GNOME Document Previewer support
_thumbnailer="no" # GNOME Thumbnailer support
_nautilus="no"    # GNOME Files support

_pkgname=evince
pkgname=${_pkgname}-light
pkgver=3.36.6
pkgrel=1
pkgdesc="GNOME document viewer, built with minimal dependencies by default but configurable."
url="https://wiki.gnome.org/Apps/Evince"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk3' 'libsm' 'gspell')

[[ "${_pdf}"        == "yes" ]] && depends+=('poppler-glib')
[[ "${_multimedia}" == "yes" ]] && depends+=('gst-plugins-base-libs')
[[ "${_ps}"         == "yes" ]] && depends+=('libspectre')
[[ "${_djvu}"       == "yes" ]] && depends+=('djvulibre')
[[ "${_dvi}"        == "yes" ]] && depends+=('texlive-bin')
[[ "${_xps}"        == "yes" ]] && depends+=('libgxps')
[[ "${_comics}"     == "yes" ]] && depends+=('libarchive')
[[ "${_nautilus}"   == "yes" ]] && depends+=('libnautilus-extension')

makedepends=('itstool' 'intltool' 'python' 'gobject-introspection' 'gtk-doc' 'appstream-glib')

[[ "${_nautilus}"   == "yes" ]] && makedepends+=('libnautilus-extension' 'gnome-common')

optdepends=('gvfs: bookmark support and session saving')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://ftp.gnome.org/pub/GNOME/sources/${_pkgname}/${pkgver:0:4}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('95ce9b21c6fc7c837e12eb6e88777ea80dcc2ce6d84d000166a24a113a6d8db0')

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
    [[ "${_nautilus}"    == "yes" ]] && _build_cfg+='--enable-nautilus '    || _build_cfg+='--disable-nautilus '

    ./configure \
        --sysconfdir=/etc \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgname} \
        --localstatedir=/var \
        --with-platform=gnome \
        --disable-static \
        --disable-debug \
        --disable-maintainer-mode \
        --disable-schemas-compile \
        --disable-libgnome-desktop \
        --enable-dbus \
        --enable-gtk-doc \
        --enable-introspection \
        --enable-viewer \
        ${_build_cfg} \
        --enable-t1lib \
        --disable-browser-plugin \
        --without-keyring \
        --with-gtk-unix-print
    make
}

package() {
    cd ${_pkgname}-${pkgver}

    make DESTDIR="${pkgdir}" install
}
