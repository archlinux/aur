# Maintainer: hoywu <wu_git [at-symbol] outlook [dot] com>
# Based on: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html

_pkgname=github-copilot
_binary=github

pkgname="${_pkgname}-app-appimage"
pkgver=1.1.14
pkgrel=1
pkgdesc="Agent-native desktop experience for finding, running, steering, and landing software work across your GitHub repositories"
arch=('x86_64')
url="https://github.com/github/app"
license=('custom')
depends=('glibc' 'zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
_desktop="GitHub Copilot.desktop"
source_x86_64=("${_appimage}::https://github.com/github/app/releases/download/v${pkgver}/GitHub-Copilot-linux-x64.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('a9dbeb7b79385bd9823cccabb0252953fcd0f64820dece387dab9e03ee501c44')

prepare() {
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract
}

build() {
  # Adjust .desktop so it will work outside of AppImage container
  sed -i -E \
      -e "s|^Name=.*|Name=GitHub Copilot|" \
      -e "s|^Exec=.*|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_binary} %u|" \
      "squashfs-root/usr/share/applications/${_desktop}"
  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX squashfs-root/usr
}

package() {
  # AppImage
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

  # Desktop file
  install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${_desktop}" \
          "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icon images
  install -dm755 "${pkgdir}/usr/share/"
  cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  # Symlink executable
  install -dm755 "${pkgdir}/usr/bin/"
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_binary}"

  # Install license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  echo "See: https://github.com/github/app" > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
