# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=onevpl-cpu-git
pkgver=2023.2.0.r0.gee71102
pkgrel=1
pkgdesc='oneVPL runtime implementation for CPU (git version)'
arch=('x86_64')
url='https://www.intel.com/content/www/us/en/developer/tools/oneapi/onevpl.html'
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'meson' 'nasm' 'onevpl' 'xxhash' 'yasm')
provides=('onevpl-cpu' 'onevpl-runtime')
conflicts=('onevpl-cpu')
source=('git+https://github.com/oneapi-src/oneVPL-cpu.git'
        '010-onevpl-cpu-fix-build.patch')
sha256sums=('SKIP'
            'e51d5b9bbd6a5f8a80cc444dd71beb57f687f8bcb36a0b263af5517a104cd21c')

prepare() {
    patch -d oneVPL-cpu -Np1 -i "${srcdir}/010-onevpl-cpu-fix-build.patch"
}

pkgver() {
    git -C oneVPL-cpu describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    export CFLAGS+=' -DNDEBUG -ffat-lto-objects'
    export CXXFLAGS+=' -DNDEBUG -ffat-lto-objects'
    local -x PKG_CONFIG_LIBDIR="${srcdir}/deps-install/lib"
    local -x VPL_CPU_DEPS_BUILD_DIR="${srcdir}/deps-build"
    local -x VPL_BUILD_DEPENDENCIES="${srcdir}/deps-install"
    
    oneVPL-cpu/script/bootstrap gpl
    
    export CFLAGS="${CFLAGS/ -ffat-lto-objects/}"
    export CXXFLAGS="${CXXFLAGS/ -ffat-lto-objects/}"
    
    cmake -B build -S oneVPL-cpu \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_INSTALL_SYSCONFDIR:PATH='/etc' \
        -DCMAKE_PREFIX_PATH:PATH="${srcdir}/deps-install" \
        -DBUILD_GPL_X264:BOOL='ON' \
        -DBUILD_TESTS:BOOL='ON' \
        -DONEAPI_INSTALL_LICENSEDIR:STRING="share/licenses/${pkgname}" \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
