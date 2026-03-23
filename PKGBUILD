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

makedepends=('pkgconf' 'go' 'zig' 'patchelf')
depends=('glibc' 'ghostty')

options=(!strip)

source=("${pkgname}-${pkgver}.tgz::${url}/archive/${_pkgvername}.tar.gz")
sha256sums=('8f71dcdf0f8f5e944e18b1422e8bd92236e49a831759e0931428410f0c34aba9')


prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	sed -i -e 's/git init/git -c init.defaultBranch=main init/g' -e 's/-linkmode external/-linkmode auto/g' Makefile

	make setup
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	make build
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	make test
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	make install PREFIX="${pkgdir}/usr/"

	patchelf --set-rpath "/usr/lib/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "docs/CLI.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "docs/ARCHITECTURE.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "docs/COMPATIBILITY.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "docs/KNOWN_LIMITATIONS.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "config/${_pkgname}/config.toml" "${pkgdir}/usr/share/doc/${pkgname}/config.example.toml"

	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
