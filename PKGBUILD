# Check deps.json
_rstd_version=0.1.4
_luato_commit=bd4848b3d6dc2cc57928e4405c3593b67322d6f8
_licrypto_commit=18345239cc68869646a6522e6e258a4eba3dec20

pkgname=lito
pkgver=0.8.2
pkgrel=1
pkgdesc="Module-first C++ build tool with manifest."
arch=(x86_64)
url=https://github.com/litocpp/lito
license=('MIT OR Apache-2.0')
depends=(glibc lua zstd)
makedepends=(cmake clang lld git ninja llvm libc++)
source=("git+https://github.com/litocpp/lito.git#tag=v$pkgver"
        "git+https://github.com/litocpp/rstd.git#tag=v$_rstd_version"
        "git+https://github.com/litocpp/luato.git#commit=$_luato_commit"
        "git+https://github.com/litocpp/licrypto.git#commit=$_licrypto_commit")
sha256sums=('dfde41f607fd0270765baf4cc573677cfec7b2660d08566aa5b3ebb552f93c4a'
            'edd45f5b4e745f8317ab8e0242fa63e6fc548b587ac01a6e94b904b9f8a8464b'
            '7b09b22347e9db3206fc797f61ce69996ff7d9e909e9c1fe8564550c2b540704'
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
