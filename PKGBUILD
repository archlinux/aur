# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ptweezy
_gitname=cronstable
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A modern, container-friendly, optionally-distributed, fault-tolerant, highly available, leader-electing, highly configurable, precompiled, multi-architecture, portable, security-hardened, production-ready cron replacement"

pkgver=1.2.21
pkgrel=1
_gitversion=${pkgver}

arch=('i686' 'x86_64' 'aarch64')
_barch=('linux-i686' 'linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

conflicts=("${pkgname%-bin}")
provides=("${_appname}")

makedepends=('git')
depends=('glibc' 'zlib')

options=(!strip)

source=("LICENSE-${pkgver}::${_ghurlraw}/LICENSE"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"COMPARISON-${pkgver}.md::${_ghurlraw}/docs/comparison.md")
source_i686=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_x86_64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
source_aarch64=("${_appname}-${arch[2]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[2]}")
sha256sums=('34331733e709d523f018dbdab00d54ce4243b48cd1eb59d3f0d7d65bf44ee67f'
            'b24a63923a591ae622874455689ade0f6cbf5c683453a26595baa859370f81a0'
            '15ce735d172d6550c76de9357720de970e2f3d08671b38de18f8a48c73badbe2')
sha256sums_i686=('be51baea67f40a5e88f7f091532bb5e595a4a928f243c2d5fde8a50139432aed')
sha256sums_x86_64=('8a0d2a1b0952c4f855d378892ba09b8b6f5845ea0838606fbc373917f1d2fadd')
sha256sums_aarch64=('5c111e4f650be27f1ed1ebd8af1085b30f8c67597f63cbb6e385801f3156c2fc')


prepare() {
	cd "${srcdir}/" || exit

	rm -rf git && git clone -n --depth=1 --filter=tree:0 --branch "${_gitversion}" "${_ghurl}" git && cd git

	git sparse-checkout set --no-cone /example && git checkout
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -dm755 "${pkgdir}/usr/share/${_appname}/examples/"
	cp -rf ./git/example/* "${pkgdir}/usr/share/${_appname}/examples/"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "COMPARISON-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/COMPARISON.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
