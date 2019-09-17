# Maintainer: Colin Adler <colin@coder.com>

pkgname=sail
pkgver=1.1.0
pkgrel=0
pkgdesc='A universal workflow for reproducible, project-defined development environments.'
arch=('x86_64')
url="https://github.com/cdr/${pkgname}"
license=('MIT')
makedepends=('go')
depends=('docker' 'git')
optdepends=(
  'chromium: For opening code-server in an app window.'
)

source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('7e169c278b89314c71724ce071f665ecf567c2f29e00ebecc2bfeb7c1e73b5a889e3dc02b43fcc129807a30f93085a33ca7c6f382781cc87a8aabe9cd1f367bf')

build() {
	export GO111MODULE=on

	cd ${pkgname}-${pkgver}
	go build \
		-gcflags "all=-trimpath=${PWD}" \
		-asmflags "all=-trimpath=${PWD}" \
		-ldflags "-extldflags ${LDFLAGS} -X main.version=${pkgver}" \
		-o ${pkgname} .
}

package() {
	# Install binary
	cd ${pkgname}-${pkgver}
	install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
