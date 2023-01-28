# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=onevpl
pkgver=2023.1.2
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
sha256sums=('b2261cca174ce1815f3d47c647921ab17f68267c69c1e2444ff27aab7d199cbb')

build() {
    local _pyver
    _pyver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    
    cmake -B build -S "oneVPL-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_INSTALL_SYSCONFDIR:PATH='/etc' \
        -DBUILD_EXAMPLES:BOOL='OFF' \
        -DBUILD_TESTS:BOOL='ON' \
        -DINSTALL_EXAMPLE_CODE:BOOL='OFF' \
        -DONEAPI_INSTALL_LICENSEDIR:STRING="share/licenses/${pkgname}" \
        -DONEAPI_INSTALL_PYTHONDIR:STRING="lib/python${_pyver}" \
        -Wno-dev
    make -C build
}

check() {
    make -C build test
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    
    local _file
    while read -r -d '' _file
    do
        if ! grep -q '^vpl\-' <<< "$_file"
        then
            mv "${pkgdir}/usr/bin"/{,vpl-}"$_file"
        fi
    done < <(find "${pkgdir}/usr/bin" -mindepth 1 -maxdepth 1 -type f -print0 | sed -z 's|.*/||')
}
