# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=gocron
_pkgauthor=gocronx-team
_pkgbase=gocron
_pkgname=${_pkgbase}
pkgbase=${_pkgbase}-bin
pkgname=(${_pkgbase}-bin ${_pkgbase}-node-bin)
pkgdesc="Distributed Scheduled Task Scheduler"

pkgver=1.9.1
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
sha256sums_x86_64=('b29eba9a6acfc5c52b81f8066e6b3b0b15fe0dfd80f39b10046ac3fd7fee046b'
                   'b00d1cc5e0fa129ea96ae1fdb3aaca2c74f87b96508add7b442b5b592fe8604b')
sha256sums_aarch64=('7628569ec96a96de1ff11970283ea10d663df2aad5db26df3d98e6a5b8349435'
                    'c48da4204a1b2659e66285ca01cc8be6d53c9967e61f2e0597cf5461506f0b37')


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
