# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=nao1215
_gitname=truss
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Rust image toolkit for CLI with signed URLs, SSRF protection, and AVIF/WebP/SVG support"

pkgver=0.12.0
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
sha256sums=('bf5ddb9135ae11b43e0ad1cf83374e363e0d535b8c5a2a9051730c7c2094ada8'
            '192d385e901927e0e4f6c16540c61525f334a732020f010d04e462fae0f8104d'
            'de20493e26c754258b460d71d3d17411ac3288173d650f7087257a9c3d154e02')
sha256sums_x86_64=('f36bbbc47af9c97b641f91f340033050df877ae5228ea7dc8ce25f1d758eda44')
sha256sums_aarch64=('0388a6299ce6f2eb1e3b8eece94825f21dc2437a84782590b8584e42a2ffcc25')


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
