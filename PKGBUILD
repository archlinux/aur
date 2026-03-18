# Maintainer: Stephen Seo <seo.disparate@gmail.com>
pkgname=mpd_info_screen2
pkgver=1.19
pkgrel=1
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
    "raylib::git+https://github.com/raysan5/raylib.git#tag=${_raylib_ver}"
)
sha256sums=(SKIP SKIP)

prepare() {
    mkdir -p "${srcdir}/${pkgname}/third_party/"

    # Use git provided "Raylib" to prevent re-downloading it when building.
    cd "${srcdir}"
    ln -s raylib "raylib-${_raylib_ver}"
    tar -chf "${srcdir}/${pkgname}/third_party/raylib-${_raylib_ver}.tar.gz" --exclude='*.git*' "raylib-${_raylib_ver}"
    cd "${srcdir}/${pkgname}"
    sha256sum "third_party/raylib-${_raylib_ver}.tar.gz" > "third_party/raylib-5.5_SHA256SUMS.txt"

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
