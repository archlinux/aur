# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=lance0
_pkgname=rookery
pkgname=${_pkgname}-bin
pkgdesc="Local inference command center"

pkgver=0.1.8
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('Apache-2.0' 'MIT')

install="${_pkgname}.install"

provides=("${_pkgname}"{,d})
conflicts=("${_pkgname}")

source=("${_pkgname}.service"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"ROADMAP-${pkgver}.md::${_urlraw}/ROADMAP.md"
		"CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md"
		"CONTRIBUTING-${pkgver}.md::${_urlraw}/CONTRIBUTING.md"
		"LICENSE-APACHE-${pkgver}::${_urlraw}/LICENSE-APACHE"
		"LICENSE-MIT-${pkgver}::${_urlraw}/LICENSE-MIT")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
sha256sums=('e4555c44eef28c0de9660da0878d0a3b7df15c60e77a21783f356e7fb8aeaab6'
            'd546d4246b39b29944b48eebc64137e2df18d45e4d1aa863e38a7ff48f6941ec'
            '87bfe094c1fad991236ff4ae9615ec8b496f6c284fd966ed70b730e9b452b792'
            '386105b9aeb17885cf8e6cd70b0d9b97d525b2fdcc58adb3299a6d5116145226'
            '445f80a83b2f1954a6ff7ce666a59cc83856fc3d2f166e8ef635e1ac6d2c4fe0'
            'dee60470438ecf75bb0a0e7b655fed25aa460232b569f55c10af42a3acbc17aa'
            '41c94c4b6c7f3068f1f4d820c0aed7f40537aa2f283fac18f1c2670b3e8ca491')
sha256sums_x86_64=('8d0156374311a648cb3cd811213f7529f89bd00aa30de10a380541d8c4113a6c')
sha256sums_aarch64=('8d0156374311a648cb3cd811213f7529f89bd00aa30de10a380541d8c4113a6c')

build() {
	cd "${srcdir}/" || exit

	./${_pkgname} completions bash > ${_pkgname}.bash
	./${_pkgname} completions zsh > ${_pkgname}.zsh
	./${_pkgname} completions fish > ${_pkgname}.fish
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${_pkgname}d" "${pkgdir}/usr/bin/${_pkgname}d"

	install -Dm644  "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"

	install -Dm644  "config.example.toml" "${pkgdir}/usr/share/${_pkgname}/config.example.toml"

	install -D -m644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -D -m644 "${_pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
	install -D -m644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "ROADMAP-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/ROADMAP.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -Dm644 "CONTRIBUTING-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"

	install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
	install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
