# Maintainer: taotieren <admin@taotieren.com>

pkgname=librnd4-svn
pkgver=r38262
pkgrel=1
pkgdesc="free/open source, flexible, modular two-dimensional CAD engine"
arch=($CARCH)
url="http://www.repo.hu/projects/librnd"
license=('LGPL-2.0-or-later')
provides=('librnd4=4.1.1' 'librnd3' 'librnd')
conflicts=('librnd4=4.1.1' 'librnd3' 'librnd')
depends=(
    glibc
    sh
    #     fungw
)
makedepends=(
    subversion
)
optdepends=(
)
source=("svn://svn.repo.hu/librnd/trunk")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/trunk/"
    local ver="$(svnversion)"
    printf "r%s" "${ver//[[:alpha:]]/}"
}

prepare() {
    cd "$srcdir/trunk/"

    # Fix: C17 forbids implicit int<->pointer conversion
    # draw_web2.c:81,96: void* assigned to int
    # draw_web2.c:311: int cast to void*
    sed -i '/#include "draw_web2.h"/a #include <stdint.h>' \
        src/librnd/plugins/lib_exp_text/draw_web2.c
    sed -i 's/int page = pctx->search\.array\[n+1\];/int page = (int)(intptr_t)pctx->search.array[n+1];/' \
        src/librnd/plugins/lib_exp_text/draw_web2.c
    sed -i 's/(void \*)pctx->page_idx)/(void \*)(intptr_t)pctx->page_idx)/' \
        src/librnd/plugins/lib_exp_text/draw_web2.c
}

build() {
    cd "$srcdir/trunk/"
    ./configure --prefix=/usr
    make LDFLAGS="-Wl,-z,now -Wl,-z,relro"
}

package() {
    cd "$srcdir/trunk/"
    make DESTDIR="$pkgdir/" install
}
