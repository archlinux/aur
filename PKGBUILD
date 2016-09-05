# Maintainer: 0strodamus <0strodamus at cox dot net>
# Contributor : Martin Wimpress <code@flexion.org>
#
# notes: if you want epub support, add 'mathjax' and 'webkitgtk2' to depends
#        and change --disable-epub to --enable-epub in build function

pkgname=atril-xfce
_pkgname=atril
_ver=1.15
pkgver=${_ver}.2
pkgrel=2
pkgdesc="MATE document viewer slimmed down for Xfce (GTK2 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dconf' 'dbus' 'desktop-file-utils' 'gtk2' 'libsecret' 'libsm' 'libspectre' 'poppler-glib' 'zlib')
makedepends=('djvulibre' 'gobject-introspection' 'libgxps' 'mate-common>=1.15.0' 'texlive-bin' 'yelp-tools')
optdepends=('djvulibre: DjVu support'
            'libgxps: XPS support'
            'texlive-bin: DVI support'
            'yelp: for reading help documents')
provides=('atril')
conflicts=('atril' 'atril-gtk3')
replaces=('atril')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgname}-${pkgver}.tar.xz"
        'atril-xfce.desktop')
sha1sums=('1792ef6fa8509c1f4a7ed08ceb57fffa434ee17e'
          'eb7bc2b54bcfff8df68f2a6a10e7aa16c85d3b59')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgname} \
        --with-gtk=2.0 \
        --enable-gtk-doc \
        --enable-djvu \
        --enable-dvi \
        --disable-epub \
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
