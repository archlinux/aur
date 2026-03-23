# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=adibhanna
_pkgname=tsm
pkgname=${_pkgname}
pkgdesc="Terminal Session Manager"

pkgver=0.5.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

makedepends=('pkgconf' 'go' 'zig')
depends=('glibc' 'ghostty')

options=(!strip)

source=("${pkgname}-${pkgver}.tgz::${url}/archive/${_pkgvername}.tar.gz")
sha256sums=('8f71dcdf0f8f5e944e18b1422e8bd92236e49a831759e0931428410f0c34aba9')


prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	sed -i -e 's/git init/git -c init.defaultBranch=master init/g' Makefile

	make setup
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	make build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	make install PREFIX="${pkgdir}/usr/"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "config/${_pkgname}/config.toml" "${pkgdir}/usr/share/doc/${pkgname}/config.example.toml"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
