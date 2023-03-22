# Maintainer: PumpkinCheshire <sollyonzou at gmail dot com>

pkgname=fermi-lite
pkgver=0.1.r13.g85f159e
pkgrel=2
pkgdesc="Standalone C library for assembling Illumina short reads in small regions"
arch=('x86_64')
url="https://github.com/lh3/fermi-lite"
license=('MIT')
depends=('zlib')
makedepends=('git' 'make' 'patch')
source=("git+${url}.git"
"001-bwa.patch::${url}/compare/master...walaj:fermi-lite:master.diff"
)
sha256sums=('SKIP'
            '9f77d739ad2b276344d4ee3301c41247550242c7ad26dd47088934c1341e3bda')

pkgver() {
    git -C ${pkgname} describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
    cd ${pkgname}
    sed -i "s|CFLAGS=|CFLAGS=-fPIC |" Makefile
    sed -i "s|^const|extern const|" rle.h
    patch --strip=1 --fuzz=3 < ../001-bwa.patch
}
build() {
    cd "$srcdir/${pkgname}"
    make
    mkdir lib
    cp libfml.a lib
    cd lib
    ar -x libfml.a
    gcc -shared  -o libfml.so *.o
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" ${srcdir}/${pkgname}/fml-asm
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ${pkgname}/LICENSE.txt
    cd $srcdir/${pkgname}
    install -Dm644 *.h -t "${pkgdir}/usr/include/${pkgname}"
    install -Dm755 lib/libfml.so -t "${pkgdir}/usr/lib"
    ln -s /usr/lib/libfml.so "${pkgdir}/usr/lib/libfermi-lite.so"
}
