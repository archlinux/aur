# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=antoniomika
_gitname=sish
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="HTTP(S)/WS(S)/TCP Tunnels to localhost using only SSH"

pkgver=4.1.1
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
sha256sums_x86_64=('f8aa192118f05397399d834c7a51ad96a99ad608973abbe9319dce72f5816e31')
sha256sums_aarch64=('d7c5aaf18c4fbc122d404a20d6908d33f9eef8c69192f1e8af65b26e18ba088c')


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
