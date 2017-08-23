# $Id: PKGBUILD 255206 2015-12-10 04:47:53Z foutrelis $
# Maintainer: Ionut Biru <ibiru@archlinux.org>

MOZJS_DEBUG=

pkgname=js52
pkgver=52.3.0esr
pkgrel=2
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
sha256sums=('c16bc86d6cb8c2199ed1435ab80a9ae65f9324c820ea0eeb38bf89a97d253b5b'
            '98e4e6ca44320c00850462a0a7014d80663f162d1d71843576f8ded26e757194')

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

  install -Dm644 mozglue/build/libmozglue.a "$pkgdir"/usr/lib/libmozglue.a
}

# vim:set ts=2 sw=2 et:
