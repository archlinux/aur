# Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>

_srcname=SPIRV-LLVM-Translator
pkgname=spirv-llvm-translator-minimal-git
pkgdesc="Tool and a library for bi-directional translation between SPIR-V and LLVM IR, trunk version"
epoch=1
pkgver=r1922.1e3ec59
pkgrel=1
arch=('x86_64')
url="https://github.com/KhronosGroup/SPIRV-LLVM-Translator"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=(llvm-minimal-git git cmake spirv-headers-git spirv-tools-git)
checkdepends=(python python-setuptools clang-minimal-git)
depends=(llvm-libs-minimal-git spirv-tools-git gcc-libs glibc)
provides=(spirv-llvm-translator)
conflicts=(spirv-llvm-translator)
source=("git+$url.git"
    "2258.patch"
)
# https://github.com/KhronosGroup/SPIRV-LLVM-Translator/issues/2261
# see https://github.com/KhronosGroup/SPIRV-LLVM-Translator/pull/2258
md5sums=('SKIP'
         '8902539869f8962da4ee16e50c033743')
sha512sums=('SKIP'
            '1c3765c4c8c2e3cf1bcf8e15d1a6821b962175a9695744dc823d6513e527af873b0da4e5e771db98062c2662899e969985b55e5f5cd103455d214f89384ff44f')


pkgver() {
    cd $_srcname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    patch --directory=$_srcname --forward --strip=1 --input="${srcdir}"/2258.patch
}

build() {
    
    cmake \
        -B _build \
        -S "$srcdir"/$_srcname  \
        -G "Unix Makefiles" \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_POSITION_INDEPENDENT_CODE=ON \
        -D CMAKE_SKIP_RPATH=ON \
        -D LLVM_EXTERNAL_LIT=/usr/bin/lit \
        -D LLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=/usr/include/spirv/ \
        -D LLVM_SPIRV_INCLUDE_TESTS=ON \
        -D BUILD_SHARED_LIBS=ON \
        -Wno-dev

    make -C _build -j 1
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
