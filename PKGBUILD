# $Id: PKGBUILD 255206 2015-12-10 04:47:53Z foutrelis $
# Maintainer: Ionut Biru <ibiru@archlinux.org>

MOZJS_DEBUG=

pkgname=js45
pkgver=45.0.2
pkgrel=4
pkgdesc="JavaScript interpreter and libraries"
arch=(i686 x86_64)
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/SpiderMonkey/Releases/45"
license=(MPL)
depends=(nspr gcc-libs readline zlib icu)
makedepends=(python2 zip libffi autoconf2.13 gcc5)
options=(!staticlibs)
[[ -z "$MOZJS_DEBUG" ]] || options+=(!strip)
source=(https://people.mozilla.org/~sfink/mozjs-$pkgver.tar.bz2
        system-icu.patch
        install-copy-files.patch
        link-mozglue.patch)
md5sums=('2ca34f998d8b5ea79d8616dd26b5fbab'
         '2b0ef1e6ef45964be002fcaa2c90b6ba'
         '6b8e25f10a529c0f8aa3dc95837c981e'
         'ad646de016de6031bfe77b6b59e87078')

prepare() {
  cd mozjs-$pkgver
  patch -p1 -i ../system-icu.patch
  patch -p1 -i ../install-copy-files.patch
  # Workaround for https://bugzilla.mozilla.org/show_bug.cgi?id=1236085
  patch -p1 -i ../link-mozglue.patch
  rm -r intl/icu

  cd js/src
  rm configure
  autoconf-2.13
  rm -r editline
  rm -r ctypes/libffi
}

build() {
  # A GCC6 optimization bug cause assertion failures and segmentation faults
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1272944
  export CC=gcc-5
  export CXX=g++-5
  export CPP=cpp-5

  [[ -z "$MOZJS_DEBUG" ]] || DBG_OPTIONS='--enable-debug --disable-optimize'
  cd mozjs-$pkgver/js/src
  ./configure --prefix=/usr --with-system-nspr --enable-system-ffi \
     --enable-readline --with-system-icu $DBG_OPTIONS
  make
}

check() {
  cd "$srcdir/mozjs-$pkgver/js/src/tests"
  python2 jstests.py ../js/src/js

  cd "$srcdir/mozjs-$pkgver/js/src/jit-test"
  python2 jit_test.py ../js/src/js
}

package() {
  export CC=gcc-5
  export CXX=g++-5
  export CPP=cpp-5

  cd mozjs-$pkgver/js/src
  make DESTDIR="$pkgdir" install

  mv "$pkgdir"/usr/bin/js{,45}
  mv "$pkgdir"/usr/bin/js{,45}-config

  install -Dm644 mozglue/build/libmozglue.a "$pkgdir"/usr/lib/libmozglue.a
}

# vim:set ts=2 sw=2 et:
