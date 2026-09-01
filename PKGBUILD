# Check CMakeLists.txt
_rstd_commit=456fec5cc2b87acdb56800e298b5712ea69cdd47
_luato_commit=61dd40dca1e9aeda69eed208ddf0d10b34f59db7
_licrypto_commit=b7156942a4b85780a21bd11092c08cb6893b05d4

pkgname=lito
pkgver=0.7.1
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
sha256sums=('9d1f886b78d7752b5b39b970593b8aef5f3f67697ce0b75e7e9f2fc79e003343'
            '67e1315baa1ec31bc6d5da381b4367a08b768da623a25cc82bb84ac597647ead'
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
