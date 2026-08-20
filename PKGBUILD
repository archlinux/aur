# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_ghauthor=kooler
_ghname=MiddayCommander
_pkgname=mdc
pkgname=${_pkgname}-bin
pkgdesc="A TUI dual-panel terminal file manager written in Go, inspired by Midnight Commander."

pkgver=0.14
pkgrel=1
_ghversion=${pkgver}
_ghversionname=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_ghauthor}/${_ghname}"
_urlraw="https://raw.githubusercontent.com/${_ghauthor}/${_ghname}/${_ghversionname}"

license=('MIT')

makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_ghversionname}/${_ghname}_${_ghversion}_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_ghversionname}/${_ghname}_${_ghversion}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('9b7e48bb833603f06ddb43b608e8c6925f543fe484f35eafeb98da524ff38353')
sha256sums_aarch64=('7f60423c7031b47db09f127baf5e7d33cd221a3a232965e553cabbe2e3e7978a')


prepare() {
	cd "${srcdir}/" || exit

	rm -rf git && git clone -n --depth=1 --filter=tree:0 "${url}" git && cd git

	git sparse-checkout set --no-cone config.example.toml /themes && git checkout
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "git/config.example.toml" -t "${pkgdir}/usr/share/doc/${pkgname}/config/"
	for theme in "git/themes/"*.toml; do
		install -Dm644 "${theme}" -t "${pkgdir}/usr/share/doc/${pkgname}/themes/"
	done

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
