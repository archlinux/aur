# Maintainer: Hork <aliyuchang33@outlook.com>
# Contributer: ArielAxionL <i at axionl dot me>
pkgname=qv2ray-dev-git
pkgver=1.3.8.0.r0.g5135091
pkgrel=1
pkgdesc="Qt cross platform v2ray GUI client (Dev branch build release)"
arch=('x86_64')
url="https://github.com/lhy0403/Qv2ray"
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme' 'grpc' 'v2ray')
makedepends=('git' 'make' 'qt5-tools' 'protobuf')
optdepends=('v2ray' 'v2ray-domain-list-community' 'v2ray-geoip')
provides=('qv2ray')
conflicts=('qv2ray')
source=("${pkgname}::git+https://github.com/lhy0403/Qv2ray#branch=dev"
        "0001-build-for-Arch-Linux.patch")
sha512sums=('SKIP'
            '71a321ed94eba421a19b3689f93faa4da3a56438a06823bc6560e2aa078ac0f453db31e815c22185252dddcf0bae8704588ce1865a4611a08fee501c6484d686')

pkgver() {
    cd ${pkgname}
    git describe --long --tags "$(git rev-list --tags --max-count=1)" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname}"
    sh -c "tools/grpc_gen.sh"
    patch -Np1 -i "${srcdir}/0001-build-for-Arch-Linux.patch"
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
