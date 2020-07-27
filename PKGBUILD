pkgname=trojan-qt5
pkgver=1.4.0
pkgrel=1
pkgdesc="A cross-platform ss/ssr/vmess/trojan GUI client"
arch=('x86_64')
url='https://github.com/Trojan-Qt5/Trojan-Qt5'
license=('GPL3')
depends=('qt5-base>5.11.0', 'grpc>=1.27.0', 'libuv>=1.34.2', 'libsodium>=1.0.17', 'qrencode>=3.4.4', 'zbar>=0.10.0', 'yaml-cpp>=0.6.2', 'openssl>=1.1.1d', 'zlib>=1.12.1', 'icu>=60.2', 'bzip2>=1.0.6')
makdedepends=('git', 'make', 'gcc', 'qt5-tools', 'go>=1.14.3', 'grpc-cli>=1.27.0', 'qt5-declarative', 'which')
provides=('trojan-qt5')
conflicts=('trojan-qt5')
source=(
    "Trojan-Qt5::git+https://github.com/Trojan-Qt5/Trojan-Qt5#tag=v${pkgver}"
)
sha512sums=(
    'SKIP'
)

prepare() {
    cd "${srcdir}/Trojan-Qt5"
    git submodule update --init --recursive
}

build() {
    export _TROJAN_QT5_BUILD_INFO_='Trojan-Qt5 from AUR'
    cd "${srcdir}/Trojan-Qt5/3rd/trojan-qt5-core"
    go build --tags 'api client router' -buildmode=c-archive
    cd "${srcdir}/Trojan-Qt5"
    mkdir -p build && cd build
    qmake .. CONFIG+=release PREFIX="${pkgdir}/usr"
    make
}

package() {
    cd "${srcdir}/Trojan-Qt5/build"
    make install PREFIX="${pkgdir}/usr"
}
