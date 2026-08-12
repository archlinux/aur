# Maintainer: Stephen Seo <seo.disparate@gmail.com>
pkgname=mpd_info_screen2
pkgver=1.24.3
pkgrel=1
pkgdesc="Views graphical info on MPD, the successor to mpd_info_screen, in C++"
arch=(x86_64)
url="https://github.com/Stephen-Seo/mpd_info_screen2"
license=('ISC')
depends=(glfw fontconfig libx11 libxrandr)
makedepends=(git cmake)
options=()
install=
changelog=
source=(
    "${pkgname}::git+https://github.com/Stephen-Seo/mpd_info_screen2.git#tag=${pkgver}"
    "raylib-6.0.tar.gz::https://github.com/raysan5/raylib/archive/refs/tags/6.0.tar.gz"
)
sha256sums=(
    '1c21f1f1d90d210bafac54474a6c2e9c58001355dfbe9c0d726abc44d4b05818'
    '2b3ee1e2120c7a0796b33062c7e9a694dd8a8caa56a96319ac8c8ecf54a90d0b'
)

prepare() {
    # Use source provided "Raylib" to prevent re-downloading it when building.
    install -D -m644 "${srcdir}/raylib-6.0.tar.gz" "${srcdir}/${pkgname}/third_party/raylib-6.0.tar.gz"

    cd "${srcdir}/${pkgname}"
    cmake -S . -B BuildRel \
        -DCMAKE_BUILD_TYPE=Release \
        -DUSE_EXTERNAL_GLFW=On \
        -DFORCE_DEBUG_FLAG=On \
        -DMPD_INFO_SCREEN_2_VERSION="${pkgver}-${pkgrel} (AUR)"
}

build() {
    make -C "${pkgname}/BuildRel"
}

check() {
    "${pkgname}/BuildRel/unittests"
}

package() {
    install -D -m 755 "${pkgname}/BuildRel/mpd_info_screen2" "${pkgdir}/usr/bin/mpd_info_screen2"
    install -D -m 644 "${pkgname}/man/mpd_info_screen2.1" "${pkgdir}/usr/share/man/man1/mpd_info_screen2.1"
}
