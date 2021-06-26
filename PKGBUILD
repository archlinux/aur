# Maintainer: database64128 <free122448@hotmail.com>
pkgname=qv2ray-git
pkgver=3.0.0.6253.r3048.5ddfd334
pkgrel=1
pkgdesc="The original Qv2ray project by the author who contributed over 95% code and other contributors. Unlike Qv2ray/Qv2ray whose control has been forcibly taken away from the author by another organization owner."
arch=(x86_64)
url="https://github.com/Shadowsocks-NET/Qv2ray"
license=('GPL3')
depends=('hicolor-icon-theme' 'qt6-base' 'grpc' 'qt6-svg')
makedepends=('git' 'make' 'qt6-tools' 'which' 'gcc' 'qt6-declarative' 'grpc-cli' 'cmake' 'ninja')
optdepends=('v2ray: use packaged v2ray' 'qt6-wayland: Wayland support (experimental)')
provides=('qv2ray')
conflicts=('qv2ray')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "%s.%s.r%s.%s" $(cat ./makespec/VERSION) $(cat ./makespec/BUILDVERSION) $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
    cd "$srcdir/$pkgname"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/$pkgname"
    export _QV2RAY_BUILD_INFO_="qv2ray-git AUR package"
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
