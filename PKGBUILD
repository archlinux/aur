# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ptweezy
_gitname=cronstable
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A modern, container-friendly, optionally-distributed, fault-tolerant, highly available, leader-electing, highly configurable, precompiled, multi-architecture, portable, security-hardened, production-ready cron replacement"

pkgver=1.2.44
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
            '9888d628d0d94c0df953f45faa53b7f65b8739e5c3a1d1b7bd4ca0c23d979961'
            '3fc5e0959c5811c11ebab39e128f699e5c0afccba1e236e2fdb61eadc47ce608')
sha256sums_i686=('61a94937d3555ffdfd417c0ed8b5f96d217cc52e60e7282df8f4224a9ba97636')
sha256sums_x86_64=('6f84d46599a750b93a05b82f82deca55fdfb862eea318ea7e503ba0cb7adc08b')
sha256sums_aarch64=('998a966e07c62c33dba85d42802e5675a386f2c5dfdbee9a0a4093da76744ef4')


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
