# Maintainer: Joermungand <joermungand at gmail dot com>
# Maintainer: redtide <redtid3 at gmail dot com>

_commit=4a6dc504be5d547a97079bf3400a85f9080177db  # refs/tags/v2.5.4
pkgname=carla-bridges-win
pkgver=2.5.4
pkgrel=1
pkgdesc="Carla Windows bridges"
arch=(i686 x86_64)
url="https://kx.studio/Applications:Carla"
license=(GPL2)
groups=(proaudio)
depends=(
  carla
  mingw-w64-crt
  mingw-w64-winpthreads
  wine
)
makedepends=(
  git
  mingw-w64-gcc
  mingw-w64-pkg-config
)
# see https://github.com/archlinux/svntogit-community/blob/packages/carla/trunk/PKGBUILD
source=($pkgname-$pkgver::git+https://github.com/falkTX/Carla#tag=$_commit?signed)
sha512sums=('SKIP')
b2sums=('SKIP')
validpgpkeys=('62B11043D2F6EB6672D93103CDBAA37ABC74FBA0') # falkTX <falktx@falktx.com>

_path=$PATH
_cflags=$CFLAGS
_cxxflags=$CXXFLAGS
_ldflags=$LDFLAGS
_ar=$AR
_cc=$CC
_cxx=$CXX
_pkg_config_path=$PKG_CONFIG_PATH
_win32=$WIN32
_win64=$WIN64

prepare() {
  cd $pkgname-$pkgver
  # fix issues with python-pyqt5
  git cherry-pick -n 4151e160f1e9e03412c112fec54b5f1cde4c45de
}

build() {
  cd $pkgname-$pkgver
  for _arch in i686-w64-mingw32 x86_64-w64-mingw32; do
    if [[ $CARCH == i686 && $_arch == i686-w64-mingw32 ]]; then continue; fi
    if [[ $_arch == i686-w64-mingw32 ]]; then _bits=32; else _bits=64; fi
    export AR=$_arch-ar
    export CC=$_arch-gcc
    export CXX=$_arch-g++
    export LDFLAGS=-static
    export PATH=/usr/$_arch/bin:$PATH
    export PKG_CONFIG_PATH=/usr/$_arch/lib/pkgconfig
    export WIN32=true
    if [[ $_bits == 64 ]]; then export WIN64=true; fi
    unset CFLAGS
    unset CXXFLAGS
    unset LDFLAGS
    make win$_bits HAVE_LIBLO=false

    export PATH=$_path
    export AR=$_ar
    export CC=gcc
    export CXX=$_cxx
    export PKG_CONFIG_PATH=$_pkg_config_path
    export CFLAGS=$_cflags
    export CXXFLAGS=$_cxxflags
    export LDFLAGS=$_ldflags
    export WIN32=$_win32
    export WIN64=$_win64
    export JACKBRIDGE_FLAGS="-D__WIDL_objidl_generated_name_0000000C="
    make wine$_bits
  done
}

package() {
  cd $pkgname-$pkgver
  mkdir -p "$pkgdir/usr/lib/carla"
  mkdir -p "$pkgdir/usr/lib/lv2/carla.lv2"
  mkdir -p "$pkgdir/usr/lib/vst/carla.vst"
  cp bin/*.exe "$pkgdir/usr/lib/carla/"
  cp bin/*.dll "$pkgdir/usr/lib/carla/"
  cd "$pkgdir/usr/lib/carla"
  ln -sr *.exe ../lv2/carla.lv2/
  ln -sr *.exe ../vst/carla.vst/
  ln -sr *.dll ../lv2/carla.lv2/
  ln -sr *.dll ../vst/carla.vst/
}
# vim:set ts=2 sw=2 et:
