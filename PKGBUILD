# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=teem
pkgname=${_pkgname}-svn
pkgver=r6479
pkgrel=2
pkgdesc='Group of libraries for processing scientific raster data.'
arch=('x86_64')
url='http://teem.sourceforge.net/index.html'
license=('LGPL')
depends=()
optdepends=()
makedepends=(
    'cmake'
    'svn'
)
provides=("teem")
conflicts=("teem")
source=(
    "${_pkgname}::svn+https://svn.code.sf.net/p/teem/code/teem/trunk"
)
sha256sums=("SKIP")

prepare() {
    cd "$srcdir/$_pkgname"

    rm -rf build
    mkdir build
    cd build

    cmake \
        -DCMAKE_INSTALL_PREFIX:PATH="/usr" \
        -DCMAKE_BUILD_TYPE:STRING=Release \
        -DBUILD_SHARED_LIBS:BOOL=ON \
        ..
}

pkgver() {
    cd "$srcdir/$_pkgname"
    local ver
    ver="$(svnversion)"
    printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
    cd "$srcdir/$_pkgname/build"
    make
}

package() {
    cd "$srcdir/$_pkgname/build"
    make install DESTDIR="$pkgdir"

    install -D -m644 \
        "${srcdir}/$_pkgname/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

