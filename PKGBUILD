# Maintainer: aklnaaw <aklnaaww@gmail.com>
# Contributor: SVAH-X (original author)
#
# Linux fork of claude-code-but-priestess
# Original: https://github.com/SVAH-X/claude-code-but-priestess

pkgname=priestess-arknights
_pkgreal=priestess-arknights
_upstream_url=https://github.com/SVAH-X/claude-code-but-priestess
pkgver=0.7.1
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
makedepends=('git' 'nodejs' 'npm')
install=priestess.install
source=("${url}.git")
sha256sums=('SKIP')

prepare() {
  mkdir -p "${srcdir}"
  rm -rf "${srcdir:?}/${_pkgreal}"
  git clone --depth 1 --branch main "${url}.git" "${srcdir}/${_pkgreal}"
}

build() {
  cd "${srcdir}/${_pkgreal}"

  npm install
  npx electron-builder --linux dir
}

package() {
  cd "${srcdir}/${_pkgreal}"

  local build_dir
  if [[ -d "dist/linux-unpacked" ]]; then
    build_dir="dist/linux-unpacked"
  elif [[ -d "dist/linux-x64" ]]; then
    build_dir="dist/linux-x64"
  else
    build_dir="$(ls -d dist/linux-* 2>/dev/null | head -1)"
  fi

  if [[ -z "${build_dir}" ]]; then
    error "electron-builder output not found in dist/"
    exit 1
  fi

  # Install to /opt/priestess
  install -d "${pkgdir}/opt/priestess"
  cp -a "${build_dir}"/* "${pkgdir}/opt/priestess/"

  # The binary is named after the "name" field in package.json
  local _bin="${pkgdir}/opt/priestess/${_pkgreal}"
  if [[ -f "${_bin}" ]]; then
    chmod 755 "${_bin}"
  fi

  chmod 4755 "${pkgdir}/opt/priestess/chrome-sandbox" 2>/dev/null || true

  # Wrapper script
  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/priestess" << WRAPPER
#!/bin/bash
export ELECTRON_OZONE_PLATFORM_HINT="\${ELECTRON_OZONE_PLATFORM_HINT:-auto}"
export ELECTRON_ENABLE_WAYLAND_ACTIVATION_TOKEN_HACK="\${ELECTRON_ENABLE_WAYLAND_ACTIVATION_TOKEN_HACK:-1}"
exec /opt/priestess/${_pkgreal} "\$@"
WRAPPER
  chmod 755 "${pkgdir}/usr/bin/priestess"
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

  # Icon
  install -Dm644 "assets/character/icon.png" "${pkgdir}/usr/share/pixmaps/priestess.png"

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
  install -d "${pkgdir}/usr/share/licenses/priestess"
  cat > "${pkgdir}/usr/share/licenses/priestess/LICENSE" << 'LICENSE'
This project is UNLICENSED. All rights reserved.
Source: https://github.com/SVAH-X/claude-code-but-priestess
LICENSE
}
