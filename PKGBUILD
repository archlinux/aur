# Maintainer: Malte Linke <me@parzival.space>

pkgname=wooting-bg-service
pkgdesc='Wooting Background Service for Wootility'
_pkgver=0.5.1 # renovate: datasource=custom.wooting-bg-service depName=wooting-bg-service versioning=semver
pkgver=${_pkgver//-/_}
pkgrel=2
arch=('x86_64')
url="https://wooting.io/wootility"
license=(unknown)
provides=('wooting-bg-service')
conflicts=('wooting-bg-service')
depends=(glibc fuse2 hicolor-icon-theme zlib)
options=(!strip)

_appImageFile="${pkgname}-${pkgver}.AppImage"
_desktopFile="Wooting Background Service.desktop"

noextract=("${_appImageFile}")
source=("${_appImageFile}::https://api.wooting.io/public/bg-service/download-installer?target=linux&version=${_pkgver}")
sha256sums=('8b0858b2f7e52837c8d912e2c51990a084a00bf1feaa972dda0ed29313bb4f89')

prepare() {
  # create copy of appimage file in case the build dir is mounted with noexec
  cp "${_appImageFile}" "${_appImageFile}.copy"
  chmod +x "${_appImageFile}.copy"

  # extract the appimage
  ./${_appImageFile}.copy --appimage-extract "usr/share/applications"
  ./${_appImageFile}.copy --appimage-extract "usr/share/icons"
  rm ${_appImageFile}.copy
}

build() {
  # Adjust .desktop so it will work outside of AppImage container, add Utility category
  sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${pkgname}|" "squashfs-root/usr/share/applications/${_desktopFile}"
  echo "Categories=Utility;" >> "squashfs-root/usr/share/applications/${_desktopFile}"

  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX squashfs-root/usr
}

package() {
  install -Dm755 ${_appImageFile} -t "${pkgdir}/opt/${pkgname}"

  # Symlink executable
  install -d "${pkgdir}/usr/bin/"
  ln -s /opt/${pkgname}/${_appImageFile} "${pkgdir}/usr/bin/${pkgname}"

  # Install desktop entry and icons
  install -Dm644 "squashfs-root/usr/share/applications/${_desktopFile}" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/"
  cp -a squashfs-root/usr/share/icons "${pkgdir}/usr/share/"
}
