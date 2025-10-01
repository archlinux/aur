# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=zhboner
_pkgname=realm
pkgname=${_pkgname}-bin
pkgver=2.9.2
pkgrel=2
_pkgvername=v${pkgver}-${pkgrel}
pkgdesc="A simple, high performance relay server written in rust."
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
		"README-${pkgver}.md::${_urlraw}/readme.md"
		"balance-${pkgver}.json::${_urlraw}/examples/balance.json"
		"basic-${pkgver}.json::${_urlraw}/examples/basic.json"
		"full-${pkgver}.json::${_urlraw}/examples/full.json"
		"good-${pkgver}.json::${_urlraw}/examples/good.json"
		"legacy-${pkgver}.json::${_urlraw}/examples/legacy.json"
		"tld-${pkgver}.json::${_urlraw}/examples/tls.json"
		"ws-${pkgver}.json::${_urlraw}/examples/ws.json"
		"wss-${pkgver}.json::${_urlraw}/examples/wss.json"
		"realm.service"
		"realm@.service")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}-unknown-linux-gnu.tar.gz")
sha256sums=('7d232b4125b518eb4527d1933cbe20e6d87b865213b9c561faade007326fd9d3'
            '25702b94a3f04271295ed8bc41f47d2fb06c5673eb139785d96e1bdb03a03f0d'
            '7418b370c51cbd86862e19acd0cbbe08102f76f77a0e9347029216ceeda517d0'
            '69948ec56300d0c5a9e182a9bf7804e2af1bf6439a3dabb1687356e565946d9d'
            '4868e52fc35321ec2efaa56173d6c694f62063834bb9d176458dd39d389b69d7'
            'aa2a0f187949c29c6ef3af4a48c6677d3047aff0e5f944ab67a10d15d83bd62d'
            '78261f8967d489f9e62df1179ca138829ebc3a723a92589d7703857dce9d1f66'
            'ca408b0184ba87e656523b881256aab86bb76a2375f2962482b8a0b92c82a322'
            '74ac25cc62e8d173f88141c9026d24958b4a558050829f3573b7e46cdd8af3e9'
            'bf121e39bc882447349e25332f4d27a47a3cb72a19451739603205cfb333bb8f'
            '4a8d9aaf9910d34085d5f57ad9077657708f6474f7979b460673a1ad3bb002e1'
            'f9c220478250e6830e6ca7fef4f82f20467f9a2ee2825a9d371f61be923cfeef')
sha256sums_x86_64=('d0237894fc4985728d8d8ab568807b4e1f135ba29bbab4f12fc16c74b9de670c')
sha256sums_aarch64=('a9bf3a6807277168ee136d8360c973b02cd19f269c82329c43b3fc9957626617')


prepare() {
    cd "${srcdir}" || exit 1

    mkdir -p ./config
    for f in *.json; do mv ${f} config/${f//-${pkgver}/} ; done
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dt "${pkgdir}/usr/lib/systemd/system/" "realm.service"
	install -Dt "${pkgdir}/usr/lib/systemd/system/" "realm@.service"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	cd "${srcdir}/config" || exit 1
	for config in ./*.json; do
		install -Dm644 ${config} "${pkgdir}/etc/realm/${config}"
	done
	ln -sf /etc/realm/full.json "${pkgdir}/etc/realm/config.json"
}
