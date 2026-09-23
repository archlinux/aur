# Check deps.json
_rstd_commit=4a4bf6910cd06043b80b179eff35f229a82580b8
_luato_commit=df0c6f2d1cce2051b4711d36067619eda7933683
_licrypto_commit=18345239cc68869646a6522e6e258a4eba3dec20

pkgname=lito
pkgver=0.8.3
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
sha256sums=('5fb7c0e8c5b3e4b49ace5da4561804a0f26f85c8ea3499f685625e18021d74a0'
            '3862e32000e060a3e810f59c5c491b0edce3ba5e32928e29a752f61db400bc10'
            '255e260360f8a29c42e33e10549a1bc2caea8cabd568eb7ad81d08b38526e7c3'
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
