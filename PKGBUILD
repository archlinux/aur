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
sha512sums=('88494f362aa1a0a9acdff763ab3b2af132a5e3ddaa280d3714c50de7afd13ee517d9e9f73da149c4ff6993674efb346e829b0c7e047f0848f5b0bdb43a2ce9c0')

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
