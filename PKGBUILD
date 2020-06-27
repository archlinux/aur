# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-graphics-compiler-git
pkgver=1.0.4155.r113.g036fb054
pkgrel=1
epoch=1
pkgdesc='Intel Graphics Compiler for OpenCL (git version)'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT')
depends=('llvm-libs' 'intel-opencl-clang')
makedepends=('git' 'cmake' 'clang' 'llvm' 'zlib' 'python')
provides=('intel-graphics-compiler')
conflicts=('intel-graphics-compiler')
options=('!emptydirs')
source=('git+https://github.com/intel/intel-graphics-compiler.git'
        '010-igc-gcc10-fix.patch'::'https://github.com/intel/intel-graphics-compiler/commit/f4efb15429bdaca0122640ae63042a8950b491df.patch')
sha256sums=('SKIP'
            'dd9fb728757a83f9d61770b77b4a17685dade697767a37826c8dc1e8fa78728c')

prepare() {
    patch -d intel-graphics-compiler -Np1 -i "${srcdir}/010-igc-gcc10-fix.patch"
}

pkgver() {
    git -C intel-graphics-compiler describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^igc\.//'
}

build() {
    cmake -B build -S intel-graphics-compiler \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DIGC_OPTION__ARCHITECTURE_TARGET='Linux64' \
        -DIGC_PREFERRED_LLVM_VERSION='10.0.0' \
        -DINSTALL_GENX_IR='ON' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 intel-graphics-compiler/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
