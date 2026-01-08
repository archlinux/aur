# Maintainer: Super Tecno Gym <banana@grrlz.net>

pkgname=arduino-router
pkgver=0.5.4
pkgrel=1
pkgdesc="Arduino UNO Q router/bridge communication service"
arch=('x86_64' 'aarch64')
url="https://github.com/arduino/arduino-router"
license=('GPL-3')
makedepends=('go')
depends=(
	'socat'
	'libgpiod'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('bdcccb5c4e856a745f1e457839ac8551d3e421126f9de7bb40ac5f7a28ab12c3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o ${pkgname} .
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 debian/arduino-router/etc/systemd/system/arduino-router.service "${pkgdir}/usr/lib/systemd/system/arduino-router.service"
  install -Dm644 debian/arduino-router/etc/systemd/system/arduino-router-serial.service "${pkgdir}/usr/lib/systemd/system/arduino-router-serial.service"
  install -Dm644 debian/arduino-router/usr/share/doc/arduino-router/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
