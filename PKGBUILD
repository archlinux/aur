# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=mpeghdec-git
pkgver=3.0.1.r0.g5f8e051
pkgrel=1
pkgdesc='Fraunhofer MPEG-H audio decoder (git version)'
arch=('x86_64')
url='https://mpegh.com/'
license=('LicenseRef-Custom')
depends=(
    'glibc')
makedepends=(
    'cmake'
    'git')
provides=('mpeghdec')
conflicts=('mpeghdec')
source=('git+https://github.com/Fraunhofer-IIS/mpeghdec.git')
sha256sums=('SKIP')

pkgver() {
    git -C mpeghdec describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^r//'
}

build() {
    cmake -B build -S mpeghdec \
        -G 'Unix Makefiles' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Dmpeghdec_BUILD_BINARIES:BOOL='OFF' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 mpeghdec/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/pkgconfig" "${pkgdir}/usr/lib"
}
