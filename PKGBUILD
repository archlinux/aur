# Maintainer: Rein Fernhout <me@levitati.ng>

pkgname=gnu-apl
pkgver=1.9
pkgrel=1
url="https://www.gnu.org/software/apl/"
pkgdesc="An (almost) complete implementation of ISO standard 13751"
arch=('x86_64')
depends=('ncurses' 'gcc-libs' 'sqlite' 'libnsl' 'pcre')
license=('GPL3')
#source=("https://ftpmirror.gnu.org/apl/apl-${pkgver}.tar.gz"{,.sig})
# official https gnu site not updated any more?
source=("https://mirrors.kernel.org/gnu/apl/apl-${pkgver}.tar.gz"{,.sig})
sha256sums=('291867f1b1937693abb57be7d9a37618b0376e3e2709574854a7bbe52bb28eb8'
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
    make PREFIX=/usr
}

package() {
    cd "$srcdir/apl-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
