# Maintainer: yuhldr yuhldr@qq.com

_pkgname="ikuuu_vpn"
_binname="ikuuu-vpn"
pkgname="${_binname}"
pkgver="0.17.2"
_buildid="7d49760e"
pkgrel=1
pkgdesc="iKuuuVPN (repacked from .deb)"
arch=('x86_64')
url="https://ikuuu.dev/"
license=('custom')
options=(!strip !debug)
depends=('gtk3' 'libsecret' 'libayatana-appindicator')
optdepends=('libkeybinder3: for global hotkeys')
# no provides/conflicts: keep only the canonical Arch package name

_deb_file="${_pkgname}-${pkgver}-${_buildid}-linux-amd64.deb"

source=("${_deb_file}::https://client.files-2.eakpfo.cn/file/ikuuu-client-release/client/ikuuu_vpn-0.17.2-7d49760e/ikuuu_vpn-0.17.2-7d49760e-linux-amd64.deb")

sha256sums=('9788ef41e06c7ec0f5b1ba715690ad46877512a449fd56c5ccd81a1ce8178730')

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
