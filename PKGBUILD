# Maintainer: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
# Contributor: Tarn Burton <twburton at gmail dot com>

pkgname='pioneer'
pkgver=20190203
pkgrel=1
pkgdesc="A game of lonely space adventure"
arch=('x86_64') # 'i686' untested
url="https://github.com/pioneerspacesim/pioneer"
license=('GPL3')
provides=('pioneer')
conflicts=('pioneer-bin' 'pioneer-git')
depends=(
  'assimp' # libassimp-dev >= 3.2
  'curl' # libcurl-dev
  'freetype2' # libfreetype6-dev
  'glew' # USE_SYSTEM_LIBGLEW include <GL/glew.h>
  'hicolor-icon-theme'
  'libpng' # libpng-dev
  'libsigc++' # libsigc++-dev libsigc++-2.0-dev
  'libvorbis' # libvorbis-dev
  'lua52' # USE_SYSTEM_LIBLUA
  'mesa' # mesa-common-dev
  'sdl2' # libsdl2-dev
  'sdl2_image' # libsdl2-image-dev
)
makedepends=(
  'automake' #  automake
  'naturaldocs'
  'pkgconf' # pkg-config
  'cmake'
)
source=("$pkgname-$pkgver.tar.gz::http://github.com/pioneerspacesim/pioneer/archive/$pkgver.tar.gz")
sha256sums=('e526f1659ae321f45b997c0245acecbf9c4cf2122b025ab8db1090f1b9804f5e')

build() {

  # Autotools support is dropped
  # https://github.com/pioneerspacesim/pioneer/issues/4525#issuecomment-460067597

  # Build codedoc
  # cd "$srcdir/$pkgname-$pkgver"
  # autoreconf -fvi
  # ./configure
  # make codedoc

  # Build
  mkdir "$srcdir/$pkgname-$pkgver/build"
  cd "$srcdir/$pkgname-$pkgver/build"
  # cmake . -LH
  # cmake . -LAH
  cmake \
    -D CMAKE_INSTALL_PREFIX:PATH=/usr \
    -D PIONEER_DATA_DIR:PATH=/usr/share/pioneer/ \
    -D USE_SYSTEM_LIBGLEW:BOOL=ON \
    -D USE_SYSTEM_LIBLUA:BOOL=ON \
    -G 'Unix Makefiles' \
    -Wno-dev \
    -Wdeprecated \
    --warn-uninitialized \
    --warn-unused-vars \
    "$srcdir/$pkgname-$pkgver"
  time make
  # Precompile all models into *.sgm files to alleviate long startup times
  ./modelcompiler -batch inplace

  # Run
  # cd "$srcdir/$pkgname-$pkgver/build"; ./pioneer # Could not load shaders/opengl/vtxColor.vert
  # cd "$srcdir/$pkgname-$pkgver"; ./build/pioneer
}

package() {

  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install

  # appdata
  mkdir --parents "$pkgdir/usr/share/metainfo"
  mv "$pkgdir/usr/share/appdata/net.pioneerspacesim.Pioneer.appdata.xml" "$pkgdir/usr/share/metainfo/net.pioneerspacesim.Pioneer.appdata.xml"
  rmdir "$pkgdir/usr/share/appdata"

  # codedoc
  # mkdir --parents "$pkgdir/usr/share/doc/pioneer"
  # cp --recursive "$srcdir/$pkgname-$pkgver"/codedoc/* "$pkgdir/usr/share/doc/pioneer/"

}
