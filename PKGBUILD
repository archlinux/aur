# Maintainer: Hork <aliyuchang33@outlook.com>
# Contributer: ArielAxionL <i at axionl dot me>
pkgname=qv2ray-dev-git
pkgver=1.3.8.0.r0.g4179cf2
pkgrel=2
pkgdesc="Qt cross platform v2ray GUI client (Dev branch build release)"
arch=('x86_64')
url="https://github.com/lhy0403/Qv2ray"
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme' 'grpc' 'v2ray')
makedepends=('git' 'make' 'qt5-tools' 'protobuf' 'which' 'gcc')
optdepends=('v2ray' 'v2ray-domain-list-community' 'v2ray-geoip')
provides=('qv2ray')
conflicts=('qv2ray')
source=("${pkgname}::git+https://github.com/lhy0403/Qv2ray#branch=dev"
        "0001-modify-exec-path-for-qv2ray.desktop.patch"
        "0002-modify-the-config-path-for-qv2ray.patch")

sha512sums=('SKIP'
            'f64f12d0c2be516aba033f3d6f31541bbcaebecb0d4e3eebce5aac0625fa1c41802e929a930601236899d1b19e01ceba167730568f9bc4d5b916bd5c636a58b5'
            '181e58c0314ff29605583069c8d14f69a9e2fa3e3c4943144989811f3c19489426ba958496fccb89fc92c5eca73fe15c74577fe1426d17191c290d9dd1a6d376')

pkgver() {
    cd ${pkgname}
    git describe --long --tags "$(git rev-list --tags --max-count=1)" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname}"
    sh -c "tools/grpc_gen.sh"
    local src
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        [[ $src = *.patch ]] || continue
        msg2 "Applying patch $src..."
        patch -Np1 < "../$src"
    done
}

build() {
    cd "${srcdir}/${pkgname}"
    git submodule update --init
    mkdir -p build && cd build
    qmake ../
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 build/Qv2ray "${pkgdir}/usr/bin/qv2ray"
    install -Dm644 icons/Qv2ray.desktop "${pkgdir}/usr/share/applications/Qv2ray.desktop"
    install -Dm644 icons/Qv2ray.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/Qv2ray.png"
}
