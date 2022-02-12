# Maintainer: Cory Sanin <corysanin@outlook.com>

_pkgname=music-kitten
pkgname=${_pkgname}-appimage
pkgdesc="Use your own soundtrack in Counter-Strike: Global Offensive."
pkgver=2.5.1
pkgrel=2
provides=('music-kitten')
conflicts=('music-kitten')
url="https://musickitten.net/"
arch=("x86_64")
license=("GPL3")
_appimage="$_pkgname.AppImage"
source=("$_appimage"::"https://github.com/CorySanin/Kitten-for-CSGO/releases/download/v2.5.0/Music.Kitten-2.5.1.AppImage")
sha1sums=("d867b503755e55706b43ced24f687ee95a5d515c")
noextract=("$_appimage")
options=(!strip)

prepare() {
	chmod +x "$_appimage"
	"./$_appimage" --appimage-extract

  # Fix the desktop file
  sed -i -E "s:Exec=AppRun:Exec=/opt/${_pkgname}/${_appimage}:" "squashfs-root/${_pkgname}.desktop"
}

package() {
	# Appimage and symlink
  install -Dpm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}"
	install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"

  # Desktop file
  install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icons
  install -dm755 "${pkgdir}/usr/share/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
}
