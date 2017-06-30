# $Id: PKGBUILD 255206 2015-12-10 04:47:53Z foutrelis $
# Maintainer: Ionut Biru <ibiru@archlinux.org>

MOZJS_DEBUG=

pkgname=js52
pkgver=52.2.1esr
pkgrel=1
pkgdesc="JavaScript interpreter and libraries"
arch=(i686 x86_64)
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/SpiderMonkey"
license=(MPL)
depends=(nspr gcc-libs readline zlib)
makedepends=(python2 zip autoconf2.13)
options=(!staticlibs)
[[ -z "$MOZJS_DEBUG" ]] || options+=(!strip)
source=(https://ftp.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz
        link-mozglue.patch)
md5sums=('148418b75a026e3f7fe09c9f76e7fb78'
         '31bf0b1a043169bd1c651331ef9c9dd8')

prepare() {
  cd firefox-$pkgver
  # Workaround for https://bugzilla.mozilla.org/show_bug.cgi?id=1236085
  patch -p1 -i ../link-mozglue.patch

  cd js/src
  rm configure
  autoconf-2.13
  rm -r editline
  rm -r ctypes/libffi
}

build() {
  [[ -z "$MOZJS_DEBUG" ]] || DBG_OPTIONS='--enable-debug --disable-optimize'
  cd firefox-$pkgver/js/src
  # spidermonkey is broken with ICU 59 and it won't be fix on FF52
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1353650
  ./configure --prefix=/usr --with-system-nspr \
     --enable-readline $DBG_OPTIONS
  make
}

check() {
  cd "$srcdir/firefox-$pkgver/js/src/tests"
  python2 jstests.py ../js/src/js

  cd "$srcdir/firefox-$pkgver/js/src/jit-test"
  python2 jit_test.py ../js/src/js
}

package() {
  cd firefox-$pkgver/js/src
  make DESTDIR="$pkgdir" install

  mv "$pkgdir"/usr/bin/js{,52}
  mv "$pkgdir"/usr/bin/js{,52}-config
  mv "$pkgdir"/usr/lib/pkgconfig/js{,52}.pc

  install -Dm644 mozglue/build/libmozglue.a "$pkgdir"/usr/lib/libmozglue.a
}

# vim:set ts=2 sw=2 et:
