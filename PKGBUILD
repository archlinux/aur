# Maintainer: taotieren <admin@taotieren.com>

pkgname=serial-studio
_pkgname=Serial-Studio
pkgver=4.0.1
pkgrel=1
pkgdesc="Multi-purpose serial data visualization & processing program"
arch=($CARCH)
url="https://github.com/Serial-Studio/Serial-Studio"
license=('GPL-3.0-only')
groups=()
_qt=qt6
depends=(
    expat
    glibc
    libgcc
    libglvnd
    libstdc++
    $_qt-5compat
    $_qt-base
    $_qt-declarative
    $_qt-connectivity
    $_qt-graphs
    $_qt-positioning
    $_qt-quick3d
    $_qt-serialport
    $_qt-shadertools
    $_qt-svg
    $_qt-webengine
    zlib
)
makedepends=(
    cmake
    git
    ninja
    openssl
    $_qt-canvaspainter 
    $_qt-tools
    pkgconf
    vulkan-headers
)
provides=(${_pkgname} ${pkgname})
conflicts=(${_pkgname} ${pkgname})
replaces=()
backup=()
options=()
install=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('e820d6b464618d4c8216a2d84f1607d7c077a0a4ade2558197c5ee185420cc0d')
noextract=()

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}"
    sed -i -e 's/^X-AppImage.*//g' app/deploy/linux/serial-studio-gpl3.desktop
}

build() {
    cd "$srcdir/${pkgname}"

    cmake -DCMAKE_BUILD_TYPE=Release \
        -DPRODUCTION_OPTIMIZATION=ON \
        -DUSE_SYSTEM_ZLIB=ON \
        -DUSE_SYSTEM_EXPAT=ON \
        -DCMAKE_SKIP_RPATH=OFF \
        -B build \
        -G Ninja \
        -Wno-dev

    ninja -C build
}

package() {
    cd "$srcdir/${pkgname}"
    install -vDm644 LICENSE.* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -vDm644 LICENSES/* -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES/"
    install -vDm755 build/app/serial-studio-gpl3 -t "${pkgdir}/usr/bin/"
    install -vDm644 app/deploy/linux/serial-studio-gpl3.desktop -t "${pkgdir}/usr/share/applications/"
    install -vDm644 app/deploy/linux/serial-studio-gpl3.svg -t "${pkgdir}/usr/share/pixmaps/"
    install -vDm644 app/deploy/linux/serial-studio.metainfo.xml -t "${pkgdir}/usr/share/metainfo/"
    install -vDm644 app/deploy/linux/serial-studio-ssproj.xml -t "${pkgdir}/usr/share/metainfo/"
}

