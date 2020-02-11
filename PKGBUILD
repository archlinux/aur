# Maintainer: DuckSoft <realducksoft at gmail dot com>
# Contributor: ArielAxionL <i at axionl dot me>
# Contributor: Leroy.H.Y <me at lhy0403 dot top>
# Contributor: Neboer <rubinposter at gmail dot com>
pkgname=qv2ray
pkgver=2.1.0
pkgrel=1
pkgdesc="Cross-platform V2ray Client written in Qt (Stable Release)"
arch=('x86_64')
url='https://github.com/Qv2ray/Qv2ray'
license=('GPL3')
depends=('hicolor-icon-theme' 'qt5-base>5.11.0' 'grpc>=1.27.0')
optdepends=('v2ray: use system v2ray')
makedepends=('git' 'make' 'qt5-tools' 'which' 'gcc' 'qt5-declarative' 'grpc-cli>=1.27.0')
provides=('qv2ray')
source=("Qv2ray::git+${url}#branch=master")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/Qv2ray"
    printf "%s" $(cat ${srcdir}/Qv2ray/makespec/VERSION)
}

prepare() {
    cd "${srcdir}/Qv2ray"
    git submodule init
    git config submodule."libs/libqvb".active false
    git submodule update
}

build() {
    cd "${srcdir}/Qv2ray"
    mkdir -p build && cd build
    qmake 'CONFIG += use_grpc' 'DEFINES += QV2RAY_DEFAULT_VCORE_PATH=\\\"/usr/bin/v2ray\\\"' 'DEFINES += QV2RAY_DEFAULT_VASSETS_PATH=\\\"/usr/lib/v2ray\\\"' PREFIX=/usr ../
    make
}

package() {
    cd "${srcdir}/Qv2ray"
    install -Dm755 build/qv2ray "${pkgdir}/usr/bin/qv2ray"
    install -Dm644 assets/qv2ray.desktop "${pkgdir}/usr/share/applications/qv2ray.desktop"
    install -Dm644 assets/icons/qv2ray.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/qv2ray.png"
}
