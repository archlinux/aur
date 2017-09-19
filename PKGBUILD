# Maintainer: Étienne Deparis <etienne@depar.is>
# Maintainer: Christoph J. Thompson <thompsonc@protonmail.ch>

pkgname=nitrokey-app
pkgver=1.1
pkgrel=4
_cppcodecver=61d9b044d6644293f99fb87dfadc15dcab951bd9
pkgdesc="Nitrokey management application"
arch=('i686' 'x86_64')
url="https://www.nitrokey.com"
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme' 'libnitrokey-git')
makedepends=('cmake' 'qt5-tools')
install=nitrokey-app.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nitrokey/nitrokey-app/archive/v$pkgver.tar.gz"
        "cppcodec.tar.gz::https://github.com/tplgy/cppcodec/archive/${_cppcodecver}.tar.gz")
sha256sums=('7501af813721b22c6f859600fd42c7269be60f2da5d0f33cf90e68c19e3f1893'
            '80c2f0ebc0da7186386f525d798bad0eaf14837c9548d86060b503751193b010')

prepare() {
  cd $pkgname-$pkgver

  sed -i 's|DESTINATION ${BASH_COMPLETION_DIR}|DESTINATION share/bash-completion/completions|' \
      CMakeLists.txt

  sed -i 's|DESTINATION ${UDEV_MAIN_DIR}|DESTINATION lib/udev/rules.d|' \
      CMakeLists.txt

  rmdir libnitrokey
  ln -s /usr/lib/libnitrokey .
  sed -i '/^add_subdirectory (libnitrokey)$/d' CMakeLists.txt

  sed -i 's|libnitrokey/LICENSE|/usr/share/licenses/libnitrokey/LICENSE|' \
      resources.qrc

  sed -i 's/^LIBNITROKEY= -lnitrokey-static$/LIBNITROKEY= -lnitrokey/' \
      nitrokey-app-qt5.pro

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
        -DLIBNITROKEY_STATIC=OFF \
        -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
