# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=gnu-apl
pkgver=1.8
pkgrel=3
url="https://www.gnu.org/software/apl/"
pkgdesc="An (almost) complete implementation of ISO standard 13751"
arch=('x86_64')
depends=('ncurses' 'postgresql-libs' 'gcc-libs' 'sqlite' 'libnsl' 'pcre')
license=('GPL3')
#source=("https://ftpmirror.gnu.org/apl/apl-${pkgver}.tar.gz"{,.sig})
# official https gnu site not updated any more?
source=("https://mirrors.kernel.org/gnu/apl/apl-${pkgver}.tar.gz"{,.sig})
sha256sums=('144f4c858a0d430ce8f28be90a35920dd8e0951e56976cb80b55053fa0d8bbcb'
            'SKIP')
validpgpkeys=('3EB2E2ECCB2F040A26CB7F2192B68B71531B6686')

prepare() {
    cd "$srcdir/apl-$pkgver"
    # The default color scheme is black-on-black in some terminals
    sed -i '64 s/^.*Color.*ANSI/#&/' gnu-apl.d/preferences{,.in}
    sed -i '65 s/^#.*Color.*CURSES/Color\tCURSES/' gnu-apl.d/preferences{,.in}
}

build() {
    cd "$srcdir/apl-$pkgver"
    #CFLAGS='-std=gnu99' ./configure --prefix=/usr --sysconfdir=/etc
    # FS#60643 (remove in 1.8)
    CFLAGS='-std=gnu99' CXX_WERROR='no' ./configure --prefix=/usr --sysconfdir=/etc
    make PREFIX=/usr -j1
}

package() {
    cd "$srcdir/apl-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
