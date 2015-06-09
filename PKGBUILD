# Maintainer: Raphael Scholer <rascholer@gmail.com>
pkgname=vte3-glade-catalogue
pkgver=0.40.2
pkgrel=1
pkgdesc="Glade catalogue files for vte3"
arch=('i686' 'x86_64')
license=('LGPL')
options=('!emptydirs')
makedepends=('intltool' 'glade')
depends=('vte3')
url="http://www.gnome.org"
source=(http://download.gnome.org/sources/vte/${pkgver::4}/vte-$pkgver.tar.xz)
sha256sums=('9b68fbc16b27f2d79e6271f2b0708808594ac5acf979d0fccea118608199fd2d')

build() {
    cd "vte-$pkgver"
    ./configure --prefix=/usr --sysconfdir=/etc \
        --libexecdir=/usr/lib/vte \
        --localstatedir=/var --disable-static \
        --disable-introspection --disable-gnome-pty-helper \
        --disable-vala --disable-nls\
        --enable-glade-catalogue
    make -C glade
}

package(){
    cd "vte-$pkgver"
    make -C glade DESTDIR="$pkgdir" install

    # Fix naming of icons
    for size in 16 22; do
        cd "${pkgdir}/usr/share/glade/pixmaps/hicolor/${size}x${size}/actions"
        mv widget-vte-terminal.png widget-vte-2.91-terminal.png
    done
}
