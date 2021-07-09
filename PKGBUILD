# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=onevpl-cpu-git
pkgver=2021.4.0.r0.g19f2e5a
pkgrel=1
pkgdesc='oneVPL runtime implementation for CPU (git version)'
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi/components/onevpl.html'
license=('MIT')
depends=('ffmpeg')
makedepends=('git' 'cmake' 'onevpl' 'svt-hevc')
provides=('onevpl-cpu' 'onevpl-runtime')
conflicts=('onevpl-cpu')
options=('!emptydirs')
source=('git+https://github.com/oneapi-src/oneVPL-cpu.git'
        '010-onevpl-cpu-fix-libs.patch'
        '020-onevpl-cpu-googletest-remove-werror.patch')
sha256sums=('SKIP'
            'ab8858a2fd1da6de829c180fdf91e41cbaa7caca71ebcb7dff377816ba42c7b0'
            'a0caaa1dd7701b6a13ebe58bc6917c4f10f787f33d4d7e53d52766ddf985b980')

prepare() {
    patch -d oneVPL-cpu -Np1 -i "${srcdir}/010-onevpl-cpu-fix-libs.patch"
    patch -d oneVPL-cpu -Np1 -i "${srcdir}/020-onevpl-cpu-googletest-remove-werror.patch"
}

pkgver() {
    git -C oneVPL-cpu describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    export VPL_BUILD_DEPENDENCIES='/usr'
    cmake -B build -S oneVPL-cpu \
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
