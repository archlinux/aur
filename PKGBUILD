# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=profullstack
_gitname=mynaposter
_appname=myna
pkgname=${_gitname}-bin
pkgdesc="A terminal social media manager. Log in, write, schedule and post to 25 networks from one TUI."

pkgver=0.44.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('30336f2999b599042257dcd6c1ecf8a0e04221073ba34bc6f1c9886115d201d1'
            'de1b680e8cf8ebf3641646e14f5c0730f726da2d9d6d211d498032c20d0d9e2c')
sha256sums_x86_64=('d9281e536d73da7f91869e43bdd6cd56dc32b62857320244a8880f0803e05efa')
sha256sums_aarch64=('9ac3a5198f14862a05061d4a8842526013918da2a31ac18b8f4b401495e068f7')


prepare() {
	cd "${srcdir}/" || exit

	rm -rf git && git clone -n --depth=1 --filter=tree:0 "${_ghurl}" git

	cd git && git sparse-checkout set --no-cone /docs && git checkout

	cp -rfa docs "${srcdir}/" && cd .. && rm -rf git
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	for doc in docs/*.md; do
		install -Dm644 "${doc}" "${pkgdir}/usr/share/doc/${pkgname}/$(name=$(basename "${doc}" .md); echo "${name^^}.md")"
	done

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
