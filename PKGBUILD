# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=lib32-speex
pkgver=1.2.1
pkgrel=1
pkgdesc="A free codec for free speech (32-bit)"
url="https://www.speex.org/"
arch=(x86_64)
license=(BSD)
depends=(lib32-gcc-libs speex)
makedepends=(git)
_commit=5dceaaf3e23ee7fd17c80cb5f02a838fd6c18e01  # tags/Speex-1.2.1^0
source=("git+https://gitlab.xiph.org/xiph/speex.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd speex
  git describe --tags | sed 's/^Speex-//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd speex
  ./autogen.sh
}

build() {
  export CC="gcc -m32"
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  cd speex
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-binaries \
    --libdir=/usr/lib32 \
    --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd speex
  make -k check
}

package() {
  provides+=(libspeex.so)

  cd speex
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/{include,share}
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
}
