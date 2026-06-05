# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=antoniomika
_gitname=sish
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="HTTP(S)/WS(S)/TCP Tunnels to localhost using only SSH"

pkgver=2.23.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'openssh')

options=(!strip)

install="${_appname}.install"

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}.${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}.${_barch[1]}.tar.gz")
sha256sums_x86_64=('965dec4c1a17ecc44ea0bed479f8aa841630cf411886c49047bc0646df616170')
sha256sums_aarch64=('ca8141d9062de174bb794befb4cdb197ed2fb2280d15454c35819d8f19655ca4')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${srcdir}/${_appname}-${pkgver}.${_CARCH}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	for dir in deploy templates; do
		install -dm755 "${pkgdir}/usr/share/${_appname}/${dir}/"
		cp -av ${dir}/. "${pkgdir}/usr/share/${_appname}/${dir}/"
	done

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
