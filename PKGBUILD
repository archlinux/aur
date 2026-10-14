# Maintainer: 9M2PJU <9m2pju@gmail.com>

pkgname=ham2k-power-logger-bin
_pkgname=ham2k-power-logger
pkgver=26.9.0
_build=179
_edition=next
pkgrel=1
pkgdesc="Next-generation amateur radio logging app by Ham2K (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://ham2k.com/"
license=('MPL-2.0')
depends=('gtk3' 'libsecret' 'curl')
options=('!strip')
provides=('ham2k-power-logger' 'ham2k-polo' 'polo')
conflicts=('ham2k-power-logger' 'ham2k-polo')

source_x86_64=("halo-${_edition}-${pkgver}-(${_build})-x64.AppImage::https://updates.ham2k.net/halo-${_edition}/linux-x64/26.9/halo-${_edition}-${pkgver}-(${_build})-x64.AppImage")
source_aarch64=("halo-${_edition}-${pkgver}-(${_build})-arm64.AppImage::https://updates.ham2k.net/halo-${_edition}/linux-arm64/26.9/halo-${_edition}-${pkgver}-(${_build})-arm64.AppImage")

sha256sums_x86_64=('7fe1de6f834292959364d940c807c5e581e1c7f2f26bc66e2c715d9692dd578b')
sha256sums_aarch64=('514d834bc3b485f8dc61259ce546e6d19b779f84ef182184ba01519484b6fdfd')

prepare() {
  cd "${srcdir}"
  if [ "${CARCH}" = "x86_64" ]; then
    _appimage="halo-${_edition}-${pkgver}-(${_build})-x64.AppImage"
  elif [ "${CARCH}" = "aarch64" ]; then
    _appimage="halo-${_edition}-${pkgver}-(${_build})-arm64.AppImage"
  fi

  chmod +x "${_appimage}"
  rm -rf squashfs-root
  ./"${_appimage}" --appimage-extract > /dev/null 2>&1
}

package() {
  cd "${srcdir}/squashfs-root"

  # Install main program files to /opt
  install -d "${pkgdir}/opt/${_pkgname}"
  cp -a data lib "${pkgdir}/opt/${_pkgname}/"
  install -Dm755 ham2k_logger "${pkgdir}/opt/${_pkgname}/ham2k_logger"

  # Symlinks in /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -sf "/opt/${_pkgname}/ham2k_logger" "${pkgdir}/usr/bin/ham2k-power-logger"
  ln -sf "/opt/${_pkgname}/ham2k_logger" "${pkgdir}/usr/bin/ham2k_logger"
  ln -sf "/opt/${_pkgname}/ham2k_logger" "${pkgdir}/usr/bin/polo"

  # Desktop file
  install -d "${pkgdir}/usr/share/applications"
  sed -e 's|^Exec=.*|Exec=/usr/bin/ham2k-power-logger %f|' \
      -e 's|^Categories=.*|Categories=Utility;HamRadio;|' \
      com.ham2k.logger.next.desktop > "${pkgdir}/usr/share/applications/com.ham2k.logger.next.desktop"

  # Icon
  install -Dm644 share/icons/hicolor/512x512/apps/com.ham2k.logger.next.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/com.ham2k.logger.next.png"
  install -Dm644 com.ham2k.logger.next.png \
    "${pkgdir}/usr/share/pixmaps/com.ham2k.logger.next.png"

  # MIME type for .h2kext extensions
  if [ -f share/mime/packages/com.ham2k.logger.next.xml ]; then
    install -Dm644 share/mime/packages/com.ham2k.logger.next.xml \
      "${pkgdir}/usr/share/mime/packages/com.ham2k.logger.next.xml"
  fi
}
