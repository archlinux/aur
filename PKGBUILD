# Check deps.json
_rstd_commit=2ec6e95c6d1067196ca572715cc5e2e3d9f9687f
_luato_commit=df0c6f2d1cce2051b4711d36067619eda7933683
_licrypto_commit=286f24ae2eff79d595a968b601b47ccf0db5e563

pkgname=lito
pkgver=0.8.5
pkgrel=1
pkgdesc="Module-first C++ build tool with manifest."
arch=(x86_64)
url=https://github.com/litocpp/lito
license=('MIT OR Apache-2.0')
depends=(glibc lua zstd)
makedepends=(cmake clang lld git ninja llvm libc++)
options=(!lto) # lto+debug crashes clang 23.1.1
source=("git+https://github.com/litocpp/lito.git#tag=v$pkgver"
        "git+https://github.com/litocpp/rstd.git#commit=$_rstd_commit"
        "git+https://github.com/litocpp/luato.git#commit=$_luato_commit"
        "git+https://github.com/litocpp/licrypto.git#commit=$_licrypto_commit")
sha256sums=('f4e28c51da3cd8167060be1e827a0e094b4e0b72a98b6e8eacd6da52e8f51721'
            'f088c006d1c022c43bda11d9914a7ff05b8c8504b472d0240299f55f9b48c92e'
            '255e260360f8a29c42e33e10549a1bc2caea8cabd568eb7ad81d08b38526e7c3'
            'e31b6f948d3a67268f38392d011fa0807d3246c2e6de7e4eb28974743bd8dc19')

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
