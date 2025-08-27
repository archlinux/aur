pkgname=seqan3
pkgver=3.4.0
pkgrel=1
pkgdesc="The modern C++ library for sequence analysis \
	 https://doi.org/10.1016/j.jbiotec.2017.07.017"
arch=("any")
url="http://www.seqan.de"
depends=()
makedepends=('cmake' 'git' 'bzip2' 'zlib' 'glibc' 'gcc-libs' 'cereal')
license=('CCPL' 'BSD')
source=("git+https://github.com/seqan/seqan3.git#tag=${pkgver}")
sha256sums=('7b3e0f7bb981f079680ca73a2698fffb419383fe81e893b301487f9e0c53669e')

prepare (){
    cd $srcdir/${pkgname}
    git submodule update --init --recursive
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
