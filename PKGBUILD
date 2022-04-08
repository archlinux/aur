# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: tobias <tobias@archlinux.net>
# Contributor: Ray Rashif <schivmeister@gmail.com>
# Contributor: Robert Emil Berge <robert@rebi.no>

_name=jack
pkgname=lib32-jack
pkgver=0.126.0
pkgrel=1
pkgdesc="A low-latency audio server (32-bit)"
arch=(x86_64)
url="http://jackaudio.org/"
license=(GPL LGPL)
depends=(jack=$pkgver lib32-alsa-lib lib32-db lib32-celt lib32-gcc-libs lib32-glibc)
makedepends=(git lib32-libsamplerate lib32-readline)
conflicts=(lib32-jack2)
provides=(libjack.so libjackserver.so)
source=(
  $_name::git+https://github.com/jackaudio/${_name}1.git#tag=$pkgver?signed
  git+https://github.com/jackaudio/headers
)
sha512sums=('SKIP'
            'SKIP')
validpgpkeys=('62B11043D2F6EB6672D93103CDBAA37ABC74FBA0') # falkTX <falktx@falktx.com>

prepare() {
  cd $_name
  git submodule init
  git config submodule.jack.url "${srcdir}/headers"
  git submodule update

  autoreconf -fiv
}

build() {
  cd $_name

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr --libdir=/usr/lib32
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  depends+=(libasound.so libcelt0.so libsamplerate.so)
  make DESTDIR="$pkgdir" install-pkgconfigDATA -C $_name
  make DESTDIR="$pkgdir" install -C $_name
  rm -frv "$pkgdir/usr/"{bin,include,share}
}

# vim:set ts=2 sw=2 et:
