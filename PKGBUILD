# Contributor: Ross Melin <rdmelin@gmail.com>
# Contributor: Tri Le <trile7@gmail.com>
# Contributor: libc <primehunter326@gmail.com>
# Contributor: Albert Nguyen <albertbmnguyen@yahoo.com>

pkgname=mjpg-streamer
pkgver=r63
pkgrel=5
pkgdesc="Stream mjpeg frames from a webcam via http"
arch=('any')
url="http://sourceforge.net/projects/mjpg-streamer"
license=('GPL')
groups=(multimedia)
depends=(libjpeg imagemagick)
makedepends=(gcc)
provides=(mjpeg-streamer)
options=(!makeflags)
source=("http://downloads.sourceforge.net/project/mjpg-streamer/mjpg-streamer/Sourcecode/$pkgname-$pkgver.tar.gz" "uvc.patch")

prepare() {
  cd "$srcdir"
  patch -p0 < uvc.patch
  cd "$srcdir/$pkgname-$pkgver"
  find . -type f -print0 | xargs -0 sed -i s/videodev.h/videodev2.h/g
  sed -i "s/make -C plugins\/input_gspcav1/# make -C plugins\/input_gspcav1/" Makefile
  sed -i "s/cp plugins\/input_gspcav1\/input_gspcav1.so/# cp plugins\/input_gspcav1\/input_gspcav1.so/" Makefile
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make clean all || return 1
  mkdir -p $pkgdir/usr/share/mjpeg-streamer/www/
  mkdir -p $pkgdir/usr/lib
  install *.so $pkgdir/usr/lib/
  install -m 644 www/* $pkgdir/usr/share/mjpeg-streamer/www/
  install -m 755 www/functions.js $pkgdir/usr/share/mjpeg-streamer/www/
  mkdir -p $pkgdir/usr/bin
  install mjpg_streamer $pkgdir/usr/bin/
  install -m 644 CHANGELOG LICENSE README start.sh $pkgdir/usr/share/mjpeg-streamer/
}

md5sums=('1c424b5441a2bf8379cdecd7dbebc935' 'edcdd714d87411d0daba9f8a336d6b82')
