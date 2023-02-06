# Maintainer: Manuel Lladosa <$(base64 --decode <<<'bWFub2xvbGxyQHJpc2V1cC5uZXQK')>
# Contributor: Tarn Burton <twburton at gmail dot com>
pkgname='pioneer-git'
pkgver=20230203.r4.gdf1f2a9da
pkgrel=1
pkgdesc="A game of lonely space adventure"
arch=('x86_64')
url="https://github.com/pioneerspacesim/pioneer"
license=('GPL3')
provides=('pioneer')
conflicts=('pioneer-bin' 'pioneer')
depends=('assimp' 'freetype2' 'hicolor-icon-theme' 'libsigc++' 'libvorbis' 'sdl2_image')
makedepends=('git' 'cmake' 'mesa' 'glu')
source=("$pkgname::git+https://github.com/pioneerspacesim/pioneer")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $pkgname

  echo "CAUTION!!! To compile the game correctly you must remove -D_GLIBCXX_ASSERTIONS in CXXFLAGS= in file /etc/makepkg.conf"
  read

  ./bootstrap -D CMAKE_INSTALL_PREFIX:PATH=/usr \
    -D PIONEER_DATA_DIR:PATH=/usr/share/pioneer/
  make -C build

  # If game is installed models don't get compiled
  # As a workaround we recompile 'modelcompiler' using $srcdir/data directory
  # instead of /usr/share/pioneer
  # Later, we let the things as them was

  if [ -d /usr/share/pioneer ]; then
    ./bootstrap cmake -D CMAKE_INSTALL_PREFIX:PATH=/usr \
      -D PIONEER_DATA_DIR:PATH="data"
    make -C build modelcompiler
    build/modelcompiler -b inplace

    ./bootstrap cmake -D CMAKE_INSTALL_PREFIX:PATH=/usr \
     -D PIONEER_DATA_DIR:PATH=/usr/share/pioneer/
  else
    build/modelcompiler -b inplace
  fi
}

package() {
  cd $pkgname

  make -C build DESTDIR="$pkgdir" install
}
