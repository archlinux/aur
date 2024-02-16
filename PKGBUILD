# Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Daniel Bermond <dbermond@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>


_srcname=SPIRV-LLVM-Translator
pkgname=lib32-spirv-llvm-translator-minimal-git
pkgdesc="Tool and a library for bi-directional translation between SPIR-V and LLVM IR, trunk version"
epoch=1
pkgver=r1978.262395d
pkgrel=1
_major_llvm_ver=19
arch=('x86_64')
url="https://github.com/KhronosGroup/SPIRV-LLVM-Translator"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=(lib32-llvm-minimal-git git cmake spirv-headers-git lib32-spirv-tools-git 'lib32-llvm-libs<$_major_llvm_ver')
depends=(lib32-llvm-libs-minimal-git lib32-spirv-tools-git lib32-gcc-libs lib32-glibc spirv-llvm-translator-minimal-git)
provides=(lib32-spirv-llvm-translator)
conflicts=(lib32-spirv-llvm-translator)
source=("git+$url.git"
)
md5sums=('SKIP')
sha512sums=('SKIP')


pkgver() {
    cd $_srcname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    
    export PKG_CONFIG=i686-pc-linux-gnu-pkg-config
    
    cmake \
        -B _build \
        -S "$srcdir"/$_srcname  \
        -G "Unix Makefiles" \
        -D BASE_LLVM_VERSION=$_major_llvm_ver \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_CXX_FLAGS:STRING=-m32 \
        -D CMAKE_C_FLAGS:STRING=-m32 \
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

package() {

    make -C _build DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}"/usr/{bin,include}
    install -Dm644 $_srcname/LICENSE.TXT -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
