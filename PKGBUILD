# Check CMakeLists.txt
_rstd_commit=fdb99aaa894d76b04032cd301ac82b5ee6e3ec6d
_luato_commit=61dd40dca1e9aeda69eed208ddf0d10b34f59db7
_libsodium_commit=77e1ce5d6dee871c49ef211222ba18ef0c486bda

pkgname=lito
pkgver=0.6.1
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
        "git+https://github.com/jedisct1/libsodium.git#commit=$_libsodium_commit")
sha256sums=('588ff921301d355193d34504a852ef7d19ac51e2731d68e6ce79bfb0ddfe9ddf'
            '5e459ff93db361faf3c893d714d1f1d26b7d133f62c58c091a20357476a37a3c'
            '351dcdfd54a6df473f457a853ce0f9dc80a2950c60b4c821eeeb252ae861f19a'
            'da5ab87a4ba609f0f38247f200b30e04acd8d2db210a23cc4206a6c3484b929d')

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
        -DFETCHCONTENT_SOURCE_DIR_SODIUM="$srcdir/libsodium" \
        -DLITO_USE_SYSTEM_ZSTD=ON
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
