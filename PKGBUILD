# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libbdplus-git
pkgver=0.2.0.0.g98a4ba1
pkgrel=1
pkgdesc="Open implementation of BD+ protocol. (GIT version)"
arch=('x86_64')
license=('LGPL')
url='http://www.videolan.org/developers/libbdplus.html'
depends=(
  'glibc' # libc.so
  'libaacs'
  'libgpg-error' # libgpg-error.so
  'libgcrypt' # libgcrypt.so
)
makedepends=('git')
provides=(
  'libbdplus'
  'libbdplus.so'
)
conflicts=('libbdplus')
source=('git+https://code.videolan.org/videolan/libbdplus.git')
sha256sums=('SKIP')

pkgver() {
  cd libbdplus
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
  
  sed 's|gpg-error-config|gpg-error|g' -i libbdplus/configure.ac
}

build() {
  cd libbdplus
  autoreconf -vfi

  cd ../build
  ../libbdplus/configure \
    --prefix=/usr \
    --disable-static

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
