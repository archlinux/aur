# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=nao1215
_gitname=truss
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Rust image toolkit for CLI with signed URLs, SSRF protection, and AVIF/WebP/SVG support"

pkgver=0.24.0
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
sha256sums=('ce43eecb814af2c2263fdf6cb64a3e68c199494dc565005a6f03f3b49c53a983'
            '192d385e901927e0e4f6c16540c61525f334a732020f010d04e462fae0f8104d'
            '84d237b18961de4685eb19374599fccb27ed92d58e869cdbecd1dd385ec968f0')
sha256sums_x86_64=('bbf9237b2c90e62425c2e7cc559c3e527a9b8d114dc87ce433634c9b8b32f96a')
sha256sums_aarch64=('a455e642ea8e6a0e9b799a59ca8341835c9e8a993ada7abc742ed426ab2f17cb')


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
