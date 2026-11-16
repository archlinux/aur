# Maintainer: Alex S. <shantanna_at_hotmail_dot_com>

pkgname=pandacode
pkgver=0.3.129
pkgrel=1
pkgdesc="Lightweight coding agent workspace"
arch=('x86_64' 'aarch64')
url="https://github.com/aicodeking/pandacode"
license=('custom')
options=(!strip)
_appimage="PandaCode-Linux-${CARCH}.AppImage"

source_x86_64=("PandaCode-Linux-x86_64.AppImage::https://github.com/aicodeking/pandacode/releases/download/v${pkgver}/PandaCode-Linux-x86_64.AppImage")
source_aarch64=("PandaCode-Linux-aarch64.AppImage::https://github.com/aicodeking/pandacode/releases/download/v${pkgver}/PandaCode-Linux-aarch64.AppImage")
sha256sums_x86_64=('9aa36a4bbd35c9d70e79f93cc41fa652ed131a33bde7775f21023889bad0cc9c')
sha256sums_aarch64=('97d5a277f3c51474d4c49b4fe783387310f08a5dcae8202108b714cda03e7fa4')
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
