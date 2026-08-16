# Check CMakeLists.txt
_rstd_commit=a802845810966d738b65a4f86331358eef0ec8c9
_luato_commit=1f5d81067e76c2c1d8399e0f2891e795bcc05325

pkgname=lito
pkgver=0.1.0
pkgrel=1
pkgdesc="Module-first C++ build tool with manifest."
arch=(x86_64)
url=https://github.com/litocpp/lito
license=(MIT)
depends=(glibc lua)
makedepends=(cmake clang lld git ninja llvm)
source=("git+https://github.com/litocpp/lito.git#tag=v$pkgver"
        "git+https://github.com/litocpp/rstd.git#commit=$_rstd_commit"
        "git+https://github.com/litocpp/luato.git#commit=$_luato_commit"
        "0001-cmake-Use-system-lua.patch")
sha256sums=('228efb03f1e236336ce7d97c63cf2ae549961660cdd944f4f1fb89d1991f70f8'
            '7d588061ef962aa68d17e9742e0da0898206540ea15b4235090d738f13e9e3a7'
            '7273160016dbde906b5be74d82deb5ce8d14140c884558b35d8b144860390b5e'
            '8e9044f5bf17744ecc83e6a50739b3a653581cb6d5357761995aab688ca674a1')

prepare() {
    patch -Np1 -i "$srcdir/0001-cmake-Use-system-lua.patch" -d luato
}
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
