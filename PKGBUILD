# Maintainer: Étienne Deparis <etienne@depar.is>
# Maintainer: Christoph J. Thompson <thompsonc@protonmail.ch>

pkgname=nitrokey-app
pkgver=1.1
pkgrel=3
_libnitrokeyver=06c0deb7935a9390a67bc02d6c323e64c785a026
_hidapiver=324dc7c0d125f57a06e1107e90e49eb4377bd03c
_cppcodecver=61d9b044d6644293f99fb87dfadc15dcab951bd9
pkgdesc="Nitrokey management application"
arch=('i686' 'x86_64')
url="https://www.nitrokey.com"
license=('GPL3')
depends=('qt5-base' 'libusb' 'hicolor-icon-theme' 'hidapi')
makedepends=('cmake' 'qt5-tools')
install=nitrokey-app.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nitrokey/nitrokey-app/archive/v$pkgver.tar.gz"
        "libnitrokey.tar.gz::https://github.com/Nitrokey/libnitrokey/archive/${_libnitrokeyver}.tar.gz"
        "cppcodec.tar.gz::https://github.com/tplgy/cppcodec/archive/${_cppcodecver}.tar.gz")
sha256sums=('7501af813721b22c6f859600fd42c7269be60f2da5d0f33cf90e68c19e3f1893'
            'acbc4a27cd92d660e44f4f7d9d4b2129ce010e0f5b2deb01a4ffda93c4b6c334'
            '80c2f0ebc0da7186386f525d798bad0eaf14837c9548d86060b503751193b010')

prepare() {
  cd $pkgname-$pkgver

  sed -i 's|DESTINATION ${BASH_COMPLETION_DIR}|DESTINATION share/bash-completion/completions|' \
      CMakeLists.txt

  sed -i 's|DESTINATION ${UDEV_MAIN_DIR}|DESTINATION lib/udev/rules.d|' \
      CMakeLists.txt

  rmdir libnitrokey
  ln -s $srcdir/libnitrokey-${_libnitrokeyver} libnitrokey

  cd 3rdparty
  rmdir cppcodec
  ln -s $srcdir/cppcodec-${_cppcodecver} cppcodec

  cd ../data/icons
  rm -r ubuntu-mono-dark ubuntu-mono-light
}

build() {
  cd $pkgname-$pkgver

  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
