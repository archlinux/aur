# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=carla-bridges-win32-git
pkgver=3222.3f9bd01
pkgrel=2
pkgdesc="Carla win32 bridge"
arch=('i686' 'x86_64')
url="http://kxstudio.sf.net/carla"
license=('GPL2')
conflicts=('carla-bridges-win32')
provides=('carla-bridges-win32')
depends=('mingw-w64-crt' 'mingw-w64-winpthreads' 'mingw-w64-pkg-config' 'wine' 'carla-git')
makedepends=('git' 'mingw-w64-gcc')
source=("$pkgname"::'git://github.com/falkTX/Carla.git'
        'http://www.steinberg.net/sdk_downloads/vstsdk360_22_11_2013_build_100.zip')
md5sums=('SKIP'
         '1ac422ebb4aa2e86061278412c347b55')

  _path=$PATH
  _cflags=$CFLAGS
  _cxxflags=$CXXFLAGS
  _ldflags=$LDFLAGS
  _ar=$AR
  _cc=$CC
  _cxx=$CXX
  _pkg_config_path=$PKG_CONFIG_PATH
  _win32=$WIN32

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  export PATH=/usr/i686-w64-mingw32/bin:$PATH
  export AR=i686-w64-mingw32-ar
  export CC=i686-w64-mingw32-gcc
  export CXX=i686-w64-mingw32-g++
  export PKG_CONFIG_PATH=/usr/i686-w64-mingw32/lib/pkgconfig
  export WIN32=true
  unset CFLAGS
  unset CXXFLAGS
  unset LDFLAGS
  export LDFLAGS="-static"
  ln -s ../../../VST3\ SDK source/includes/vst2
  sed -i 's/#if !PLATFORM_64/#if 0/' source/includes/vst2/base/source/fthread.cpp
  make win32 HAVE_LIBLO=false
  export PATH=$_path
  export AR=$_ar
  export CC=$_cc
  export CXX=$_cxx
  export PKG_CONFIG_PATH=$_pkg_config_path
  export CFLAGS=$_cflags
  export CXXFLAGS=$_cxxflags
  export LDFLAGS=$_ldflags
  export WIN32=$_win32
  make wine32
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/lib/carla"
  cp bin/*.exe "$pkgdir/usr/lib/carla/"
  cp bin/*.dll "$pkgdir/usr/lib/carla/"
  mkdir -p "$pkgdir/usr/lib/lv2/carla.lv2"
  mkdir -p "$pkgdir/usr/lib/vst/carla.vst"
  cd "$pkgdir/usr/lib/carla"
  ln -sr *.exe ../lv2/carla.lv2/
  ln -sr *.exe ../vst/carla.vst/
  ln -sr *.dll ../lv2/carla.lv2/
  ln -sr *.dll ../vst/carla.vst/
}

