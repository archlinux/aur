# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Original Author: Grey Christoforo <first name [at] last name [dot] net>

pkgname=bcn3dcuraengine-git
pkgver=r5200.7abc629e
pkgrel=1
epoch=1
pkgdesc="CuraEngine is a powerful, fast and robust engine for processing 3D models into 3D printing instruction for Ultimaker and other GCode based 3D printers. Modified version for BCN3DCura."
url="https://github.com/Ultimaker/CuraEngine"
arch=('i686' 'x86_64')
license=('GPL3')
provides=('curaengine')
conflicts=('curaengine')
depends=('libarcus-git')
makedepends=('cmake' 'git')
source=('git+https://github.com/Ultimaker/CuraEngine.git#tag=3.2.1'
        'gcc9.patch'
        '5aad55bf67e52ce5bdb27a3925af8a4cab441b38.patch')
md5sums=('SKIP'
         'bf99eb9e5907a55caa65064114e47672'
         '74779d285eb559a779a332ac3d9c11f8')

prepare() {
    cd $srcdir
    patch --forward --strip=0 --input="${srcdir}/gcc9.patch"
    cd $srcdir/CuraEngine
    patch --forward --strip=1 --input="${srcdir}/5aad55bf67e52ce5bdb27a3925af8a4cab441b38.patch"
}

pkgver() {
  cd CuraEngine
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p CuraEngine/build
  cd CuraEngine/build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd CuraEngine/build
  make DESTDIR="${pkgdir}" install
  #install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
