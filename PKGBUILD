# Maintainer: Yiyao Yu <yuydevel at protonmail dot com>

_pkgname='kcptun-plugin'
pkgname="${_pkgname}-git"
pkgver=r27.30c848a
pkgrel=3
pkgdesc='SIP003-compatible KCPTUN and UDP2RAW plugins for shadowsocks-libev'
license=('custom:Unlicense')
url='https://github.com/w1ndy/kcptun-plugins'
arch=('x86_64')
depends=('glibc' 'curl')
makedepends=('git' 'make')
source=("${_pkgname}::git+${url}.git"
		"${_pkgname}.install"
		"0001-local_to_share.patch")
install="${_pkgname}.install"
sha256sums=('SKIP'
			'ba7135e5042e13f236402f7bdfb5e2fa9a170445233bdc1ff90e893f4caa7c78'
			'961c584fe20e340877bade0a012218157c2c4d4efe37a7b563174084e4ac48c9')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	for p in ${srcdir}/*.patch; do
		patch -Np1 -i "$p"
	done
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -dm 755 "${pkgdir}/usr/share/kcptun_plugins" "${pkgdir}/usr/bin"
	install -Dm 755 'ss-proxy' 'kcptun-client-plugin' 'kcptun-server-plugin' 'lib' "${pkgdir}/usr/share/kcptun_plugins/"
	ln -s '/usr/share/kcptun_plugins/ss-proxy' "${pkgdir}/usr/bin/ss-proxy"
	ln -s '/usr/share/kcptun_plugins/kcptun-client-plugin' "${pkgdir}/usr/bin/kcptun-client-plugin"
	ln -s '/usr/share/kcptun_plugins/kcptun-server-plugin' "${pkgdir}/usr/bin/kcptun-server-plugin"

	install -Dm 644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
