# Maintainer: Alexandros Theodotou <alex at zrythm dot org>
# based on PKGBUILD by: Joermungand <joermungand at gmail dot com>
_pkgbase=carla
MINGW_PACKAGE_PREFIX=mingw-w64
pkgname=$MINGW_PACKAGE_PREFIX-$_pkgbase
pkgver=5399.cfa1bf23e
pkgrel=1
pkgdesc="Carla"
arch=('any')
url="http://kxstudio.sf.net/carla"
license=('GPL2')
depends=('mingw-w64-crt'
  'mingw-w64-winpthreads'
  'mingw-w64-libsndfile'
  'mingw-w64-libvorbis'
  'mingw-w64-fluidsynth'
  'mingw-w64-pkg-config')
makedepends=('git' 'mingw-w64-gcc')
source=("$pkgname"::'git://github.com/falkTX/Carla.git')
md5sums=('SKIP')
_architectures=('x86_64-w64-mingw32')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  export LDFLAGS=
  LDFLAGS=
  sed -i -e 's/\t@/\t/g' source/**/Makefile
  sed -i -e 's/--libs sndfile/--libs --static sndfile vorbis ogg/g' source/Makefile.mk
   for _arch in "${_architectures[@]}"; do
     #$_arch-make PKG_CONFIG=$_arch-pkg-config BUILDING_FOR_WINDOWS=true clean
     $_arch-make PKG_CONFIG=$_arch-pkg-config BUILDING_FOR_WINDOWS=true
   done
}

package() {
  cd "$srcdir/$pkgname"

  pwd
  ls source/backend/Makefile
  for _arch in "${_architectures[@]}"; do
    $_arch-make DESTDIR="${pkgdir}" \
      PREFIX=/usr/$_arch \
      PKG_CONFIG=$_arch-pkg-config BUILDING_FOR_WINDOWS=true install
  done
}
