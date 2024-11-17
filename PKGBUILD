# Maintainer: Kirikaze Chiyuki <me@chyk.ink>
pkgname=thextech-git
pkgver=v1.3.r3842.gd142b5d2
pkgrel=1
pkgdesc="TheXTech - the modern C++ port and successor of the SMBX engine"
arch=('i386' 'x86_64' 'aarch64')
url="https://github.com/Wohlstand/TheXTech"
license=('GPLv3')
depends=('desktop-file-utils' 'sdl2' 'libjpeg-turbo' 'libpng' 'glew' 'libglvnd' 'thextech-assetpack')
makedepends=('git' 'cmake' 'p7zip')
optdepends=()
provides=('thextech')
#conflicts=()
install=${pkgname}.install
source=("git+https://github.com/Wohlstand/TheXTech"
"thextech.sh"
"thextech.desktop")
sha256sums=("SKIP"
"372d3353a49d137ee89a920dfc11762a4a0452946cbbfddce533761442f2e95b"
"b2e34a0d14af29dd18bf5ce9e341720434b13f81918cf0bd80340f175af37118")

pkgver() {
    cd "${srcdir}/TheXTech"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/lastlocal.//'
}

prepare() {
	cd "${srcdir}/TheXTech"
    git submodule init
    git submodule update
}

build() {
	cd "${srcdir}/TheXTech"
	if [ -d build ]; then rm -rf build; fi
	mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=MinSizeRel -DUSE_SYSTEM_LIBS=OFF -DUSE_STATIC_LIBC=ON -DPGE_SHARED_SDLMIXER=OFF -DUSE_FREEIMAGE_SYSTEM_LIBS=ON -DUSE_SYSTEM_SDL2=ON ..
    CFLAGS="$CFLAGS -Wno-error=format-security" CXXFLAGS="$CXXFLAGS -Wno-error=format-security" make
}

package() {
    mkdir -p "${pkgdir}/usr/share/games/TheXTech"
    mkdir -p "${pkgdir}/usr/lib/thextech"
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/TheXTech/build/output/bin/thextech" "${pkgdir}/usr/lib/thextech/thextech"
    install -Dm755 "${srcdir}/thextech.sh" "${pkgdir}/usr/bin/thextech"
    install -Dm644 "${srcdir}/TheXTech/resources/icon/thextech_128.png" "${pkgdir}/usr/share/pixmaps/thextech.png"
    install -Dm644 "${srcdir}/TheXTech/LICENSE" "${pkgdir}/usr/share/licenses/thextech/LICENSE"
    mkdir -p "${pkgdir}/usr/share/applications"
    install -Dm755 "${srcdir}/thextech.desktop" "${pkgdir}/usr/share/applications/thextech.desktop"
}
