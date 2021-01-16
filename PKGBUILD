# Maintainer: ObserverOfTime <chronobserver@disroot.org>
# based on lib32-zbar

pkgname=lib32-libzbar
pkgver=0.23.1
pkgrel=1
pkgdesc="Application and library for reading bar \
codes from various sources. 32bit libraries only version"
arch=('x86_64')
url='https://github.com/mchehab/zbar'
license=('LGPL')
options=('!staticlibs')
conflicts=('lib32-zbar')
provides=("lib32-zbar=$pkgver")
depends=('zbar' 'lib32-v4l-utils' 'lib32-dbus' 'lib32-libsm' 'lib32-libxv')
makedepends=('docbook-xsl' 'xmlto')
source=("zbar-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "fix-configure.patch::$url/commit/89e7900.patch")
sha256sums=('297439f8859089d2248f55ab95b2a90bba35687975365385c87364c77fdb19f3'
            '82ac7723115d4c6aa8db6ff0e62764c310cc35f7b620413b36c4999a301216e2')

prepare() {
  cd zbar-$pkgver
  patch -Np1 -i ../fix-configure.patch
  autoreconf -vfi
}

build() {
  cd zbar-$pkgver
  export CC='gcc -m32' CXX='g++ -m32' \
         CFLAGS="$CFLAGS -DNDEBUG" \
         PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --without-imagemagick \
    --without-python \
    --without-qt \
    --without-gtk \
    --host=i686-pc-linux-gnu
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd zbar-$pkgver
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/{bin,share,include} "$pkgdir"/etc
}
