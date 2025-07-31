# Maintainer: Kimiblock Moe
# Modified from baidunetdisk-bin
# Contributor: Astro Benzene <universebenzene at sina dot com>
# Contributor: Ariel AxionL <i at axionl dot me>
# Contributor: lilydjwg <lilydjwg at gmail dot com>
# Contributor: kearneyBack <191615342 at qq dot com>

_pkgname=baidunetdisk
pkgname=baidunetdisk-portable
pkgver=4.17.7
pkgrel=1
pkgdesc="Baidu Netdisk sandboxed by portable"
arch=('x86_64')
depends=('portable' 'libnotify' 'libsecret' 'libxss' 'gtk3' 'nss')
makedepends+=('desktop-file-utils')
provides=("baidunetdisk")
conflicts=("baidunetdisk")
url="https://pan.baidu.com"
license=("LicenseRef-custom")
options=('!strip')

source=(
        "baidunetdisk-wrapper.sh"
	portable-config
)

#source_x86_64=("${pkgname}-${pkgver}.deb::https://issuecdn.baidupcs.com/issue/netdisk/LinuxGuanjia/${_mainver}/${_pkgname}_linux_${pkgver}.deb")
source_x86_64=("${pkgname}-${pkgver}.deb::http://wppkg.baidupcs.com/issue/netdisk/Linuxguanjia/${pkgver}/baidunetdisk_${pkgver}_amd64.deb")

sha256sums=('b6a97f823fd8891669ff879385beeb009632bd4c120ee95a409d7ac648f9b149'
            '9c26d81f9ce25c35f138da3e726b88447e754b3279766de419a9c672a148c10a')
sha256sums_x86_64=('50ec18f05626a13f57ef034630416d481682bc1018539f33397d5c71bc653b3d')

prepare() {
	bsdtar -xpf "data.tar.xz"
	sed -i '/Name/a Name[zh_CN]=百度网盘' usr/share/applications/${_pkgname}.desktop
	desktop-file-edit \
		--set-key=Exec \
		--set-value='env _portableConfig=com.baidu.pan portable -- %U' \
		usr/share/applications/${_pkgname}.desktop
}

package() {
	cd "${srcdir}"
	mv "usr" "${pkgdir}"
	install -dm755 "${pkgdir}/usr/lib" "${pkgdir}/usr/share/licenses/${_pkgname}"
	mv "opt/${_pkgname}" "${pkgdir}/usr/lib/${_pkgname}"
#	install -Dm755 "${srcdir}/baidunetdisk-wrapper.sh" "${pkgdir}/usr/bin/baidunetdisk"
	chmod 644 "${pkgdir}/usr/lib/${_pkgname}/"*.so
	find ${pkgdir} -type d -exec chmod 755 {} \;
	# install license
	ln -s "/usr/lib/${_pkgname}/LICENSE.electron.txt" \
		"${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.electron.txt"
	ln -s "/usr/lib/${_pkgname}/LICENSES.chromium.html" \
		"${pkgdir}/usr/share/licenses/${_pkgname}/LICENSES.chromium.html"
	install -vDm755 "${srcdir}/baidunetdisk-wrapper.sh" "${pkgdir}/usr/bin/baidunetdisk"
	install -vDm755 "${srcdir}/portable-config" "${pkgdir}/usr/lib/portable/info/com.baidu.pan/config"
	mv \
		"${pkgdir}/usr/share/applications/baidunetdisk.desktop" \
		"${pkgdir}/usr/share/applications/com.baidu.pan.desktop"
}
