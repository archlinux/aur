# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=nao1215
_gitname=gup
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Update binaries installed by \"go install\" with goroutines"

pkgver=1.8.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('linux_amd64' 'linux_386' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${_appname}")

options=('!strip')

_pkgsrc="${_appname}-${pkgver}"

source=("README-${pkgver}.md::${_ghurlraw}/README.md" "LICENSE-${pkgver}::${_ghurlraw}/LICENSE"
		"${_pkgsrc}-checksums.txt::${_ghurl}/releases/download/${_gitversion}/checksums.txt")
source_x86_64=("${_pkgsrc}-${arch[0]}.tgz::${_ghurl}/releases/download/${_gitversion}/${_pkgsrc//-/_}_${_barch[0]}.tar.gz")
source_i686=("${_pkgsrc}-${arch[1]}.tgz::${_ghurl}/releases/download/${_gitversion}/${_pkgsrc//-/_}_${_barch[1]}.tar.gz")
source_aarch64=("${_pkgsrc}-${arch[2]}.tgz::${_ghurl}/releases/download/${_gitversion}/${_pkgsrc//-/_}_${_barch[2]}.tar.gz")
sha256sums=('486b8ccca93e8ddc403d072b470decf7f4431b7218bcf7d53ad86c725dd58af0'
            '9342d2ca1f93313e4f2a06e19db82e4a94462fab17c82eda907226631bd62079'
            '9445fab309a1747097cacca69c63bc4b3967e8e39b9cd480c5f246544314953d')
sha256sums_x86_64=('7ee0dbb3c043f7e2d1afd0b44bad2f4fdae647e7245246b9e0ff75524c48b76d')
sha256sums_i686=('ea3f13e11b471bd15bbdd8e80e6d4d381fde58a03dde9894c92c0975baa8f597')
sha256sums_aarch64=('562cbf136502ba5b93eb474a1f42d6e1e29b93abc5bd864c2c392e129538591e')


verify() {
	cp "${_pkgsrc}-checksums.txt" "checksums.txt"
	sed -n \
		-e "/${_pkgsrc//-/_}_${_barch[0]}.tar.gz/{s//${_pkgsrc}-${arch[0]}.tgz/g;p;}" \
		-e "/${_pkgsrc//-/_}_${_barch[1]}.tar.gz/{s//${_pkgsrc}-${arch[1]}.tgz/g;p;}" \
		-e "/${_pkgsrc//-/_}_${_barch[2]}.tar.gz/{s//${_pkgsrc}-${arch[2]}.tgz/g;p;}" \
		-i "checksums.txt"

	sha256sum -c --ignore-missing "checksums.txt"
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
