# Maintainer: DuckVador<qvssr@protonmail.com>
pkgname=qvssr
pkgver=2.1.2
pkgrel=1
pkgdesc="A fork of qv2ray which add support of shadowsocksr"
arch=('x86_64')
url='https://github.com/DuckVador/qvssr'
license=('GPL3')
depends=('hicolor-icon-theme' 'qt5-base>5.11.0' 'grpc>=1.27.0')
optdepends=('v2ray: use system v2ray')
makedepends=('git' 'make' 'qt5-tools' 'which' 'gcc' 'qt5-declarative' 'grpc-cli>=1.27.0')
provides=('qvssr')
source=("qvssr::git+${url}#branch=master")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/qvssr"
    printf "%s" $(cat ${srcdir}/qvssr/makespec/VERSION)
}

prepare() {
    cd "${srcdir}/qvssr"
    git submodule init
    git config submodule."libs/libqvb".active false
    git submodule update
}

build() {
    cd "${srcdir}/qvssr"
    mkdir -p build && cd build
    qmake 'CONFIG += use_grpc'  PREFIX=/usr ../
    make
}

package() {
    cd "${srcdir}/qvssr"
    install -Dm755 build/qvssr "${pkgdir}/usr/bin/qvssr"
    install -Dm644 assets/qvssr.desktop "${pkgdir}/usr/share/applications/qvssr.desktop"
    install -Dm644 assets/icons/ssw128.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/qvssr.png"
}

