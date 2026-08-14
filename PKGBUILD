# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=gocron
_pkgauthor=gocronx-team
_pkgbase=gocron
_pkgname=${_pkgbase}
pkgbase=${_pkgbase}-bin
pkgname=(${_pkgbase}-bin ${_pkgbase}-node-bin)
pkgdesc="Distributed Scheduled Task Scheduler"

pkgver=1.11.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[0]}.tar.gz"
               "${_pkgname}-node-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-node-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[1]}.tar.gz"
                "${_pkgname}-node-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-node-${_barch[1]}.tar.gz")
sha256sums_x86_64=('5d887992bedb791feeaad4e354f263e796e2dad95231c33f0310faa007821081'
                   '1fccf504c02be4a6b501bd52d3d3d388829ca502eb8ad4233528e6b2ad26c8ae')
sha256sums_aarch64=('e96cc68d2e53c0a5486db0a4d4e17d7ba12c575da17f0ec37dd41b0d07d4cb7a'
                    '3178ece1c8eba20df553c76d8ce40d5ff2252df82576db67f56918cec95d81c3')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package_gocron-bin() {
	provides=("${_appname}")
	optdepends=("${_appname}-node")

	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/opt/${_appname}/${_appname}"

	install -dm777 "${pkgdir}/var/lib/${_appname}"

	ln -sf "/var/lib/${_appname}" "${pkgdir}/opt/${_appname}/.${_appname}"

	install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_appname}" << END
#!/usr/bin/env sh

exec /opt/${_appname}/${_appname} "\$@"
END

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_gocron-node-bin() {
	provides=("${_appname}-node")
	optdepends=("${_appname}")

	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-node" "${pkgdir}/opt/${_appname}/${_appname}-node"

	install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_appname}-node" << END
#!/usr/bin/env sh

exec /opt/${_appname}/${_appname}-node "\$@"
END

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
