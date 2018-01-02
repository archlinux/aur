# Maintainer: Étienne Deparis <etienne@depar.is>
# Maintainer: Christoph J. Thompson <thompsonc@protonmail.ch>

pkgname=nitrokey-app
pkgver=1.2
pkgrel=1
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
sha256sums=('652538d6a9ce51cb274f45c7a5198689da549eacecff372f5534b5ace458de91'
            '80c2f0ebc0da7186386f525d798bad0eaf14837c9548d86060b503751193b010')

prepare() {
  cd $pkgname-$pkgver

  sed -i 's|libnitrokey/LICENSE|/usr/share/licenses/libnitrokey/LICENSE|' \
      resources.qrc

  for srcfile in $(grep -rl 'libnitrokey/include/' src); do
    sed -i 's|^#include \(["<]\)libnitrokey/include/|#include \1libnitrokey/|g' "$srcfile"
  done

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
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
