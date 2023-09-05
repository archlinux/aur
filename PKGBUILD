# Maintainer:ston<2424284164@qq.com>
pkgname=go-musicfox
pkgver=4.1.6
pkgrel=1
pkgdesc='Command-line Netease Cloud Music written in Go.'
url='https://github.com/anhoder/go-musicfox'
license=('MIT')
arch=('x86_64')
provides=('musicfox')
conflicts=('go-musicfox-bin' 'musicfox')
depends=('flac' 'alsa-lib')
makedepends=('gcc-objc' 'go')
source=("go-musicfox-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
		"lastfm_auth")
sha256sums=('004880be095c07f341225bcebb9a6af865eb8b33eea26eb93a0cb0556c5b2366'
			'1798a98fc0b986c690f0dc93b4f475b03f18cc72abf2825cbffcaa78cd869df2')

build(){
	cd go-musicfox-${pkgver}
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external"
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export GOPATH=${srcdir}
		go build -o ../musicfox -ldflags "-s -w \
		-X 'github.com/go-musicfox/go-musicfox/pkg/constants.AppVersion=v${pkgver}' 	\
		-X 'github.com/go-musicfox/go-musicfox/pkg/constants.LastfmKey=$(awk 'NR==1{print $3}' $HOME/.go-musicfox/lastfm_auth)'	\
		-X 'github.com/go-musicfox/go-musicfox/pkg/constants.LastfmSecret=$(awk 'NR==2{print $3}' $HOME/.go-musicfox/lastfm_auth)' " cmd/musicfox.go
}

package() {
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm755 "${srcdir}/musicfox" "${pkgdir}/usr/bin/musicfox"
	install -Dm644 "${srcdir}/go-musicfox-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}