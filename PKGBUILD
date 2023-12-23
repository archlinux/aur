# Maintainer: Wasabi <wasabithumbs@gmail.com>
pkgname=open-goal-launcher-bin
pkgver="2.4.0"
pkgrel=2
pkgdesc="A launcher for the OpenGOAL Project to simplify usage and installation"
arch=("x86_64")
url='https://github.com/open-goal/launcher'
license=('ISC')
depends=('fuse')
conflicts=('open-goal-launcher')
_image="open-goal-launcher_${pkgver}_amd64.AppImage"
source_x86_64=("https://github.com/open-goal/launcher/releases/download/v2.4.0/${_image}")
md5sums_x86_64=("cf3e6c5394006bba1ea51af418ce9b07")
options=(!strip)

prepare() {
	cd $srcdir
	chmod +x "${_image}"
	./"${_image}" --appimage-extract
}

build() {
	cd "${srcdir}/squashfs-root"
	sed -i '/^Type=/d' open-goal-launcher.desktop
	sed -i '/^Exec=/d' open-goal-launcher.desktop
	sed -i '/^Comment=/d' open-goal-launcher.desktop
	sed -i '/^Version=/d' open-goal-launcher.desktop
	sed -i '/^X-AppImage-Version=/d' open-goal-launcher.desktop
	echo "Type=Application" >> open-goal-launcher.desktop
	echo "Exec=/usr/bin/${pkgname}" >> open-goal-launcher.desktop
	echo "Comment=${pkgdesc}" >> open-goal-launcher.desktop
	echo "Version=${pkgver}" >> open-goal-launcher.desktop
	chmod -R a-x+rX usr
}

package() {
	install -Dm755 "${srcdir}/${_image}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

	install -Dm644 "${srcdir}/squashfs-root/open-goal-launcher.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	install -dm755 "${pkgdir}/usr/share/"
	cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}