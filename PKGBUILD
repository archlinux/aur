pkgname=carla-bridges-win32
pkgver=2.5.5
pkgrel=1
pkgdesc="Carla Windows VST 32-Bit Bridge (Stable)"
arch=('x86_64')
url="http://kxstudio.sf.net/carla"
license=('GPL2')
conflicts=('carla-bridges-win32' 'carla-bridges-win')
provides=('carla-bridges-win32')
depends=('wine' 'carla')
makedepends=('gcc-multilib' 'git' 'mingw-w64-gcc' 'mingw-w64-pkg-config' 'mingw-w64-winpthreads')
source=("https://github.com/falkTX/Carla/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('93d0fd7c97956446701328f4b98db508a64df9ae6f476871ba7c1ec3f7cc420c206622a01ce5aec2e98079a714264dac5f3f662e0c3d0fad83cc1f1dbeac119a')
b2sums=('fd34d827eea5fb4b7a9fcd57827adde9fae1f0fe2ee02fcccfc4b2d0f72a31872f52956b32455666471cf573fcd04abe3d432c3d38407c6dabe8f95287da388c')

  _path=$PATH
  _cflags=$CFLAGS
  _cxxflags=$CXXFLAGS
  _ldflags=$LDFLAGS
  _ar=$AR
  _cc=$CC
  _cxx=$CXX
  _pkg_config_path=$PKG_CONFIG_PATH
  _win32=$WIN32

build() {
  cd "$srcdir/Carla-${pkgver}"
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
  make win32 HAVE_LIBLO=false
  export PATH=$_path
  export AR=$_ar
  export CC=gcc 
  export CXX=$_cxx
  export PKG_CONFIG_PATH=$_pkg_config_path
  export CFLAGS=$_cflags
  export CXXFLAGS=$_cxxflags
  export LDFLAGS=$_ldflags
  export WIN32=$_win32
  export JACKBRIDGE_FLAGS="-D__WIDL_objidl_generated_name_0000000C="
  make wine32 TESTBUILD=false
}

package() {
  cd "$srcdir/Carla-${pkgver}"
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

