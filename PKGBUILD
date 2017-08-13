# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=igb
pkgver=5.3.5.10
pkgrel=1
pkgdesc="Driver for Intel Ethernet Network Connection"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/e1000/files/igb%20stable/"
license=('GPL')
depends=('linux>=2.6.30')
makedepends=('linux-headers>=2.6.30')
install=$pkgname.install
source=("$pkgname-$pkgver-src.tar.gz::https://downloads.sourceforge.net/project/e1000/igb%20stable/$pkgver/$pkgname-$pkgver.tar.gz"
        "pci_enable_msix.patch")
sha256sums=('0c3fc7ace88c2f76bb41696f5f57c6d724dbad2067db6c92625b6725930807d5'
            '5bd88953545099e6c4595b3dc25c947c52ecd8c65f06e0d2f3d1fda606b525d6')


prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    patch -p1 -i "$srcdir/pci_enable_msix.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver/src"

    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/src"

    _kernver=$(pacman -Q linux | grep -Po '(?<= )\d+\.\d+')
    _extramodules="/usr/lib/modules/extramodules-$_kernver-ARCH"

    find './' -name '*.ko' -exec gzip --force --fast {} \;
    install -Dm644 'igb.ko.gz' "$pkgdir/$_extramodules/igb.ko.gz"
}
