# Maintainer:ston<2424284164@qq.com>
pkgname=go-musicfox
pkgver=3.5.3
pkgrel=1
pkgdesc='Command-line Netease Cloud Music written in Go.'
url='https://github.com/anhoder/go-musicfox'
license=('MIT')
arch=('x86_64')
provides=('musicfox')
conflicts=('go-musicfox-bin' 'musicfox')
depends=('flac' 'alsa-lib')
makedepends=('gcc-objc' 'go')
source=(go-musicfox-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('848bef05ad33bd55748469326d751ffe41cbda05d4495d7a94c4ecb9668d8e72')

build(){
	cd go-musicfox-${pkgver}
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external"
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export GOPATH=${srcdir}
	go build -o ../musicfox -ldflags "-s -w -X go-musicfox/pkg/constants.AppVersion=v${pkgver}" cmd/musicfox.go
}

package() {
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm755 "${srcdir}/musicfox" "${pkgdir}/usr/bin/musicfox"
	install -Dm644 "${srcdir}/go-musicfox-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}