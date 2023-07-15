pkgname=seqan3
pkgver=3.2.0
pkgrel=2
pkgdesc="The modern C++ library for sequence analysis \
	 https://doi.org/10.1016/j.jbiotec.2017.07.017"
arch=("any")
url="http://www.seqan.de"
depends=()
makedepends=('cmake' 'git' 'bzip2' 'zlib' 'glibc' 'gcc-libs' 'cereal')
license=('CCPL' 'BSD')
source=("git+https://github.com/seqan/seqan3.git#tag=${pkgver}"
	"sdsl-lite.patch::https://github.com/xxsds/sdsl-lite/commit/607019d52b10bb8eb399e6fc9578eaf0a150f9c4.patch")
sha256sums=('SKIP'
            'e690a0f2b27a608edb683c871ba87e387d5cd5e323bc39944302131b988eda13')

prepare (){
    cd $srcdir/${pkgname}
    git submodule update --init --recursive
    
    cd $srcdir/$pkgname/submodules/sdsl-lite
    patch -p1 < $srcdir/sdsl-lite.patch
}
build() {
    cd ${pkgname}
    cmake -B build  \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_SKIP_RPATH=true \
        -Wno-dev
    cmake --build build
}

check() {
    cd ${pkgname}
    ctest --test-dir build --output-on-failure
}

package() {
    cd ${pkgname}
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
