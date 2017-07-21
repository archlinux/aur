# $Id: PKGBUILD 255206 2015-12-10 04:47:53Z foutrelis $
# Maintainer: Ionut Biru <ibiru@archlinux.org>

MOZJS_DEBUG=

pkgname=js52
pkgver=52.2.1esr
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
        link-mozglue.patch
        mozjs52-shell-version.patch
        mozjs52-pkg-config-version.patch)
sha256sums=('8ee3ae10e8e782d867e9164eaed4613783959266fd7d01daf972159ca426efdb'
            '770d6122e95d062050ffa9039dd41f085e6f4e6da3c56958a9a0cc2897fc8ca6'
            'e5470391fd9e3fde866d9a5046f4e778b001e632342fcd5ba6273e8956a2924b'
            'fcdc86524d3abb89244310bded9e994833b1ecad2cb181821cbb523e2c1b567a')

prepare() {
  cd firefox-$pkgver
  # Workaround for https://bugzilla.mozilla.org/show_bug.cgi?id=1236085
  patch -p1 -i ../link-mozglue.patch
  patch -Np1 -i ../mozjs52-shell-version.patch
  patch -Np1 -i ../mozjs52-pkg-config-version.patch

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
  python2 jstests.py ../js/src/$pkgname

  cd "$srcdir/firefox-$pkgver/js/src/jit-test"
  python2 jit_test.py ../js/src/$pkgname
}

package() {
  cd firefox-$pkgver/js/src
  make DESTDIR="$pkgdir" install

  install -Dm644 mozglue/build/libmozglue.a "$pkgdir"/usr/lib/libmozglue.a
}

# vim:set ts=2 sw=2 et:
