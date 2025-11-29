# Maintainer: Rooki <aur at rooki dot xyz>
# Contributor: RoBoT095 <robot095 at users dot noreply dot github dot com>
pkgname=printnotes-git
_appname=PrintNotes
_reponame=printnotes
pkgver=r232.5037f0c
pkgrel=1
pkgdesc="A better way to take notes inspired by Google Keep and Obsidian (git version)"
arch=('x86_64')
url="https://github.com/RoBoT095/printnotes"
license=('GPL-3.0-only')
provides=("${pkgname%}=${pkgver}")
conflicts=("${pkgname%}")
conflicts=("printnotes-bin")
options=(
    '!strip'
)
depends=('gtk3')
makedepends=('git' 'flutter')
source=("git+https://github.com/RoBoT095/printnotes.git")
sha256sums=('SKIP')

# Extract version from pubspec.yaml
pkgver() {
    cd "$srcdir/$_reponame"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
  cd "${srcdir}/${_reponame}"
  
  # Install dependencies
  flutter pub get
}

build() {
  cd "${srcdir}/${_reponame}"
  
  # Build for Linux
  flutter build linux --release
}

package() {
  cd "${srcdir}/${_reponame}"
  
  # Create directories
  install -d "${pkgdir}/opt/${_reponame}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
  install -d "${pkgdir}/usr/share/applications"
  
  # Copy built application
  cp -r build/linux/x64/release/bundle/* "${pkgdir}/opt/${_reponame}/"
  
     # Create desktop entry with proper error checking
        cat > "${pkgdir}/usr/share/applications/printnotes.desktop" << 'EOF'
[Desktop Entry]
Name=PrintNotes
Comment=A better way to take notes inspired by Google Keep and Obsidian
Exec=/opt/printnotes/printnotes
Icon=printnotes
Terminal=false
Type=Application
Categories=Office;TextEditor;
StartupNotify=true
EOF
  # Set proper permissions for desktop entry
  chmod 644 "${pkgdir}/usr/share/applications/printnotes.desktop"
  
  # Create symlink for executable
  ln -s "/opt/${pkgname}/printnotes" "${pkgdir}/usr/bin/printnotes"
  
  # Install icon
  install -m644 assets/app_icon_no-bg.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/printnotes.png"
  
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_appname}/LICENSE"
}
