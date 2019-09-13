# Maintainer: Colin Adler <colin@coder.com>

pkgname=sshcode
pkgver=0.9.0
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
sha512sums=('4d1ba6dbb8c0b613a9c47df7b5abd5fffeaca6e72236385d8b0c307a32a08ba5bcb0e058b90bf46b58b1e348b87cc6c1c86693574c7690c389489f3ea1102ef4')

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
