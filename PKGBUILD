# Maintainer: Colin Adler <cadler@coder.com>

pkgname=sail
pkgver=1.0.6
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
sha512sums=('a396c75b4e613cada463df7001baf1efbac2cc2b5e6ffc54745a23c17bc2e56ce6b6020da0bda71fd869f20276e1e6b49a71762051ca99b3cf6f8d93d34a1b17')

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
