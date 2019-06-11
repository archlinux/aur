# Maintainer: Colin Adler <cadler@coder.com>

pkgname=sail
pkgver=1.0.4
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
sha512sums=('637e8eb332a144a26abdd4278799d1e24bb186ca5031ec94c46b2f3fb01a8536e94378db20df17bc085ce6460516576a54ac644cd595b95934455411a0016182')

build() {
	export GO111MODULE=on

	cd ${pkgname}-${pkgver}
	go build \
		-gcflags "all=-trimpath=${PWD}" \
		-asmflags "all=-trimpath=${PWD}" \
		-ldflags "-extldflags ${LDFLAGS}" \
		-o ${pkgname} .
}

package() {
	# Install binary
	cd ${pkgname}-${pkgver}
	install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
