# Maintainer: Stephen Seo <seo.disparate@gmail.com>
pkgname=mpd_info_screen2
pkgver=1.19
pkgrel=2
pkgdesc="Views graphical info on MPD, the successor to mpd_info_screen, in C++"
arch=(x86_64)
url="https://github.com/Stephen-Seo/mpd_info_screen2"
license=('ISC')
depends=(glfw fontconfig)
makedepends=(git cmake)
options=()
install=
changelog=
_raylib_ver=5.5
source=(
    "${pkgname}::git+https://github.com/Stephen-Seo/mpd_info_screen2.git#tag=${pkgver}"
    "raylib-5.5.tar.gz::https://github.com/raysan5/raylib/archive/refs/tags/5.5.tar.gz"
)
sha256sums=(
    SKIP
    'aea98ecf5bc5c5e0b789a76de0083a21a70457050ea4cc2aec7566935f5e258e'
)

prepare() {
    # Use source provided "Raylib" to prevent re-downloading it when building.
    install -D -m644 "${srcdir}/raylib-5.5.tar.gz" "${srcdir}/${pkgname}/third_party/raylib-5.5.tar.gz"

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
