# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=onevpl-git
pkgver=2021.4.0.r0.gd5c0725
pkgrel=1
pkgdesc='oneAPI Video Processing Library (git version)'
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi/components/onevpl.html'
license=('MIT')
depends=('libva')
optdepends=('onevpl-runtime: for runtime implementation'
            'python: for python bindings')
makedepends=('git' 'cmake' 'libdrm' 'pybind11' 'python' 'libx11')
provides=('onevpl')
conflicts=('onevpl')
options=('!emptydirs')
source=('git+https://github.com/oneapi-src/oneVPL.git')
sha256sums=('SKIP')

pkgver() {
    git -C oneVPL describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S oneVPL \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_PYTHON_BINDING:BOOL='ON' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -d -m755 "${pkgdir}/usr/share/licenses"
    mv "${pkgdir}/usr/share/doc/oneVPL" "${pkgdir}/usr/share/licenses/${pkgname}"
    
    local _pyver
    _pyver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    mv "${pkgdir}/usr/lib/python"{,"$_pyver"}
}
