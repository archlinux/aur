# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=nao1215
_gitname=truss
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Rust image toolkit for CLI with signed URLs, SSRF protection, and AVIF/WebP/SVG support"

pkgver=0.19.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=('!strip')

_pkgsrc="${_appname}-${pkgver}"

source=("README-${pkgver}.md::${_ghurlraw}/README.md" "LICENSE-${pkgver}::${_ghurlraw}/LICENSE"
		"${_pkgsrc}-checksums.txt::${_ghurl}/releases/download/${_gitversion}/checksums.txt")
source_x86_64=("${_pkgsrc}-${arch[0]}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgsrc}-${arch[1]}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[1]}.tar.gz")
sha256sums=('61aa81efbe8786e977df77cde6c13bce24caa0f457bcabef034b1fd8c9fd1fc1'
            '192d385e901927e0e4f6c16540c61525f334a732020f010d04e462fae0f8104d'
            '98c579bf0ac16c32e0d47d7ae385cc423802d79234abe998ab1e1fddb51e1074')
sha256sums_x86_64=('2fc4d2958cdad045a45a33d18cdc5a940c3f4df966082bbb48d2b7ed6cc62e3f')
sha256sums_aarch64=('a1f08d800dc5e7e6faeaa83141ab7f38e9e6bf343ecf991614889f518646c21a')


verify() {
	cp "${_pkgsrc}-checksums.txt" "checksums.txt"
	sed -n \
		-e "/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz/{s//${_pkgsrc}-${arch[0]}.tgz/g;p;}" \
		-e "/${_gitname}-${_gitversion}-${_barch[1]}.tar.gz/{s//${_pkgsrc}-${arch[1]}.tgz/g;p;}" \
		-i "checksums.txt"

	sha256sum -c --ignore-missing "checksums.txt"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
