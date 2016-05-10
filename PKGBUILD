# Maintainer: Chocobo1

pkgname=igb
pkgver=5.3.4.4
pkgrel=2
pkgdesc="Linux* Base Driver for Intel(R) Ethernet Network Connection"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/e1000/files/igb%20stable/"
license=('GPL')
depends=('linux>=2.6.30')
makedepends=('linux-headers>=2.6.30')
install=$pkgname.install
source=("$pkgname-$pkgver-src.tar.gz::https://sourceforge.net/projects/e1000/files/igb%20stable/5.3.4.4/$pkgname-$pkgver.tar.gz/download"
        'fix-compile.patch')
sha256sums=('556708dbb8c891e1a23c1bd280b6bd1c28ccee061a4a3da8220dd8daa74c103f'
            '1c894085cf6a866ac720deefc5dc516bd7f308667ad159501bf2cb7ff5eb5317')


build() {
    cd "$srcdir/$pkgname-$pkgver/src"

    patch -p1 -i "$srcdir/fix-compile.patch"
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
