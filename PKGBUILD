# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Maintainer: Nitroretro <nitroretro@protonmail.com>

pkgname=hydroxide
pkgver=0.2.18
pkgrel=1
pkgdesc="A third-party, open-source ProtonMail CardDAV, IMAP and SMTP bridge"
arch=('x86_64')
url="https://github.com/emersion/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('79997fb1aaa4c942f169a27c66cc3a92fd765e846a3278b809d732105a58eb6bfe9980ed8de3bdcdd3cebce824382fba226dd68fd4805f0b63ce0e68486c04be'
            'SKIP')
validpgpkeys=("34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48")

prepare() {
	cd "${pkgname}-${pkgver}"
	mkdir -p build
}

build() {
	cd "${pkgname}-${pkgver}"

	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	go build -o build ./cmd/...
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 -- "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 -- "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
