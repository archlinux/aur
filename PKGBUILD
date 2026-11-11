# Maintainer: Alex S. <shantanna_at_hotmail_dot_com>

pkgname=pandacode
pkgver=0.3.111
pkgrel=1
pkgdesc="Lightweight coding agent workspace"
arch=('x86_64' 'aarch64')
url="https://github.com/aicodeking/pandacode"
license=('custom')
options=(!strip)
_appimage="PandaCode-Linux-${CARCH}.AppImage"

source_x86_64=("PandaCode-Linux-x86_64.AppImage::https://github.com/aicodeking/pandacode/releases/download/v${pkgver}/PandaCode-Linux-x86_64.AppImage")
source_aarch64=("PandaCode-Linux-aarch64.AppImage::https://github.com/aicodeking/pandacode/releases/download/v${pkgver}/PandaCode-Linux-aarch64.AppImage")
sha256sums_x86_64=('ca1b1aa267717b88670d8804ed5c11c4aed007efb723e47454c2df08ef5b70be')
sha256sums_aarch64=('0baa7f21271c3b9f68736782d3847e68d4ed6cd2fde1aee420fb7dadc76f7463')
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
  cat > "${pkgdir}/usr/bin/pandacode" <<'EOF'
#!/bin/sh
exec /opt/pandacode/AppRun "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/pandacode"

  install -Dm644 squashfs-root/PandaCode.desktop \
    "${pkgdir}/usr/share/applications/pandacode.desktop"

  # icons
  if [[ -d squashfs-root/usr/share/icons ]]; then
    cp -a squashfs-root/usr/share/icons/. "${pkgdir}/usr/share/icons/"
    chmod -R a+rX "${pkgdir}/usr/share/icons"
  fi
}
