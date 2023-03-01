# Maintainer: Bruno Miguel <bruno@privacyrequired.com>

_pkgname=appimagepool
pkgname=${_pkgname}-appimage
pkgdesc="A simple, modern AppImageHub Client, powered by flutter."
pkgver=5.1.0
pkgrel=1
provides=('appimagepool')
conflicts=('appimagepool')
url="https://github.com/prateekmedia/appimagepool/"
arch=("x86_64")
license=("GPL3")
source=("https://github.com/prateekmedia/appimagepool/releases/download/5.1.0/appimagepool-5.1.0-x86_64.AppImage")
sha1sums=("5304ad0e4d1538cfee47088ba403f6c66e39bcdc")
_filename=("$_pkgname-5.1.0-x86_64.AppImage")
noextract=("$_pkgname-x86_64.AppImage")
_appimage="$_pkgname.AppImage"
options=(!strip)

prepare() {
	mv "${_filename}" "$_appimage"
	chmod +x "$_appimage"
	"./$_appimage" --appimage-extract

  # Fix the desktop file
  sed -i -E "s:Exec=appimagepool %u:Exec=/opt/${_pkgname}/${_appimage}:" "squashfs-root/${_pkgname}.desktop"
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
