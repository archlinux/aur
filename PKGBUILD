# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=adibhanna
_pkgname=tsm
pkgname=${_pkgname}
pkgdesc="Terminal Session Manager"

pkgver=0.6.6
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
sha256sums=('f95f27c7cdfb1af1c8be5799d1e86cc4e918f3851bf624327aa5514d21fd5fed')


prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	sed -i -e 's/git init/git -c init.defaultBranch=main init/g' Makefile
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	make setup
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
