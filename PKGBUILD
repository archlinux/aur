# Maintainer: Colin Adler <cadler@coder.com>

pkgname=sshcode
pkgver=0.8.0
pkgrel=1
pkgdesc='A CLI to automatically install and run code-server over SSH.'
arch=('x86_64')
url="https://github.com/cdr/${pkgname}"
license=('MIT')
makedepends=('go')
depends=('ssh' 'rsync')
optdepends=(
  'chromium: For opening code-server in an app window.'
)

source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('a0992d16587383bc9dab38be60f629d495f516aede6752a98e78365bb3e20962931069eff679bb627243465893dc335c5fecc2179970829521ae2f896e76482c')

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
