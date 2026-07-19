# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=dasunNimantha
_gitname=scrawl
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Blazingly fast, self-hosted text sharing app with a single Go binary"

pkgver=1.3.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

backup=("etc/${_appname}/${_appname}.env")

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE"
		"${_appname}.env"
		"${_appname}.service"
		"${_appname}.sysusers"
		"${_appname}.tmpfiles")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('5815030d745c8b41f1c40e5db7f1a4e71397d309c4eaf15c0a76f66fdbabad86'
            'af5df43331a40387f753caf86b18b38b979848afd7ba9122753b3c716a2a969e'
            'b4f28a98ca8767dbfde56583f430d2c69dd83754f1f06b9c502fe5a59c328dd5'
            '5c8ac23a27228b965f9c894e6b0433dec8e8894bc1dd8469138ef74950dff928'
            '3ed4912eef3c9944b9834eb1ea021a4920ffc6eeb63166e8a6204ae81fd1722b'
            '2a15403d58e74da1bcc16745cbce41f0bc8047621715203157d2badd18926ca5')
sha256sums_x86_64=('8fa3a64ee67334895a26672c3c64886e07b2bdbe5f92036e3bf275444cd1b681')
sha256sums_aarch64=('84157fd8fa2dc28cdca9053d1e4b0caccd1c049ad52131036b3494dfbe2345d5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "${srcdir}/${_appname}.env" -t "${pkgdir}/etc/${_appname}/"

	install -Dm644 "${srcdir}/${_appname}.service" -t "${pkgdir}/usr/lib/systemd/system/"

	install -Dm644 "${srcdir}/${_appname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_appname}.conf"
	install -Dm644 "${srcdir}/${_appname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_appname}.conf"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
