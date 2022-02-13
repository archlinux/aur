# Maintainer: database64128 <free122448@hotmail.com>
# Contributor: Sam L. Yes <samlukeyes123 at gmail dot com>

pkgname=qv2ray-git
pkgver=3.0.0.rc1.r24.g2aec20c6
pkgrel=1
pkgdesc="A cross platform connection manager for V2Ray and other backends"
arch=(x86_64)
url="https://github.com/Shadowsocks-NET/Qv2ray"
license=('GPL3')
depends=('grpc' 'hicolor-icon-theme' 'libqv2ray-git' 'protobuf' 'qt6-base' 'qt6-svg')
makedepends=('cmake' 'gcc' 'git' 'grpc-cli' 'make' 'ninja' 'qt6-declarative' 'qt6-tools' 'which')
optdepends=('qt6-wayland: Wayland support (experimental)' 'v2ray: use packaged v2ray')
provides=('qv2ray')
conflicts=('qv2ray' 'xray')
source=(
    "$pkgname::git+$url.git"
    "git+https://github.com/itay-grudev/SingleApplication.git"
    "git+https://github.com/cpeditor/QCodeEditor.git"
    "git+https://github.com/danielsanfr/qt-qrcode.git"
    #"git+https://github.com/xiaokangwang/v2ray-core-1.git"
    "git+https://github.com/moodyhunter/libRoutingA.git"
    "git+https://github.com/fukuchi/libqrencode.git"
)
sha512sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    #'SKIP'
    'SKIP'
    'SKIP'
)

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

patch_gitmodules() {
    sed -i "s|https://github.com/.*/|${srcdir}/|;s|\.git||" .gitmodules
}

prepare() {
    cd "$srcdir/$pkgname"
    patch_gitmodules
    git submodule update --init \
        3rdparty/SingleApplication \
        3rdparty/QCodeEditor \
        3rdparty/qt-qrcode \
        src/plugins/routingA/core
        #src/plugins/v2ray/3rdparty/v2ray-core \
    cd 3rdparty/qt-qrcode
    patch_gitmodules
    git submodule update --init
}

build() {
    cd "$srcdir/$pkgname"
    mkdir -p build && cd build
    cmake .. \
        -DBUILD_TESTING=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
        -DQV2RAY_AUTO_UPDATE=OFF \
        -DQV2RAY_BUILD_INFO="qv2ray-git AUR package" \
        -DQV2RAY_BUILD_EXTRA_INFO="r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)" \
        -DQV2RAY_DEFAULT_VASSETS_PATH="/usr/share/v2ray" \
        -DQV2RAY_DEFAULT_VCORE_PATH="/usr/bin/v2ray" \
        -DQV2RAY_QV2RAYBASE_PROVIDER=package \
        -GNinja
    cmake --build . --parallel
}

package() {
    cd "$srcdir/$pkgname/build"
    cmake --install .
}
