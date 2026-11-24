# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=danpozmanter
_gitname=process-watch
_appname=${_gitname}
_execname=pw
pkgname=${_appname}-bin
pkgdesc="Local process monitor to get peak CPU/RAM over time"

pkgver=0.6.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_execname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
sha256sums_x86_64=('c3ca1eca685de437010e89fde8edf45f471e2dabbf45afb3a01983cf46a85331')


case ${CARCH} in
	${arch[0]})
		_CARCH=${_barch[0]}
	;;

	${arch[1]})
		_CARCH=${_barch[1]}
	;;
esac

prepare() {
	cd "${srcdir}/${_appname}-${pkgver}-${_CARCH}/" || exit

	sed -e 's|%h/.local/bin/|/usr/bin/|g' -i contrib/systemd/*.service
}

package() {
	cd "${srcdir}/${_appname}-${pkgver}-${_CARCH}/" || exit

	install -Dm755 ${_execname} -t "${pkgdir}/usr/bin/"

	install -Dm644 contrib/systemd/*.service -t "${pkgdir}/usr/lib/systemd/user/"

	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
