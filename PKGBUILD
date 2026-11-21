# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=gossamer-lang
_gitname=gossamer
_appname=gos
pkgname=${_gitname}-bin
pkgdesc="The Gossamer programming language and tooling"

pkgver=0.83.0
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
sha256sums_x86_64=('c81af92308abb1ea79363cce7aeb6102d9b4353ff6cca17c6eb31ab8ea7f9955')
sha256sums_aarch64=('b7eaec50557a8167220b5c4d0489733add5ea76d73a10cc39cb97743d54fdc60')


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
