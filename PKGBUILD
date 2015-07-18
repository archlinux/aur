# Maintainer Martin Peres <martin.peres@ensi-bourges.fr>
pkgname=arduide-git
pkgver=0.r340.8beb733
pkgrel=1
pkgdesc="ArduIDE is a Qt-based IDE for the open-source Arduino electronics prototyping platform."
arch=('i686' 'x86_64')
url="http://mupuf.org/project/arduide.html"
license=('GPL')
depends=('qt4>=4.5' 'qtwebkit' 'qscintilla' 'grantlee-qt4>=0.1' 'udev' 'gcc-libs' 'avr-gcc' 'avr-libc')
makedepends=('git' 'cmake')

source=("${pkgname}::git+https://github.com/mupuf/arduide.git")
sha256sums=('SKIP')

prepare() {
  msg "Cleaning the previous build directory..."
  rm -rf build
  mkdir build
}

pkgver() {
  cd ${pkgname}
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_FHS_PATHS=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
        ../${pkgname}
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
