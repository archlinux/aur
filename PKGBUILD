# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>
# Contributor: jtts
# Contributor: Ionut Biru <ibiru@archlinux.org>

_pkgname_base=js
pkgname=lib32-$_pkgname_base

_pkgver_major=24
pkgver=$_pkgver_major.2.0

pkgrel=2
pkgdesc="JavaScript interpreter and libraries (32-bit)"
arch=('x86_64')
url="https://developer.mozilla.org/En/SpiderMonkey/$_pkgver_major"
license=(MPL)
depends=($_pkgname_base lib32-nspr lib32-readline lib32-zlib gcc-libs-multilib)
makedepends=(python2 zip lib32-libffi gcc-multilib)
options=(!staticlibs)
source=(http://ftp.mozilla.org/pub/mozilla.org/js/mozjs-$pkgver.tar.bz2)
sha1sums=('ce779081cc11bd0c871c6f303fc4a0091cf4fe66')

prepare() {
  rm -rf mozjs-$pkgver/js/src/editline
  rm -rf mozjs-$pkgver/js/src/ctypes/libffi
}

build() {
  cd mozjs-$pkgver/js/src

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_LIBDIR=/usr/lib32/pkgconfig
  export AR=ar

  # FORTIFY_SOURCE causes errors
  export CFLAGS="${CFLAGS/-D_FORTIFY_SOURCE=+([0-9])/}"
  export CPPFLAGS="${CPPFLAGS/-D_FORTIFY_SOURCE=+([0-9])/}"
  export CXXFLAGS="${CXXFLAGS/-D_FORTIFY_SOURCE=+([0-9])/}"

  # there is no 32-bit nspr-config, so manual cflags and libs
  # TODO update once in a while
  ./configure --prefix=/usr \
     --target=i686-pc-linux \
     --libdir=/usr/lib32 \
     --with-nspr-cflags='-I/usr/include/nspr' \
     --with-nspr-libs='-L/usr/lib32 -lplds4 -lplc4 -lnspr4 -lpthread' \
     --with-system-ffi \
     --enable-readline \
     --enable-threadsafe

  make
}

check() {
  cd mozjs-$pkgver/js/src

  make check
}

package() {
  cd mozjs-$pkgver/js/src

  make DESTDIR="$pkgdir" install

  find "$pkgdir"/usr/{lib32/pkgconfig,include} -type f -exec chmod -x {} +

  # cleanup for lib32 package
  rm -rf "${pkgdir}"/{etc,sbin,usr/bin,usr/{include,share}}
}
