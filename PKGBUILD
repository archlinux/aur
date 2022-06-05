# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=onevpl-cpu-git
pkgver=2022.1.4.r0.g83a0537
pkgrel=2
pkgdesc='oneVPL runtime implementation for CPU (git version)'
arch=('x86_64')
url='https://www.intel.com/content/www/us/en/developer/tools/oneapi/onevpl.html'
license=('MIT')
depends=('ffmpeg')
makedepends=('git' 'cmake' 'onevpl' 'openh264' 'svt-hevc')
provides=('onevpl-cpu' 'onevpl-runtime')
conflicts=('onevpl-cpu')
options=('!emptydirs')
source=('git+https://github.com/oneapi-src/oneVPL-cpu.git'
        '010-onevpl-cpu-fix-libs.patch'
        '020-onevpl-cpu-googletest-remove-werror.patch')
sha256sums=('SKIP'
            '3e27f4634dfb3b563dfec9d85082e20abbeb58bf489782e901fab102106ca7c5'
            'a0caaa1dd7701b6a13ebe58bc6917c4f10f787f33d4d7e53d52766ddf985b980')

prepare() {
    patch -d oneVPL-cpu -Np1 -i "${srcdir}/010-onevpl-cpu-fix-libs.patch"
    patch -d oneVPL-cpu -Np1 -i "${srcdir}/020-onevpl-cpu-googletest-remove-werror.patch"
}

pkgver() {
    git -C oneVPL-cpu describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    local -x VPL_BUILD_DEPENDENCIES='/usr'
    cmake -B build -S oneVPL-cpu \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_INSTALL_SYSCONFDIR:PATH='/etc' \
        -DBUILD_TESTS:BOOL='OFF' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -d -m755 "${pkgdir}/usr/share/licenses"
    mv "${pkgdir}/usr/share/oneVPL-cpu/licensing" "${pkgdir}/usr/share/licenses/${pkgname}"
}
