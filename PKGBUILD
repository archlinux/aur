# Maintainer: Alex S. <shantanna_at_hotmail_dot_com>

pkgname=pandacode
pkgver=0.3.56
pkgrel=1
pkgdesc="Lightweight coding agent workspace"
arch=('x86_64' 'aarch64')
url="https://github.com/aicodeking/pandacode"
license=('custom')
options=(!strip)
_appimage="PandaCode-Linux-${CARCH}.AppImage"

source_x86_64=("PandaCode-Linux-x86_64.AppImage::https://github.com/aicodeking/pandacode/releases/download/v${pkgver}/PandaCode-Linux-x86_64.AppImage")
source_aarch64=("PandaCode-Linux-aarch64.AppImage::https://github.com/aicodeking/pandacode/releases/download/v${pkgver}/PandaCode-Linux-aarch64.AppImage")
sha256sums_x86_64=('d99bc42c2c64bdb0bd18ad9f27b4365f502ab8fdc7e4eb00911e7b9e782b8273')
sha256sums_aarch64=('8e27bfa3c49387ea72752cd0fc0e5ae9db2929cb167b7c294cc652f171a101be')

prepare() {
  cd "${srcdir}"
  chmod +x "${_appimage}"
  "./${_appimage}" --appimage-extract >/dev/null 2>&1
}

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/opt/${pkgname}"
  cp -a squashfs-root/. "${pkgdir}/opt/${pkgname}/"
  chmod -R a+rX "${pkgdir}/opt/${pkgname}"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/AppRun" "${pkgdir}/usr/bin/pandacode"

  install -Dm644 squashfs-root/PandaCode.desktop \
    "${pkgdir}/usr/share/applications/pandacode.desktop"

  # icons
  if [[ -d squashfs-root/usr/share/icons ]]; then
    cp -a squashfs-root/usr/share/icons/. "${pkgdir}/usr/share/icons/"
  fi
}
