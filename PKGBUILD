# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=onevpl-intel-gpu
pkgver=22.1.0
pkgrel=1
pkgdesc='oneVPL runtime implementation for Intel GPU (TigerLake and later)'
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi/components/onevpl.html'
license=('MIT')
depends=('libdrm' 'libva')
makedepends=('cmake')
provides=('onevpl-runtime')
source=("https://github.com/oneapi-src/oneVPL-intel-gpu/archive/intel-onevpl-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-onevpl-intel-gpu-disable-verbose-makefile.patch'
        '020-onevpl-intel-gpu-gcc11-fix.patch'::'https://github.com/oneapi-src/oneVPL-intel-gpu/commit/a8702a9eb94a306ec8f592b5fcac41c84564f7c4.patch')
sha256sums=('730f8241cec6259228455840e817194cd12df5842f0caa3b605e7998f70ca5c1'
            'c6b17b7026d16d02c3cab7b5081366c24021a86fa173eaee5db310691ce76879'
            '1d9bb5952dc818c12642544226717a097e363c096020105d3534b8ad3ee532bd')

prepare() {
    patch -d "oneVPL-intel-gpu-intel-onevpl-${pkgver}" -Np1 -i "${srcdir}/010-onevpl-intel-gpu-disable-verbose-makefile.patch"
    patch -d "oneVPL-intel-gpu-intel-onevpl-${pkgver}" -Np1 -i "${srcdir}/020-onevpl-intel-gpu-gcc11-fix.patch"
}

build() {
    cmake -B build -S "oneVPL-intel-gpu-intel-onevpl-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_TESTS:BOOL='ON' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 "oneVPL-intel-gpu-intel-onevpl-${pkgver}"/{LICENSE,NOTICE} -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
