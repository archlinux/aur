# Maintainer: Reza Jahanbakhshi <reza.jahanbakhshi at gmail dot com

_srcname=SPIRV-LLVM-Translator
pkgname=spirv-llvm-translator-git
pkgdesc="Tool and a library for bi-directional translation between SPIR-V and LLVM IR, trunk version"
epoch=1
pkgver=r2012.0838497
pkgrel=1
arch=('x86_64')
url="https://github.com/KhronosGroup/SPIRV-LLVM-Translator"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=(llvm-git git cmake spirv-headers-git spirv-tools-git)
checkdepends=(python python-setuptools clang-git clang-opencl-headers-git)
depends=(llvm-libs-git spirv-tools-git gcc-libs glibc)
provides=(spirv-llvm-translator)
conflicts=(spirv-llvm-translator)
source=("git+$url.git"
)
md5sums=('SKIP')
sha512sums=('SKIP')
options=(!debug)

pkgver() {
    cd $_srcname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    
    cmake \
        -B _build \
        -S "$srcdir"/$_srcname  \
        -G "Unix Makefiles" \
        -D BASE_LLVM_VERSION=19 \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_POSITION_INDEPENDENT_CODE=ON \
        -D CMAKE_SKIP_RPATH=ON \
        -D LLVM_EXTERNAL_LIT=/usr/bin/lit \
        -D LLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=/usr/include/spirv/ \
        -D LLVM_SPIRV_INCLUDE_TESTS=ON \
        -D BUILD_SHARED_LIBS=ON \
        -Wno-dev

    make -C _build
}

check() {
    LD_LIBRARY_PATH="$srcdir"/_build/lib/SPIRV make -C _build test
}

package() {

    make -C _build DESTDIR="${pkgdir}" install
    install -Dm755 _build/tools/llvm-spirv/llvm-spirv -t "$pkgdir"/usr/bin
    install -Dm644 $_srcname/LICENSE.TXT -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:

