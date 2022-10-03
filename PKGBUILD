# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=onevpl
pkgver=2022.2.4
pkgrel=1
pkgdesc='oneAPI Video Processing Library'
arch=('x86_64')
url='https://www.intel.com/content/www/us/en/developer/tools/oneapi/onevpl.html'
license=('MIT')
depends=('libdrm' 'libva' 'wayland')
optdepends=('onevpl-runtime: for runtime implementation'
            'python: for python bindings')
makedepends=('cmake' 'libx11' 'pybind11' 'python' 'wayland-protocols')
source=("https://github.com/oneapi-src/oneVPL/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b8af78b0a59623d8a1dd556f5efd5b3ad395426615bec043289c34e729769d36')

build() {
    local _pyver
    _pyver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    
    cmake -B build -S "oneVPL-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_INSTALL_SYSCONFDIR:PATH='/etc' \
        -DBUILD_PYTHON_BINDING:BOOL='ON' \
        -DBUILD_EXAMPLES:BOOL='OFF' \
        -DBUILD_TESTS:BOOL='ON' \
        -DINSTALL_EXAMPLE_CODE:BOOL='OFF' \
        -DONEAPI_INSTALL_LICENSEDIR:STRING="share/licenses/${pkgname}" \
        -DONEAPI_INSTALL_PYTHONDIR:STRING="lib/python${_pyver}" \
        -DPYTHON_INSTALL_DIR:STRING="lib/python${_pyver}" \
        -Wno-dev
    make -C build
}

check() {
    make -C build test
}

package() {
    make -C build DESTDIR="$pkgdir" install
    
    local _file
    while read -r -d '' _file
    do
        if ! grep -q '^vpl\-' <<< "$_file"
        then
            mv "${pkgdir}/usr/bin"/{,vpl-}"$_file"
        fi
    done < <(find "${pkgdir}/usr/bin" -mindepth 1 -maxdepth 1 -type f -print0 | sed -z 's|.*/||')
}
