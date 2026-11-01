# Maintainer: Alex S. <shantanna_at_hotmail_dot_com>

pkgname=pandacode
pkgver=0.3.87
pkgrel=1
pkgdesc="Lightweight coding agent workspace"
arch=('x86_64' 'aarch64')
url="https://github.com/aicodeking/pandacode"
license=('custom')
options=(!strip)
_appimage="PandaCode-Linux-${CARCH}.AppImage"

source_x86_64=("PandaCode-Linux-x86_64.AppImage::https://github.com/aicodeking/pandacode/releases/download/v${pkgver}/PandaCode-Linux-x86_64.AppImage")
source_aarch64=("PandaCode-Linux-aarch64.AppImage::https://github.com/aicodeking/pandacode/releases/download/v${pkgver}/PandaCode-Linux-aarch64.AppImage")
sha256sums_x86_64=('2b07246c0843498104736df87e79fdeed283afefcb72e8e77de49fad452a9512')
sha256sums_aarch64=('7d852e0d17153c0cb8a97ac44535956f31afaf829db0290ec3080e5315bb357b')

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
  fi
}
