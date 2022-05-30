# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=onevpl-cpu
pkgver=2022.1.4
pkgrel=1
pkgdesc='oneVPL runtime implementation for CPU'
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi/components/onevpl.html'
license=('MIT')
depends=('ffmpeg')
makedepends=('cmake' 'onevpl' 'openh264' 'svt-hevc')
options=('!emptydirs')
provides=('onevpl-runtime')
source=("https://github.com/oneapi-src/oneVPL-cpu/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-onevpl-cpu-fix-libs.patch'
        '020-onevpl-cpu-googletest-remove-werror.patch')
sha256sums=('88a156ec57016813297c83ea0aa30e3d631aad2e1821c3fc3e5a573d1dc21a80'
            '3e27f4634dfb3b563dfec9d85082e20abbeb58bf489782e901fab102106ca7c5'
            'a0caaa1dd7701b6a13ebe58bc6917c4f10f787f33d4d7e53d52766ddf985b980')

prepare() {
    patch -d "oneVPL-cpu-${pkgver}" -Np1 -i "${srcdir}/010-onevpl-cpu-fix-libs.patch"
    patch -d "oneVPL-cpu-${pkgver}" -Np1 -i "${srcdir}/020-onevpl-cpu-googletest-remove-werror.patch"
}

build() {
    local -x VPL_BUILD_DEPENDENCIES='/usr'
    cmake -B build -S "oneVPL-cpu-${pkgver}" \
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
