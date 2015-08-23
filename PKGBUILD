# Maintainer: Sam S <smls75@gmail.com>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: Joost Bremmer <toost dot b at gmail dot com>

pkgname=(libtiff3 libtiff4)
pkgver=3.9.7
pkgrel=4
arch=('i686' 'x86_64')
url="http://www.remotesensing.org/libtiff/"
license=('custom')
depends=('libjpeg' 'zlib' 'libtiff')
makedepends=('freeglut')
optdepends=('freeglut: for using tiffgt')
source=("http://download.osgeo.org/libtiff/tiff-$pkgver.tar.gz")
sha256sums=('f5d64dd4ce61c55f5e9f6dc3920fbe5a41e02c2e607da7117a35eb5c320cef6a')

build() {
    cd tiff-$pkgver
    ./configure --prefix=/usr
    make
}

check() {
    cd tiff-$pkgver
    make check
}

package_libtiff3() {
    pkgdesc="Library for manipulation of TIFF images (legacy version, provides libtiff.so.3)"
    
    cd tiff-$pkgver
    make DESTDIR="$pkgdir" install
    install -D -m644 COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    
    # Remove files which are already installed by the libtiff package
    rm -f  "$pkgdir"/usr/lib/libtiff{,xx}.{a,so}
    rm -rf "$pkgdir"/usr/bin
    rm -rf "$pkgdir"/usr/include
    rm -rf "$pkgdir"/usr/share/man
    rm -rf "$pkgdir"/usr/share/doc
}

package_libtiff4() {
    pkgdesc="Library for manipulation of TIFF images (legacy version, provides libtiff.so.4)"
    depends+=('libtiff3')
    
    # see http://www.asmail.be/msg0055009514.html
    install -d "$pkgdir"/usr/lib
    ln -sf libtiff.so.$pkgver   "$pkgdir"/usr/lib/libtiff.so.4
    ln -sf libtiffxx.so.$pkgver "$pkgdir"/usr/lib/libtiffxx.so.4
}
