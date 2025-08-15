# Contributor: SummerBreeze630 <xzwf2003 AT 163 DOT com>

pkgname=lamina
pkgver=1.1.1_Beta
_pkgver_tag=${pkgver//_/-}
pkgrel=2
pkgdesc="A procedural programming language focusing on precise mathematical computation"
arch=('x86_64' 'aarch64')
url="https://github.com/Lamina-dev/Lamina"
license=('LGPL-2.1')
depends=('glibc' 'libuv')
makedepends=('cmake')

_libuv_vers=1.51.0
_libuv_url="https://github.com/libuv/libuv"
source=(
    "${pkgname}-${_pkgver_tag}.tar.gz::https://github.com/Lamina-dev/Lamina/archive/refs/tags/v${_pkgver_tag}.tar.gz"
    "libuv-${_libuv_vers}.tar.gz::${_libuv_url}/archive/refs/tags/v${_libuv_vers}.tar.gz"
)

sha256sums=(
    '05b4e12f2cb3504f30e980ec0f355f157e4de1472c002e7d3478842440e71afd'
    '27e55cf7083913bfb6826ca78cde9de7647cded648d35f24163f2d31bb9f51cd'
)

prepare() {
    rm -r Lamina-${_pkgver_tag}/external/libuv
    mv libuv-${_libuv_vers} Lamina-${_pkgver_tag}/external/libuv
}

build() {
    mkdir -p build

    cmake -B build \
        -S Lamina-${_pkgver_tag} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release

    cmake --build build \
        -j $(nproc)
}

package() {
    DESTDIR="${pkgdir}" \
        cmake --build build \
        --target install

    # remove libuv files from package
    rm ${pkgdir}/usr/lib/libuv.so* ${pkgdir}/usr/lib/libuv.a  # libs
    rm ${pkgdir}/usr/include/uv.h -r ${pkgdir}/usr/include/uv # headers
    rm -r ${pkgdir}/usr/share/doc                             # docs
    rm -r ${pkgdir}/usr/lib/cmake                             # cmake files
    rm -r ${pkgdir}/usr/lib/pkgconfig                         # pkgconfig files

    # install license
    install -Dm644 Lamina-${_pkgver_tag}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}
}
