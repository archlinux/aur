# Check deps.json
_rstd_commit=0c755371a02ccee658fa6d63728b6078cb2f9070
_luato_commit=df0c6f2d1cce2051b4711d36067619eda7933683
_licrypto_commit=40da005cbd7faf1328fd29a01cb0c534d6998612

pkgname=lito
pkgver=0.8.6
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
sha256sums=('cffe92a3a57d2c94bb66723539270c031d26473638022b381d5f1e0d82a27da9'
            '499cd550b557b7a5ed1a5576ba8738109518a7ec3461ee29befb02bc3d5177fb'
            '255e260360f8a29c42e33e10549a1bc2caea8cabd568eb7ad81d08b38526e7c3'
            'f7b1276b97797d7f50888cadd59d14dfeafb8963f2199d5f7f5ef03482090685')

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
