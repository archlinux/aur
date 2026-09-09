# Check CMakeLists.txt
_rstd_commit=21f422f0e7f409dcd1b503523ceaa6dc63b54b06
_luato_commit=9ad07ca2604022319c0178b7f5543220baf87050
_licrypto_commit=18345239cc68869646a6522e6e258a4eba3dec20

pkgname=lito
pkgver=0.8.0
pkgrel=1
pkgdesc="Module-first C++ build tool with manifest."
arch=(x86_64)
url=https://github.com/litocpp/lito
license=('MIT OR Apache-2.0')
depends=(glibc lua zstd)
makedepends=(cmake clang lld git ninja llvm libc++)
source=("git+https://github.com/litocpp/lito.git#tag=v$pkgver"
        "git+https://github.com/litocpp/rstd.git#commit=$_rstd_commit"
        "git+https://github.com/litocpp/luato.git#commit=$_luato_commit"
        "git+https://github.com/litocpp/licrypto.git#commit=$_licrypto_commit")
sha256sums=('e0cf097f5aa8bc54f1ed249561a52856e2ffbf0a5a4be89fd754cf78116d01ae'
            '4274d70bf57ec5f85923f6a7b393e114665c8497a04797fb0c7bb6da57fb3fd1'
            '0e7de62fac442c248334e98434b478ab230dd1fe94692cb43ec6f7b6e2a7fe36'
            '99481a98d86eb2b4bd9c2f755463fd163bfff58b3fc65281f8d66b88741a36d1')

build() {
    # ld.lld: error: undefined symbol: open(char const*, int pass_dynamic_object_size1, unsigned int)
    CXXFLAGS="${CXXFLAGS//-Wp,-D_FORTIFY_SOURCE=3/}"

    cmake -B build -S "lito" -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
        -DFETCHCONTENT_SOURCE_DIR_RSTD="$srcdir/rstd" \
        -DFETCHCONTENT_SOURCE_DIR_LUATO="$srcdir/luato" \
        -DFETCHCONTENT_SOURCE_DIR_LICRYPTO="$srcdir/licrypto" \
        -DLITO_USE_SYSTEM_ZSTD=ON
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
