# Maintainer: Graham Edgecombe <graham@grahamedgecombe.com>
# Contributor: mortzu
pkgname=netkit-rwho-debian
pkgver=0.17
pkgrel=3
_debrev=13
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="Remote who"
depends=('glibc')
url='ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/'
install=rwhod.install
backup=('etc/conf.d/rwhod')
source=(http://ftp.debian.org/debian/pool/main/n/netkit-rwho/netkit-rwho_${pkgver}.orig.tar.gz
        http://ftp.debian.org/debian/pool/main/n/netkit-rwho/netkit-rwho_${pkgver}-${_debrev}.debian.tar.gz
        rwhod.conf rwhod.service)
md5sums=('0f71620d45d472f89134ba0d74242e75'
         '82ed5a3c6b0bbf00b36508b9787963b9'
         '6f0db2a76fc465cc2e2d37dc0c4aa19d'
         'd8ff594a2235fb7a0b3328f6f2459e60')

build() {
  cd $srcdir/netkit-rwho-$pkgver

  while read patch; do
    patch -Np1 -i ../debian/patches/$patch
  done < ../debian/patches/series

  ./configure --prefix=/usr --installroot=$pkgdir
  make
}

package() {
  cd $srcdir/netkit-rwho-$pkgver

  mkdir -p $pkgdir/usr/{bin,sbin,share,man/man1,man/man8} $pkgdir/var/spool/rwho
  make install

  mv $pkgdir/usr/man $pkgdir/usr/share/man

  mv $pkgdir/usr/sbin/rwhod $pkgdir/usr/bin
  rmdir $pkgdir/usr/sbin

  install -Dm644 $srcdir/rwhod.conf $pkgdir/etc/conf.d/rwhod
  install -Dm644 $srcdir/rwhod.service $pkgdir/usr/lib/systemd/system/rwhod.service
}
