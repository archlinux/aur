# Maintainer: Alex S. <shantanna_at_hotmail_dot_com>

pkgname=freellmapi-desktop-bin
pkgver=0.16.29
pkgrel=1
pkgdesc="FreeLLMAPI menu-bar app — local OpenAI-compatible LLM router"
arch=('x86_64')
url="https://github.com/tashfeenahmed/freellmapi"
license=('custom')
options=(!strip)
_appimage="FreeLLMAPI-${pkgver}.AppImage"

source=("FreeLLMAPI-${pkgver}.AppImage::https://github.com/tashfeenahmed/freellmapi/releases/download/v${pkgver}/FreeLLMAPI-${pkgver}.AppImage")
sha256sums=('e5b918006f3a310fc019e08a3ae368b09a2c02302c80cd196072cc03c80d4293')
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
  cat > "${pkgdir}/usr/bin/freellmapi-desktop" <<'EOF'
#!/bin/sh
exec /opt/freellmapi-desktop-bin/freellmapi-desktop --no-sandbox "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/freellmapi-desktop"

  install -d "${pkgdir}/usr/share/applications"
  sed 's|^Exec=.*|Exec=freellmapi-desktop %U|' squashfs-root/freellmapi-desktop.desktop > "${pkgdir}/usr/share/applications/freellmapi-desktop.desktop"
  chmod 644 "${pkgdir}/usr/share/applications/freellmapi-desktop.desktop"

  if [[ -d squashfs-root/usr/share/icons ]]; then
    cp -a squashfs-root/usr/share/icons/. "${pkgdir}/usr/share/icons/"
    chmod -R a+rX "${pkgdir}/usr/share/icons"
  fi
  install -Dm644 squashfs-root/freellmapi-desktop.png \
    "${pkgdir}/usr/share/pixmaps/freellmapi-desktop.png"
}
