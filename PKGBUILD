# Check CMakeLists.txt
_rstd_commit=a852e89dc7b2c7fae6cc4c89d1f76afbac55be82
_luato_commit=3b10ff2caf2efddcdcdc7196240627cbd3346af5

pkgname=lito
pkgver=0.3.0
pkgrel=1
pkgdesc="Module-first C++ build tool with manifest."
arch=(x86_64)
url=https://github.com/litocpp/lito
license=('MIT OR Apache-2.0')
depends=(glibc lua)
makedepends=(cmake clang lld git ninja llvm)
source=("git+https://github.com/litocpp/lito.git#tag=v$pkgver"
        "git+https://github.com/litocpp/rstd.git#commit=$_rstd_commit"
        "git+https://github.com/litocpp/luato.git#commit=$_luato_commit")
sha256sums=('417582aa551810ef30d7f712424447d988f1d58af3fcc62735a3dad58e098575'
            'd6f977ace1bea2ee52bcebb6dd715108eb925d30dc8fb9367c3d23003a683ea1'
            'eac5a1320e6c6a2953ec195d71f57424afa6c7b4149664889dacaa65bf78e350')

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
