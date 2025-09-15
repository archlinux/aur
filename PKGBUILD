# Maintainer: taotieren <admin@taotieren.com>

pkgname=route-rnd-svn
pkgver=r1531
pkgrel=1
pkgdesc="free/open source, flexible, modular autorouter for Printed Circuit Boards"
arch=($CARCH)
url="http://www.repo.hu/projects/route-rnd/"
license=('LGPL-2.0-or-later')
provides=(${pkgname%-svn})
conflicts=(${pkgname%-svn})
depends=(
    glibc
)
makedepends=(
    subversion
)
optdepends=(
)
source=("svn://svn.repo.hu/route-rnd/trunk")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/trunk/"
    local ver="$(svnversion)"
    printf "r%s" "${ver//[[:alpha:]]/}"
}

build() {
    cd "$srcdir/trunk/"

    find . -type f -name 'Makefile*' -exec sed -i.bak \
        -e 's#^\([[:space:]]*PREFIX[[:space:]]*=[[:space:]]*\)/usr/local#\1/usr#' \
        {} +

    ./configure --prefix=/usr
    make LDFLAGS="-Wl,-z,now -Wl,-z,relro"
}

package() {
    cd "$srcdir/trunk/"
    make DESTDIR="$pkgdir/" install
}
