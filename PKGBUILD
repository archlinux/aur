# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=onevpl-cpu
pkgver=2023.1.3
pkgrel=1
pkgdesc='oneVPL runtime implementation for CPU'
arch=('x86_64')
url='https://www.intel.com/content/www/us/en/developer/tools/oneapi/onevpl.html'
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'meson' 'nasm' 'onevpl' 'xxhash' 'yasm')
provides=('onevpl-runtime')
source=("https://github.com/oneapi-src/oneVPL-cpu/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-onevpl-cpu-fix-build.patch')
sha256sums=('5512a54f5d892985d1e57655773bfa8b90642a6468fddf5385904c090583df88'
            'ee6b8f15e24a6c03337657c3b38eab0b929cc3ec539a94dd8d1d5f9a9b85b3cb')

prepare() {
    patch -d "oneVPL-cpu-${pkgver}" -Np1 -i "${srcdir}/010-onevpl-cpu-fix-build.patch"
}

build() {
    export CFLAGS+=' -ffat-lto-objects'
    export CXXFLAGS+=' -ffat-lto-objects'
    local -x PKG_CONFIG_LIBDIR="${srcdir}/deps-install/lib"
    local -x VPL_CPU_DEPS_BUILD_DIR="${srcdir}/deps-build"
    local -x VPL_BUILD_DEPENDENCIES="${srcdir}/deps-install"
    
    "oneVPL-cpu-${pkgver}/script/bootstrap" gpl
    
    export CFLAGS="${CFLAGS/ -ffat-lto-objects/}"
    export CXXFLAGS="${CXXFLAGS/ -ffat-lto-objects/}"
    
    cmake -B build -S "oneVPL-cpu-${pkgver}" \
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
