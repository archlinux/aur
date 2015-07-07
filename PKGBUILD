
# Maintainer: Malte Veerman <maldela@halloarsch.de>

pkgname=fancontrol-gui-git
pkgver=0.1.r7.gd6de588
pkgrel=1
pkgdesc="GUI for the fancontrol script and systemd service"
arch=('any')
url="https://github.com/Maldela/Fancontrol-GUI"
license=('GPL2')
depends=('qt5-base' 'qt5-quickcontrols' 'qt5-declarative' 'lm_sensors' 'kauth' 'systemd')
makedepends=('git' 'gcc' 'cmake' 'extra-cmake-modules' )
provides=('fancontrol-gui')
conflicts=('fancontrol-gui')
source=('https://github.com/Maldela/Fancontrol-GUI.git')
md5sums=('SKIP')

_gitroot=https://github.com/Maldela/Fancontrol-GUI
_gitname=Fancontrol-GUI


pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_CORE=1 -DBUILD_GUI=1 .
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}