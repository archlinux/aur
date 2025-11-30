# Maintainer: Winni Neessen <wn@neessen.dev>

pkgname=waybar-weather
pkgver=0.2.6
pkgrel=1
pkgdesc='A weather module for waybar with automatic geolocation'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/wneessen/waybar-weather'
license=('MIT')
makedepends=('go')
source=("https://github.com/wneessen/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('400ae7b0d4aaa946d2b5d4c1079806a19c28406ff25698c6a55ca507b45604fb')
options=('!debug')

prepare() {
    cd "${pkgname}-${pkgver}"
    mkdir -p build/
}

build() {
    cd "${pkgname}-${pkgver}"
    export GOPATH="${srcdir}"
    go mod tidy
	go build -o "build/${pkgname}" -trimpath -ldflags "-w -s -extldflags '-static' -X main.version=${pkgver} -X main.commit="main-via-aur" -X main.date="$(date -u +'%Y-%m-%dT%H:%M:%SZ')" -X github.com/wneessen/waybar-weather/internal/http.version=${pkgver}" github.com/wneessen/waybar-weather/cmd/waybar-weather
}

package() {
    cd "${pkgname}-${pkgver}"
    # binary
    install -D -m755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

