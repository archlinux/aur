# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Maks Verver <maksverver@geocities.com>
# Contributor: p2k <Patrick.Schneider@uni-ulm.de>
# Contributor: nokangaroo <nokangaroo@aon.at>

pkgname=golly
pkgver=2.8
pkgrel=1
_wxver=3.0.2
pkgdesc="A simulator for Conway's Game of Life and other cellular automata"
arch=('i686' 'x86_64')
url="http://golly.sourceforge.net/"
license=('GPL')
makedepends=('gendesk' 'perl' 'python2')
optdepends=('perl: for Perl scripting support'
            'python2: for Python scripting support')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}-src.tar.gz"
        "https://downloads.sourceforge.net/wxwindows/wxWidgets-${_wxver}.tar.bz2"
        'make-abicheck-non-fatal.patch'
        'wxgtk-gcc6.patch'
        'gst1.0.patch')
sha1sums=('6c41ae2bfd762bb39d556eb7c342412cbb7f9787'
          '6461eab4428c0a8b9e41781b8787510484dea800'
          'dfe38650c655395b90bf082b5734c4093508bfa3'
          '498202334c69d49c1ebbc9d36ad382cfa237f3f8'
          '8702e148ac8a49cc334f19acf19af9bb2c975952')
prepare() {
    cd ${srcdir}
    tar jxf ../wxWidgets-${_wxver}.tar.bz2
    cd ${srcdir}/wxWidgets-${_wxver}

    patch -Np1 -i ../make-abicheck-non-fatal.patch
    patch -p1 -i ../wxgtk-gcc6.patch
    patch -Np1 -i ../gst1.0.patch
}

build() {
    mkdir -p ${srcdir}/wxWidgets-${_wxver}/build-gtk
    cd ${srcdir}/wxWidgets-${_wxver}/build-gtk
    ../configure --with-gtk --disable-shared --enable-unicode --with-opengl
    make

    cd "${srcdir}/${pkgname}-${pkgver}-src"

    gui-wx/configure/configure \
        --with-perl-shlib=/usr/lib/perl5/core_perl/CORE/libperl.so \
        --with-python-shlib=libpython2.7.so \
        --prefix=/usr --with-wxdir=${srcdir}/wxWidgets-${_wxver}/build-gtk

    make

    gendesk -n "$startdir"/PKGBUILD
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-src"

    make DESTDIR="$pkgdir" install

    install -D -m644 "${pkgname}.desktop" \
        "$pkgdir"/usr/share/applications/"${pkgname}.desktop"
    install -D -m644 gui-wx/icons/appicon.xpm \
        "$pkgdir"/usr/share/pixmaps/"${pkgname}.xpm"
}
