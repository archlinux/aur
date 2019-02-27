# Maintainer: Shatur <genaloner@gmail.com>

# Use KDE API for tray for additional feautures (this also add knotifier dependency, recommended for KDE users).
KDE=false

pkgname=optimus-manager-qt-git
pkgver=1.0.0.r0.gad396e2
pkgrel=1
pkgdesc="A Qt interface for Optimus Manager that allows to configure and switch GPUs on Optimus laptops using the tray menu"
arch=('x86_64')
url="https://github.com/Shatur95/optimus-manager-qt"
license=('GPL3')
depends=('qt5-base' 'optimus-manager')
makedepends=('qt5-tools' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/Shatur95/optimus-manager-qt")
sha256sums=('SKIP')

if [ ${KDE} == true ]; then
  depends+=('knotifications')
fi

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# Clone submodules
prepare() {
  cd "${pkgname%-git}"
  
  git submodule init
  git submodule update
}

build() {
  cd "${pkgname%-git}"
  
  if [ ${KDE} == true ]; then
    qmake "DEFINES += KDE"
  else
    qmake
  fi
  
  make
}

package() {
  cd "${pkgname%-git}"
  
  make INSTALL_ROOT="$pkgdir/" install
} 
