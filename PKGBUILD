# Maintainer: Alexander Björk <aur.operator320@passmail.net>
pkgname=viiper
pkgver=0.6.0
pkgrel=1
pkgdesc="Virtual Input over IP Emulator - VIIPER is a tool to create virtual input devices using USBIP"
arch=('x86_64')
url="https://github.com/Alia5/VIIPER"
license=('GPL-3.0-or-later')
depends=('glibc' 'usbip')
makedepends=('go' 'git')
provides=('viiper')
conflicts=('viiper-bin' 'viiper-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "viiper.service")
sha256sums=('44112fee78636426c1c32ca2aad76c38e89cef213d400c05999dcec09f743ad3'
            '4944a90179737bde276ba88e3d6ebc2d6e47afb255f14afd454bbf5d5d06f18d')

prepare() {
    cd "VIIPER-$pkgver"
    mkdir -p build
}

build() {
    cd "VIIPER-$pkgver"
    #export CGO_CPPFLAGS="{}$CPPFLAGS}"
    #export CGO_CFLAGS="{$CFLAGS}"
    #export CGO_CXXFLAGS="{$CXXFLAGS}"
    #export CGO_LDFLAGS="{$LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build/viiper ./cmd/viiper
}

package() {
    cd "VIIPER-$pkgver"
    install -Dm755 "build/viiper" "$pkgdir/usr/bin/viiper"
    install -Dm644 "../viiper.service" "$pkgdir/usr/lib/systemd/system/viiper.service"
}
