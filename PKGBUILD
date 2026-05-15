# Maintainer: asamk <asamk@gmx.de>

pkgname=3dmmex
_pkgname=3DMMEx
pkgver=0.5.0
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
sha512sums=('d70faa308c009ace350e25fe57b05d9eea42eec92629f9fb09248b57faf5efea25dd0ed93de07fc41e114d0533cb040855dbaa7bd67d9f9516b2e395ec19108c'
            'b10af6d99e5083f9bf6986e3b65f502372b1ccfc68d87f931eeda4c3b623f1a039434a2de5bad92b8f7cf6295729bc836a75f4712ef1ebd8e8cfe80ea40625b8'
            '28cb710e08cf92ba5991c83c29c4feea412060cabee51de4a1d59b9a6480711014a12a7877578da9bedd729a5d953aa230f0869ded2962a45e07d984988dd5b8'
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
        --preset "sdl-${arch}-gcc-linux-release"
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
