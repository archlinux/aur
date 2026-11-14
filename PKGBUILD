# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=gocron
_pkgauthor=gocronx-team
_pkgbase=gocron
_pkgname=${_pkgbase}
pkgbase=${_pkgbase}-bin
pkgname=(${_pkgbase}-bin ${_pkgbase}-node-bin)
pkgdesc="Distributed Scheduled Task Scheduler"

pkgver=1.13.0
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
sha256sums_x86_64=('97263b3d9b08360a289586b47147e0838cc2727b423d5da045edf025797987a6'
                   '59c3ef820d09e8b252bb6991797548cd2098c0154f44a0c10282b1692f83b45b')
sha256sums_aarch64=('060e7db0c20d1f64ed978867aa9392c879c2733bb66c4ee8033ac8dee39deb8c'
                    '5948e2bda8d1c447d9fe04426af26fa534ba776e841c32d30ec0f02956720558')


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
