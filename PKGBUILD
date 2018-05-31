# Maintainer: Graham Edgecombe <gpe@grahamedgecombe.com>
# Contributor: mortzu
pkgname=netkit-rwho-debian
pkgver=0.17
pkgrel=6
_debrev=13
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('BSD')
pkgdesc='Remote who client and server (with Debian patches)'
depends=('glibc' 'sh')
optdepends=('cron: to periodically delete old /var/spool/rwho files'
            'systemd: to run the rwhod daemon')
url='http://packages.qa.debian.org/n/netkit-rwho.html'
install=rwhod.install
backup=('etc/conf.d/rwhod')
source=(http://ftp.debian.org/debian/pool/main/n/netkit-rwho/netkit-rwho_${pkgver}.orig.tar.gz
        http://ftp.debian.org/debian/pool/main/n/netkit-rwho/netkit-rwho_${pkgver}-${_debrev}.debian.tar.gz
        rwhod.conf rwhod.service rwhod.cron)
sha256sums=('0409e2ce4bfdb2dacb2c193d0fedfc49bb975cb057c5c6b0ffcca603a1188da7'
            '53aefa27d98b565bf756db57120c03bd224a238e45699d92076420272a6eba8e'
            '3ad57b0f1ec2f05084df0d2e33fd7605b8c1af5c4330e519b1defcd0ef334a3c'
            'dd73567ee4b9f44096fc3c763d8cbd6b454d05c05bfe50d9a2a966336f1197c1'
            'f76bc6481d81a1d2510a410915b946c44eebdce12d6c3b5f2869634b10372ed8')

build() {
  cd "$srcdir/netkit-rwho-$pkgver"

  while read patch; do
    patch -Np1 -i "../debian/patches/$patch"
  done < ../debian/patches/series

  ./configure --prefix=/usr --installroot="$pkgdir"
  make
}

package() {
  cd "$srcdir/netkit-rwho-$pkgver"

  mkdir -p "$pkgdir/usr/"{bin,sbin,share,man/man1,man/man8} "$pkgdir/var/spool/rwho"
  make install

  mv "$pkgdir/usr/man" "$pkgdir/usr/share/man"

  mv "$pkgdir/usr/sbin/rwhod" "$pkgdir/usr/bin"
  rmdir "$pkgdir/usr/sbin"

  install -Dm644 "$srcdir/debian/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/rwhod.conf" "$pkgdir/etc/conf.d/rwhod"
  install -Dm644 "$srcdir/rwhod.service" "$pkgdir/usr/lib/systemd/system/rwhod.service"
  install -D "$srcdir/rwhod.cron" "$pkgdir/etc/cron.monthly/rwhod"
}
