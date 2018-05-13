# Contributor: Slash <demodevil5 [AT] yahoo [DOT] com>

pkgname=gmameui
pkgver=r279.ea144d7
pkgrel=1
pkgdesc='SDLMAME/XMAME frontend designed to look like MAME32 (fork of GXMAME)'
arch=('i686' 'x86_64')
url='http://gmameui.sourceforge.net/'
license=('GPL')
depends=('gnome-doc-utils' 'libarchive' 'libglade' 'vte-legacy')
makedepends=('intltool' 'gtkimageview')
#source=("http://sourceforge.net/projects/gmameui/files/gmameui/$pkgver/$pkgname-$pkgver.tar.gz")
source=('gmameui::git+https://github.com/sergiomb2/gmameui.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
#  git describe --always --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"

    # archive_read_data_into_buffer() is deprecated in libarchive
    /bin/sed -i 's/archive_read_data_into_buffer/archive_read_data/' src/gmameui-zip-utils.c

    # replace individual glib headers with glib.h
    /bin/sed -i '34,36d' src/gmameui.c
    /bin/sed -i '33 a\#include <glib.h>' src/gmameui.c
    autoreconf -fiv
    intltoolize
    ./configure --prefix=/usr --enable-joystick --enable-debug
    make
}

package() {
    cd "$srcdir/$pkgname"

    make DESTDIR="$pkgdir" install
}
