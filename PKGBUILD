# Maintainer: fansuregrin <quarlong@qq.com>
pkgname=cnkiexpress
_pkgname=$pkgname
pkgver=0.1.22
pkgrel=2
pkgdesc="A software for academic research articles developed by CNKI"
arch=("x86_64")
url="https://cajviewer.cnki.net"
license=('custom')
depends=('hicolor-icon-theme'
         'gtk3'
         'libnotify'
         'nss'
         'libxss'
         'libxtst'
         'xdg-utils'
         'at-spi2-core'
         'util-linux-libs'
         'libappindicator-gtk3'
         'libsecret')
makedepends=('sed' 'tar')
source=("https://download.cnki.net/cnkiexpress/cnkiexpress_${pkgver}_amd64.deb")
sha256sums=('e402f22c9e005882b2e97fe1622a8dead7dd82766055f1c073ce023ca2ef877f')
options=(!strip)

prepare() {
	tar -xJf data.tar.xz
	cd ${srcdir}/opt/${_pkgname}

	# making .AppImage file executable
	chmod -v +x ${_pkgname}.AppImage

	# extract .AppImage file
	./${_pkgname}.AppImage --appimage-extract
}

build() {
	cd ${srcdir}/opt/${_pkgname}
	# modifying .desktop file
	sed -i -E "s|Exec=AppRun|Exec=/usr/bin/${_pkgname}|" squashfs-root/${_pkgname}.desktop
	sed -i "s/Name/Name[zh_CN]/g" squashfs-root/${_pkgname}.desktop 
	sed -i "/Name/i\Name=CNKI Express" squashfs-root/${_pkgname}.desktop 
}

package() {
	cd ${srcdir}

	# Copy app files
	install -vdm 755 ${pkgdir}/opt/${_pkgname}/
	cp -va opt/${_pkgname}/squashfs-root/* ${pkgdir}/opt/${_pkgname}

	# Fix permissions
	for d in locales resources Resource; do
		chmod -v 755 ${pkgdir}/opt/${_pkgname}/${d}
		find ${pkgdir}/opt/${_pkgname}/${d} -type d -exec chmod -v 755 {} +
	done
	chown root:root ${pkgdir}/opt/${_pkgname}/chrome-sandbox
	chmod 4755 ${pkgdir}/opt/${_pkgname}/chrome-sandbox

	# Install mime file
	install -vDm 644 usr/share/mime/packages/${_pkgname}.xml -t ${pkgdir}/usr/share/mime/packages 

	# Link entry point	
	install -vdm 755 ${pkgdir}/usr/bin/
	ln -vsf /opt/${_pkgname}/${_pkgname}  ${pkgdir}/usr/bin/${_pkgname}

	# Install LICENSE file
	install -Dm644 ${pkgdir}/opt/${_pkgname}/license.txt -t ${pkgdir}/usr/share/licenses/${_pkgname}

	# Copy icons files
	install -vdm 755 ${pkgdir}/usr/share/icons/
	find usr/share/icons -type d -exec chmod -v 755 {} +
	cp -va usr/share/icons/* ${pkgdir}/usr/share/icons/

	# Copy desktop file
	install -vDm 644 opt/${_pkgname}/squashfs-root/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop

	# Remove unused files
	rm -vrf ${pkgdir}/opt/${_pkgname}/{usr,swiftshader,AppRun,${pkgname}.{desktop,png}}
}
