# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=onevpl-git
pkgver=2023.1.1.r0.g5d7b6af
pkgrel=1
pkgdesc='oneAPI Video Processing Library (git version)'
arch=('x86_64')
url='https://www.intel.com/content/www/us/en/developer/tools/oneapi/onevpl.html'
license=('MIT')
depends=('libdrm' 'libva' 'wayland')
optdepends=('onevpl-runtime: for runtime implementation'
            'python: for python bindings')
makedepends=('git' 'cmake' 'libx11' 'pybind11' 'python' 'wayland-protocols')
provides=('onevpl')
conflicts=('onevpl')
source=('git+https://github.com/oneapi-src/oneVPL.git')
sha256sums=('SKIP')

pkgver() {
    git -C oneVPL describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    local _pyver
    _pyver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    
    cmake -B build -S oneVPL \
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
