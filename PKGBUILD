# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg='Simple-Robotics'
_pkgname='proxsuite'
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=0.4.1
pkgrel=1
pkgdesc="The Advanced Proximal Optimization Toolbox"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$pkgname"
license=('BSD')
depends=()
optdepends=()
makedepends=('cmake' 'eigen' 'simde')
checkdepends=('libmatio')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('216e99fdd68d0f66ce5193be863c924223146458f4046e5a88ff51b877eb473a'
            'SKIP')
validpgpkeys=('A031AD35058955293D54DECEC45D22EF408328AD')

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    cmake --build "build-$pkgver"
}

check() {
    cmake --build "build-$pkgver" -t test
}

package_proxsuite() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf $pkgdir/usr/share/doc
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_proxsuite-docs() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf $pkgdir/usr/{lib,include,bin,share/{"$_pkgname",ament,ament_index}}
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
