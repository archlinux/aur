# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ptweezy
_gitname=cronstable
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A modern, container-friendly, optionally-distributed, fault-tolerant, highly available, leader-electing, highly configurable, precompiled, multi-architecture, portable, security-hardened, production-ready cron replacement"

pkgver=1.2.42
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
            '8be77e1de4436fe047adeccc8d735ade21f5da815074fe7d43ce09bab424e5dd'
            '1401970d437db55192d958a8922936315b7185a786357a40d5e19f6a0bf7fd59')
sha256sums_i686=('0ed4430794021ec7db4875c8af908ba434c01d77ab968a6f63cbc1fed66c6bb5')
sha256sums_x86_64=('8158d2bafaef885b069d566ead38d7bcda93eeb1f30ceebd9f48bf22997346af')
sha256sums_aarch64=('cd0aaedc3943973e4d15a507a824fb8f283b8299b22ef3b1df2f9762f7628ade')


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
