# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=onevpl-intel-gpu
pkgver=23.1.2
pkgrel=1
pkgdesc='oneVPL runtime implementation for Intel GPUs (Tiger Lake and newer)'
arch=('x86_64')
url='https://www.intel.com/content/www/us/en/developer/tools/oneapi/onevpl.html'
license=('MIT')
depends=('intel-media-driver' 'libdrm' 'libva')
makedepends=('cmake')
provides=('onevpl-runtime')
source=("https://github.com/oneapi-src/oneVPL-intel-gpu/archive/intel-onevpl-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-onevpl-intel-gpu-disable-verbose-makefile.patch')
sha256sums=('02f2dbfa9fc4c1c2b221ccb32e5c9e1abaf8d02bfdcc9b6e3c3c599eeb558224'
            'c6b17b7026d16d02c3cab7b5081366c24021a86fa173eaee5db310691ce76879')

prepare() {
    patch -d "oneVPL-intel-gpu-intel-onevpl-${pkgver}" -Np1 -i "${srcdir}/010-onevpl-intel-gpu-disable-verbose-makefile.patch"
}

build() {
    cmake -B build -S "oneVPL-intel-gpu-intel-onevpl-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_TESTS:BOOL='OFF' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "oneVPL-intel-gpu-intel-onevpl-${pkgver}"/{LICENSE,NOTICE} -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
