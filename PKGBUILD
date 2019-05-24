# Maintainer: Colin Adler <cadler@coder.com>

pkgname=sail
pkgver=1.0.3
pkgrel=1
pkgdesc='A universal workflow for reproducible, project-defined development environments.'
arch=('x86_64')
url="https://github.com/cdr/${pkgname}"
license=('MIT')
makedepends=('go-pie')
depends=('docker' 'git')
optdepends=(
  'chrome: For opening code-server in an app window.'
  'chromium: For opening code-server in an app window.'
)

source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('67920931e9d4355e90eb5228b6cf1139c57f6269a3339c2b8f91d6e4d399a3c6')

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
