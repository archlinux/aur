# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=overcuriousity
_pkgname=bitvault
pkgname=${_pkgname}-bin
pkgver=2026.11.7
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A secure, configurable file-sharing and URL shortening web app written in Rust."

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-musl' 'aarch64-unknown-linux-musl')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('GPL-3.0')

provides=("${_pkgname}")
conflicts=("${pkgname%-bin}")

backup=("etc/${_pkgname}/config.toml")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
		"README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[0]}-offline.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[1]}-offline.tar.gz")
sha256sums=('89dc84174bf4bdc8895f75625e535401a108418ff9cb207f0776b414cf7e2f0a'
            'b6852f1d215f82b8d31a5556ba62c146733e98d9805e88b5f2c580d1250c3944')
sha256sums_x86_64=('02890b3b1f7c72386e054b7deacece3cdcfb6efeeb2067781a0f88fd5b356b40')
sha256sums_aarch64=('30f58e38118d806778179a396781ad225087375bd1e1c22a0055d6e8d8388c13')


case ${CARCH} in
	${arch[0]})
		_CARCH=${_barch[0]}
	;;

	${arch[1]})
		_CARCH=${_barch[1]}
	;;
esac

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}-${_CARCH}/" || exit

	sed -e "s|Description=.*|Description=${pkgdesc%' written in Rust.'}|g" -e 's|/usr/local/|/usr/|g' -i "${_pkgname}.service"
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}-${_CARCH}/" || exit

	install -Dm0755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "config.example.toml" "${pkgdir}/etc/${_pkgname}/config.toml"

	install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

	install -Dm644 "AIRGAP.md" "${pkgdir}/usr/share/doc/${pkgname}/AIRGAP.md"
	install -Dm644 "../README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "../LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "THIRD-PARTY-LICENSES" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-LICENSES"
}
