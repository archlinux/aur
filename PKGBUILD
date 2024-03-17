# Maintainer: Guilhem Saurel <saurel@laas.fr>

_org='Simple-Robotics'
_pkgname='proxsuite'
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=0.6.4
pkgrel=1
pkgdesc="The Advanced Proximal Optimization Toolbox"
arch=('any')
url="https://github.com/$_org/$_pkgname"
license=('BSD-2-Clause')
depends=('eigen' 'simde')
optdepends=()
makedepends=('cmake')
checkdepends=('libmatio')
source=($url/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('fb90a9e45f5bf91659c394b7cfa22f9754bd864798c10a1269d342f6a456a1f3'
            'SKIP')
validpgpkeys=(
        'A031AD35058955293D54DECEC45D22EF408328AD'  # https://github.com/jcarpent.gpg
        'F534E75540B2E7D24F99746987CFFF3D0D73CC93'  # https://github.com/jcarpent.gpg
        '1462AF00C9CF3C9E7AFC905E63380359F089A579'  # https://github.com/jorisv.gpg
        )

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DINSTALL_DOCUMENTATION=ON \
        -DBUILD_DOCUMENTATION=ON \
        -Wno-dev
    cmake --build "build-$pkgver"
}

check() {
    cmake --build "build-$pkgver" -t test
}

package_proxsuite() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf "$pkgdir/usr/share/doc"
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_proxsuite-docs() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf $pkgdir/usr/{lib,include,bin,share/{"$_pkgname",ament,ament_index}}
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
