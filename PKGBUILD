# Maintainer: database64128 <free122448@hotmail.com>
pkgname=qv2ray-git
pkgver=3.0.0.rc1.r18.gdac7ed16
pkgrel=1
pkgdesc="A cross platform connection manager for V2Ray and other backends"
arch=(x86_64)
url="https://github.com/Shadowsocks-NET/Qv2ray"
license=('GPL3')
depends=('grpc' 'hicolor-icon-theme' 'protobuf' 'qt6-base' 'qt6-svg')
makedepends=('cmake' 'gcc' 'git' 'grpc-cli' 'make' 'ninja' 'qt6-declarative' 'qt6-tools' 'which')
optdepends=('qt6-wayland: Wayland support (experimental)' 'v2ray: use packaged v2ray')
provides=('qv2ray')
conflicts=('qv2ray' 'xray')
source=("$pkgname::git+$url.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$pkgname"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/$pkgname"
    mkdir -p build && cd build
    cmake .. \
        -DBUILD_TESTING=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
        -DQV2RAY_BUILD_INFO="qv2ray-git AUR package" \
        -DQV2RAY_BUILD_EXTRA_INFO="r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)" \
        -DQV2RAY_DEFAULT_VASSETS_PATH="/usr/share/v2ray" \
        -DQV2RAY_DEFAULT_VCORE_PATH="/usr/bin/v2ray" \
        -DQV2RAY_AUTO_UPDATE=OFF \
        -GNinja
    cmake --build . --parallel
}

package() {
    cd "$srcdir/$pkgname/build"
    cmake --install .
}
