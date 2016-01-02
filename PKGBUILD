# Maintainer: 0strodamus <0strodamus at cox dot net>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=atril-xfce
_pkgname=atril
pkgver=1.12.2
_pkgver=1.12
pkgrel=1
pkgdesc="MATE document viewer slimmed down for Xfce (GTK2 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dconf' 'dbus' 'desktop-file-utils' 'gtk2' 'libsecret' 'libsm' 'libspectre' 'mathjax' 'poppler-glib' 'webkitgtk2' 'zlib')
makedepends=('djvulibre' 'gobject-introspection' 'libgxps' 'mate-common' 'texlive-bin' 'yelp-tools')
optdepends=('djvulibre: DjVu support'
            'libgxps: XPS support'
            'texlive-bin: DVI support'
            'yelp: for reading help documents')
provides=('atril')
conflicts=('atril' 'atril-gtk3')
replaces=('atril')
source=("http://pub.mate-desktop.org/releases/${_pkgver}/${_pkgname}-${pkgver}.tar.xz"
        "${pkgname}.desktop")
sha1sums=('c8d9ecf779f398439d67899e31722dd15d8b3b85'
          'eb7bc2b54bcfff8df68f2a6a10e7aa16c85d3b59')
install=atril.install

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgname} \
        --with-gtk=2.0 \
        --enable-gtk-doc \
        --enable-djvu \
        --enable-dvi \
        --enable-epub \
        --enable-t1lib \
        --enable-pixbuf \
        --enable-comics \
        --enable-xps \
        --enable-introspection \
        --disable-static \
        --disable-caja --disable-thumbnailer --disable-previewer \
        --without-smclient-backend --without-matedesktop
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install

    # add desktop file with StartupNotify=false and MATE specific settings removed
    rm "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm755 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
