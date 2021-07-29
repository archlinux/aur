# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Maintainer: Nitroretro <nitroretro@protonmail.com>

pkgname=hydroxide
pkgver=0.2.19
pkgrel=1
pkgdesc="A third-party, open-source ProtonMail CardDAV, IMAP and SMTP bridge"
arch=('x86_64')
url="https://github.com/emersion/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('856b0d7bca12eff81d4e26abcdf6f1551b8e38f2b316c5cd1bd6b3a94635920aa32a928181aa7a02ee5618362f21200c67ea3f2a1fff85ae333235e0234c1af5'
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
