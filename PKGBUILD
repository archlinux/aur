# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=kunchenguid
_gitname=no-mistakes
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Kill all the slop. Raise clean PR."

pkgver=1.31.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('git')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[1]}.tar.gz")
sha256sums=('1420eadf11e6cf695f7b2627250d313c3759066221cb136661bec69218d1e179'
            '945016bd37e1ba7211622ef60ee1d23ab727896ba7710edd21e8fbe983863969')
sha256sums_x86_64=('e3009fe9986c51ca59ddb0152e127bb245858efe03dc84842138c0f192ff7f8b')
sha256sums_aarch64=('e3009fe9986c51ca59ddb0152e127bb245858efe03dc84842138c0f192ff7f8b')


build() {
	cd "${srcdir}/" || exit

	mkdir -p completions
	./"${_appname}" completion zsh > "completions/${_appname}.zsh"
	./"${_appname}" completion bash > "completions/${_appname}.bash"
	./"${_appname}" completion fish > "completions/${_appname}.fish"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

    install -D -m644 "completions/${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
    install -D -m644 "completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
    install -D -m644 "completions/${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
