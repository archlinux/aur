# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=bcn3dcura-git
pkgver=2.1.5
pkgrel=1
pkgdesc="3D printer / slicing GUI forked from Cura and built on top of the Uranium framework, customized for the BCN3D machines."
arch=('any')
license=('GPL3')
url="https://github.com/BCN3D/Cura"
provides=('cura' 'bcn3dcura')
conflicts=('cura' 'bcn3dcura')
depends=('python'
         'python-pyqt5'
         'python-numpy'
         'python-protobuf'
         'qt5-graphicaleffects'
         'qt5-quickcontrols'
         'qt5-quickcontrols2'
         'libarcus-git'
         'libsavitar'
         'bcn3duranium-git'
         'bcn3dcuraengine-git')
makedepends=('git' 'cmake')
optdepends=('python-zeroconf: Detecting mDNS printers'
            'cura-binary-data-git: Firmwares and translations'
            'python-pyserial: USB printing')
source=('git+https://github.com/BCN3D/Cura.git'
        'git+https://github.com/BCN3D/CuraResources.git'
        'bcn3dcura.patch')
md5sums=('SKIP'
         'SKIP'
         '82ab7bf90b0c3529a571bbb9e8f912ae')

prepare() {
    cd $srcdir
    patch --forward --strip=1 --input="${srcdir}/bcn3dcura.patch"
}

pkgver() {
  cd Cura
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p Cura/build
  cd Cura/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DURANIUM_SCRIPTS_DIR=/usr/share/uranium/scripts ..
  make
}

package() {
  cd "$srcdir/Cura/build"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/CuraResources"
  cp -r ./. "$pkgdir/usr/share/cura/resources"
}

# vim:set ts=2 sw=2 et:
