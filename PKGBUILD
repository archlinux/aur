# Maintainer: taotieren <admin@taotieren.com>

pkgname=serial-studio
pkgver=4.0.3
pkgrel=3
pkgdesc="Multi-purpose serial data visualization & processing program"
arch=($CARCH)
url="https://github.com/Serial-Studio/Serial-Studio"
license=('GPL-3.0-only')
groups=()
_qt=qt6
depends=(
    expat
    grpc
    protobuf
    $_qt-5compat
    $_qt-base
    $_qt-declarative
    $_qt-connectivity
    $_qt-graphs
    $_qt-serialport
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
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
backup=()
options=()
install=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('772f785285eccbb69a0e39695c4317c9a64554f933afbec3889c91dcccb6f013')
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
        -DENABLE_HARDENING=ON \
        -DENABLE_GRPC=ON \
        -DENABLE_PGO=ON \
        -DPGO_STAGE=GENERATE \
        -DUSE_SYSTEM_ZLIB=ON \
        -DUSE_SYSTEM_EXPAT=ON \
        -DSS_USE_MIMALLOC=OFF \
        -DWITH_WEBENGINE=ON \
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

