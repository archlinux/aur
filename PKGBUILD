# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=antoniomika
_gitname=sish
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="HTTP(S)/WS(S)/TCP Tunnels to localhost using only SSH"

pkgver=4.0.0
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
sha256sums_x86_64=('3adb57cc008cb1d95d178a0ec0ceb67cf0d3645c0004d0d789011ce7dc01956f')
sha256sums_aarch64=('f48039d6b9224b00ead10443d7d41168cd10005009660e719c3a033beeb8714f')


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
