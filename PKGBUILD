# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Hypabolic
_gitname=Hypa-TTFX
_appname=ttfx
pkgname=${_gitname,,}-bin
pkgdesc="Hypa Terminal Text Effects"

pkgver=0.3.3
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${pkgname%-bin}" "${_appname}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('30554fcbb3efca4d7bc2383d3736eb62909e6509923ff5848cda04d79ad92efb'
            '0b0072e3ef3ef2d067615d7c777f65b17bc10c15c888fb2ce19f36e1366f386a')
sha256sums_x86_64=('3dbe40f1c5266c0d4afa9730774045faaefa71dac03a0e6470bdd0735cc02ad5')
sha256sums_aarch64=('2f2d68f7c360674e40f848bcf3dfed4199dae6007f05ad7ad86653387834ecd9')


prepare() {
	cd "${srcdir}/" || exit

	mv "${_appname}-${CARCH}-${pkgver}" "${_appname}"
	chmod +x "${_appname}"
}

build() {
	cd "${srcdir}/" || exit

	mkdir -p completions
	./"${_appname}" --print-completion zsh > "completions/${_appname}.zsh"
	./"${_appname}" --print-completion bash > "completions/${_appname}.bash"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "completions/${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	install -Dm644 "completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
