# Maintainer: Ildus Kurbangaliev <i.kurbangaliev@gmail.com>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_prj=prjtrellis
pkgname=$_prj-git
pkgver=1.0
pkgrel=5
pkgdesc='Documentation and definitions for the Lattice ECP5 bit-stream format'
arch=('x86_64')
url='https://github.com/YosysHQ/prjtrellis'
license=('custom:ISC' 'MIT')
depends=('boost-libs')
makedepends=('cmake' "$_prj-db" 'boost' 'openocd')
optdepends=('python: Python support')
provides=('libtrellis')
conflicts=('libtrellis')
source=("$_prj-master.zip::$url/archive/master.zip")
sha512sums=('SKIP')

prepare() {
  cd $_prj-master

  sed -i 's|set(LIBDIR "lib64")|set(LIBDIR "lib")|
          s|NOT ("${LAST_GIT_VERSION}" STREQUAL "${CURRENT_GIT_VERSION}")|ON|
          s|project(libtrellis)|project(libtrellis VERSION 1.0)|' libtrellis/CMakeLists.txt
}

build() {
  mkdir -p $_prj-master/libtrellis/build
  cd $_prj-master/libtrellis/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  sed -i '/Boost::python-NOTFOUND/d' CMakeFiles/*.dir/build.make
  sed -i 's|Boost::python-NOTFOUND||g' CMakeFiles/*.dir/link.txt

  make
}

package() {
  cd $_prj-master

  install -Dm 644 COPYING "$pkgdir"/usr/share/licenses/$_prj/LICENSE

  cd libtrellis/build

  make DESTDIR="$pkgdir" install

  # The database is provided in a separate package
  rmdir "$pkgdir"/usr/share/trellis/database
}
