# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=adibhanna
_pkgname=tsm
pkgname=${_pkgname}-bin
pkgdesc="Terminal Session Manager"

pkgver=0.6.7
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

makedepends=('patchelf')
depends=('glibc' 'ghostty')

options=(!strip)

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
		"CLI-${pkgver}.md::${_urlraw}/docs/CLI.md"
		"ARCHITECTURE-${pkgver}.md::${_urlraw}/docs/ARCHITECTURE.md"
		"COMPATIBILITY-${pkgver}.md::${_urlraw}/docs/COMPATIBILITY.md"
		"MUX_RELEASE_NOTES-${pkgver}.md::${_urlraw}/docs/MUX_RELEASE_NOTES.md"
		"KNOWN_LIMITATIONS-${pkgver}.md::${_urlraw}/docs/KNOWN_LIMITATIONS.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_${_barch[1]}.tar.gz")
sha256sums=('2b87bf7de1f8d01aa9b6d406e29cf45a5c326657faccff7eaacd7a04399e1a64'
            'c982541021bad6122eba6b084327f684b6c9029ede8b23418cdebfb96efc541d'
            '4bf5b22c37c22a9cd4abdf62b587497ccfaa07d6bb81a6a5bae5aee49822a981'
            'bcb89d7b1ac89a301e67d8037c6d9f85608ac0d4964750a1d38a9b2350eed1fd'
            '6ad66aa5a589607225dccd58da9f5aa26c7f62b0bde7ca695f6dd6a6cd950d3f'
            '7190508bd9b199df1d32751427986bcefa67f8800492fb4d6cff82cba9bca025')
sha256sums_x86_64=('4a3c99d670d9d2499de404051f4c7adcd00ef24b95fb062fd4f0c7c95955ecb2')
sha256sums_aarch64=('5fe524656abf3b1484f5fad6152562767e7e097bde9d0b32a27010a2f5e94db8')


case ${CARCH} in
	${arch[0]})
		_CARCH="${_barch[0]}"
		;;
	${arch[1]})
		_CARCH="${_barch[1]}"
		;;
esac

prepare() {
	cd "${srcdir}/${_pkgname}_${_pkgvername}_${_CARCH}/" || exit

	msg2 "Patching binary with 'patchelf'"
	patchelf --set-rpath "/usr/lib/${_pkgname}" "./${_pkgname}" --no-sort
}

package() {
	cd "${srcdir}/${_pkgname}_${_pkgvername}_${_CARCH}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm755 "libghostty-vt.so.0.1.0" "${pkgdir}/usr/lib/${_pkgname}/libghostty-vt.so.0.1.0"
	ln -sf "/usr/lib/${_pkgname}/libghostty-vt.so.0.1.0" "${pkgdir}/usr/lib/${_pkgname}/libghostty-vt.so"
	ln -sf "/usr/lib/${_pkgname}/libghostty-vt.so.0.1.0" "${pkgdir}/usr/lib/${_pkgname}/libghostty-vt.so.0"

	install -Dm644 "config/${_pkgname}/config.toml" "${pkgdir}/usr/share/doc/${pkgname}/config.example.toml"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "../CLI-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CLI.md"
	install -Dm644 "../ARCHITECTURE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/ARCHITECTURE.md"
	install -Dm644 "../COMPATIBILITY-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/COMPATIBILITY.md"
	install -Dm644 "../MUX_RELEASE_NOTES-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/MUX_RELEASE_NOTES.md"
	install -Dm644 "../KNOWN_LIMITATIONS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/KNOWN_LIMITATIONS.md"

	install -Dm644 "../LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
