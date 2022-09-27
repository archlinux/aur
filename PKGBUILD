# Maintainer: Karim Vergnes <me@thesola.io>

pkgname=intel-ipu6-dkms-git
_pkgname=ipu6-drivers
pkgver=r53.3c24456e0
pkgrel=1
pkgdesc="Intel IPU6 camera drivers (DKMS)"
arch=('any')
url="https://github.com/intel/ipu6-drivers"
license=('unknown')
depends=('dkms')
makedepends=('git')
source=("git+${url}.git"
        "0000-disable-remaining-ivsc-calls.patch")
sha256sums=('SKIP'
            '1ed8ca177e476ace36a2205b2ddc72bb4358ad16eaa1eb180b96d18c4f2631f0')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"
    sed -i "s/^PACKAGE_VERSION=\".*\"$/PACKAGE_VERSION=\"$pkgver\"/g" ./dkms.conf
    patch -p1 -i $srcdir/0000-disable-remaining-ivsc-calls.patch
}

package() {
    cd "$srcdir"
    install -dm755 "$pkgdir/usr/src"
    cp -rT "$_pkgname" "$pkgdir/usr/src/$_pkgname-$pkgver"
}
