# Maintainer: Wakatron <maka-krah@mail.ru>

pkgname=streamdeck-lets-go-git
_giturl=https://github.com/Wakatron/streamdeck-lets-go.git
pkgver=r0.unknown
pkgrel=1
pkgdesc="Lightweight daemon for controlling Elgato Stream Deck devices with a built-in web UI"
arch=('x86_64' 'aarch64')
url="https://github.com/Wakatron/streamdeck-lets-go"
license=('MIT')
depends=('libusb-1.0')
optdepends=('librsvg: SVG icon rendering'
            'fontconfig: system font detection')
makedepends=('go>=1.26' 'git')
provides=('streamdeck-lets-go')
conflicts=('streamdeck-lets-go')

source=("${pkgname}::git+${_giturl}"
        "streamdeck-lets-go.service"
        "90-streamdeck.rules")
b2sums=('SKIP'
        'SKIP'
        'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --always --tags 2>/dev/null || echo "r0.$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  export CGO_ENABLED=1
  go build \
    -ldflags "-s -w" \
    -o streamdeck-lets-go .
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm755 streamdeck-lets-go "${pkgdir}/usr/bin/streamdeck-lets-go"

  install -Dm644 "${srcdir}/streamdeck-lets-go.service" \
    "${pkgdir}/usr/lib/systemd/user/streamdeck-lets-go.service"

  install -Dm644 "${srcdir}/90-streamdeck.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/90-streamdeck.rules"
}
