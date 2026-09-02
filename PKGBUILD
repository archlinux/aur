# Maintainer: taotieren <admin@taotieren.com>

pkgname=serial-studio
pkgver=4.1.0
pkgrel=1
pkgdesc="Multi-purpose serial data visualization & processing program"
arch=($CARCH)
url="https://github.com/Serial-Studio/Serial-Studio"
license=('GPL-3.0-only')
groups=()
_qt=qt6
depends=(
    abseil-cpp
    c-ares
    expat
    glibc
    libgcc
    libglvnd
    libstdc++
    grpc
    openssl
    protobuf
    $_qt-5compat
    $_qt-base
    $_qt-declarative
    $_qt-connectivity
    $_qt-graphs
    $_qt-quick3d
    $_qt-positioning
    $_qt-serialport
    $_qt-shadertools
    $_qt-svg
    $_qt-webchannel
    $_qt-webengine
    $_qt-websockets
    re2
    systemd-libs
    zlib
)
makedepends=(
    cmake
    git
    ninja
    $_qt-canvaspainter 
    $_qt-tools
    pkgconf
    vulkan-headers
)
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
backup=()
options=(!lto)
install=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('da883c111e1edd0c79add96ec85273410498cddd93687c1ab8e82a714ea9e9ac')
noextract=()

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}"
    sed -i -e 's/^X-AppImage.*//g' app/deploy/linux/serial-studio-gpl3.desktop

    git cherry-pick -n 7678839b8c835fb9a5be7d2573b4cee550aba23c
}

build() {
    cd "$srcdir/${pkgname}"

    cmake -DCMAKE_BUILD_TYPE=Release \
        -DENABLE_GRPC=ON \
        -DUSE_SYSTEM_ZLIB=ON \
        -DUSE_SYSTEM_EXPAT=ON \
        -DCMAKE_SKIP_RPATH=OFF \
        -B build \
        -G Ninja \
        -Wno-author

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

