# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=sdl2-mir
pkgver=2.0.3
_ubuntu_ver=2.0.2+dfsg1
_ubuntu_rel=3ubuntu2
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 2)"
arch=(i686 x86_64)
url="http://www.libsdl.org"
license=(MIT)
depends=(glibc libxext libxrender libx11 libgl libxcursor)
makedepends=(alsa-lib mesa-mir libpulse libxrandr libxinerama wayland
             libxkbcommon)
optdepends=('alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver')
provides=("sdl2=${pkgver}")
conflicts=(sdl2)
source=("http://www.libsdl.org/release/SDL2-${pkgver}.tar.gz"
        "https://launchpad.net/ubuntu/+archive/primary/+files/libsdl2_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.debian.tar.xz")
sha512sums=('b6d2485154fbc07ab86a4305485e116d35fac25a97033b9e1c65ee0eb8251a18209cb1de3a914d9c0ddc53aa1ffac66c865b111d218e79eb5a10ed00dfec7540'
            '7b1eb554db0c21c3d32ebe03cb76457b01530c18a44254a427ddce1c92e24807a06de7933a5fb9eef3a7b51abf8ca52f42bd0ce0d10bbfb847131a1d1335dec4')

prepare() {
    for i in $(grep -v '#' debian/patches/series); do
        patch -p1 -i "${srcdir}/debian/patches/${i}" -d SDL2-${pkgver}
    done

    mkdir build
}

build() {
    pushd SDL2-${pkgver}
    ./autogen.sh
    popd

    cd build
    ../SDL2-${pkgver}/configure \
        --prefix=/usr \
        --enable-sdl-dlopen \
        --disable-arts \
        --disable-esd \
        --disable-nas \
        --enable-alsa \
        --enable-pulseaudio-shared \
        --enable-video-wayland \
        --enable-video-mir \
        --enable-mir-shared \
        --disable-rpath
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}/" install
    install -Dm644 ../SDL2-${pkgver}/COPYING.txt \
        "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
