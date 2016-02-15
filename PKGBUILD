# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=cura-git
pkgver=15.06.03.1217.gd088044
pkgrel=1
pkgdesc="A full software solution for 3D printing aimed at RepRaps and the Ultimaker."
arch=('any')
license=('GPL3')
url="https://github.com/daid/Cura"
provides=('cura')
conflicts=('cura')
depends=('python' 'python-pyqt5' 'python-pyserial' 'python-numpy' 'python-protobuf3' 'qt5-quickcontrols' 'libarcus-git' 'uranium-git' 'curaengine-git')
makedepends=('git' 'cmake')
source=('git+https://github.com/Ultimaker/Cura.git' 'site-packages-dir.patch')
md5sums=('SKIP' 'c9ac02af3d23b7c271340458412ea9de')

pkgver() {
  cd Cura
  git describe --tags | sed 's/-/./g'
}

prepare(){
  cd Cura
  patch -Np1 -i ../site-packages-dir.patch
}

build() {
  mkdir -p Cura/build
  cd Cura/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr  -DURANIUM_SCRIPTS_DIR=/usr/share/uranium/scripts ..
  make
}

package() {
  cd "$srcdir/Cura/build"
  make DESTDIR="$pkgdir/" install

  chmod +x "$pkgdir/usr/bin/cura_app.py"
  ln -s "cura_app.py" "$pkgdir/usr/bin/cura"
}

# vim:set ts=2 sw=2 et:
