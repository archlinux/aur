# Check deps.json
_rstd_commit=05748d842307476dd86dfa14237838295cb5ec77
_luato_commit=df0c6f2d1cce2051b4711d36067619eda7933683
_licrypto_commit=1199a8fe2b119774a85adbd33043fc5ef7b20d3c

pkgname=lito
pkgver=0.8.8
pkgrel=1
pkgdesc="Module-first C++ build tool with manifest."
arch=(x86_64)
url=https://github.com/litocpp/lito
license=('MIT OR Apache-2.0')
depends=(glibc libgcc lua zstd)
makedepends=(cmake clang lld git ninja llvm libc++)
options=(!lto) # lto+debug crashes clang 23.1.1
source=("git+https://github.com/litocpp/lito.git#tag=v$pkgver"
        "git+https://github.com/litocpp/rstd.git#commit=$_rstd_commit"
        "git+https://github.com/litocpp/luato.git#commit=$_luato_commit"
        "git+https://github.com/litocpp/licrypto.git#commit=$_licrypto_commit")
sha256sums=('df5856bfbc68fdb7ccd4b840e601d21b373faef82a26270d195bd6d39df30f07'
            'b3ce3796a942227faacbc82df46a26c274192610aee3efcb02af66b3c5357046'
            '255e260360f8a29c42e33e10549a1bc2caea8cabd568eb7ad81d08b38526e7c3'
            '4f00968aaee40d9edca9f62f39a4f335fe5f65181136d6f4b5b27e3af9fe45de')

build() {
    # ld.lld: error: undefined symbol: open(char const*, int pass_dynamic_object_size1, unsigned int)
    CXXFLAGS="${CXXFLAGS//-Wp,-D_FORTIFY_SOURCE=3/}"

    cmake -B build -S "lito" -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=OFF‎\
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
