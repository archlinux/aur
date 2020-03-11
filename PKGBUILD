# Maintainer: Colin Adler <colin@coder.com>

pkgname=sshcode
pkgver=0.10.0
pkgrel=0
pkgdesc='A CLI to automatically install and run code-server over SSH.'
arch=('x86_64')
url="https://github.com/cdr/${pkgname}"
license=('MIT')
makedepends=('go')
depends=('openssh' 'rsync')
optdepends=(
  'chromium: For opening code-server in an app window.'
)

source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('ae133f2b7a425f3ae4669c5355a7b6a6513e69dba703787ee2bbf0895da0597220d56f61428017dd1582170b698ba2af98fbea65ada734846d121fbcd1a1aee2')

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
