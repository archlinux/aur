# Maintainer: Vasilly Prokopyev <Vasilly.Prokopyev at google mail>
# Contributor: 欠陥電気 <misaka13514 at google mail>

pkgname=easyeda-bin
_pkgname=${pkgname%-bin}
pkgver=6.5.11
pkgrel=1
pkgdesc="A Simple and Powerful Electronic Circuit Design Tool"
arch=('x86_64')
url="https://easyeda.com/"
license=('custom')
depends=('gtk3' 'nss' 'libxss' 'alsa-lib')
makedepends=('unzip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.zip::https://image.easyeda.com/files/${_pkgname}-linux-x64-${pkgver}.zip"
		"LICENSE")
sha256sums=('58d9c9d7cf8b4dd274f2b0251520fe3f3db0b057ac437d0114fd80e8923eb31f'
			'c52b78caac78dde0948489d67bfadbb2c1eb21a456846806b1a4a3a1c07f36ec')

package() {
	install -dm755 ${pkgdir}/opt/${_pkgname}
	unzip easyeda-linux-x64.zip -d ${pkgdir}/opt/${_pkgname}
	#mv ${srcdir}/easyeda-linux-x64/* ${pkgdir}/opt/${_pkgname}

	# icon
	local _icon
	for _icon in 16 32 48 64 128 256; do
		install -Dm644	${pkgdir}/opt/${_pkgname}/icon/${_icon}x${_icon}/${_pkgname}.png \
						${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${_pkgname}.png
	done
	rm -rf ${pkgdir}/opt/${_pkgname}/icon

	# desktop entry
	install -Dm644	${pkgdir}/opt/${_pkgname}/EASYEDA.dkt \
					${pkgdir}/usr/share/applications/${_pkgname}.desktop

	sed -i 's|/easyeda-linux-x64/icon/128x128/easyeda.png|easyeda|g' \
		${pkgdir}/usr/share/applications/${_pkgname}.desktop
	sed -i 's|/easyeda-linux-x64/||g' \
		${pkgdir}/usr/share/applications/${_pkgname}.desktop
	rm -rf ${pkgdir}/opt/${_pkgname}/EASYEDA.dkt

	# soft link
	install -dm755 ${pkgdir}/usr/bin
	ln -s /opt/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
	chmod 755 ${pkgdir}/opt/${_pkgname}/${_pkgname}

	# LICENSE
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
