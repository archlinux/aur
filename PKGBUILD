# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=onevpl-intel-gpu
pkgver=21.3.4
pkgrel=1
pkgdesc='oneVPL runtime implementation for Intel GPU (TigerLake and later)'
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi/components/onevpl.html'
license=('MIT')
depends=('libdrm' 'libva')
makedepends=('cmake')
provides=('onevpl-runtime')
source=("https://github.com/oneapi-src/oneVPL-intel-gpu/archive/intel-onevpl-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-onevpl-intel-gpu-disable-verbose-makefile.patch')
sha256sums=('eb1c4b1fec3c3838f59bdd3d77d7056b1ff5637fdb81da198884936ee848536f'
            'c4056b72a2c5dedb54ed19ad56cd0ff60d4dc6d8e991db3d71d18423aa19012e')

prepare() {
    patch -d "oneVPL-intel-gpu-intel-onevpl-${pkgver}" -Np1 -i "${srcdir}/010-onevpl-intel-gpu-disable-verbose-makefile.patch"
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
