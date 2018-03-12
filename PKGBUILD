# Maintainer: Lukas Lamper <lukash.lamper@gmail.com>
_name=openhantek
pkgname=$_name-git
pkgver=r259.ad9b229
pkgrel=1
pkgdesc="Qt5 UI for Hantek DSO2xxx/DSO52xx/6022BE/BL oscilloscopes. Including firmware"
arch=('i686' 'x86_64')
url="http://www.openhantek.org/"
license=('GPL-3.0')
depends=('bzip2' 'double-conversion' 'fftw' 'freetype2' 'fxload'
         'gcc-libs' 'glib2' 'glibc' 'graphite' 'harfbuzz'
         'icu' 'libgcrypt' 'libglvnd' 'libgpg-error' 
         'libpng' 'libsystemd' 'libusb' 'libx11' 'libxau'
         'libxcb' 'libxdmcp' 'libxext' 'lz4' 'pcre'
         'pcre2' 'qt5-base' 'xz' 'zlib')
provides=("$_name")
conflicts=("$_name" "$pkgname")
makedepends=('git' 'cmake' 'binutils' 'fakeroot')
source=('git+https://github.com/OpenHantek/openhantek.git')
sha256sums=('SKIP')


pkgver() {
  cd "$srcdir/$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_name"

  if [ ! -d build ]; then
      mkdir build
  fi
  cd build

  cmake                               \
       -DCMAKE_INSTALL_PREFIX=/usr \
       -DCMAKE_INSTALL_LIBDIR=/usr/lib ../

  make -j
}

package() {
  cd $srcdir/$_name/build
  make DESTDIR="$pkgdir" install

  mkdir -p $pkgdir/usr/share/openhantek
  cp -a $srcdir/$_name/openhantek/res/firmware/*.hex $pkgdir/usr/share/openhantek/

  mv $pkgdir/lib $pkgdir/usr/lib

  mv $pkgdir/usr/bin/OpenHantek $pkgdir/usr/bin/openhantek
}
