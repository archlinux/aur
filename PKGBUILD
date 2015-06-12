# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=carla-bridges-win64-git
pkgver=2631.03f5746
pkgrel=1
pkgdesc="Carla win64 bridge"
arch=('i686' 'x86_64')
url="http://kxstudio.sf.net/carla"
license=('GPL2')
conflicts=('carla-bridges-win64')
provides=('carla-bridges-win64')
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
  _win64=$WIN64

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export PATH=/usr/x86_64-w64-mingw32/bin:$PATH
  export AR=x86_64-w64-mingw32-ar
  export CC=x86_64-w64-mingw32-gcc
  export CXX=x86_64-w64-mingw32-g++
  export PKG_CONFIG_PATH=/usr/x86_64-w64-mingw32/lib/pkgconfig
  export WIN32=true
  export WIN64=true
  unset CFLAGS
  unset CXXFLAGS
  unset LDFLAGS
  export LDFLAGS="-static"
  cd "$srcdir/$pkgname"
  ln -s ../../../VST3\ SDK source/includes/vst2
  sed -i 's/#if !PLATFORM_64/#if 0/' source/includes/vst2/base/source/fthread.cpp
  make win64
  export PATH=$_path
  export AR=$_ar
  export CC=$_cc
  export CXX=$_cxx
  export PKG_CONFIG_PATH=$_pkg_config_path
  export CFLAGS=$_cflags
  export CXXFLAGS=$_cxxflags
  export LDFLAGS=$_ldflags
  export WIN32=$_win32
  export WIN64=$_win64
  make wine64
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/lib/carla"
  cp bin/*.exe "$pkgdir/usr/lib/carla/"
  cp bin/*.dll "$pkgdir/usr/lib/carla/"
}

