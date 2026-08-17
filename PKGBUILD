# Check CMakeLists.txt
_rstd_commit=99e7d045c8bd340ba942ca742a66b89ede02fa4c
_luato_commit=a5cfe5dbb67ab9161ba26776c93d7ef7141c838a

pkgname=lito
pkgver=0.2.1
pkgrel=1
pkgdesc="Module-first C++ build tool with manifest."
arch=(x86_64)
url=https://github.com/litocpp/lito
license=(MIT)
depends=(glibc lua)
makedepends=(cmake clang lld git ninja llvm)
source=("git+https://github.com/litocpp/lito.git#tag=v$pkgver"
        "git+https://github.com/litocpp/rstd.git#commit=$_rstd_commit"
        "git+https://github.com/litocpp/luato.git#commit=$_luato_commit")
sha256sums=('482a4a39bf1a0053ccea7580620c5f0d45016a1f14fcd97b9d7b10997949716e'
            'ad116a5f2d52ddb6e5d4e970a6e992bb720d425a2a10d3df4d60e635505ec3af'
            '80df4d8e8f7e38e8170df32d37933fadc8ec83c1543231a369180442efd514ba')

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
