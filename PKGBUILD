# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=nao1215
_gitname=jsonize
_appname=jz
pkgname=${_gitname}-bin
pkgdesc="Turn command output into JSON"

pkgver=0.9.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

_pkgsrc="${_gitname}-${pkgver}"

source=("${_pkgsrc}-checksums.txt::${url}/releases/download/${_gitversion}/checksums.txt")
source_x86_64=("${_pkgsrc}-${arch[0]}.tgz::${url}/releases/download/${_gitversion}/${_pkgsrc//-/_}_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgsrc}-${arch[1]}.tgz::${url}/releases/download/${_gitversion}/${_pkgsrc//-/_}_${_barch[1]}.tar.gz")
sha256sums=('80dd5106c9cded590daac15b00ccca5cf9c119d870138cf9b059f0bb77a89e5f')
sha256sums_x86_64=('8c518e35e5984525a7941c660728d883c3e9ede9ca379bd8bdc0d1d7a34bc76d')
sha256sums_aarch64=('540f633b4fa2176cde7972165ca207b63cd7f0f30b4a718cb1af994f58aab8f2')


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
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "./completions/${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	install -Dm644 "./completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
