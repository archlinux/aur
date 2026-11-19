# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=nao1215
_gitname=truss
_appname=${_gitname}
pkgname=${_gitname}-bin
pkgdesc="Rust image toolkit for CLI with signed URLs, SSRF protection, and AVIF/WebP/SVG support"

pkgver=0.28.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

_pkgsrc="${_gitname}-${pkgver}"

source=("README-${pkgver}.md::${_ghurlraw}/README.md" "LICENSE-${pkgver}::${_ghurlraw}/LICENSE"
		"${_pkgsrc}-checksums.txt::${_ghurl}/releases/download/${_gitversion}/checksums.txt")
source_x86_64=("${_pkgsrc}-${arch[0]}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgsrc}-${arch[1]}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[1]}.tar.gz")
sha256sums=('3ee5c3004452939132480502132b440f0d783938b6b3b2ccb1b4377b66a981a1'
            '192d385e901927e0e4f6c16540c61525f334a732020f010d04e462fae0f8104d'
            'baa9f5dc18b87a74afef87b6ae2098163ffc78a65082c681fea42a1d8a37af45')
sha256sums_x86_64=('0140aef9dbd22002b114ed9967062f67204e7fb03ffa0cc1adc51ea996e8805b')
sha256sums_aarch64=('4eef468b3f8d21a6bfa13362d5d8403c15497fe0b9d38e493d7a87df44e84b7d')


verify() {
	cp "${_pkgsrc}-checksums.txt" "checksums.txt"
	sed -n \
		-e "/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz/{s//${_pkgsrc}-${arch[0]}.tgz/g;p;}" \
		-e "/${_gitname}-${_gitversion}-${_barch[1]}.tar.gz/{s//${_pkgsrc}-${arch[1]}.tgz/g;p;}" \
		-i "checksums.txt"

	sha256sum -c --ignore-missing "checksums.txt"
}

build() {
	cd "${srcdir}/" || exit

	mkdir -p "./completions"

	"./${_appname}" completions zsh > "./completions/${_appname}.zsh"
	"./${_appname}" completions bash > "./completions/${_appname}.bash"
	"./${_appname}" completions fish > "./completions/${_appname}.fish"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "./completions/${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	install -Dm644 "./completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "./completions/${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
