pkgname=carla-bridges-win32
pkgver=2.4.2
pkgrel=1
pkgdesc="Carla Windows VST 32-Bit Bridge (Stable)"
arch=('x86_64')
url="http://kxstudio.sf.net/carla"
license=('GPL2')
conflicts=('carla-bridges-win32' 'carla-bridges-win')
provides=('carla-bridges-win32')
depends=('mingw-w64-winpthreads' 'wine' 'carla')
makedepends=('git' 'mingw-w64-gcc' 'mingw-w64-pkg-config' 'gcc-multilib')
source=("https://github.com/falkTX/Carla/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('70b53ed681565a59398b3626c5aff2ccd46c6fe55c6f22796408d0b851620e6f0a502b6122df10a189d7706ca9baf471bbc735c14eacf610f3257ec0409eae65')
b2sums=('600e0d640cea1781f3288f5a92058e2417021b6831df78264d0f6b2a9546e19d3ecb175482a95655efa3cf3b26f98f456f459cda91ca976913c0fa3eab3b0a2e')

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
  make -j$(nproc) win32 HAVE_LIBLO=false
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
  make -j$(nproc) wine32 TESTBUILD=false
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

