# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_srcname=PotreeConverter
_basename=potreeconverter
pkgname=$_basename-git
pkgver=2.1.1.r7.gc2328c4
pkgrel=1
pkgdesc="Generator for octrees LOD structures for streaming and real-time rendering of massive point clouds"
arch=('x86_64')
url="https://potree.org"
license=('BSD-2-Clause')
depends=('brotli' 'gcc-libs' 'glibc' 'laszip' 'onetbb')
makedepends=('cmake>=3.16' 'git')
provides=($_basename)
conflicts=($_basename)
source=(
    "git+https://github.com/potree/PotreeConverter.git"
    '0001-cmake.patch'
)
b2sums=('SKIP'
        'a1cbb7f16b781468d6a3b5854a01596643f8cf259eccb18c07b39e7949b3049d03acefbb34f034716462cf7646b5d98aec7f800118a08db51f30de446d81516b')

pkgver() {
    cd $srcdir/$_srcname
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $srcdir/$_srcname
    patch --forward --strip=1 --input=../0001-cmake.patch
}

build() {
    cd $srcdir/$_srcname
    mkdir -p build
    cd build
    cmake ../
    make
}

package() {
    cd $srcdir/$_srcname

    install -Dm755 build/PotreeConverter -t $pkgdir/usr/bin/
    install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/

    install -Dm644 README.md -t $pkgdir/usr/share/doc/$pkgname/
    find docs -type f -exec install -Dm644 {} $pkgdir/usr/share/doc/$pkgname/{} \;

    cd resources
    find page_template -type f -exec install -Dm644 {} $pkgdir/usr/share/$pkgname/{} \;

}
