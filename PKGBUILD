# Maintainer: Karim Vergnes <me@thesola.io>

pkgname=intel-ipu6-dkms-git
_pkgname=ipu6-drivers
pkgver=r45.d50e0f5
pkgrel=1
pkgdesc="Intel IPU6 camera drivers (DKMS)"
arch=('any')
url="https://github.com/intel/ipu6-drivers"
license=('unknown')
depends=('dkms' 'intel-ivsc-driver-dkms-git')
makedepends=('git')
source=("git+${url}.git"
        "0000-Add-ivsc-header.patch"
        "0001-Add-kprobe-function-loader.patch")
sha256sums=('SKIP'
            '41e2b29d42ac0380fc4fb59bad19e37192d5e534e1808d9588ae99d20862447e'
            'eb318f8d549e36963d1ee5d83488235e1ca5cbe196f772f658b3790faaaaada3')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"
    sed -i "s/^PACKAGE_VERSION=\".*\"$/PACKAGE_VERSION=\"$pkgver\"/g" ./dkms.conf
    mkdir -p include/linux/mfd
    patch -p1 -i $srcdir/0000-Add-ivsc-header.patch
    patch -p1 -i $srcdir/0001-Add-kprobe-function-loader.patch
}

package() {
    cd "$srcdir"
    install -dm755 "$pkgdir/usr/src"
    cp -rT "$_pkgname" "$pkgdir/usr/src/$_pkgname-$pkgver"
}
