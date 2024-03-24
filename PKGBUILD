# Maintainer: lihe07 <umikahoshi at gmail dot com>

pkgname=wechat-universal
pkgver=1.0.0.238
pkgrel=1
pkgdesc="WeChat (Universal) with full access to the system"
arch=('x86_64' 'aarch64' 'loong64')
url="https://weixin.qq.com"
license=('proprietary')
provides=("${pkgname}")
conflicts=("${pkgname}"{,-bwrap,-privileged})
depends=(
	'alsa-lib'
	'at-spi2-core'
	'bash'
	'flatpak-xdg-utils'
	'libxcomposite'
	'libxkbcommon-x11'
	'libxrandr'
	'lsb-release'
	'mesa'
	'nss'
	'openssl-1.1'
	'pango'
	'xcb-util-image'
	'xcb-util-keysyms'
	'xcb-util-renderutil'
	'xcb-util-wm'
	'xdg-desktop-portal'
	'xdg-user-dirs'
)
options=(!strip !debug emptydirs)
source=(
	"license.tar.gz"
	"${pkgname}.sh"
	"${pkgname}.desktop"
)

_deb_url_common="https://home-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.wechat/com.tencent.wechat_${pkgver}"
_deb_stem="${pkgname}_${pkgver}"

source_x86_64=(
	"${_deb_stem}_x86_64.deb::${_deb_url_common}_amd64.deb"
)

source_aarch64=(
	"${_deb_stem}_aarch64.deb::${_deb_url_common}_arm64.deb"
)

source_loong64=(
	"${_deb_stem}_loong64.deb::${_deb_url_common}_loongarch64.deb"
)

noextract=("${_deb_stem}"_{x86_64,aarch64,loong64}.deb)

sha256sums=(
	'53760079c1a5b58f2fa3d5effe1ed35239590b288841d812229ef4e55b2dbd69'
	'1ba349d82c21e7cdff872f3fc36f2c532f4c2802b936f836ff9ba650677bb501'
	'b783b7b0035efb5a0fcb4ddba6446f645a4911e4a9f71475e408a5c87ef04c30'
)

sha256sums_x86_64=(
	'371026679dba25a033023b4077dc527059d906ec03ea2db05f6fc012ab40c96b'
)
sha256sums_aarch64=(
	'debbba2b20585e2b80959b96872cafb500966ce261198ce47abdc54b4efcf111'
)
sha256sums_loong64=(
	'8ae25e2cc283eaff09f222b0dfe73238337b3d942b2e98bda74fff9a4234ba31'
)

package() {
	echo 'Popupating pkgdir with data from wechat-universal deb file...'
	bsdtar -xOf "${_deb_stem}_${CARCH}.deb" ./data.tar.xz |
		xz -cdT0 |
		bsdtar -xpC "${pkgdir}" ./opt/apps/com.tencent.wechat
	mv "${pkgdir}"/opt/{apps/com.tencent.wechat/files,"${pkgname}"}

	echo 'Installing icons...'
	for res in 16 32 48 64 128 256; do
		install -Dm644 \
			"${pkgdir}/opt/apps/com.tencent.wechat/entries/icons/hicolor/${res}x${res}/apps/com.tencent.wechat.png" \
			"${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${pkgname}.png"
	done
	rm -rf "${pkgdir}"/opt/apps

	echo 'Fixing licenses...'
	local _wechat_root="${pkgdir}/usr/share/${pkgname}"
	install -dm755 {"${pkgdir}","${_wechat_root}"}/usr/lib/license
	mv "${pkgdir}/opt/${pkgname}/libuosdevicea.so" "${_wechat_root}"/usr/lib/license/
	cp -ra license/etc "${_wechat_root}"
	cp -ra license/var "${_wechat_root}"

	echo 'Installing desktop files...'
	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
