# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=onevpl-cpu
pkgver=2022.2.1
pkgrel=1
pkgdesc='oneVPL runtime implementation for CPU'
arch=('x86_64')
url='https://www.intel.com/content/www/us/en/developer/tools/oneapi/onevpl.html'
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'meson' 'nasm' 'onevpl' 'python' 'xxhash' 'yasm')
provides=('onevpl-runtime')
source=("https://github.com/oneapi-src/oneVPL-cpu/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-onevpl-cpu-fix-build.patch')
sha256sums=('f56ee98343ab97be080dadb6346cf433ef0610db8ad6c9e45bba80930aa677a1'
            'f8a04899239250cd32edde782823cf76be46249a17c3147fc29f3742a21f710c')

prepare() {
    patch -d "oneVPL-cpu-${pkgver}" -Np1 -i "${srcdir}/010-onevpl-cpu-fix-build.patch"
}

build() {
    export CFLAGS+=' -ffat-lto-objects'
    export CXXFLAGS+=' -ffat-lto-objects'
    local -x PKG_CONFIG_LIBDIR="${srcdir}/install-deps/lib"
    local -x VPL_BUILD_DEPENDENCIES="${srcdir}/install-deps"
    
    . "oneVPL-cpu-${pkgver}/script/bootstrap" gpl
    
    local _pyver
    _pyver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    
    cmake -B build -S "oneVPL-cpu-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_INSTALL_SYSCONFDIR:PATH='/etc' \
        -DCMAKE_PREFIX_PATH:PATH="${srcdir}/install-deps" \
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
