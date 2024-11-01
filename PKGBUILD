# Maintainer: Guilhem Saurel <saurel@laas.fr>

_org='stack-of-tasks'
_pkgname=eigenpy
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=3.10.1
pkgrel=1
pkgdesc="Bindings between numpy and eigen using boost::python"
arch=('i686' 'x86_64')
url="https://github.com/$_org/$_pkgname"
license=('BSD-2-Clause')
depends=('boost-libs' 'eigen' 'gcc-libs' 'glibc')
optdepends=('doxygen')
makedepends=('cmake' 'boost' 'python-numpy' 'python-scipy')
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('7b4ea31c8eda2eeba6b1ebb22ebfe72b650e04da20e6ef48d48008c2afb1bbc4'
            'SKIP')
validpgpkeys=(
        'A031AD35058955293D54DECEC45D22EF408328AD' # https://github.com/jcarpent.gpg
        'F534E75540B2E7D24F99746987CFFF3D0D73CC93' # https://github.com/jcarpent.gpg
        'F182CC432A4752C7A3E4FE02001EB2069D785C81' # https://github.com/proyan.gpg
        '1462AF00C9CF3C9E7AFC905E63380359F089A579' # https://github.com/jorisv.gpg
        'F6B9DDE42ED91D7939BC25B2A4D60E0153ADD041' # https://github.com/manifoldfr.gpg
        )

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DGENERATE_PYTHON_STUBS=ON \
        -Wno-dev
    # This require a lot of ram to build.
    cmake --build "build-$pkgver" -j 1
}

check() {
    cmake --build "build-$pkgver" -t test
}

package_eigenpy() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf "$pkgdir/usr/share/doc"
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_eigenpy-docs() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf $pkgdir/usr/{lib,include,bin,share/{"$_pkgname",ament,ament_index}}
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
