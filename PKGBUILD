# Maintainer: Kenneth Hunter <kennethdhunter at gmail dot com>
pkgname=mt76-dkms-git
pkgver=r4269.de635e1e
pkgrel=1
pkgdesc="DKMS build of the MediaTek mt76 wireless driver from OpenWRT (with mt7925 support)"
arch=('x86_64')
url="https://github.com/openwrt/mt76"
license=('GPL')
depends=('dkms' 'git')
makedepends=('linux-headers')
optdepends=(
    'linux-headers: build for default Arch Linux kernel'
    'linux-zen-headers: build for Zen kernel'
    'linux-lts-headers: build for LTS kernel'
)
conflicts=('mt76-dkms')
provides=('mt76-dkms')
source=("git+https://github.com/openwrt/mt76.git"
        "dkms.conf")
md5sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/mt76"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p "$srcdir/mt76-dkms"
    cp -r "$srcdir/mt76"/* "$srcdir/mt76-dkms/"
    cp "$srcdir/dkms.conf" "$srcdir/mt76-dkms/"
}

package() {
    install -dm755 "$pkgdir/usr/lib/dkms/mt76"
    cp -r "$srcdir/mt76-dkms/"* "$pkgdir/usr/lib/dkms/mt76/"

    echo "**********************************************************"
    echo "To enable mt76 for your current kernel, run the following:"
    echo "  sudo cp -r /usr/lib/dkms/mt76 /usr/src/mt76-${pkgver}"
    echo "  sudo dkms add -m mt76 -v ${pkgver}"
    echo "  sudo dkms build -m mt76 -v ${pkgver}"
    echo "  sudo dkms install -m mt76 -v ${pkgver}"
    echo "**********************************************************"
}

