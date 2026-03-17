# Maintainer: qr243vbi

pkgname=(nekobox nekobox-core)
pkgver=5.10.27
pkgrel=1
pkgdesc="Cross-platform GUI proxy utility (Empowered by sing-box)"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/qr243vbi/nekobox"
license=('GPL-3.0-or-later')
makedepends=('bash' 'gcc-libs' 'glibc' 'libx11' 'qt6-base' 'qt6-declarative' 'thrift' 'boost')
makedepends+=('cmake' 'gendesk' 'go' 'qt6-tools' 'vulkan-headers' 'cpio' 'upx' 'boost-libs')
source=("https://github.com/qr243vbi/nekobox/releases/download/${pkgver}/nekobox-unified-source-${pkgver}.tar.xz")
sha256sums=("fc44faef4eb7635037c3116737cf56572c651c828c88876a87710b65d2bdd7a1")

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
        -D "NKR_DEFAULT_VERSION=${pkgver}" \
        -W no-dev
    cmake --build "${DEST}"
    popd
}


package_nekobox-core() {
    depends=('gcc-libs' 'glibc')
    provides=('sing-box')
    conflicts=('sing-box')
    install -Dm755 "$DEST"/nekobox_core -t "${pkgdir}/usr/lib/Iblis"
    upx "${pkgdir}/usr/lib/Iblis/nekobox_core"
}

package_nekobox() {
    depends=('bash' 'gcc-libs' 'glibc' 'libx11' 'qt6-base' 'qt6-declarative' 'nekobox-core' 'thrift' 'boost-libs')
    provides=('nekoray')
    conflicts=('nekoray')

    install -Dm755 "$DEST"/nekobox -t "${pkgdir}/usr/lib/Iblis"
    upx "${pkgdir}/usr/lib/Iblis/nekobox"

    echo '#!/bin/bash -x' > "nekobox.sh"
    echo 'exec /usr/lib/Iblis/nekobox -appdata "$@"' >> "nekobox.sh"

    echo '#!/bin/bash -x' > "sing-box.sh"
    echo 'exec /usr/lib/Iblis/nekobox_core sing-box "$@"' >> "sing-box.sh"

    install -Dm755 "nekobox.sh" "${pkgdir}/usr/bin/nekobox"
    install -Dm755 "sing-box.sh" "${pkgdir}/usr/bin/sing-box"
    install -Dm644 "nekobox.desktop" -t "${pkgdir}/usr/share/applications"

    cd "nekobox-unified-source-${pkgver}"
    install -Dm644 srslist.json -t "${pkgdir}/usr/lib/Iblis"
    cp *.js "${pkgdir}/usr/lib/Iblis"
    cp -RfvT "res/public" "${pkgdir}/usr/lib/Iblis/public"
    install -Dm644 res/public/icon.png "${pkgdir}/usr/share/pixmaps/nekobox.png"
}
