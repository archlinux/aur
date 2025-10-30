# Maintainer: wjsoj <wjs@wjsphy.top>

pkgname=lobe-chat-appimage
pkgver=1.142.8
pkgrel=1
pkgdesc="An open-source, modern-design LLMs/AI chat framework (AppImage)"
arch=(x86_64)
url="https://github.com/lobehub/lobe-chat"

license=('Apache-2.0')

# AppImages need fuse2 at runtime
depends=(fuse2)
conflicts=(lobe-chat)
options=(!strip)

# Upstream release asset naming (Beta channel). Adjust here if channel changes.
_channel=Beta
_upstream_base="LobeHub-${_channel}"
_appimage="${_upstream_base}-${pkgver}.AppImage"

source=("${_appimage}::${url}/releases/download/v${pkgver}/${_upstream_base}-${pkgver}.AppImage"
  "LICENSE::https://raw.githubusercontent.com/lobehub/lobe-chat/v${pkgver}/LICENSE"
  "lobe-chat.png::https://raw.githubusercontent.com/lobehub/lobe-chat/v${pkgver}/apps/desktop/resources/tray.png")

# These placeholders are auto-updated by the GitHub Actions workflow.
sha256sums=('8632291b5b1558f6ece010ffcebded0b7f81273bfeba19dbf3e1a1991c44ea94'
            '790a8c42f10beb4f5e9122e05a8e65d5522de49f89ac69cd31063c0f2be93ea4'
            '38e5a907edee6a2188c7f49d6c56688c8c7e110a0dc2ccd6172129372f21efaf')

_install_dir="opt/${pkgname}"
_exec_name="lobe-chat" # Symlink /usr/bin/lobe-chat -> AppImage

prepare() {
  # Nothing to prepare; placeholder kept for future extraction logic if needed.
  true
}

package() {
  cd "${srcdir}"

  install -Dm755 "${_appimage}" "${pkgdir}/${_install_dir}/${_exec_name}.AppImage"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install upstream tray icon as application icon 
  install -Dm644 lobe-chat.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/lobe-chat.png"

  # Create symlink for command line execution
  install -d "${pkgdir}/usr/bin"
  ln -s "/${_install_dir}/${_exec_name}.AppImage" "${pkgdir}/usr/bin/${_exec_name}"

  # Basic desktop entry
  install -d "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=LobeChat
Comment=${pkgdesc}
Exec=${_exec_name} %u
Terminal=false
Type=Application
Categories=Network;Chat;AI;Utility;
StartupNotify=true
Icon=lobe-chat
EOF
}
