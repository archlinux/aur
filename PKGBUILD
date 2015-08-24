# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
 
pkgname=cura-git
pkgver=15.06.03.277.g3cb3cce
pkgrel=1
pkgdesc="A full software solution for 3D printing aimed at RepRaps and the Ultimaker."
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/daid/Cura"
provides=('cura')
conflicts=('cura')
depends=('python' 'python-pyqt5' 'python-opengl' 'python-pyserial' 'python-numpy' 'python-power-git' 'python-protobuf3' 'libarcus-git' 'qt5-quickcontrols')
makedepends=('git' 'cmake')
source=('git+https://github.com/Ultimaker/Cura.git'
        'git+https://github.com/Ultimaker/CuraEngine.git'
        'git+https://github.com/Ultimaker/Uranium.git')
md5sums=('SKIP' 'SKIP' 'SKIP')

_gitname="Cura"
_gitbranch="master"

pkgver() {
  cd "$_gitname"
  git describe --tags | sed 's/-/./g'
}

build() {
  mkdir -p CuraEngine/build
  cd CuraEngine/build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make

  mkdir -p ../../Uranium/build
  cd ../../Uranium/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make

  mkdir -p ../../Cura/build
  cd ../../Cura/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DURANIUM_SCRIPTS_DIR="$srcdir/Uranium/scripts" ..
  make
}

package() {
  cd "$srcdir/Uranium/build"
  make DESTDIR="$pkgdir/" install
  
  cd "$srcdir/Cura/build"
  make DESTDIR="$pkgdir/" install

  cd "$srcdir/CuraEngine/build"
  make DESTDIR="$pkgdir/" install

  chmod +x "$pkgdir/usr/bin/cura_app.py"

  mv "$pkgdir/usr/lib/python3/" "$pkgdir/usr/lib/python3.4/"
  mv "$pkgdir/usr/lib/python3.4/dist-packages/" "$pkgdir/usr/lib/python3.4/site-packages/"
}

