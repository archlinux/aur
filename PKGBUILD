# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: taotieren <admin@taotieren.com>

pkgname=easyeda-pro-bin
_pkgname=${pkgname%-bin}
pkgver=1.7.31
pkgrel=3
pkgdesc="EasyEDA Professional Edition"
arch=('x86_64')
url="https://pro.easyeda.com/"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib')
makedepends=('libarchive')
optdepends=()
provides=(${_pkgname})
conflicts=(${_pkgname} ${_pkgname}-git)
backup=()
options=()
install=${pkgname}.install
source=("${_pkgname}-${pkgver}.zip::https://image.easyeda.com/files/easyeda-pro-linux-x64-${pkgver}.zip"
		"LICENSE"
		"${pkgname}.install")
noextract=()
sha256sums=('3d1cfa547e7616d54c29cc01d6c2073a894a1cd4b6c8c719c68c99994728d38f'
			'c25d162b032c680a34856d65062aa7ffab56a478ee972eeb3e78543d2eb40f74'
			'cc1661c75c9366d2fe43c4b864cf81acb9aae7cab505ce21e7de2db3c68cde76')

package() {
	install -dm755 ${pkgdir}/opt/${_pkgname}
	#unzip "${srcdir}/${_pkgname}-linux-x64.zip" -d ${pkgdir}/opt/${_pkgname}
	#bsdtar xf "${srcdir}/${_pkgname}-linux-x64.zip" -C "${pkgdir}/opt/${_pkgname}"
	mv ${srcdir}/${_pkgname}-linux-x64/* ${pkgdir}/opt/${_pkgname}

	# icon
	local _icon
	for _icon in 16 32 64 128 256 512; do
		install -Dm644	${pkgdir}/opt/${_pkgname}/icon/icon_${_icon}x${_icon}.png \
						${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${_pkgname}.png
	done
	install -Dm644	${pkgdir}/opt/${_pkgname}/icon/icon_512x512@2x.png \
					${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${_pkgname}.png
	rm -rf ${pkgdir}/opt/${_pkgname}/icon

	# desktop entry
	install -Dm644	${pkgdir}/opt/${_pkgname}/EasyEDA-PRO.dkt \
					${pkgdir}/usr/share/applications/${_pkgname}.desktop

	sed -i 's|/opt/easyeda-pro/icon/icon_128x128.png|easyeda-pro|g' \
		${pkgdir}/usr/share/applications/${_pkgname}.desktop
	sed -i 's|/opt/easyeda-pro/||g' \
		${pkgdir}/usr/share/applications/${_pkgname}.desktop
	rm -rf ${pkgdir}/opt/${_pkgname}/EasyEDA-PRO.dkt

	# soft link
	install -dm755 ${pkgdir}/usr/bin
	ln -s /opt/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
	chmod 755 ${pkgdir}/opt/${_pkgname}/${_pkgname}

	# LICENSE
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
