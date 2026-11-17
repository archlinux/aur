# Check deps.json
_rstd_commit=0d2e9c19f318ea4cb920623eda2358dc2f75e63a
_luato_commit=34b0d9b6a64f23a54b7c158853a1b127f25a0056
_licrypto_commit=4f5f0432d4566d66745b448d617f6b1b36ae6db9
_ligraph_commit=26cfca9b2306f1de389487cabfe37f16363ee24f
_liresto_commit=a36aa4edd009197cd123275143bfb00d67b3f769

pkgname=lito
pkgver=0.8.9
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
        "git+https://github.com/litocpp/licrypto.git#commit=$_licrypto_commit"
        "git+https://github.com/litocpp/ligraph.git#commit=$_ligraph_commit"
        "git+https://github.com/litocpp/liresto.git#commit=$_liresto_commit")
sha256sums=('e21832263662b7488939348d9fa197e3fd6c72fb05ab43aea4f6488ae6122333'
            '7b80bf852afc94e543f9d87a632bdefa1f0766de01bd95df59440975e4e8d931'
            'b8e4589fe724df1eaecf7f1009b466545ad63ac9c89eb28ad12953e66eb10c6e'
            'a1b4edc2f1055d556f023fc6863f278fdcad906a72a2bc30615a4704aa2efd8a'
            '90dd0eb2a90813149c0392cbb05ea74d6a23e2a0a76617713088a0bc2bd9f27b'
            'e4b9605c35cbb63c8695651c459e0062928e44aa515178437b58d0b8178fca7e')

build() {
    # ld.lld: error: undefined symbol: open(char const*, int pass_dynamic_object_size1, unsigned int)
    CXXFLAGS="${CXXFLAGS//-Wp,-D_FORTIFY_SOURCE=3/}"

    CXXFLAGS+=" --stdlib=libc++"

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
        -DFETCHCONTENT_SOURCE_DIR_LIGRAPH="$srcdir/ligraph" \
        -DFETCHCONTENT_SOURCE_DIR_LIRESTO="$srcdir/liresto" \
        -DLITO_USE_SYSTEM_ZSTD=ON
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
