# Maintainer: qr243vbi
pkgname=(nekobox nekobox-core)
pkgver=5.8.13
pkgrel=1
pkgdesc="Cross-platform GUI proxy utility (Empowered by sing-box)"
arch=('x86_64')
url="https://github.com/qr243vbi/nekobox"
license=('GPL-3.0-or-later')
makedepends=('bash' 'gcc-libs' 'glibc' 'libx11' 'qt6-base' 'qt6-declarative' 'qt6-grpc')
makedepends+=('cmake' 'gendesk' 'go' 'protobuf' 'qt6-tools' 'vulkan-headers' 'cpio' 'upx')
source=("https://github.com/qr243vbi/nekobox/releases/download/${pkgver}/nekobox-unified-source-${pkgver}.tar.xz")
sha256sums=("51a664f4d1cb23b41e8efcad8038252d3a74b59f502e39062613309540376a73")


prepare() {
    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name "${pkgname^}" \
        --categories 'Network'
}


build() {
    export DEST=$PWD/build
    pushd "nekobox-unified-source-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOARCH=""
    export GOOS=linux
    export SKIP_UPDATER=y
    export GOFLAGS='-mod=vendor'
    export VERSION_SINGBOX="$(cat SingBox.Version)"
    ( bash -x script/build_go.sh ; )

    cmake -B "${DEST}" -S . \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D SKIP_UPDATE_BUTTON=ON \
        -W no-dev
    cmake --build "${DEST}"
    popd
}


package_nekobox-core() {
    depends=('gcc-libs' 'glibc')
    install -Dm755 "$DEST"/nekobox_core -t "${pkgdir}/usr/lib/NekoBox"
    upx "${pkgdir}/usr/lib/NekoBox/nekobox_core"
}

package_nekobox() {
    depends=('bash' 'gcc-libs' 'glibc' 'libx11' 'qt6-base' 'qt6-declarative' 'nekobox-core')

    install -Dm755 "$DEST"/nekobox -t "${pkgdir}/usr/lib/NekoBox"
    upx "${pkgdir}/usr/lib/NekoBox/nekobox"

    echo '#!/bin/bash -x' > "nekobox.sh"
    echo 'exec /usr/lib/NekoBox/nekobox -appdata "$@"' >> "nekobox.sh"
    install -Dm755 "nekobox.sh" "${pkgdir}/usr/bin/nekobox"
    install -Dm644 "nekobox.desktop" -t "${pkgdir}/usr/share/applications"

    cd "nekobox-unified-source-${pkgver}"
    install -Dm644 srslist.json -t "${pkgdir}/usr/lib/NekoBox"
    cp *.js "${pkgdir}/usr/lib/NekoBox"
    cp -RfvT "res/public" "${pkgdir}/usr/lib/NekoBox/public"
    echo "${pkgver}" > "${pkgdir}/usr/lib/NekoBox/version.txt"
    install -Dm644 res/public/icon.png "${pkgdir}/usr/share/pixmaps/nekobox.png"
}

