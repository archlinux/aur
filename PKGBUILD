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
        "0001-build_for_archlinux.patch")

sha512sums=('SKIP'
            'a25cc3eea393a83ed300a99dad06e23b83f31e5faa59ccda0594396b59a85b7106063f68c10a8a2f57e07b1683b7980217b6e8f37922018e2acf2d4a894ebb25')

pkgver() {
    cd ${pkgname}
    git describe --long --tags "$(git rev-list --tags --max-count=1)" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname}"
    sh -c "tools/grpc_gen.sh"
    patch -Np1 -i "${srcdir}/0001-build_for_archlinux.patch"
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
