# Maintainer: Lukas Lamper <lukash.lamper@gmail.com>
_name=openhantek
pkgname=$_name-git
pkgver=r261.0eff8d4
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
makedepends=('git' 'cmake' 'binutils' 'fakeroot')
provides=("$_name")
conflicts=("$_name" "$pkgname")
install=$pkgname.install
source=('git+https://github.com/OpenHantek/openhantek.git'
        "$_name.desktop")
sha256sums=('SKIP'
            '73ab4cc2902fdec10975ee8fdfbe22541aac3e59de27fb968842c4b1509c07ce')


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
  cd "$srcdir/$_name/build"
  make DESTDIR="$pkgdir" install

  mv "$pkgdir/lib" "$pkgdir/usr/lib"

  mv "$pkgdir/usr/bin/OpenHantek" "$pkgdir/usr/bin/openhantek"

  install -Dm644 "$srcdir/$_name.desktop" "$pkgdir/usr/share/applications/$_name.desktop"
  install -Dm644 "$srcdir/$_name/$_name/res/images/$_name.png" "$pkgdir/usr/share/pixmaps/$_name.png"
}
