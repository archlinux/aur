# Maintainer: Ted John <intelorca@gmail.com>
pkgname=openrct2-cli
pkgver=0.1.0
pkgrel=1
pkgdesc='OpenRCT2, command line interface (headless).'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://openrct2.website'
license=('GPL3')
depends=('libopenrct2')
makedepends=('cmake')
source=("https://github.com/OpenRCT2/OpenRCT2/archive/v$pkgver.tar.gz")
sha256sums=('0347a47d380fc18ea543928c92a13d1bdb4431573154afeb80fa33f1149e6992')

build() {
  cd "$srcdir/OpenRCT2-$pkgver"

  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr ..
  make openrct2-cli
}

package() {
  cd "$srcdir/OpenRCT2-$pkgver/build"

  make DESTDIR="$pkgdir" install
  cp openrct2-cli "$pkgdir/usr/bin"
  cd "$pkgdir/usr"

  # Currently the install target builds openrct2 which we don't want
  # we also need to remove the stuff that is installed with libopenrct2
  rm -rf bin/openrct2 lib share/applications share/icons share/doc/openrct2 share/openrct2

  # Symlink openrct2 to openrct2-cli
  cd bin
  ln -s openrct2-cli openrct2
}
