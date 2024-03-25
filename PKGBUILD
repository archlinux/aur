pkgname=carla-bridges-win64
pkgver=6940.86afb5f65
pkgrel=1
pkgdesc="Carla Win64 Bridge"
arch=('i686' 'x86_64')
url="http://kxstudio.sf.net/carla"
license=('GPL2')
groups=('pro-audio')
depends=('wine' 'carla')
makedepends=('git' 'mingw-w64-crt' 'mingw-w64-gcc' 'mingw-w64-pkg-config' 'mingw-w64-winpthreads')
source=("$pkgname"::'git+https://github.com/falkTX/Carla.git')
md5sums=('SKIP')

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
  make -j$(nproc) win64 HAVE_LIBLO=false
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
  make -j$(nproc) wine64
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

