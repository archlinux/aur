# Maintainer: Chris Snell <chris.snell@gmail.com>

pkgname=weather-bar
pkgver=1.2
pkgrel=1
pkgdesc="Weather plug-in for polybar, lemonbar, and others. With geolocation, Weather Underground, and NOAA support"
arch=('i686' 'x86_64')
url="https://github.com/chrissnell/${pkgname}"
license=('BSD')
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/chrissnell/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ea6459732eca589afed5df912a0ce85b4d75c964c5fe8b499f65a01dc98244e4')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go mod download
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_ENABLED=0
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"
  go build -ldflags="-s -w -extldflags '-static'" -o weather-bar .
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 weather-bar "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 example/config "${pkgdir}/usr/share/${pkgname}/example/config"
  install -Dm644 example/polybar-config "${pkgdir}/usr/share/${pkgname}/example/polybar-config"
}

