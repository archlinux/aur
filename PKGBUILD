# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>
# Contributor: database64128 <free122448@hotmail.com>
pkgname=qv2ray-v3
_tag=v3.0.0-rc1
pkgver=3.0.0rc1
pkgrel=1
pkgdesc="A cross platform connection manager for V2Ray and other backends."
arch=(x86_64)
url="https://github.com/Shadowsocks-NET/Qv2ray"
license=('GPL3')
depends=('grpc' 'hicolor-icon-theme' 'qt6-svg')
makedepends=('cmake' 'gcc' 'git' 'grpc-cli' 'make' 'ninja' 'qt6-declarative' 'qt6-tools' 'which')
optdepends=('qt6-wayland: Wayland support (experimental)' 'v2ray: use packaged v2ray')
provides=('qv2ray')
conflicts=('qv2ray')
source=("$pkgname::git+$url.git#tag=$_tag")
sha512sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/$pkgname"
    export _QV2RAY_BUILD_INFO_="$pkgname AUR package"
    export _QV2RAY_BUILD_EXTRA_INFO_="r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    mkdir -p build && cd build
    cmake .. -GNinja \
        -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DQV2RAY_DEFAULT_VASSETS_PATH="/usr/share/v2ray" \
        -DQV2RAY_DEFAULT_VCORE_PATH="/usr/bin/v2ray" \
        -DQV2RAY_DISABLE_AUTO_UPDATE=on
    ninja
}

package() {
    cd "$srcdir/$pkgname"
    ninja -C "build" install
}
