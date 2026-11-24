# Check deps.json
_rstd_commit=c5a080604370563298a0dac46012e717f35fe643
_luato_commit=500fa77514f1ea32c9dffd1d68a16ab5bd31e069
_licrypto_commit=4f5f0432d4566d66745b448d617f6b1b36ae6db9
_ligraph_commit=26cfca9b2306f1de389487cabfe37f16363ee24f
_liresto_commit=39a1bc0f01762ce702a45a0cfcb92035229a5035

pkgname=lito
pkgver=0.8.11
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
sha256sums=('ef34dbaf4aa4368943ffc2fece7fbe4b4c3289d1651ffd0c24415d1072b4e64b'
            'c5926f25f4ca49ce02b0608ede079afcf7c0fadafa270d9cc050c821189adb1c'
            '03c85e20d4a80e20552f6f2e6655409d68ebaac554dd0044e4c0b150a386f355'
            'a1b4edc2f1055d556f023fc6863f278fdcad906a72a2bc30615a4704aa2efd8a'
            '90dd0eb2a90813149c0392cbb05ea74d6a23e2a0a76617713088a0bc2bd9f27b'
            'd35de0b3bcd803014dacc4d786e3a2a4e2bc42e965a32c6f46587d4a45361f7c')

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
