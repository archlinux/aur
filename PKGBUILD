# Maintainer: Stephen Seo <seo.disparate@gmail.com>
pkgname=mpd_info_screen2
pkgver=1.24.14
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
    "raylib-6.2.tar.gz::https://github.com/raysan5/raylib/archive/refs/tags/6.2.tar.gz"
)
sha256sums=(
    '6a5732438dea3df4ce9104b739d9b8a2532619cd38d68f940f522c1d8c09b410'
    'df7a13129b1bec9e73a6962efff170beba310ee6eab8f94cd000b7316b4db5ee'
)

prepare() {
    # Use source provided "Raylib" to prevent re-downloading it when building.
    install -D -m644 "${srcdir}/raylib-6.2.tar.gz" "${srcdir}/${pkgname}/third_party/raylib-6.2.tar.gz"

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
