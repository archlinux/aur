# Maintainer: aklnaaw <aklnaaww@gmail.com>
# Contributor: SVAH-X (original author)
#
# Linux fork of claude-code-but-priestess
# Original: https://github.com/SVAH-X/claude-code-but-priestess

pkgname=priestess-arknights
_pkgreal=priestess-arknights
_ghrepo=aklnaaw/claude-code-but-priestess
pkgver=0.7.8
pkgrel=1
pkgdesc="桌面伴侣普瑞赛斯 (Priestess) — 基于 Claude Code / Codex CLI 后端的 Electron 托盘应用"
arch=('x86_64')
url="https://github.com/aklnaaw/claude-code-but-priestess"
license=('custom:UNLICENSED')
depends=(
  'cairo'
  'dbus'
  'expat'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'glibc'
  'glib2'
  'gtk3'
  'libdrm'
  'libnotify'
  'libpulse'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxkbfile'
  'libxrandr'
  'libxshmfence'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'udev'
  'zlib'
)
provides=("${pkgname}")
install=priestess.install
source=("${pkgname}-${pkgver}.AppImage::https://github.com/${_ghrepo}/releases/download/v${pkgver}/${pkgname}-${pkgver}.AppImage")
sha256sums=('SKIP')

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

  # Wrapper script
  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/priestess" << WRAPPER
#!/bin/bash
exec /opt/${pkgname}/${pkgname}.AppImage "\$@"
WRAPPER
  chmod 755 "${pkgdir}/usr/bin/priestess"

  # Desktop entry
  install -d "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/priestess.desktop" << DESKTOP
[Desktop Entry]
Name=Priestess
Name[zh_CN]=普瑞赛斯
Comment=Desktop companion — Priestess from Arknights
Comment[zh_CN]=桌面伴侣普瑞赛斯 — 基于 Claude Code / Codex CLI
Exec=priestess %F
Icon=priestess
Type=Application
Categories=Utility;Development;
Terminal=false
StartupWMClass=PRTS
DESKTOP

  # Icon (extract from AppImage)
  install -d "${pkgdir}/usr/share/pixmaps"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/usr/share/pixmaps/priestess.png" 2>/dev/null || true

  # AppData
  install -d "${pkgdir}/usr/share/metainfo"
  cat > "${pkgdir}/usr/share/metainfo/priestess.metainfo.xml" << APPDATA
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>local.priestess-arknights.menubar</id>
  <name>Priestess</name>
  <name xml:lang="zh_CN">普瑞赛斯</name>
  <summary>Desktop companion — Priestess from Arknights</summary>
  <summary xml:lang="zh_CN">桌面伴侣普瑞赛斯</summary>
  <categories>
    <category>Utility</category>
  </categories>
</component>
APPDATA

  # License
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'LICENSE'
This project is UNLICENSED. All rights reserved.
Source: https://github.com/SVAH-X/claude-code-but-priestess
LICENSE
}
