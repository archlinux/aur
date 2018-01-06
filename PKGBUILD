# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Christian Schmidt <mucknert@gmx.net>

pkgname=w3cam
pkgver=0.7.2
pkgrel=11
pkgdesc="a small and fast CGI program to retrieve images from a video4linux device."
arch=('x86_64')
url="http://mpx.freeshell.net/"
license=('GPL')
depends=('libpng' 'libjpeg')
makedepends=('v4l-utils')
source=(http://mpx.freeshell.net/$pkgname-$pkgver.tar.gz)
md5sums=('eec0b301b32bc8e9f65a4e54248c9868')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  sed -i 's|#include <linux/videodev.h>|#include <libv4l1-videodev.h>|' v4l.c vidcat.c w3cam.c w3camd/w3v4l.c
  ./configure --prefix=/usr --with-device=/dev/video0 --with-ttf-inc=/usr/include/freetype
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  mkdir -p "$pkgdir"/usr/cgi-bin "$pkgdir"/usr/bin "$pkgdir"/usr/man/man1 "$pkgdir"/usr/share/
  make prefix="$pkgdir"/usr/ install
  mkdir -p "$pkgdir"/usr/lib/w3cam/
  mv "$pkgdir"/usr/cgi-bin/* "$pkgdir"/usr/lib/w3cam/
  mv "$pkgdir"/usr/man "$pkgdir"/usr/share/man
  rm -rf "$pkgdir"/usr/cgi-bin
}
