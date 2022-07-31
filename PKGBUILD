# Maintainer: Jieao Song <8d1h at tutanota dot com>

pkgname=surf-geometry
pkgver=1.0.6
pkgrel=1
pkgdesc="Visualization of real algebraic geometry"
arch=('i686' 'x86_64')
url="http://surf.sourceforge.net/"
license=('GPL')
depends=('libjpeg-turbo' 'libtiff' 'libx11' 'libcups' 'flex')
optdepends=('gtk')
conflicts=('surf')
source=("https://downloads.sourceforge.net/surf/surf-$pkgver.tar.gz" 'surf.patch')
sha1sums=('b901a4640c5fe321d9161bcbd99cf93141be59d9' 'c3e05a36413281ac1581585aad18f44381fa2472')

prepare() {
    cd "$srcdir/surf-$pkgver"
    patch --forward --strip=1 --input="$srcdir"/surf.patch
}

build() {
    cd "$srcdir/surf-$pkgver"
    export CXXFLAGS="-std=c++14 $CFLAGS"

    # add the flag --disable-gui if gtk is not available
    if [[ -z $(command -v "gtk-config") ]]; then
        ./configure --prefix=/usr --disable-gui
    else
        ./configure --prefix=/usr
    fi
    make clean
    make
}

package() {
    cd "$srcdir/surf-$pkgver"
    make DESTDIR="$pkgdir" install
}
