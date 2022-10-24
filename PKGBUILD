# Maintainer: Karim Vergnes <me@thesola.io>

pkgname=intel-ipu6-dkms-git
_pkgname=intel-ipu6-dkms
pkgver=r74.c1fdd8a
pkgrel=1
pkgdesc="Intel IPU6 camera drivers (DKMS)"
arch=('any')
url="https://git.launchpad.net/~vicamo/+git/intel-ipu6-dkms"
license=('unknown')
depends=('dkms' 'intel-ivsc-driver-dkms-git')
makedepends=('git')
source=("git+${url}#branch=ubuntu/devel")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"
    sed -i "s/^PACKAGE_VERSION=\".*\"$/PACKAGE_VERSION=\"$pkgver\"/g" ./dkms.conf
    for patch in $(< debian/patches/series)
    do
        patch -p 1 -i debian/patches/$patch
    done
}

package() {
    cd "$srcdir"
    install -dm755 "$pkgdir/usr/src"
    cp -rT "$_pkgname" "$pkgdir/usr/src/$_pkgname-$pkgver"
}
