# Contributor: Slash <demodevil5 [AT] yahoo [DOT] com>

pkgname=gmameui
pkgver=0.2.12
pkgrel=3
pkgdesc='SDLMAME/XMAME frontend designed to look like MAME32 (fork of GXMAME)'
arch=('i686' 'x86_64')
url='http://gmameui.sourceforge.net/'
license=('GPL')
depends=('gnome-doc-utils' 'libarchive' 'libglade' 'vte')
makedepends=('intltool')
source=("http://sourceforge.net/projects/gmameui/files/gmameui/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('e1f36731b0007501cf4c169aaee2ccc8')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # archive_read_data_into_buffer() is deprecated in libarchive
    /bin/sed -i 's/archive_read_data_into_buffer/archive_read_data/' src/gmameui-zip-utils.c

    # replace individual glib headers with glib.h
    /bin/sed -i '34,36d' src/gmameui.c
    /bin/sed -i '33 a\#include <glib.h>' src/gmameui.c

    ./configure --prefix=/usr --disable-libgnome --enable-joystick --enable-debug
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    make DESTDIR="$pkgdir" install
}
