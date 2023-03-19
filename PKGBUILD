# Maintainer: Yanli <beautyyuyanli@gmail.com>
# Contributor: cubercsl <hi@cubercsl.site>
# Contributor: glitsj16
pkgname=linuxqq-firejail
pkgver=1.0.2
pkgrel=1
epoch=1
pkgdesc='New Linux QQ based on Electron, running in Firejail sandbox.'
arch=('x86_64' 'aarch64')
url="https://github.com/BeautyYuYanli/linuxqq-firejail"
license=('unknown')
depends=('linuxqq' 'firejail>=0.9.72' 'xdg-desktop-portal' 'flatpak-xdg-utils')
source=(
	"jsbridge-dummy.desktop"
	"jsbridge-dummy.xml"
	"linuxqq-firejail.png"
)
sha512sums=(
	'2b35a552d4a9e0540739d7787924ccee8a6a3850aadbfa20031f45e0e660ba36ae223b88bdff3e32161c39a43a151fc2e817d96452fd1da981d24d8daf50707b'
	'265028a10695cf879f4dc8bf87b9a9f860b774563487dedba5f2c11a233eb74dde0ee61e0a6a8618e5320302600edaeedc68114337ad455d2303e5d931cbea3f'
	'6c0eaec353aedb8e5f27490a176f20435c71c41492f606abf00ef6918d10dcbd17266b46a59b28fe9168008389b097506965771319bdb24fe1f03c818520e19f'
)

package() {
	# Create icon
	mkdir "${pkgdir}/usr/share/icons/hicolor/512x512/apps/" -p
	cp "linuxqq-firejail.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/"

	# Wrap launcher
	launcher="${pkgdir}/usr/share/applications/qq-firejail.desktop"
	echo "  -> Wrapping launcher..."
	mkdir "${pkgdir}/usr/share/applications" -p
	cp "/usr/share/applications/qq.desktop" "${launcher}"
	sed -i "2s!QQ!QQ in Firejail!" "${launcher}"
	sed -i "3s!Exec=!Exec=sh -c \"env PATH=/usr/lib/flatpak-xdg-utils:\$PATH firejail --private-bin=linuxqq,xdg-open,xdg-mime !" "${launcher}"
	sed -i "3s!%U!\"%U!" "${launcher}"
	sed -i "6s!qq!linuxqq-firejail!" "${launcher}"

	# Add dummy jsbridge handler
	mkdir "${pkgdir}/usr/share/mime/packages/" -p
	cp "jsbridge-dummy.desktop" "${pkgdir}/usr/share/applications/"
	cp "jsbridge-dummy.xml" "${pkgdir}/usr/share/mime/packages/"
}

post_install() {
	update-desktop-database -q
	update-mime-database /usr/share/mime
}
