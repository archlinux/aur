# Maintainer: Panda <sato.du@gmail.com>
_pkgname=kde-webapp-manager
pkgname=${_pkgname}-git
pkgver=r10.g672b075
pkgrel=2
pkgdesc="A native Qt6 utility to easily generate and manage custom browser webapps on KDE Plasma"
arch=('any')
url="https://github.com/satodu/kde-webapp-gen"
license=('MIT')
depends=('python' 'python-pyqt6')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/satodu/kde-webapp-gen.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  
  # Install the executable script
  install -Dm755 main.py "${pkgdir}/usr/bin/${_pkgname}"
  
  # Install Python modules package and assets
  install -d "${pkgdir}/usr/share/${_pkgname}/webapp_manager"
  install -Dm644 webapp_manager/*.py "${pkgdir}/usr/share/${_pkgname}/webapp_manager/"
  install -Dm644 webapp_manager/*.png "${pkgdir}/usr/share/${_pkgname}/webapp_manager/"
  
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
