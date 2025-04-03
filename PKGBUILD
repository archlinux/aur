# Maintainer: shinka <shinnkka1@gmail.com>

pkgname=animeko
pkgver="4.8.0_beta01"
pkgrel=1
pkgdesc='集找番、追番、看番的一站式弹幕追番平台'
arch=('x86_64')
url='https://github.com/open-ani/animeko/'
license=('AGPL-3.0')
source_x86_64=("https://d.myani.org/v${pkgver//_/-}/ani-${pkgver//_/-}-linux-x86_64.appimage")
sha512sums_x86_64=('SKIP')
depends=('vlc')
#options=('!strip' )

prepare() {
	chmod +x "${srcdir}/ani-${pkgver//_/-}-linux-x86_64.appimage"
	./ani-${pkgver//_/-}-linux-x86_64.appimage --appimage-extract || true
	sed -i -E "s|Exec=Ani|Exec=/usr/bin/${pkgname}|g" "${srcdir}/squashfs-root/${pkgname}.desktop"
	sed -i -E "s|Icon=icon|Icon=${pkgname}|g" "${srcdir}/squashfs-root/${pkgname}.desktop"
}

package() {
    	install -d "${pkgdir}/opt/${pkgname}"
    	install -d "${pkgdir}/usr/bin"
    	install -d "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
   	install -d "${pkgdir}/usr/share/applications"

    	cp -r "${srcdir}/squashfs-root/usr" "${pkgdir}/opt/${pkgname}/"


    	install -Dm755 "${srcdir}/squashfs-root/AppRun" "${pkgdir}/opt/${pkgname}/AppRun"

    	ln -s "/opt/${pkgname}/AppRun" "${pkgdir}/usr/bin/${pkgname}"

    	install -Dm644 "${srcdir}/squashfs-root/icon.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
    	
    	install -Dm644 "${srcdir}/squashfs-root/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
