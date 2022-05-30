# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=onevpl
pkgver=2022.1.4
pkgrel=1
pkgdesc='oneAPI Video Processing Library'
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi/components/onevpl.html'
license=('MIT')
depends=('libva')
optdepends=('onevpl-runtime: for runtime implementation'
            'python: for python bindings')
makedepends=('cmake' 'libdrm' 'pybind11' 'python' 'libx11' 'wayland-protocols')
options=('!emptydirs')
source=("https://github.com/oneapi-src/oneVPL/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('939f158ea7f011be14069326ee0a95be1776c364032e6ca800b01d2f2b2e9597')

build() {
    cmake -B build -S "oneVPL-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_INSTALL_SYSCONFDIR:PATH='/etc' \
        -DBUILD_PYTHON_BINDING:BOOL='ON' \
        -DBUILD_EXAMPLES:BOOL='OFF' \
        -DINSTALL_EXAMPLE_CODE:BOOL='OFF' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -d -m755 "${pkgdir}/usr/share/licenses"
    mv "${pkgdir}/usr/share/vpl/licensing" "${pkgdir}/usr/share/licenses/${pkgname}"
    
    local _pyver
    _pyver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    mv "${pkgdir}/usr/lib/python"{,"$_pyver"}
    mv "${pkgdir}/usr/bin"/{,vpl-}sample_decode
    mv "${pkgdir}/usr/bin"/{,vpl-}sample_encode
    mv "${pkgdir}/usr/bin"/{,vpl-}sample_multi_transcode
}
