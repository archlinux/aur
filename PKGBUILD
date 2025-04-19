# Maintainer: OpenSource Guy

pkgname=atl-gui-git
_pkgname=atl-gui
pkgver=0.1.0.r36.193e85e
pkgrel=1
pkgdesc="A sleek, modern GTK4 graphical user interface for Android Translation Layer (Git Version)"
arch=('any')
url="https://github.com/os-guy/atl-gui"
license=('GPL')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'python-distro')
makedepends=('git')
optdepends=('appimagetool: For AppImage building'
            'android_translation_layer: Required to actually run Android applications'
            'android_translation_layer-git: Required to actually run Android applications - Latest Git Release')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  # Extract version from latest commit date in git
  printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  
  # Make the scripts executable
  chmod +x atl_gui.py
  if [ -f clean.sh ]; then
    chmod +x clean.sh
  fi
  
  # Run clean script to remove any Python cache files
  if [ -f clean.sh ]; then
    ./clean.sh
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"
  # Nothing to build - pure Python application
}

check() {
  cd "${srcdir}/${_pkgname}"
  # Start the app with --help to check it's working, but discard output
  # python atl_gui.py --help &> /dev/null || echo "Warning: Application didn't start correctly"
  # Uncomment above if the application supports --help
}

package() {
  cd "${srcdir}/${_pkgname}"
  
  # Create directories
  install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}"
  
  # Install application files
  cp -r atl_gui.py src res "${pkgdir}/usr/lib/${_pkgname}/"
  
  # Install documentation
  install -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/"
  install -m644 LICENSE "${pkgdir}/usr/share/doc/${_pkgname}/"
  
  # Install the desktop file
  cat > "${pkgdir}/usr/share/applications/${_pkgname}.desktop" << EOF
[Desktop Entry]
Type=Application
Name=ATL-GUI
Comment=Android Translation Layer GUI Application
Exec=/usr/bin/${_pkgname} %f
Icon=${_pkgname}
Categories=Development;Utility;
Terminal=false
StartupNotify=true
MimeType=application/vnd.android.package-archive;
Keywords=Android;APK;Translation Layer;Testing;
EOF
  
  # Install the icon
  install -m644 res/android_translation_layer.png "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
  
  # Create the executable script
  cat > "${pkgdir}/usr/bin/${_pkgname}" << EOF
#!/bin/bash
if [ ! -f /usr/bin/android-translation-layer ]; then
  echo "android-translation-layer is not found on user PATH"
  echo "Please install it first with one of the following methods:"
  echo "  • AUR: yay -S android-translation-layer"
  echo "  • Or visit: https://gitlab.com/android_translation_layer/android_translation_layer"
  exit 1
fi
exec python /usr/lib/${_pkgname}/atl_gui.py "\$@"
EOF
  
  chmod +x "${pkgdir}/usr/bin/${_pkgname}"
} 
