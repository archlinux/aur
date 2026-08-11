# Maintainer: tugyan <bilaltasdelen at windowslive dot com>
# Contributor: jkdhn <aur@jkdhn.me>

pkgname=saleae-logic2
pkgver=2.4.46
pkgrel=2
pkgdesc="Debug hardware like a pro"
arch=("x86_64")
url="https://discuss.saleae.com/c/logic-2-0-software/7"
license=("unknown")
depends=(
	"libxcrypt-compat"
)
source=("https://downloads2.saleae.com/logic2/Logic-${pkgver}-linux-x64.AppImage")
conflicts=("saleae-logic" "saleae-logic-beta")
provides=("saleae-logic" "saleae-logic-beta")
sha256sums=('82832ed0d3166701d7f4f7df57a620b721a23883e0cfe8f2e8e95a2e6720d6f2')

build() {
	_file="Logic-${pkgver}-linux-x64.AppImage"
	chmod u+x "${_file}"
	"./${_file}" --appimage-extract

	_desktop="${srcdir}/squashfs-root/Logic.desktop"
	sed -i "/^Exec=/cExec=${pkgname}" "${_desktop}"
	sed -i "/^X-AppImage/d" "${_desktop}"
	sed -i "s/^X-AppImage-Version=/Version=/" "${_desktop}"
}

package() {
	mkdir "${pkgdir}/opt/"
	mv "${srcdir}/squashfs-root/usr" "${pkgdir}/usr"
	mv "${srcdir}/squashfs-root" "${pkgdir}/opt/${pkgname}"

	mkdir -p "${pkgdir}/usr/share/applications"
	mv "${pkgdir}/opt/${pkgname}/Logic.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	rm "${pkgdir}/opt/${pkgname}/AppRun"

	# Use intended program icon
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    mv "${pkgdir}/usr/lib/logic/resources/linux-x64/LogicIcon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/Logic.png"

	install -Dm644 "${pkgdir}/usr/lib/logic/resources/udev/99-SaleaeLogic.rules" "${pkgdir}/etc/udev/rules.d/99-SaleaeLogic.rules"

	rm "${pkgdir}/usr/bin/Logic" # remove the symlink

    # Fix permissions (example: 700->755, 640->644)
	find "${pkgdir}"   -perm "/111" -exec chmod 755 \{\} \;
	find "${pkgdir}" ! -perm "/111" -exec chmod 644 \{\} \;
	chmod 4755 "${pkgdir}/usr/lib/logic/chrome-sandbox"

	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/usr/lib/logic/Logic" "${pkgdir}/usr/bin/${pkgname}"

}
