# Maintainer: Bernhard Landauer <bernhard@manjaro.org>

pkgname=(mlt-python2-bindings)
pkgver=6.14.0
pkgrel=2
pkgdesc="python2 bindings for mlt"
arch=(x86_64)
url="https://www.mltframework.org"
license=(GPL)
depends=(python2 mlt)
makedepends=(ladspa frei0r-plugins libdv sdl_image libsamplerate sox ffmpeg vid.stab qt5-svg
             jack libexif python2 swig movit eigen opencv libebur128 gtk2)
source=($pkgname-$pkgver.tar.gz::"https://github.com/mltframework/mlt/archive/v$pkgver.tar.gz"
        mlt-opencv4.patch)
sha256sums=('d387350f7bb7dd01efce3933c5ab7987b596e98bef7cc9c2349524d55a808b5e'
            'e770eaa39337cbbeb7d03357c11013e62ea355696023d1bd2d0fca6d1812b627')

prepare() {
  cd mlt-$pkgver
  patch -p1 -i ../mlt-opencv4.patch # Fix build with openCV 4
}

build() {
  cd mlt-$pkgver

  ./configure --prefix=/usr \
	--avformat-swscale \
	--enable-gpl \
        --enable-gpl3 \
        --enable-opencv \
	--qt-libdir=/usr/lib --qt-includedir=/usr/include/qt
  make

# python bindings
  cd src/swig/python
  sed -i 's_path=`which python_path=`which python2_' build
  sed -i 's_`python -c_`python2 -c_' build
  sed -i 's#python-config#python2-config#' build
  ./build
}

package() {
  cd "$srcdir/mlt-$pkgver/src/swig/python"
  mkdir -p "$pkgdir/usr/lib/python2.7/"
  install -m755 mlt.py "$pkgdir/usr/lib/python2.7/"
  install -m755 _mlt.so "$pkgdir/usr/lib/python2.7/"
  install -m755 mlt_wrap.o "$pkgdir/usr/lib/python2.7/"
}
