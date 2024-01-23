# Maintainer: Guilhem Saurel <saurel@laas.fr>

_org='stack-of-tasks'
_pkgname=eigenpy
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=3.3.0
pkgrel=2
pkgdesc="Bindings between numpy and eigen using boost::python"
arch=('i686' 'x86_64')
url="https://github.com/$_org/$_pkgname"
license=('BSD-2-Clause')
depends=('boost-libs' 'eigen' 'gcc-libs' 'glibc')
optdepends=('doxygen')
makedepends=('cmake' 'boost' 'python-numpy')
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('ecfab9fe7a6a37c64c80c4ebac102ed5f072e95f696d3e9a918a8db8fc35b080'
            'SKIP')
validpgpkeys=(
        'A031AD35058955293D54DECEC45D22EF408328AD'  # https://github.com/jcarpent.gpg
        'F182CC432A4752C7A3E4FE02001EB2069D785C81'  # https://github.com/proyan.gpg
        '1462AF00C9CF3C9E7AFC905E63380359F089A579'  # https://github.com/jorisv.gpg
        )

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DGENERATE_PYTHON_STUBS=ON \
        -Wno-dev
    cmake --build "build-$pkgver"
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
