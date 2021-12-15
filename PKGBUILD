# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=onevpl
pkgver=2022.0.0
pkgrel=1
pkgdesc='oneAPI Video Processing Library'
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi/components/onevpl.html'
license=('MIT')
depends=('libva')
optdepends=('onevpl-runtime: for runtime implementation'
            'python: for python bindings')
makedepends=('cmake' 'libdrm' 'pybind11' 'python' 'libx11')
options=('!emptydirs')
source=("https://github.com/oneapi-src/oneVPL/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('81c545ed05165f530d7fd5f9804376d048aa626cadb487761dd81b3b99e9383e')

build() {
    cmake -B build -S "oneVPL-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_PYTHON_BINDING:BOOL='ON' \
        -DBUILD_EXAMPLES:BOOL='OFF' \
        -DINSTALL_EXAMPLE_CODE:BOOL='OFF' \
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
    mv "${pkgdir}/usr/bin"/{,vpl-}sample_decode
    mv "${pkgdir}/usr/bin"/{,vpl-}sample_encode
    mv "${pkgdir}/usr/bin"/{,vpl-}sample_multi_transcode
}
