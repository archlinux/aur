# Maintainer: Cory Sanin <corysanin@outlook.com>

_pkgname=clonehero-launcher
pkgname=${_pkgname}
pkgdesc="Launcher for Clone Hero. Clone Hero is a free rhythm game, which can be played with any 5 or 6 button guitar controller, game controllers, or just your standard computer keyboard."
pkgver=0.9.488
pkgrel=1
provides=('clonehero-launcher')
conflicts=('clonehero-launcher')
url="https://clonehero.net/"
arch=("x86_64")
license=("freeware-proprietary")
_appimage="$_pkgname.AppImage"
source=("$_appimage"::"https://launcher-dl.clonehero.net/Clone%20Hero%20Launcher-0.9.488.AppImage")
sha1sums=("a8794a0b6299e3f2be0569183e484cd739649473")
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
