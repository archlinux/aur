# Maintainer: Chocobo1

pkgname=igb
pkgver=5.3.5.3
pkgrel=2
pkgdesc="Linux* Base Driver for Intel(R) Ethernet Network Connection"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/e1000/files/igb%20stable/"
license=('GPL')
depends=('linux>=2.6.30')
makedepends=('linux-headers>=2.6.30')
install=$pkgname.install
source=("$pkgname-$pkgver-src.tar.gz::https://downloads.sourceforge.net/project/e1000/igb%20stable/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('4bee5e16cba82a390dc7ae6d930b0af0f6ac82939e7f17f1494ff8b59bbd62ba')


build() {
    cd "$srcdir/$pkgname-$pkgver/src"

    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/src"

    _kernver=$(pacman -Q linux | sed -r 's#.* ([0-9]+\.[0-9]+).*#\1#')
    _extramodules="/usr/lib/modules/extramodules-$_kernver-ARCH"

    find './' -name '*.ko' -exec gzip --force --fast {} \;
    install -Dm644 'igb.ko.gz' "$pkgdir/$_extramodules/igb.ko.gz"

    install -Dm644 '../COPYING' "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
