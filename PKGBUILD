# Maintainer Brian Bidulock <bidulock@openss7.org>

pkgname=coda
pkgver=7.1.1
pkgrel=1
pkgdesc="A distributed file system with disconnected operation."
depends=('bash' 'perl')
arch=(i686 x86_64 armv7h)
url="http://coda.cs.cmu.edu/"
source=("http://coda.cs.cmu.edu/coda/source/$pkgname-$pkgver.tar.xz")
sha512sums=('ad7ae62f586b4a459c185b1def8b7ba6300a9b3e110c28879815fb4d6168b30823b808efa2c559e78790063d0580ca7e9ddeb72c83a3467e1397755dc57ed156')
license=("GPL")

prepare() {
  cd $pkgname-$pkgver
  for f in al/pdbtool.c al/pdbtool.8 al/pdb.h al/Makefile.am auth2/passwd.coda.5 scripts/vice-setup-user.in ; do
    sed -i -e 's,pdbtool,cpdbtool,g' coda-src/$f
    sed -i -e 's,PDBTOOL,CPDBTOOL,g' coda-src/$f
  done
  mv coda-src/al/pdbtool.c coda-src/al/cpdbtool.c
  mv coda-src/al/pdbtool.8 coda-src/al/cpdbtool.8
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
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed,-pie\0/g' libtool
  make V=1
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}
