# Based on the following version of extra/libmtp:
# $Id: PKGBUILD 155745 2012-04-06 00:05:58Z tomegun $
#
# Contributor: damir <damir@archlinux.org>
# Contributor: Kevin Edmonds <edmondskevin@hotmail.com>
# Contributor: John Karahalis <john.karahalis@gmail.com>
# Maintainer: Simon Conseil <contact+aur at saimon dot org>

pkgname=libmtp-git
pkgver=1.1.9.r6.gd07cd29
pkgrel=1
pkgdesc="Library implementation of the Media Transfer Protocol"
arch=("i686" "x86_64")
url="http://libmtp.sourceforge.net"
license=('LGPL')
depends=('libusb' 'libgcrypt')
makedepends=('git')
conflicts=('libmtp')
provides=('libmtp')
source=("$pkgname"::'git://git.code.sf.net/p/libmtp/code')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/libmtp-//' | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  yes | ./autogen.sh
  ./configure --prefix=/usr --with-udev=/usr/lib/udev
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="${pkgdir}" install

  # fix broken udev rule
  sed -i "/^Unable to open/d" ${pkgdir}/usr/lib/udev/rules.d/69-libmtp.rules
}
