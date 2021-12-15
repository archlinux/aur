# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=onevpl-cpu
pkgver=2022.0.0
pkgrel=1
pkgdesc='oneVPL runtime implementation for CPU'
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi/components/onevpl.html'
license=('MIT')
depends=('ffmpeg')
makedepends=('cmake' 'onevpl' 'svt-hevc')
options=('!emptydirs')
provides=('onevpl-runtime')
source=("https://github.com/oneapi-src/oneVPL-cpu/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-onevpl-cpu-fix-libs.patch'
        '020-onevpl-cpu-googletest-remove-werror.patch')
sha256sums=('6f143db3db1f0c6c6d8eb5833fdd5da4627602ceafaf93b4eeee65796bf54cc2'
            'ab8858a2fd1da6de829c180fdf91e41cbaa7caca71ebcb7dff377816ba42c7b0'
            'a0caaa1dd7701b6a13ebe58bc6917c4f10f787f33d4d7e53d52766ddf985b980')

prepare() {
    patch -d "oneVPL-cpu-${pkgver}" -Np1 -i "${srcdir}/010-onevpl-cpu-fix-libs.patch"
    patch -d "oneVPL-cpu-${pkgver}" -Np1 -i "${srcdir}/020-onevpl-cpu-googletest-remove-werror.patch"
}

build() {
    export VPL_BUILD_DEPENDENCIES='/usr'
    cmake -B build -S "oneVPL-cpu-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_TESTS:BOOL='OFF' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -d -m755 "${pkgdir}/usr/share/licenses"
    mv "${pkgdir}/usr/share/doc/oneVPL-cpu" "${pkgdir}/usr/share/licenses/${pkgname}"
}
