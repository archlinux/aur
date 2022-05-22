# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-graphics-compiler-git
pkgver=1.0.11222.r136.g2ea7d9f58
pkgrel=1
epoch=1
pkgdesc='Intel Graphics Compiler for OpenCL (git version)'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT')
depends=('llvm-libs' 'intel-opencl-clang' 'ncurses' 'spirv-tools' 'zlib')
makedepends=('git' 'cmake' 'clang' 'lld' 'llvm' 'python' 'libunwind' 'spirv-headers' 'vc-intrinsics')
provides=('intel-graphics-compiler')
conflicts=('intel-graphics-compiler')
options=('!emptydirs' '!lto')
source=('git+https://github.com/intel/intel-graphics-compiler.git')
sha256sums=('SKIP')

pkgver() {
    git -C intel-graphics-compiler describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^igc\.//'
}

build() {
    cmake -B build -S intel-graphics-compiler \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_INSTALL_LIBDIR='lib' \
        -DIGC_OPTION__ARCHITECTURE_TARGET='Linux64' \
        -DIGC_OPTION__CLANG_MODE='Prebuilds' \
        -DIGC_OPTION__LLD_MODE='Prebuilds' \
        -DIGC_OPTION__LLVM_PREFERRED_VERSION="$(clang --version | awk 'NR == 1 { print $3 }')" \
        -DIGC_OPTION__LLVM_MODE='Prebuilds' \
        -DIGC_OPTION__LINK_KHRONOS_SPIRV_TRANSLATOR='ON' \
        -DIGC_OPTION__USE_PREINSTALLED_SPRIV_HEADERS='ON' \
        -DIGC_OPTION__SPIRV_TOOLS_MODE='Prebuilds' \
        -DIGC_OPTION__SPIRV_TRANSLATOR_MODE='Prebuilds' \
        -DIGC_OPTION__VC_INTRINSICS_MODE='Prebuilds' \
        -DINSTALL_GENX_IR='ON' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 intel-graphics-compiler/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/lib/igc/NOTICES.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
}
