# Check CMakeLists.txt
_rstd_commit=e5451a6ac1acbe22c47b5061839ee378e559ef39
_luato_commit=afb1a0f908188ea7fb449f865f540811cae03d20

pkgname=lito
pkgver=0.4.0
pkgrel=1
pkgdesc="Module-first C++ build tool with manifest."
arch=(x86_64)
url=https://github.com/litocpp/lito
license=('MIT OR Apache-2.0')
depends=(glibc lua)
makedepends=(cmake clang lld git ninja llvm libc++)
source=("git+https://github.com/litocpp/lito.git#tag=v$pkgver"
        "git+https://github.com/litocpp/rstd.git#commit=$_rstd_commit"
        "git+https://github.com/litocpp/luato.git#commit=$_luato_commit")
sha256sums=('4c5b4d429cb0c21ad69b3b8a367e1841c596c87f86da9dc3940f2341191e96bb'
            '41bbc5b97aef6e3297bfbea89afc75af882bc369bc324f6d6c66bd62fa96fb7c'
            '2b74ed6478506e05c3a972e818fc06ffe202173e327a4a90fd4cc44bcc70ecc8')

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
        -DFETCHCONTENT_SOURCE_DIR_LUATO="$srcdir/luato"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
