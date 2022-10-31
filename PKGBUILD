# Maintainer: klee <klee at fedora dot email>

pkgname=freetube-appimage
pkgver=0.17.1
pkgrel=1
pkgdesc="An open source desktop YouTube player built with privacy in mind."
arch=('x86_64')
url="https://freetubeapp.io/"
license=('AGPL3')
depends=('fuse2' 'zlib' 'libva' 'qt5-multimedia' 'hicolor-icon-theme')
provides=('freetube')
conflicts=('freetube' 'freetube-bin' 'freetube-git' 'freetube-wayland')
options=(!strip)
_appimage="FreeTube_${pkgver}_amd64.AppImage"
source=("https://github.com/FreeTubeApp/FreeTube/releases/download/v${pkgver}-beta/${_appimage}")
noextract=("${_appimage}")
sha512sums=('ab2571e0e83c52705cae9089718766f8e599e668c99a0ec913b0575d9f3c364806eb8c368a057ad28c1716cf0458abfaa8112f76a4b390e3058608e9b6443d17')

prepare() {
        cd "${srcdir}"
        chmod +x "${_appimage}"
        ./"${_appimage}" --appimage-extract
}

build() {
	# Adjust .desktop so it will work outside of AppImage container
	sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/freetube|"\
		"squashfs-root/freetube.desktop"
	# Fix permissions; .AppImage permissions are 700 for all directories
	chmod -R a-x+rX squashfs-root/usr
}

package() {
	# AppImage
	install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"

	# Desktop file
	install -Dm644 "${srcdir}/squashfs-root/freetube.desktop"\
		"${pkgdir}/usr/share/applications/freetube.desktop"

	# Icon images
	install -dm755 "${pkgdir}/usr/share/"
	cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

	# Symlink executable
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/freetube"
}
