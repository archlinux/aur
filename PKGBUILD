# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_srcname=PotreeConverter
pkgname=potreeconverter
pkgver=2.1.1
pkgrel=1
pkgdesc="Generator for octrees LOD structures for streaming and real-time rendering of massive point clouds"
arch=('x86_64')
url="https://potree.org"
license=('BSD-2-Clause')
depends=('brotli' 'gcc-libs' 'glibc' 'laszip' 'onetbb')
makedepends=('cmake>=3.16')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/potree/PotreeConverter/archive/refs/tags/${pkgver}.tar.gz"
    '0001-cmake.patch'
)
b2sums=('193f57169b6e9acc49f2bf6666cac8e4c111f259558034f6d8e21c541bf8e8b4b5e911345d196e4d631b34300af0556a631206f6d8aba894eea356b87337aa2f'
        'a1cbb7f16b781468d6a3b5854a01596643f8cf259eccb18c07b39e7949b3049d03acefbb34f034716462cf7646b5d98aec7f800118a08db51f30de446d81516b')

prepare() {
    cd $srcdir/$_srcname-$pkgver
    patch --forward --strip=1 --input=../0001-cmake.patch
}

build() {
    cd $srcdir/$_srcname-$pkgver
    mkdir -p build
    cd build
    cmake ../
    make
}

package() {
    cd $srcdir/$_srcname-$pkgver

    install -Dm755 build/PotreeConverter -t $pkgdir/usr/bin/
    install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/

    install -Dm644 README.md -t $pkgdir/usr/share/doc/$pkgname/
    find docs -type f -exec install -Dm644 {} $pkgdir/usr/share/doc/$pkgname/{} \;

    cd resources
    find page_template -type f -exec install -Dm644 {} $pkgdir/usr/share/$pkgname/{} \;

}
