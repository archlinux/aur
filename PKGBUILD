# Check CMakeLists.txt
_rstd_commit=5b163c47dd044012ae69128fe44aa9311011b250
_luato_commit=61dd40dca1e9aeda69eed208ddf0d10b34f59db7
_licrypto_commit=b7156942a4b85780a21bd11092c08cb6893b05d4

pkgname=lito
pkgver=0.7.0
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
sha256sums=('c21411cbbd635e510c7ca6ab2d2d45d93ed611efcdf22e57f300c8f12b0367a3'
            '0c18bb1db6a66fb33081fa91ace86b5ae35e6c292f7f16e5cf30346f01c0fd14'
            '351dcdfd54a6df473f457a853ce0f9dc80a2950c60b4c821eeeb252ae861f19a'
            'b5bf1e89fbe4f8598344b66538dfcabeddb5f1f79ce38cdd9806f59677f23a2c')

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
