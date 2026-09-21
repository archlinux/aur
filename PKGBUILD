# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ptweezy
_gitname=cronstable
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A modern, container-friendly, optionally-distributed, fault-tolerant, highly available, leader-electing, highly configurable, precompiled, multi-architecture, portable, security-hardened, production-ready cron replacement"

pkgver=1.2.55
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
sha256sums=('9241d47c049b68a38340566a12980c92e29e3f5c99c203944fdc78937eabe7d1'
            'db928813a0e0828da4195b3b26c9d48e8c784820da81c34c5680a347d5ca7acb'
            '1e940e2dc1c5d7931294a445a8ee47d009cbec6b7555951bef1fc0e2b0c2dfe4')
sha256sums_i686=('b1391e529da9b43909ac9d2ff5de3af4ecf69bd0ce08c38c397a5e379aa95549')
sha256sums_x86_64=('54bc43f0373997226e045d9670f84df829681999c8519dbf1cff69a593d6c900')
sha256sums_aarch64=('b2e1ee49bcb8096f4083842a83af640afa38da4a244ee376b4266f6f2ac16cb9')


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
