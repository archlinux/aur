# Maintainer: ServiusHack <serviushack at gmx dot de>
pkgname=casparcg-client-git
pkgver=next_r1221.1bca33bf
pkgrel=1
pkgdesc='A client software used to control the CasparCG Server software'
arch=('x86_64')
url='http://www.casparcg.com/'
license=('GPL')
depends=('boost-libs' 'qt5-base' 'qt5-websockets' 'libqatemcontrol-git' 'vlc')
makedepends=('git' 'boost' 'time')
source=('system-libs.diff' 'casparcg-client' 'git+https://github.com/CasparCG/Client.git' 'git+https://github.com/CasparCG/Tools.git')
sha256sums=('bd9c6f86da782c62a2f7e3f845f271d7ed7ed19eeeac8ad75fdfb9e4bdf9e5dc' '8c5b1a9104ae09895e3b71d5a250a5db0e4611181aa53103d6bbde40cd76ab5c' 'SKIP' 'SKIP')
conflicts=('casparcg-client-bin')

pkgver() {
	cd "$srcdir/Client"
	printf "next_r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # Build gpio-client
  pushd "$srcdir/Tools/cpp/gpio/trunk/gpio-client"
  qmake
  make
  popd

  # Copy gpio-client
  rm -r $srcdir/Client/lib/gpio-client/include
  cp -r $srcdir/Tools/cpp/gpio/trunk/gpio-client/include $srcdir/Client/lib/gpio-client/
  rm $srcdir/Client/lib/gpio-client/lib/linux/libgpio-client.so*
  cp $srcdir/Tools/cpp/gpio/trunk/gpio-client/libgpio-client.so* $srcdir/Client/lib/gpio-client/lib/linux
  cp $srcdir/Tools/cpp/gpio/trunk/gpio-client/libgpio-client.so* $srcdir/Client/deploy/linux/bin

  cd "$srcdir/Client"
  patch -p1 <$srcdir/../system-libs.diff
  export BUILD_QT_PATH=/usr/bin
  export BUILD_ARCHIVE_NAME="archive"
  export BUILD_PARALLEL_THREADS=$(nproc)
  cd build-scripts
  ./build-linux.sh
}

package() {
  # Remove libs for which we use the system ones
  rm $srcdir/Client/build/archive/bin/libQt5*
  rm $srcdir/Client/build/archive/bin/libboost_*
  rm $srcdir/Client/build/archive/bin/libqatemcontrol*
  rm -r $srcdir/Client/build/archive/bin/platforms/
  rm -r $srcdir/Client/build/archive/bin/sqldrivers/

  mkdir -p $pkgdir/opt/casparcg-client/
  rsync -av $srcdir/Client/build/archive/ "$pkgdir/opt/casparcg-client"
  mkdir -p $pkgdir/usr/bin/
  cp casparcg-client "$pkgdir/usr/bin/"
}
