# Maintainer: AutoMaker Team <webdevcody@gmail.com>
# Contributor: Your Name <your.email@example.com>

pkgname=automaker-git
pkgver=0.15.0
pkgrel=1
pkgdesc="An autonomous AI development studio that helps you build software faster using AI-powered agents"
arch=('x86_64')
url="https://github.com/AutoMaker-Org/automaker"
license=('MIT')
depends=(
  'gtk3'
  'libnotify'
  'nss'
  'libxss'
  'libxtst'
  'xdg-utils'
  'at-spi2-core'
  'util-linux-libs'
  'nodejs>=22.0.0'
  'npm'
)
makedepends=(
  'git'
  'nodejs>=22.0.0'
  'npm'
  'python'
  'gcc'
  'make'
)
optdepends=(
  'claude-code-cli: Claude Code CLI for authentication'
  'github-cli: GitHub integration'
)
provides=('automaker')
conflicts=('automaker')
source=("${pkgname}::git+${url}.git#branch=main")
sha256sums=('SKIP')
options=('!strip' '!emptydirs')
install=automaker.install

pkgver() {
  cd "${srcdir}/${pkgname}"
  # Use the version from package.json
  node -e "console.log(require('./package.json').version)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  
  # Ensure clean state
  npm cache clean --force || true
}

build() {
  cd "${srcdir}/${pkgname}"
  
  # Install dependencies
  echo "Installing npm dependencies..."
  npm install --legacy-peer-deps
  
  # Build shared packages first
  echo "Building shared packages..."
  npm run build:packages
  
  # Build Electron app for Linux
  echo "Building Electron application..."
  npm run build:electron:linux:dir
  
  echo "Build complete!"
}

package() {
  cd "${srcdir}/${pkgname}"
  
  # Create directories
  install -dm755 "${pkgdir}/opt/automaker"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  
  # Find the built AppImage (electron-builder creates it in apps/ui/release)
  local appimage_dir="apps/ui/release/linux-unpacked"
  
  # Copy the unpacked application to /opt/automaker
  if [ -d "${appimage_dir}" ]; then
    cp -r "${appimage_dir}/"* "${pkgdir}/opt/automaker/"
  else
    # Fallback: try to find AppImage file
    local appimage_file=$(find apps/ui/release -name "*.AppImage" -type f | head -n1)
    if [ -n "${appimage_file}" ]; then
      cp "${appimage_file}" "${pkgdir}/opt/automaker/automaker.AppImage"
      chmod +x "${pkgdir}/opt/automaker/automaker.AppImage"
    else
      echo "Error: Could not find built application"
      return 1
    fi
  fi
  
  # Create symlink to binary
  if [ -f "${pkgdir}/opt/automaker/automaker" ]; then
    ln -s "/opt/automaker/automaker" "${pkgdir}/usr/bin/automaker"
  elif [ -f "${pkgdir}/opt/automaker/automaker.AppImage" ]; then
    ln -s "/opt/automaker/automaker.AppImage" "${pkgdir}/usr/bin/automaker"
  fi
  
  # Install desktop entry
  cat > "${pkgdir}/usr/share/applications/automaker.desktop" << EOF
[Desktop Entry]
Name=Automaker
Comment=An autonomous AI development studio
Exec=automaker %U
Icon=automaker
Type=Application
Categories=Development;IDE;
StartupNotify=true
StartupWMClass=automaker
MimeType=x-scheme-handler/automaker;
EOF
  
  # Install icon
  if [ -f "apps/ui/public/logo_larger.png" ]; then
    install -Dm644 "apps/ui/public/logo_larger.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/automaker.png"
  fi
  
  # Install license
  if [ -f "LICENSE" ]; then
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}

# vim:set ts=2 sw=2 et:
