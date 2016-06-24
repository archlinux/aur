# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=ktexteditor-git
pkgver=r1114.f3f4319
pkgrel=2
pkgdesc='KTextEditor framework'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/frameworks/ktexteditor'
license=(LGPL)
depends=(kparts-git libgit2)
makedepends=(extra-cmake-modules-git git)
provides=(ktexteditor)
conflicts=(ktexteditor)
source=('git://anongit.kde.org/ktexteditor.git' "pkgbuild-syntax-highlight.patch")
md5sums=('SKIP'
         '3a03efe92f1403991c51f2859ee092f6')

pkgver() {
  cd ktexteditor
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build

  cd ktexteditor
  patch -p0 -i "$srcdir"/pkgbuild-syntax-highlight.patch
}

build() {
  cd build
  cmake ../ktexteditor \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
