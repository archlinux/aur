# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=ktexteditor-git
pkgver=r807.d13bfd1
pkgrel=1
pkgdesc='KTextEditor framework'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/ktexteditor'
license=('LGPL')
depends=('kparts-git' 'libgit2')
makedepends=('extra-cmake-modules-git' 'git')
provides=('ktexteditor')
conflicts=('ktexteditor')
source=('git://anongit.kde.org/ktexteditor.git' "pkgbuild-syntax-highlight.patch")
md5sums=('SKIP'
         'cc66f75c967dd7ac7c97375875772d69')

pkgver() {
  cd ktexteditor
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
  cd ktexteditor
  patch -p0 -i $srcdir/pkgbuild-syntax-highlight.patch
}

build() {
  cd build
  cmake ../ktexteditor \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DBUILD_TESTING=OFF \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
