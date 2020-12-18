# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Kovivchak Evgen <oneonfire@gmail.com>

pkgname=codec2-git
_gitname=codec2
pkgver=20201210
pkgrel=1
pkgdesc="Open source 2400 bit/s speech codec"
arch=('i686' 'x86_64')
license=('LGPL')
#url="http://www.rowetel.com/blog/?page_id=452"
url="http://codec2.org/"
depends=('glibc')
makedepends=('git' 'cmake')
provides=('codec2')
conflicts=('codec2')
source=('git+https://github.com/drowe67/codec2')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$_gitname"
  mkdir -p build_linux
  cd build_linux
  cmake ../ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR:PATH=lib
  make all
}

package() {
  cd "$_gitname"
  install -m644 -D COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  cd "build_linux"
  make DESTDIR="$pkgdir" install

  # it won't install the binaries?
  install -d "$pkgdir/usr/bin/"
  cd src
  find ./ -type f -executable -print0 | xargs -0 /usr/bin/install -t "$pkgdir/usr/bin/"
  rm "$pkgdir/usr/bin/libcodec"*
}
