# Maintainer: klpod221 <klpod221@gmail.com>

pkgname=cockpit-tools
_pkgname=cockpit-tools
pkgver=1.3.36
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Universal AI IDE account manager for Antigravity / Codex / GitHub Copilot / Windsurf / Kiro / Cursor / Gemini-cli / CodeBuddy"
arch=('x86_64')
_barch=('amd64')
url="https://github.com/jlcodes99/cockpit-tools"
makedepends=(
  'rust'
  'cargo'
  'nodejs>=18'
  'npm'
  'webkit2gtk-4.1'
  'gtk3'
  'glib2'
  'cairo'
  'libsoup3'
  'gdk-pixbuf2'
)

depends=(
  'glibc'
  'gcc-libs'
  'glib2'
  'gtk3'
  'cairo'
  'webkit2gtk-4.1'
  'libsoup3'
  'gdk-pixbuf2'
  'hicolor-icon-theme'
)

source=("${_pkgname}::git+${url}.git#tag=v${pkgver}")

sha256sums=('53bf4fd668b1e5e6caf17c5d6ef297334efd6fb8a72a57da803cc46fe39cb976')

prepare() {
  echo "Generating .desktop file..."
  cat <<EOF > "${srcdir}/${pkgname}.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Name=Cockpit Tools
Comment=${pkgdesc}
Exec=${pkgname} %U
Icon=${pkgname}
Terminal=false
Categories=Utility;Development;
EOF

  cd "${_pkgname}"
  
  npm install
}

build() {
  cd "${_pkgname}"
  
  export CARGO_TARGET_DIR="target"

  cargo tauri build --no-bundle
}

package() {
    cd "${_pkgname}"

    install -Dm755 "src-tauri/target/release/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "src-tauri/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
