# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=qingjian
pkgname="fcitx5-${_appname}-bin"
pkgver=0.3.4
pkgrel=2
pkgdesc="青简输入法 Linux/Fcitx5 官方支持版（Rust Server + Fcitx5 插件 + 离线数据模型）"
arch=('x86_64')
url="https://qingjian.app"
_ghurl="https://github.com/qingjian-team/qingjian"
license=('GPL-3.0-or-later')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
makedepends=('python')
depends=(
	'fcitx5'
	'openssl-3'
	'hicolor-icon-theme'
	'glibc'
	'fcitx5-gtk'
	'fcitx5-qt'
	'fcitx5-configtool'
)
options=(
	'!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-x86_64.tar.gz"
    "${_appname}-server.service"
)
install="${pkgname%-bin}.install"
sha256sums=('363371f48e988356b2fab8bc38cd3c04188a25cc475fd7e78401e7dccc9cb069'
            'b543cdc876b02e14602fb84399afbcd1a57add840b10d8b1ce532099ad8b3516')
_get_app_dir() {
	find "${srcdir}" -type f -name "install.sh" -printf '%h\n' 2>/dev/null \
		| while read -r d; do [[ -d "${d}/target" ]] && { echo "$d"; return 0; }; done
}
package() {
	install -Dm755 "$(_get_app_dir)/bin/"* -t "${pkgdir}/usr/bin"
	install -Dm755 "$(_get_app_dir)/lib/${_appname}.so" -t "${pkgdir}/usr/lib/fcitx5"
	install -Dm644 "$(_get_app_dir)/apps/linux/fcitx5/data/addon/${_appname}.conf" -t "${pkgdir}/usr/share/fcitx5/addon"
	install -Dm644 "$(_get_app_dir)/apps/linux/fcitx5/data/inputmethod/${_appname}.conf" -t "${pkgdir}/usr/share/fcitx5/inputmethod"
	install -Dm644 "$(_get_app_dir)/apps/settings/linux/${_appname}-settings.desktop" -t "${pkgdir}/usr/share/applications"
	for _size in 16 22 24 32 48 64 128 256; do
		install -Dm644 "$(_get_app_dir)/assets/icon/linux/hicolor/${_size}x${_size}/apps/${_appname}.png" \
			"${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${_appname}.png"
	done
	python3 "$(_get_app_dir)/tools/release/models-fetch.py"
	python3 "$(_get_app_dir)/tools/release/dicts-fetch.py"
	python3 "$(_get_app_dir)/files.py" resources "${pkgdir}/usr/share/${_appname}/resources" --root "$(_get_app_dir)"
	install -Dm644 "${_appname}-server.service" -t "${pkgdir}/usr/lib/systemd/user"
	install -d "${pkgdir}/usr/lib/systemd/user-preset"
	printf 'enable %s-server.service\n' "${_appname}" \
		> "${pkgdir}/usr/lib/systemd/user-preset/50-${_appname}.preset"
}
