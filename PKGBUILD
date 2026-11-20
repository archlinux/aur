# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=gossamer-lang
_gitname=gossamer
_appname=gos
pkgname=${_gitname}-bin
pkgdesc="The Gossamer programming language and tooling"

pkgver=0.82.3
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

makedepends=('git')
depends=('glibc' 'libgcc')

options=('!strip' 'staticlibs')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums_x86_64=('a8c7cc66aad080257e0c775ccb039d43bbc31afa06be5ae4ed27c6633de34bb0')
sha256sums_aarch64=('d8b5723381a3499d0c0aa61c6da0b4bda3df38311360fca29e1fe675d93d4df7')


case ${CARCH} in
	${arch[0]})
		_CARCH=${_barch[0]}
	;;

	${arch[1]})
		_CARCH=${_barch[1]}
	;;
esac

prepare() {
	cd "${srcdir}/" || exit

	rm -rf git && git clone -n --depth=1 --filter=tree:0 "${_ghurl}" git

	cd git && git sparse-checkout set --no-cone /examples /example-external-libraries && git checkout

	rm -rf examples/*.expected.txt examples/.gitignore* example-external-libraries/*.sh

	mv -f example-external-libraries examples/projects/external-libraries

	cp -rfa examples "${srcdir}/${_appname}-${pkgver}-${_CARCH}/"

	cd .. && rm -rf git
}

package() {
	cd "${srcdir}/${_appname}-${pkgver}-${_CARCH}/" || exit

	install -Dm755 ${_appname} -t "${pkgdir}/usr/bin/"

	install -Dm644 lib${_gitname}*.a -t "$pkgdir/usr/lib/"

	install -dm755 "${pkgdir}/usr/share/${_gitname}/"
	cp -rfa examples "${pkgdir}/usr/share/${_gitname}/"

	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
