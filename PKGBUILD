pkgname=carla-bridges-win32
pkgver=2.4.3
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
sha512sums=('1e062e2bd5c8791d5936dbaa30accf8165cfb8b487e4b7d90800b573f436a6415d7452000849ebdab60ff60f7162161a0f4f50645deaaf115d47a436807ea3b9')
b2sums=('2fc4cf69b11b88069049eba84a6f3d88d1fbd35539d32dd8d0204de5c146d7bee4eaf6aca40ef3cc366661238eb06dda2a3a3aec93f6c4b6cf4848055076b616')

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

