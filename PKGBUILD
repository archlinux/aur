# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=mpeghdec
pkgver=4.0.0
pkgrel=1
pkgdesc='Fraunhofer MPEG-H audio decoder'
arch=('x86_64')
url='https://mpegh.com/'
license=('LicenseRef-Custom')
depends=(
    'glibc'
    'libgcc'
    'libstdc++')
makedepends=(
    'cmake'
    'git')
source=("https://github.com/Fraunhofer-IIS/mpeghdec/archive/r${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('62733df4f7bcd38c19c4eccafa12e789dec0c38e052a3dec46039d86d49ee17c')

build() {
    cmake -B build -S "mpeghdec-r${pkgver}" \
        -G 'Unix Makefiles' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_SKIP_RPATH:BOOL='YES' \
        -Wno-author
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m755 build/bin/* -t "${pkgdir}/usr/bin"
    install -D -m644 "mpeghdec-r${pkgver}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/pkgconfig" "${pkgdir}/usr/lib"
    rm -r "${pkgdir}/usr/include"/{ilo,mmtisobmff}
    rm "${pkgdir}/usr/lib"/lib{ilo,mmtisobmff}.a
    rm "${pkgdir}/usr/lib/pkgconfig"/{ilo,mmtisobmff}.pc
}
