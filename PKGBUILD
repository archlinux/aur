# Maintainer: Alex S. <shantanna_at_hotmail_dot_com>

pkgname=freellmapi-desktop-bin
pkgver=0.16.34
pkgrel=1
pkgdesc="FreeLLMAPI menu-bar app — local OpenAI-compatible LLM router"
arch=('x86_64')
url="https://github.com/tashfeenahmed/freellmapi"
license=('custom')
options=(!strip)
_appimage="FreeLLMAPI-${pkgver}.AppImage"

source=("FreeLLMAPI-${pkgver}.AppImage::https://github.com/tashfeenahmed/freellmapi/releases/download/v${pkgver}/FreeLLMAPI-${pkgver}.AppImage")
sha256sums=('f43f30024f18b370a4f93607a2b857cbc6b2888ac361d3e906ccbe94e1502930')
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
