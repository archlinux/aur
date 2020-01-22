# Maintainer: Hork <aliyuchang33@outlook.com>
# Contributer: ArielAxionL <i at axionl dot me>
# Contributor: DuckSoft <realducksoft@gmail.com>
pkgname=qv2ray-dev-git
pkgver=1.99.6.3054+grpcfree
pkgrel=1
pkgdesc="Cross-platform V2ray Client written in Qt (Development Release)"
arch=('x86_64')
url='https://github.com/Qv2ray/Qv2ray'
license=('GPL3')
depends=(
    'hicolor-icon-theme' 'qt5-charts>5.11.0'
    'v2ray' 'v2ray-domain-list-community' 'v2ray-geoip'
)
makedepends=('git' 'make' 'qt5-tools' 'which' 'gcc' 'qt5-declarative' 'go')
provides=('qv2ray')
conflicts=('qv2ray')

source=(
    'Qv2ray::git+https://github.com/Qv2ray/Qv2ray#branch=dev'
    'QNodeEditor::git+https://github.com/lhy0403/QNodeEditor'
    'SingleApplication::git+https://github.com/itay-grudev/SingleApplication'
    'x2struct::git+https://github.com/xyz347/x2struct'
    'qzxing::git+https://github.com/ftylitak/qzxing'
    'qhttpserver::git+https://github.com/nikhilm/qhttpserver'
    'QvRPCBridge::git+https://github.com/Qv2ray/QvRPCBridge'
)

sha512sums=(
    'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)

pkgver() {
    printf "%s.%s+grpcfree" $(grep 'VERSION = ' ${srcdir}/Qv2ray/Qv2ray.pro | cut -d ' ' -f 3 | cut -d '.' -f 1,2,3) $(cat ${srcdir}/Qv2ray/Build.Counter)
}

prepare() {
    submodules=('QNodeEditor' 'SingleApplication' 'x2struct' 'qzxing' 'qhttpserver')
    for module in ${submodules[@]}; do
        rm -rf "${srcdir}/Qv2ray/3rdparty/$module"
        ln -sfd "${srcdir}/$module" "${srcdir}/Qv2ray/3rdparty/"
    done
    
    rm -rf "${srcdir}/Qv2ray/libs/libqvb"
    ln -sfd "${srcdir}/QvRPCBridge" "${srcdir}/Qv2ray/libs/libqvb"
}

build() {
    cd "${srcdir}/QvRPCBridge"
    chmod +x ./build.sh && ./build.sh
    ln -sf "${srcdir}/QvRPCBridge/build/libqvb.a" "${srcdir}/Qv2ray/libs/libqvb-linux64.a"

    cd "${srcdir}/Qv2ray"
    mkdir -p build && cd build
    qmake 'CONFIG += with_new_backend' 'DEFINES += QV2RAY_DEFAULT_VCORE_PATH=\\\"/usr/bin/v2ray\\\"' 'DEFINES += QV2RAY_DEFAULT_VASSETS_PATH=\\\"/usr/lib/v2ray\\\"' PREFIX=/usr ../
    make
}

package() {
    cd "${srcdir}/Qv2ray"
    install -Dm755 build/qv2ray "${pkgdir}/usr/bin/qv2ray"
    install -Dm644 assets/qv2ray.desktop "${pkgdir}/usr/share/applications/qv2ray.desktop"
    install -Dm644 assets/icons/qv2ray.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/qv2ray.png"
}
