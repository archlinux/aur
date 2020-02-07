# Maintainer: Tom Whitwell <tom.whitwell@digital.cabinet-office.gov.uk>
pkgname=gds-cli-git
pkgver=535.f8b405e
pkgrel=1
pkgdesc="CLI for GDS Staff"
arch=('i686' 'x86_64')
url="https://github.com/alphagov/gds-cli"
license=('unknown')
optdepends=("aws-cli: CLI for Amazon AWS"
	"aws-vault: Manager for AWS Credentials"
	"yubikey-manager: Manager for yubikey")
makedepends=('git' 'go')
provides=("gds-cli=${pkgver}")
conflicts=('gds-cli')
source=("${pkgname}"::"git+https://github.com/alphagov/gds-cli")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "${srcdir}/${pkgname}"
	rm -rf gds
	make gds
}

check() {
	${srcdir}/${pkgname}/gds --version
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	make -C "${srcdir}/${pkgname}" INSTALL_PATH="${pkgdir}/usr/bin" install
	cd "${pkgdir}/usr/bin"
	ln -s gds gds-cli
}
