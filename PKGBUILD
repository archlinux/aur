# Maintainer Brian Bidulock <bidulock@openss7.org>

pkgname=coda
pkgver=8.1.3
pkgrel=1
pkgdesc="A distributed file system with disconnected operation."
depends=('bash' 'perl' 'python' 'python-attrs' 'python-setuptools')
arch=(i686 x86_64 armv7h)
url="http://coda.cs.cmu.edu/"
source=("http://coda.cs.cmu.edu/coda/source/$pkgname-$pkgver.tar.xz")
sha512sums=('04bae335d4a85e0b0ba5a5577a4c4b424e7ceb0b5f1a7d9346bbae6876b12ebdb53408eeee43d520051df74bc6187c91f1906d569172e60a6e83b6ae16eefde2')
license=("GPL")

prepare() {
  cd $pkgname-$pkgver
  sed -i -e 's,^LDFLAGS=,,' lib-src/rpc2/rp2gen/Makefile.am
  ./bootstrap.sh
}

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libdir=/usr/lib \
    --datadir=/usr/share \
    --includedir=/usr/include \
    --enable-client \
    --enable-server
  sed -i -e 's/ -shared / -Wl,-O1,--sort-common,--as-needed,-pie,-z,relro,-z,now \0/g' libtool
  make V=1
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}
