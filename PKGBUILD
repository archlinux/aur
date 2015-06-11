# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>
# Submitter: Fredrik Tegenfeldt <fredrik.tegenfeldt@unige.ch>

pkgname=munge
pkgver=0.5.11
pkgrel=4
pkgdesc="An authentication service for creating and validating credentials. It is designed to be highly scalable for use in an HPC cluster environment."
arch=('i686' 'x86_64')
url="http://code.google.com/p/munge/"
license=('GPL3' 'LGPL3')
depends=('openssl')
optdepends=("zlib: zlib compression support"
			"bzip2: bzip2 compression support")
install=$pkgname.install
source=("http://munge.googlecode.com/files/$pkgname-$pkgver.tar.bz2"
        "arch_munge.init"
        "munged-tmpfiles.conf")
md5sums=('bd8fca8d5f4c1fcbef1816482d49ee01'
         '668942f323275199d35db5a534d9a80e'
         'b6e6a73c8a678777645ffcdb4b3e9d27')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin  \
    --localstatedir=/var  \
    --sysconfdir=/etc

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  # install arch specific munge init and remove original one...
  rm -f $pkgdir/etc/init.d/munge
  rmdir $pkgdir/etc/init.d

  install -D -m755 ../arch_munge.init $pkgdir/etc/rc.d/munge
  install -D -m644 ../munged-tmpfiles.conf $pkgdir/etc/tmpfiles.d/munged-tmpfiles.conf

  # /usr/sbin is deprecated in arch, hence using /usr/bin
  sed -i 's/\/usr\/sbin/\/usr\/bin/g' $pkgdir/usr/lib/systemd/system/munge.service

  # /var/run/munge will be created in post install, see munge.install
  # because it is bad practice to put package-files in /run
  rmdir $pkgdir/var/run/munge
  rmdir $pkgdir/var/run
}
