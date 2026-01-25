# Maintainer: Illia Pukalov illia.pukalov@teleinformatika.eu
pkgbase=saturn-launcher
pkgname=('saturn-launcher' 'saturn-launcher-gui')
pkgver=1.0.0
pkgrel=1
pkgdesc="Fast and lightweight Minecraft launcher with shader, mod, and resource pack support"
arch=('any')
url="https://ilyap358.github.io/saturn-web"
license=('GPL3')
depends=('python' 'java-runtime' 'python-requests' 'python-pyyaml')
makedepends=('git' 'python-pip' 'python-wheel')
install=saturn-launcher.install
source=("git+https://github.com/IlyaP358/saturn_launcher.git")
md5sums=('SKIP')

package_saturn-launcher() {
  pkgdesc="Console-based Minecraft launcher with support for shaders, mods, and resource packs. Fast, lightweight, and easy to use"
  depends=('python' 'python-requests' 'python-pyyaml' 'java-runtime')
  
  cd "${srcdir}/saturn_launcher"
  
  # Install to /opt/saturn-launcher
  install -d "${pkgdir}/opt/saturn-launcher"
  cp -r . "${pkgdir}/opt/saturn-launcher/"
  
  # Remove unnecessary files
  rm -rf "${pkgdir}/opt/saturn-launcher/.git" \
         "${pkgdir}/opt/saturn-launcher/.gitignore" \
         "${pkgdir}/opt/saturn-launcher/build" \
         "${pkgdir}/opt/saturn-launcher/dist" \
         "${pkgdir}/opt/saturn-launcher/venv" \
         "${pkgdir}/opt/saturn-launcher/__pycache__" \
         "${pkgdir}/opt/saturn-launcher"/*.spec \
         "${pkgdir}/opt/saturn-launcher/saturn-gui.py" \
         "${pkgdir}/opt/saturn-launcher/update_gui_classes.py"
  
  # Create virtual environment and install dependencies
  python -m venv "${pkgdir}/opt/saturn-launcher/venv"
  "${pkgdir}/opt/saturn-launcher/venv/bin/pip" install --upgrade pip
  "${pkgdir}/opt/saturn-launcher/venv/bin/pip" install -r "${pkgdir}/opt/saturn-launcher/requirements.txt"
  
  # Create wrapper script
  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/saturn" << 'EOF'
#!/bin/sh
WORK_DIR="$HOME/.local/share/saturn-launcher"
mkdir -p "$WORK_DIR"
cd "$WORK_DIR"
exec /opt/saturn-launcher/venv/bin/python /opt/saturn-launcher/saturn.py "$@"
EOF
  chmod +x "${pkgdir}/usr/bin/saturn"
  
  # Install License
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package_saturn-launcher-gui() {
  pkgdesc="User-friendly GUI Minecraft launcher featuring shader, mod, and resource pack management with intuitive interface"
  depends=('python' 'python-requests' 'python-pyyaml' 'python-pyqt5' 'java-runtime')
  
  cd "${srcdir}/saturn_launcher"
  
  # Install to /opt/saturn-launcher-gui
  install -d "${pkgdir}/opt/saturn-launcher-gui"
  cp -r . "${pkgdir}/opt/saturn-launcher-gui/"
  
  # Remove unnecessary files
  rm -rf "${pkgdir}/opt/saturn-launcher-gui/.git" \
         "${pkgdir}/opt/saturn-launcher-gui/.gitignore" \
         "${pkgdir}/opt/saturn-launcher-gui/build" \
         "${pkgdir}/opt/saturn-launcher-gui/dist" \
         "${pkgdir}/opt/saturn-launcher-gui/venv" \
         "${pkgdir}/opt/saturn-launcher-gui/__pycache__" \
         "${pkgdir}/opt/saturn-launcher-gui"/*.spec
  
  # Create virtual environment and install dependencies
  python -m venv "${pkgdir}/opt/saturn-launcher-gui/venv"
  "${pkgdir}/opt/saturn-launcher-gui/venv/bin/pip" install --upgrade pip
  "${pkgdir}/opt/saturn-launcher-gui/venv/bin/pip" install -r "${pkgdir}/opt/saturn-launcher-gui/requirements.txt"
  
  # Wrapper
  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/saturn-gui" << 'EOF'
#!/bin/sh
WORK_DIR="$HOME/.local/share/saturn-launcher"
mkdir -p "$WORK_DIR"
cd "$WORK_DIR"
exec /opt/saturn-launcher-gui/venv/bin/python /opt/saturn-launcher-gui/saturn-gui.py "$@"
EOF
  chmod +x "${pkgdir}/usr/bin/saturn-gui"
  
  # Desktop entry
  install -d "${pkgdir}/usr/share/applications"
  if [ -f "com.github.IlyaP358.SaturnLauncher.GUI.desktop" ]; then
    install -m 644 com.github.IlyaP358.SaturnLauncher.GUI.desktop \
      "${pkgdir}/usr/share/applications/saturn-launcher-gui.desktop"
  fi
  
  # Metainfo
  install -d "${pkgdir}/usr/share/metainfo"
  if [ -f "com.github.IlyaP358.SaturnLauncher.GUI.metainfo.xml" ]; then
    install -m 644 com.github.IlyaP358.SaturnLauncher.GUI.metainfo.xml \
      "${pkgdir}/usr/share/metainfo/saturn-launcher-gui.metainfo.xml"
  fi
  
  # Icon (if exists)
  if [ -f "logo_512.png" ]; then
    install -d "${pkgdir}/usr/share/pixmaps"
    install -m 644 logo_512.png "${pkgdir}/usr/share/pixmaps/saturn-launcher-gui.png"
  fi
      
  # License
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
