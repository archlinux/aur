# Check CMakeLists.txt
_rstd_commit=66983d6e25b4059d444adb0bd162ffcbd0d455e4
_luato_commit=00d5cfacd85f44f98727d3cd7e2f78ec96689552

pkgname=lito
pkgver=0.5.0
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
sha256sums=('e020f8e11e9bebd8402b502e76dbabfd2b172923b94d27504206c473012aed3e'
            '420ce8dafd66c355f2d4e2f7cd62be4ae0e1b9ab158c546e6aebd828e112b917'
            '5f4c8f70a958106b97a6a909d082eeb262ca11c8725d8971600103ba5435e32a')

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
