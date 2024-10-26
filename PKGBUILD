# Maintainer: ThatOneCalculator <kainoa@t1c.dev>
# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html

_pkgname=texts

pkgname="${_pkgname}-appimage"
pkgver=0.83.22
pkgrel=1
pkgdesc="All of your messages in one inbox"
arch=('x86_64')
url="https://texts.com/"
license=('Proprietary')
depends=('libnotify' 'libappindicator-gtk3' 'fuse2' 'fuse3' 'fuse-common' 'libsecret')
sha512sums_x86_64=('7d25a7dd285acb654fc3d2331dae872fd2401a75d35d216ede39b11bac8ce27d3161fe8b6aa608cae8f86cde33863fff9117219f8a4a7760505d56895439b44e')
hash=$(echo ${sha512sums_x86_64} | head -c 10)
_appimage="Texts-Linux-x64-v${pkgver}-${hash}.AppImage"
source_x86_64=("${_appimage}::https://texts.com/api/install/linux/x64/${_appimage}")
noextract=("${_appimage}")
options+=('!strip')

prepare() {
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract
}

build() {
  # Adjust .desktop so it will work outside of AppImage container
  sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
    "squashfs-root/jack.desktop"
  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX squashfs-root/usr
}

package() {
  # AppImage
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
  # Desktop file
  install -Dm644 "${srcdir}/squashfs-root/jack.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icon images
  install -dm755 "${pkgdir}/usr/share/"
  cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  # Symlink executable
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
