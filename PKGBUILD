# Maintainer: database64128 <free122448@hotmail.com>
pkgname=libqv2ray-git
pkgver=r170.45d50f5
pkgrel=1
pkgdesc="Modular, feature-rich infrastructure library for Qv2ray"
arch=(x86_64)
url="https://github.com/Shadowsocks-NET/Qv2rayBase"
license=('GPL3')
depends=('libuv' 'qt6-base' 'qv2ray-plugin-interface-git' 'uvw')
makedepends=('cmake' 'git' 'ninja' 'qt6-tools')
provides=('libqv2ray')
conflicts=('libqv2ray')
source=("$pkgname::git+$url.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    # git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    mkdir -p build && cd build
    cmake .. \
        -DUSE_SYSTEM_UVW=ON \
        -DUSE_SYSTEM_PLUGIN_INTERFACE=ON \
        -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -GNinja
    cmake --build . --parallel
}

package() {
    cd "$srcdir/$pkgname/build"
    cmake --install . --component development
}
