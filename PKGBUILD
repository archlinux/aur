# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=takakix2
_gitname=berthd
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Persistent shell sessions — a small daemon that owns your PTYs, so shells outlive the terminal app"

pkgver=0.6.3
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('ISC')

provides=("${_appname%d}"{,d})
conflicts=("${pkgname%-bin}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums_x86_64=('9ebf03cf46a603be52175b4a322fe4e0796786c751b832fb6c8a559eec45923d')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

prepare() {
	cd "${srcdir}/${_appname}-${pkgver}-${_CARCH}/" || exit

	sed -e "s|ExecStart=.*|ExecStart=/usr/bin/${_appname}|g" -i dist/*.service
}

package() {
	cd "${srcdir}/${_appname}-${pkgver}-${_CARCH}/" || exit

	install -Dm755 ${_appname%d}{,d} -t "${pkgdir}/usr/bin/"

	install -Dm644 dist/*.service -t "${pkgdir}/usr/lib/systemd/user/"

	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
