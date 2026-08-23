# Maintainer: asamk <asamk@gmx.de>

pkgname=3dmmex
_pkgname=3DMMEx
pkgver=0.7.0
pkgrel=1
pkgdesc='A classic 3D Movie Maker experience for modern systems'
arch=(x86_64)
url='https://github.com/benstone/3DMMEx'
license=(MIT)
depends=(
    fluidsynth
    fontconfig
    gtk3
    gstreamer
    gst-plugins-good
    iniparser
    miniaudio
    sdl2
    sdl2_ttf
    zenity
)
makedepends=(
    cmake
    git
    imagemagick
    ninja
)
optdepends=(
    ttf-comic-sans
    soundfont-fluid
)
source=(
    ${pkgname}-v${pkgver}.tar.gz::https://github.com/benstone/3DMMEx/archive/refs/tags/v${pkgver}.tar.gz
    cmake.patch
    fluidsynth.patch
    3dmmex.desktop
)
sha512sums=('db349fb2af529348071c2ab06b2d31b6e4630bdacc818ede67248c1e180c41c7bd87b922ce1b174101350ff6ec5e7da4c1cfaeb1893053b0d5c00f95a6a3695a'
            '95f0d388bc3bf23f96de3c3b7c8c229750f41d271e11d169742b5c199f0a2e3749389f6e1ca7d0148827d19db066575dd9c366d31d0fee3253fab487fddbe382'
            'e5d29a416f37212eefc9e4b64a8bcac044d557c283356467db6201363c28c5c8aa5f0bfd7161b8dee9fcc4086c87b01a003edce4406e7a2df93bb5cf1814ad3d'
            'a4082115e6bdc98771c3e5611442561a38194e216c95338f50069999289d4d805812ed5c97889bde8975385637c14021982719a2c4763973ceccc07e3acf9660')

prepare() {
    patch -d "${_pkgname}-${pkgver}" -p1 < cmake.patch
    patch -d "${_pkgname}-${pkgver}" -p1 < fluidsynth.patch
}

build() {
    local cmake_options=(
        -B build
        -S "${_pkgname}-${pkgver}"
        -W no-dev
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr/share/3dmmex
        --preset "sdl-relwithdebinfo"
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

check() {
    ctest --test-dir build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -d "${pkgdir}/usr/bin"
    ln -s "../share/3dmmex/3dmovie" "${pkgdir}/usr/bin/3dmovie"
    install -Dm644 "${srcdir}/3dmmex.desktop" "${pkgdir}/usr/share/applications/3dmmex.desktop"
    install -d "${pkgdir}/usr/share/icons/hicolor/48x48/apps"
    magick "${srcdir}/${_pkgname}-${pkgver}/src/studio/bmp/app.ico[5]" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/3dmmex.png"
}
