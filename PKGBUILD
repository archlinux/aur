# Maintainer: Winni Neessen <wn@neessen.dev>

pkgname=waybar-weather
pkgver=0.2.0
pkgrel=1
pkgdesc='A weather module for waybar with automatic geolocation'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/wneessen/waybar-weather'
license=('MIT')
makedepends=('go')
source=("https://github.com/wneessen/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f56d8a4b6351d51f1ec5fa6375d5b3113f4a2bfface9a51a32f53ba5713cf0f5')
options=('!debug')

prepare() {
    cd "${pkgname}-${pkgver}"
    mkdir -p build/
}

build() {
    cd "${pkgname}-${pkgver}"
    export GOPATH="${srcdir}"
    go mod tidy
    go build -o "build/${pkgname}" -trimpath -ldflags "-w -s -extldflags '-static' -X main.version=${pkgver} -X github.com/wneessen/waybar-weather/internal/http.version=${pkgver}" .
}

package() {
    cd "${pkgname}-${pkgver}"
    # binary
    install -D -m755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

