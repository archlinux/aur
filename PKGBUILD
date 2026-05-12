# Maintainer: Mattia Moffa <mattia [at] moffa [dot] xyz>
# Previous maintainer: Wasabi <wasabithumbs@gmail.com>
pkgname=open-goal-launcher-bin
pkgver="2.10.3"
pkgrel=1
pkgdesc="A launcher for the OpenGOAL Project to simplify usage and installation"
arch=("x86_64")
url='https://github.com/open-goal/launcher'
license=('ISC')
depends=('fuse')
conflicts=('open-goal-launcher')
_image="OpenGOAL-Launcher_${pkgver}_amd64.AppImage"
source_x86_64=("https://github.com/open-goal/launcher/releases/download/v2.10.3/${_image}")
md5sums_x86_64=("9bb8ffb0a72e57725908708b685d8e39")
options=(!strip)

prepare() {
	cd $srcdir
	chmod +x "${_image}"
	./"${_image}" --appimage-extract
}

build() {
	cd "${srcdir}/squashfs-root"
	sed -i '/^Type=/d' OpenGOAL-Launcher.desktop
	sed -i '/^Exec=/d' OpenGOAL-Launcher.desktop
	sed -i '/^Comment=/d' OpenGOAL-Launcher.desktop
	sed -i '/^Version=/d' OpenGOAL-Launcher.desktop
	sed -i '/^X-AppImage-Version=/d' OpenGOAL-Launcher.desktop
	echo "Type=Application" >> OpenGOAL-Launcher.desktop
	echo "Exec=/usr/bin/${pkgname}" >> OpenGOAL-Launcher.desktop
	echo "Comment=${pkgdesc}" >> OpenGOAL-Launcher.desktop
	echo "Version=${pkgver}" >> OpenGOAL-Launcher.desktop
}

package() {
	install -Dm755 "${srcdir}/${_image}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

	install -Dm644 "${srcdir}/squashfs-root/OpenGOAL-Launcher.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -Dm644 "${srcdir}/squashfs-root/OpenGOAL-Launcher.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/OpenGOAL-Launcher.png"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
