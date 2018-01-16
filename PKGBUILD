# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: Sebastian Sareyko <public@nooms.de>

pkgname=gnustep-base
pkgver=1.25.0
pkgrel=4
pkgdesc="The GNUstep base package"
arch=('x86_64')
url="http://www.gnustep.org/"
license=("GPL" "LGPL")
depends=(libxslt avahi gmp gcc-libs openssl libffi gnustep-make gnutls icu)
makedepends=(gcc-objc)
conflicts=('gnustep-base-svn')
groups=('gnustep-core')
options=('!emptydirs' '!makeflags')
source=(ftp://ftp.gnustep.org/pub/gnustep/core/$pkgname-$pkgver.tar.gz)
sha256sums=('f5159a7d70e06b9dfb96c5f8ac572e3a5e6cf8de7bafb056bc9b2e0c4f93c347')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  source /usr/share/GNUstep/Makefiles/GNUstep.sh
  ./configure --prefix=/usr --sysconfdir=/etc/GNUstep \
	--with-ffi-include=/usr/lib/libffi-`pacman -Q libffi | cut -f2 -d\ |cut -f1 -d-`/include/
  # fix file ownership
  sed -i 's/tar -xf $(TIMEZONE_ARCHIVE);/tar -xf $(TIMEZONE_ARCHIVE);chown -R root:root * ;/' NSTimeZones/Makefile.postamble
  sed -i 's|.*gnutls_transport_set_lowat.*||' Source/GSSocketStream.m
  make VERBOSE=1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  chown -R root.root "$pkgdir/"
}
