# Maintainer: yuhldr yuhldr@qq.com

_pkgname="ikuuu_vpn"
_binname="ikuuu-vpn"
pkgname="${_binname}"
pkgver="0.17.5"
_buildid="22a756ce"
pkgrel=1
pkgdesc="iKuuuVPN (repacked from .deb)"
arch=('x86_64')
url="https://ikuuu.dev/"
license=('custom')
options=(!strip !debug)
depends=('gtk3' 'libsecret' 'libayatana-appindicator')
optdepends=('libkeybinder3: for global hotkeys')
# no provides/conflicts: keep only the canonical Arch package name

_deb_pkg="${_pkgname}-${pkgver}-${_buildid}"
_deb_file="${_deb_pkg}-linux-amd64.deb"

source=("${_deb_file}::https://client.files-2.eakpfo.cn/file/ikuuu-client-release/client/${_deb_pkg}/${_deb_file}")

sha256sums=('63fa28b2fe68f30142034e7943fefc04c5764744546045df4dc486d3559c9693')

prepare() {
	bsdtar -xf "${_deb_file}"
}

build() {
	:
}

package() {
	bsdtar --no-same-owner --no-same-permissions -xf data.tar.xz -C "${pkgdir}"

	# Desktop file: use a stable command name
	sed -i \
		-e "s|^Exec=.*|Exec=${_binname} %U|" \
		"${pkgdir}/usr/share/applications/ikuuuvpn.desktop"

	# License / notices
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 \
		"${pkgdir}/usr/share/iKuuuVPN/data/flutter_assets/NOTICES.Z" \
		"${pkgdir}/usr/share/licenses/${pkgname}/NOTICES.Z"

	# Binary (canonical command name)
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "../share/iKuuuVPN/iKuuuVPN" "${pkgdir}/usr/bin/${_binname}"
}
