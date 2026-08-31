# Maintainer: Panda <sato.du@gmail.com>
_pkgname=kde-webapp-manager
pkgname=${_pkgname}-git
pkgver=1.2.0
pkgrel=1
pkgdesc="A native Qt6 utility to easily generate and manage custom browser webapps on KDE Plasma"
arch=('any')
url="https://github.com/satodu/kde-webapp-gen"
license=('MIT')
depends=('python' 'python-pyqt6')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/satodu/kde-webapp-gen.git#tag=1.2.0")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${_pkgname}"
  
  # Install the executable script wrapper
  install -Dm755 main.py "${pkgdir}/usr/bin/${_pkgname}"
  
  # Install Python modules package and assets (recursive copy to include widgets subfolder)
  install -d "${pkgdir}/usr/share/${_pkgname}"
  cp -r webapp_manager "${pkgdir}/usr/share/${_pkgname}/"
  
  # Fix directory and file permissions in the share directory
  find "${pkgdir}/usr/share/${_pkgname}/webapp_manager" -type d -exec chmod 755 {} +
  find "${pkgdir}/usr/share/${_pkgname}/webapp_manager" -type f -exec chmod 644 {} +
  
  # Install custom logo icon to pixmaps (standard for standalone icons)
  install -Dm644 images/kde-webapp-gen-icon-logo.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  
  # Install custom logo icon to hicolor icons theme
  install -Dm644 images/kde-webapp-gen-icon-logo.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
  
  # Install desktop entry shortcut
  install -d "${pkgdir}/usr/share/applications"
  cat <<EOF > "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Name=Webapp Manager
Comment=Create and edit webapps for KDE Plasma
Exec=${_pkgname}
Icon=/usr/share/pixmaps/${_pkgname}.png
Terminal=false
Categories=Utility;Settings;Qt;
StartupNotify=true
EOF
}
