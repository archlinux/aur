# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>
# Submitter: Fredrik Tegenfeldt <fredrik.tegenfeldt@unige.ch>

pkgname=munge
pkgver=0.5.11
pkgrel=4
pkgdesc="An authentication service for creating and validating credentials. It is designed to be highly scalable for use in an HPC cluster environment."
arch=('i686' 'x86_64')
url="https://github.com/dun/munge/wiki"
license=('GPL3' 'LGPL3')
depends=('openssl')
optdepends=("zlib: zlib compression support"
			"bzip2: bzip2 compression support")
install=$pkgname.install
source=("https://github.com/dun/munge/archive/$pkgname-$pkgver.tar.gz"
        "arch_munge.init")
md5sums=('0b00f0a352f9619f205d41a31a2f3f80'
         '668942f323275199d35db5a534d9a80e')

build() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin  \
    --localstatedir=/var  \
    --sysconfdir=/etc

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  # install arch specific munge init and remove original one...
  rm -f $pkgdir/etc/init.d/munge
  rmdir $pkgdir/etc/init.d

  install -D -m755 ../arch_munge.init $pkgdir/etc/rc.d/munge

  # /usr/sbin is deprecated in arch, hence using /usr/bin
  sed -i 's/\/usr\/sbin/\/usr\/bin/g' $pkgdir/usr/lib/systemd/system/munge.service

  # /var/run/munge will be created in post install, see munge.install
  # because it is bad practice to put package-files in /run
  rmdir $pkgdir/var/run/munge
  rmdir $pkgdir/var/run
}
