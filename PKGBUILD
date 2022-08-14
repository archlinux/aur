# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=onevpl-cpu-git
pkgver=2022.2.1.r0.ga091605
pkgrel=1
pkgdesc='oneVPL runtime implementation for CPU (git version)'
arch=('x86_64')
url='https://www.intel.com/content/www/us/en/developer/tools/oneapi/onevpl.html'
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'meson' 'nasm' 'onevpl' 'python' 'xxhash' 'yasm')
provides=('onevpl-cpu' 'onevpl-runtime')
conflicts=('onevpl-cpu')
source=('git+https://github.com/oneapi-src/oneVPL-cpu.git'
        '010-onevpl-cpu-fix-build.patch')
sha256sums=('SKIP'
            'b3d77713f62240140fe743e2bf6cd747469c8c070b18f31f0efc572c68af20ca')

prepare() {
    patch -d oneVPL-cpu -Np1 -i "${srcdir}/010-onevpl-cpu-fix-build.patch"
}

pkgver() {
    git -C oneVPL-cpu describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    export CFLAGS+=' -ffat-lto-objects'
    export CXXFLAGS+=' -ffat-lto-objects'
    local -x PKG_CONFIG_LIBDIR="${srcdir}/deps-install/lib"
    local -x VPL_CPU_DEPS_BUILD_DIR="${srcdir}/deps-build"
    local -x VPL_BUILD_DEPENDENCIES="${srcdir}/deps-install"
    
    oneVPL-cpu/script/bootstrap gpl
    
    local _pyver
    _pyver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    export CFLAGS="${CFLAGS/ -ffat-lto-objects/}"
    export CXXFLAGS="${CXXFLAGS/ -ffat-lto-objects/}"
    
    cmake -B build -S oneVPL-cpu \
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
