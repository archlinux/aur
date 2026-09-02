# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=vorjdux
_gitname=dux-lang
_appname=${_gitname%-lang}
pkgname=${_gitname}-bin
pkgdesc="An experimental new programming language"

pkgver=0.1.3
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

makedepends=('git')
depends=('glibc' 'libgcc' 'libstdc++' 'readline' 'zlib' 'zstd')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
sha256sums=('d55f37eb4bb3b4dfeaf01896254488a7d6659f37c3636ffdab0a5e0d498083ad'
            '30c60d5d9ea8435588b76dfa956cf8ad5ebb2e7c9b7d0f755a3e8effc46c5fac')
sha256sums_x86_64=('c4731dab76e34de70013ea044a3515d7cabf7760ae19f6d0db60dd32a426bb5e')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

_PACKAGE_DIR="${_appname}-${pkgver}-${_CARCH}/"

prepare() {
	cd "${srcdir}/" || exit

	rm -rf git && git clone -n --depth=1 --filter=tree:0 "${_ghurl}" git

	cd git && git sparse-checkout set --no-cone /examples && git checkout

	cp -rfa examples "${srcdir}/${_PACKAGE_DIR}/share/${_appname}/" && cd .. && rm -rf git
}

package() {
	cd "${srcdir}/${_PACKAGE_DIR}/" || exit

	install -dm755 "${pkgdir}/usr"

	cp -rfa bin lib include share "${pkgdir}/usr/"

	install -Dm644 "../README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "../LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
