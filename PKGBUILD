# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=nao1215
_gitname=onionscan
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Tool to scan onion services"

pkgver=0.2.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=('!strip')

_pkgsrc="${_appname}-${pkgver}"

source=("${_pkgsrc}-checksums.txt::${_ghurl}/releases/download/${_gitversion}/checksums.txt")
source_x86_64=("${_pkgsrc}-${arch[0]}.tgz::${_ghurl}/releases/download/${_gitversion}/${_pkgsrc//-/_}_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgsrc}-${arch[1]}.tgz::${_ghurl}/releases/download/${_gitversion}/${_pkgsrc//-/_}_${_barch[1]}.tar.gz")
sha256sums=('baf0465357a2eea178ff6ec98f452acd032b72b524077a9e37a3ab185fcefdba')
sha256sums_x86_64=('edc0c7668b2e6d25b4c79633c306e63c2bbf0c7e01cfd026e780b40c7adf0534')
sha256sums_aarch64=('6dfa4e61a3d428904d5b76efd949bee0b7baa2404280aba30715dbd69e00f463')


verify() {
	cp "${_pkgsrc}-checksums.txt" "checksums.txt"
	sed -n \
		-e "/${_pkgsrc//-/_}_${_barch[0]}.tar.gz/{s//${_pkgsrc}-${arch[0]}.tgz/g;p;}" \
		-e "/${_pkgsrc//-/_}_${_barch[1]}.tar.gz/{s//${_pkgsrc}-${arch[1]}.tgz/g;p;}" \
		-i "checksums.txt"

	sha256sum -c --ignore-missing "checksums.txt"
}

build() {
	cd "${srcdir}/" || exit

	mkdir -p "./completions"

	"./${_appname}" completion zsh > "./completions/${_appname}.zsh"
	"./${_appname}" completion bash > "./completions/${_appname}.bash"
	"./${_appname}" completion fish > "./completions/${_appname}.fish"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "./completions/${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	install -Dm644 "./completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "./completions/${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
