# Maintainer: Winni Neessen <wn@neessen.dev>

pkgname=waybar-weather
pkgver=0.3.1
pkgrel=1
pkgdesc='A waybar weather module with automatic geolocation lookup'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/wneessen/waybar-weather'
license=('MIT')
options=('!debug')
makedepends=('go')
install="${pkgname}_install.sh"

source=(
    "${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('31743a2d8ffd176089261e8fb2f6ccb00b31b5a407c6bd1d5f5ef394cf4f12bf')

prepare() {
    cd "${pkgname}-${pkgver}"
    mkdir -p build
}

build() {
    cd "${pkgname}-${pkgver}"

    export SOURCE_DATE_EPOCH="${SOURCE_DATE_EPOCH:-$(stat -c %Y .)}"
    local _build_date
    _build_date="$(date -u -d "@${SOURCE_DATE_EPOCH}" +'%Y-%m-%dT%H:%M:%SZ')"

    local _ldflags="
        -s -w
        -extldflags '-static'
        -X main.version=${pkgver}
        -X main.commit=main-via-aur
        -X main.date=${_build_date}
        -X github.com/wneessen/waybar-weather/internal/http.version=${pkgver}
    "

    go build \
        -trimpath \
        -ldflags "${_ldflags}" \
        -o "build/${pkgname}" \
        ./cmd/waybar-weather
}

package() {
    cd "${pkgname}-${pkgver}"

    # binary
    install -Dm755 "build/${pkgname}" \
        "${pkgdir}/usr/bin/${pkgname}"

    # example files
    install -Dm644 "etc/config.toml" \
        "${pkgdir}/usr/share/${pkgname}/config.toml"
    install -Dm644 "etc/geolocation" \
        "${pkgdir}/usr/share/${pkgname}/geolocation"
    install -Dm644 "etc/cityname" \
        "${pkgdir}/usr/share/${pkgname}/cityname"

    # style and icon files
    install -Dm644 "contrib/style/waybar-weather.css" \
        "${pkgdir}/usr/share/${pkgname}/waybar-weather.css"
    install -d "${pkgdir}/usr/share/${pkgname}/weather-icons"
    cp -r contrib/icons/meteocons/* "${pkgdir}/usr/share/${pkgname}/weather-icons/"

    # documentation
    install -Dm644 "README.md" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # license
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
