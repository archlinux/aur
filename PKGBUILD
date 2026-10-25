# Maintainer: Luke Bubar <luke@coldmail.xyz>

pkgname=ichgytw-bin
_pkgname=ichgytw
pkgver=0.1.96
_tag="ICHGYTW_${pkgver}"
_commit=c624e28e73a06b0f712dd506d4c6febef4b2d483
pkgrel=1
pkgdesc='A static recompilation project of the N64 game The World Is Not Enough'
arch=('x86_64')
url='https://github.com/riseio/TWIPE_00Sheven'

# The repository carries no licence.
license=('LicenseRef-unknown')
depends=(
  'hicolor-icon-theme'
  'libdrm'
  'libx11'
  'libxcb'
  'libxcursor'
  'libxext'
  'libxfixes'
  'libxi'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'mesa'
  'vulkan-driver'
  'vulkan-icd-loader'
)
optdepends=(
  'wayland: native Wayland window'
  'kdialog: error dialogs at startup'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# The AppImage brings its own glibc, loader and compiler; stripping breaks them.
options=('!strip' '!debug')
_appimage="${_pkgname}-${pkgver}-x86_64.AppImage"
source=(
  "${_appimage}::${url}/releases/download/${_tag}/ICHGYTW-SteamDeck-x86_64.AppImage"
  "README-${pkgver}.md::https://raw.githubusercontent.com/riseio/TWIPE_00Sheven/${_commit}/README.md"
)
noextract=("${_appimage}")
sha256sums=('6e4c3f12baa3cfe817bc13cb7cec39649925859b4d68f5b2fc17038f93786cef'
            '4f6fba95f184204c93ff772a9ffff5d6d08fb755068f055e24ba93d6118652ac')

prepare() {
  rm -rf squashfs-root
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract >/dev/null

  # The game keeps saves, settings and its compiled code in data/ beside the
  # AppImage, which /opt is not; AppRun takes another folder from these
  # variables. APPDIR and APPIMAGE are cleared so that a launcher started from
  # another AppImage does not point AppRun elsewhere.
  cat > "${_pkgname}.sh" << 'EOF'
#!/bin/sh
data="${XDG_DATA_HOME:-$HOME/.local/share}/ichgytw"
mkdir -p "$data" || exit 1
unset APPDIR APPIMAGE
export APP_FOLDER_PATH="${APP_FOLDER_PATH:-$data}"
export TWINE_DEBUG_LOG="${TWINE_DEBUG_LOG:-$data/twine_debug.log}"
exec /opt/ichgytw/AppRun "$@"
EOF

  cat > "${_pkgname}.desktop" << EOF
[Desktop Entry]
Type=Application
Name=I Could Have Given You The World
Comment=Native PC port of 007: The World Is Not Enough
Exec=${_pkgname} %f
Icon=${_pkgname}
Categories=Game;ActionGame;
Terminal=false
EOF
}

package() {
  install -d "${pkgdir}/opt/${_pkgname}"
  cp -a squashfs-root/. "${pkgdir}/opt/${_pkgname}/"
  rm -f "${pkgdir}/opt/${_pkgname}/.DirIcon" "${pkgdir}/opt/${_pkgname}/TWINERecompiled.desktop"
  chmod -R u=rwX,go=rX "${pkgdir}/opt/${_pkgname}"

  install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 squashfs-root/TWINERecompiled.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
