# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-graphics-compiler-git
pkgver=1.0.4361.r125.ga3bf2c5b
pkgrel=1
epoch=1
pkgdesc='Intel Graphics Compiler for OpenCL (git version)'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT')
depends=('llvm-libs' 'intel-opencl-clang' 'ncurses' 'zlib')
makedepends=('git' 'cmake' 'clang' 'llvm' 'python')
provides=('intel-graphics-compiler')
conflicts=('intel-graphics-compiler')
options=('!emptydirs')
source=('git+https://github.com/intel/intel-graphics-compiler.git'
        'git+https://github.com/intel/vc-intrinsics.git'
        'git+https://github.com/KhronosGroup/SPIRV-LLVM-Translator.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    git -C intel-graphics-compiler describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^igc\.//'
}

build() {
    cmake -B build -S intel-graphics-compiler \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DIGC_OPTION__ARCHITECTURE_TARGET='Linux64' \
        -DIGC_PREFERRED_LLVM_VERSION='10.0.1' \
        -DVC_INTRINSICS_SRC="${srcdir}/vc-intrinsics" \
        -DSPIRV_SRC="${srcdir}/SPIRV-LLVM-Translator" \
        -DINSTALL_GENX_IR='ON' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 intel-graphics-compiler/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/lib/igc/NOTICES.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
}
