# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Martin Wimpress <code@flexion.org>

_ver=1.16
_pkgbase=atril
pkgname=(${_pkgbase}-gtk2)
pkgver=${_ver}.1
pkgrel=5
pkgdesc="MATE document viewer (GTK2 version)"
url="https://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('djvulibre' 'libspectre' 'libgxps' 'mathjax' 'poppler-glib')
makedepends=('caja-gtk2' 'gobject-introspection' 'intltool' 'itstool' 'texlive-bin')
optdepends=('caja: Document Properties extension'
            'texlive-bin: DVI support'
            'webkitgtk2: ePub support (not recommended)')
groups=('mate-extra-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
source=("https://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('7a05ec3e856335ce6a49a97f545ab401d9221f6e')

prepare() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"

    # Fix mathjax path
    sed -i 's|/usr/share/javascript/mathjax|/usr/share/mathjax|' backend/epub/epub-document.c
}

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgbase} \
        --with-gtk=2.0 \
        --enable-djvu \
        --enable-dvi \
        --enable-epub \
        --enable-t1lib \
        --enable-pixbuf \
        --enable-comics \
        --enable-xps \
        --enable-introspection

    #https://bugzilla.gnome.org/show_bug.cgi?id=656231
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
