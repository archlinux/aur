# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Limatura
_gitname=tessera
_appname=${_gitname}
_bins=(${_appname%era} ${_appname}-server)
pkgname=${_appname}-bin
pkgdesc="Self-hosted file and note sharing that cleans up after itself"

pkgver=1.0.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('AGPL-3.0')

provides=("${_bins[@]}")
conflicts=("${pkgname%-bin}")

options=('!strip')

backup=("etc/${_appname}/${_appname}.env")

source=("CONFIG-${pkgver}.env::${_ghurlraw}/${_appname}.personal.env.example"
		"SERVICE-${pkgver}.service::${_ghurlraw}/contrib/${_appname}.service"
		"${_appname}.sysusers" "${_appname}.tmpfiles")
source_x86_64=("${_bins[0]}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_bins[0]}-${_barch[0]}.tar.gz"
               "${_bins[1]}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_bins[1]}-${_barch[0]}.tar.gz")
source_aarch64=("${_bins[0]}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_bins[0]}-${_barch[1]}.tar.gz"
                "${_bins[1]}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_bins[1]}-${_barch[1]}.tar.gz")
sha256sums=('4808aa59a70bec6258b19893dfc69cdd8f18cd973d183934297e179d2fe813d7'
            'f154f981d00348c50e7ee65b53b7056e3bbea764adafc31c0bd85c2db66966ee'
            '42ff3305b6746b97ec2f168efbb2d83e092da8657df7d6b57b0dd6315f3ddd57'
            '07e1e84a873387fd758aabd84d3f199ce7247e866c3ca82e37abcc82f9271e31')
sha256sums_x86_64=('3cba6cc764cc98deda9a6516b70585d2300a6e94d5646d82d6257485782ac7d5'
                   '0e345dbef2ec3d441df476607413eba8151345ddb26e0f0c48daee1e8f108f8e')
sha256sums_aarch64=('b549ef575d03347132ecfb111d35469f7ee7bd09d0b072abddca77e1c75faf72'
                    '21a66e7c0e0b927618b25bad5644b67eec8cd92ce8103b0768ec065e38bd4b2d')


prepare() {
	cd "${srcdir}/" || exit

	sed -e 's|/usr/local/bin/|/usr/bin/|g' -i "SERVICE-${pkgver}.service"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_bins[0]}" -t "${pkgdir}/usr/bin/"
	install -Dm755 "${_bins[1]}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "CONFIG-${pkgver}.env" "${pkgdir}/etc/${_appname}/${_appname}.env"

	install -Dm644 "SERVICE-${pkgver}.service" "${pkgdir}/usr/lib/systemd/system/${_appname}.service"

	install -Dm644 "${_appname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_appname}.conf"
	install -Dm644 "${_appname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_appname}.conf"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
