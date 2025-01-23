pkgbase=dslview
pkgname=('dslview-git')
pkgver=1.3.2
pkgrel=1
pkgdesc="DSLogic Series USB-based Logic Analyzer"
arch=('x86_64')
url="https://github.com/DreamSourceLab/DSView"
license=('MIT')
source=("git+https://github.com/DreamSourceLab/DSView.git")
depends=('base-devel' 'git' 'cmake' 'glib2' 'zlib' 'libusb' 'python' 'boost' 'qt6-base' 'fftw')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/DSView"
  local version=$(git describe --tags --match "v*" --abbrev=0) # Получение последнего тега
  local commits=$(git rev-list --count ${version}..HEAD)       # Количество коммитов после тега
  echo "${version#v}.$commits"                                 # Удаление 'v' и добавление числа коммитов
}

build() {
  cd "$srcdir/DSView"
  patch -p1 <"$srcdir/../patch.patch"
  patch -p1 <"$srcdir/../cmake_opt.patch"

  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make -j2
}

package() {
  cd "$srcdir/DSView/build"
  make DESTDIR="$pkgdir" install
}
