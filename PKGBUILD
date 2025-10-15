# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=getsavvyinc
_pkgname=savvy-cli
_pkgexecname=${_pkgname%%-cli}
pkgname=${_pkgname}-bin
pkgver=0.23.0
pkgrel=1
_pkgvername=${pkgver}
pkgdesc="Automatically capture and surface your team's tribal knowledge"
arch=('x86_64' 'i686' 'aarch64')
_barch=('x86_64' 'i386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgexecname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgexecname}_linux_${_barch[0]}")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgexecname}_linux_${_barch[1]}")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgexecname}_linux_${_barch[2]}")
sha256sums=('d2ecd5c1cdeff135927e7cc0d307796ee294518a000dc993636cdf629a9c47e5'
            'e402f17bda18b4dae93f31d46d8ced78b686a7c68930284683ed65bbdf8a8ee0')
sha256sums_x86_64=('1659a697c46caeb7213e034c1df2f9b9fcda601bfa03e54f713a195dc0f2b287')
sha256sums_i686=('4d6b356c83c3c3fe78a450f7fbc3d2e401fefd3f0825c8a6e349b94b88aadc8e')
sha256sums_aarch64=('05794617c76c4690e72cd2c771d068fc17c453d102f378fc5570bdb98469a49e')


build() {
	cd "${srcdir}/" || exit

	mkdir -p completions

	chmod +x "${_pkgname}-${CARCH}-${pkgver}"

	"./${_pkgname}-${CARCH}-${pkgver}" completion bash > "completions/${_pkgexecname}.bash_completion"
	"./${_pkgname}-${CARCH}-${pkgver}" completion zsh > "completions/${_pkgexecname}.zsh_completion"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgexecname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "completions/${_pkgexecname}.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${_pkgexecname}"
	install -Dm644 "completions/${_pkgexecname}.zsh_completion" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgexecname}"
}
