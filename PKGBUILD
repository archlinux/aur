# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=antoniomika
_gitname=sish
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="HTTP(S)/WS(S)/TCP Tunnels to localhost using only SSH"

pkgver=3.1.0
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
sha256sums_x86_64=('a516791a6e2816d3270d9e867894b0a11ff5ddd37f57d237339cbbdee064770f')
sha256sums_aarch64=('8e0ce98c7e5581149708a48d4438ed2a01a67f10ad1ef0a5514ee9ff7c2b1426')


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

	for dir in deploy; do
		install -dm755 "${pkgdir}/usr/share/${_appname}/${dir}/"
		cp -av ${dir}/. "${pkgdir}/usr/share/${_appname}/${dir}/"
	done

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
