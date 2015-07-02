# Maintainer: 3ED <krzysztof1987@gmail.com>

pkgname=alsa-tools-emu10k1-gui
pkgver=1.0.29
pkgrel=1
pkgdesc="a GUI utility to manage emu10k1/2 patch loader"
url="http://alsa-project.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('alsa-tools' 'qt3')
source=("ftp://ftp.alsa-project.org/pub/tools/alsa-tools-${pkgver}.tar.bz2"
        "qlo10k1.desktop")
sha256sums=('94abf0ab5a73f0710c70d4fb3dc1003af5bae2d2ed721d59d245b41ad0f2fbd1'
            'd58a3e1215edd6ecbf1853c15a397e6240d1700c2a749536136a95535e11d7a3')

prepare() {
  cd "$srcdir/alsa-tools-$pkgver/qlo10k1"
  sed 's|$QTDIR/include|/usr/include/qt3/|g' -i configure
  sed 's|$QTDIR/bin|/usr/lib/qt3/bin|g' -i configure
  sed 's|$QTDIR/lib|/usr/lib|g' -i configure
  sed 's|$QTDIR/$QT_LIB_DIR|/usr/lib|g' -i configure
}

build() {
  export PATH=/usr/lib/qt3/bin/:$PATH
  export QTDIR=/usr/lib/qt3/

  cd "$srcdir/alsa-tools-$pkgver/qlo10k1"
  ./configure --prefix=/usr --with-qtdir=$QTDIR --disable-ld10k1test
  make
}

package() {
  cd "$srcdir/alsa-tools-$pkgver/qlo10k1"

  make DESTDIR="$pkgdir/" install

  install -dm755 "$pkgdir/usr/share/applications"
  install -m 644 "$srcdir/qlo10k1.desktop" \
    "$pkgdir/usr/share/applications/qlo10k1.desktop"

  find "$pkgdir/" -name '*.la' -delete
}

