# Maintainer: Alexey Andreyev <aa13q@ya.ru>

_gitname=brain-im
pkgname=telepathy-brain-im-git
pkgver=r13.bc31484
pkgrel=1
pkgdesc="Telepathy IM client"
arch=(i686 x86_64 armv7h aarch64)
url="https://telepathy.freedesktop.org/"
license=(GPL)
depends=('telepathy-qt')
makedepends=(cmake git)
provides=(telepathy-brain-im)
conflicts=(telepathy-brain-im)
source=("git+https://github.com/TelepathyIM/$_gitname")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_gitname \
    -DENABLE_QML_CLIENT=TRUE \
    -DENABLE_QML=TRUE \
    -DINSTALL_QML_IMPORT_DIR=lib/qt/qml \
    -DUSE_TELEPATHY=TRUE \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib/telepathy \
    -DCMAKE_BUILD_TYPE=Release \
    -DQT_VERSION_MAJOR=5
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir"/usr/bin
  cp "examples/qmlclient/$_gitname" "$pkgdir"/usr/bin
}
