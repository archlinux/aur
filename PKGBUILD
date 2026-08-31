# Maintainer: Malte Linke <me@parzival.space>

pkgname=eso-addons-manager-bin
pkgdesc='Cross platform addon manager for the Elder Scrolls Online'
pkgver=0.4.23 # renovate: datasource=github-tags depName=arviceblot/eso-addons versioning=semver
pkgrel=1
arch=('x86_64')
url="https://github.com/arviceblot/eso-addons"
license=('MIT')
provides=('eso-addons-manager')
conflicts=('eso-addons-manager')
depends=(glibc fuse2 hicolor-icon-theme zlib)
options=(!strip)

_appImageFile="eso-addon-manager-v${pkgver}-x86_64.AppImage"
_desktopFile="eso-addon-manager.desktop"
_appIcon="eso-addon-manager.png"

noextract=("${_appImageFile}")
source=("${_appImageFile}::https://github.com/arviceblot/eso-addons/releases/download/v${pkgver}/${_appImageFile}"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/arviceblot/eso-addons/refs/tags/v${pkgver}/LICENSE")
sha256sums=('daf3a9b1fced9fd923e51f788aa5abd1c3ba2021a2d05ee5be2f73b73c3a4a2d'
            '8e53babd1d2c750bcee57c8489cbb58602541f7bc1f4077cec919234246f6ea9')

prepare() {
  # create copy of appimage file in case the build dir is mounted with noexec
  cp "${_appImageFile}" "${_appImageFile}.copy"
  chmod +x "${_appImageFile}.copy"

  # extract the appimage
  ./${_appImageFile}.copy --appimage-extract "usr/bin/eso-addon-manager"
  ./${_appImageFile}.copy --appimage-extract "${_desktopFile}"
  ./${_appImageFile}.copy --appimage-extract "${_appIcon}"
  rm ${_appImageFile}.copy
}

build() {
  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX squashfs-root/usr
}

package() {
  install -Dm755 "squashfs-root/usr/bin/eso-addon-manager" -t "${pkgdir}/usr/bin"

  # Install desktop entry and icons
  install -Dm644 "squashfs-root/${_desktopFile}" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "squashfs-root/${_appIcon}" -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
}
