# Maintainer: Cory Sanin <corysanin@outlook.com>

_pkgname=scorespy-launcher
pkgname=${_pkgname}
pkgdesc="Launcher for ScoreSpy CH, a modified Clone Hero client that submits scores to an online leaderboard."
pkgver=0.12.420
pkgrel=2
provides=('scorespy-launcher')
conflicts=('scorespy-launcher')
url="https://clonehero.scorespy.online/"
arch=("x86_64")
license=("freeware-proprietary")
_appimage="${_pkgname}_${pkgver}-${pkgrel}-.AppImage"
source=("$_appimage"::"https://launcher.scorespy.online/dist/ScoreSpy%20Launcher-${pkgver}.AppImage")
sha1sums=("cf63120e1c5fc9097bba87b54b6ba898578f30d2")
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
  install -dm755 "${pkgdir}/usr/share/pixmaps"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/$_pkgname.png"
}
