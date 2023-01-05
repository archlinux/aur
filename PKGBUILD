# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=onevpl-cpu
pkgver=2023.1.1
pkgrel=1
pkgdesc='oneVPL runtime implementation for CPU'
arch=('x86_64')
url='https://www.intel.com/content/www/us/en/developer/tools/oneapi/onevpl.html'
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'meson' 'nasm' 'onevpl' 'python' 'xxhash' 'yasm')
provides=('onevpl-runtime')
source=("https://github.com/oneapi-src/oneVPL-cpu/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-onevpl-cpu-fix-build.patch'
        '020-onevpl-cpu-disable-gtest-werror.patch')
sha256sums=('54cef98ce56cf2d68ab0cedf84194036d484621e5cd68d502a0aac90f6b32c4b'
            'ee6b8f15e24a6c03337657c3b38eab0b929cc3ec539a94dd8d1d5f9a9b85b3cb'
            'a0caaa1dd7701b6a13ebe58bc6917c4f10f787f33d4d7e53d52766ddf985b980')

prepare() {
    patch -d "oneVPL-cpu-${pkgver}" -Np1 -i "${srcdir}/010-onevpl-cpu-fix-build.patch"
    patch -d "oneVPL-cpu-${pkgver}" -Np1 -i "${srcdir}/020-onevpl-cpu-disable-gtest-werror.patch"
}

build() {
    export CFLAGS+=' -ffat-lto-objects'
    export CXXFLAGS+=' -ffat-lto-objects'
    local -x PKG_CONFIG_LIBDIR="${srcdir}/deps-install/lib"
    local -x VPL_CPU_DEPS_BUILD_DIR="${srcdir}/deps-build"
    local -x VPL_BUILD_DEPENDENCIES="${srcdir}/deps-install"
    
    "oneVPL-cpu-${pkgver}/script/bootstrap" gpl
    
    local _pyver
    _pyver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    export CFLAGS="${CFLAGS/ -ffat-lto-objects/}"
    export CXXFLAGS="${CXXFLAGS/ -ffat-lto-objects/}"
    
    cmake -B build -S "oneVPL-cpu-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_INSTALL_SYSCONFDIR:PATH='/etc' \
        -DCMAKE_PREFIX_PATH:PATH="${srcdir}/deps-install" \
        -DBUILD_GPL_X264:BOOL='ON' \
        -DBUILD_TESTS:BOOL='ON' \
        -DONEAPI_INSTALL_LICENSEDIR:STRING="share/licenses/${pkgname}" \
        -DONEAPI_INSTALL_PYTHONDIR:STRING="lib/python${_pyver}" \
        -Wno-dev
    make -C build
}

check() {
    make -C build test
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
