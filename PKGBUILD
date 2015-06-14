# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=openhantek
pkgver=0.2.0
_fwpkgver=0.7.0
pkgrel=7
pkgdesc="Qt4 UI for Hantek DSO-2090/2150/2250/5200/5200A oscilloscopes. Includes firmware"
arch=('i686' 'x86_64')
url="http://www.openhantek.org/"
license=('GPL')
depends=('qt4' 'libusb' 'fftw' 'libgl' 'fxload')
makedepends=('binutils' 'unzip')
install=openhantek.install
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver.tar.bz2 \
http://downloads.sourceforge.net/project/$pkgname/$pkgname-extractfw/$pkgname-extractfw-0.7.0.tar.bz2)
md5sums=('57732229f063f582bfaa3c3cc942dae2'
         '9346d8e842cf1ea3eb378f21220e74b9')

# todo: handle groups, source firmware

build() {
  cd "$srcdir/$pkgname"
  qmake-qt4 PREFIX="/usr"  # Hah, if only.
  sed -i 's|/local/|/|g' Makefile
  sed -i 's|/local||g' OpenHantek.pro
  # fix crashiness on Catalyst, makes display slightly uglier
  #sed -i 's|GL_SMOOTH|GL_FLAT|' src/glscope.cpp
  make
  #sed -i 's|local/\(share/apps/openhantek/translations\)|\1\x00\x00\x00\x00\x00\x00|' bin/openhantek

  cd "$srcdir/$pkgname-extractfw"
  ./configure --prefix=/usr
  sed -i 's|/local/|/|g'   Makefile
  sed -i 's/-lbfd/& -ldl -liberty -lz/' Makefile
  make

  # hantek changed their site, get these tweaks merged upstream
  sed -i 's|"http.*"$|"http://www.hantek.com/Product/DSO2000"|' fwget.sh
  sed -i 's|wget -O "$ARCHIVE"|wget -nc|' fwget.sh
  sed -i 's|$MODEL/$ARCHIVE|DSO${MODEL}_Driver.zip|' fwget.sh
  sed -i 's|unrar .*$|unzip -j "DSO${MODEL}_Driver.zip" "*861.sys" -d "$TARGETDIR"|' fwget.sh
  ./fwget.sh

  sed -i 's|/local/|/|g'   90-hantek.rules
  sed -i 's/SYSFS/ATTRS/g' 90-hantek.rules
  sed -i 's/520A/520a/g'   90-hantek.rules
}

package() {
  cd "$srcdir/$pkgname"
  make INSTALL_ROOT="$pkgdir" install
  
  cd "$srcdir/$pkgname-extractfw"
  make DESTDIR="$pkgdir" install
  pushd firmware
  for h in *.hex; do
    install -Dm644 "$h" "$pkgdir/usr/share/hantek/${h/x86/}"
  done
  popd
  install -Dm644 90-hantek.rules "$pkgdir/usr/lib/udev/rules.d/90-hantek.rules"
}
