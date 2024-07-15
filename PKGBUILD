# Maintainer: Kim Scarborough <kim@scarborough.kim>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Graham Edgecombe <gpe@grahamedgecombe.com>
# Contributor: mortzu
pkgname=netkit-rwho-debian
pkgver=0.17
pkgrel=10
_debrev=15
arch=('i686' 'x86_64' 'arm' 'aarch64')
license=('BSD-4-Clause-UC')
depends=('glibc')
optdepends=(
	'systemd: to run daemon, and optionally delete old /var/spool/rwho files monthly'
	'cron: alternate way to monthly delete old /var/spool/rwho files'
	'bash: to execute cron script'
)
pkgdesc='Remote who client and server (with Debian patches)'
url='https://tracker.debian.org/pkg/netkit-rwho'
backup=('etc/conf.d/rwhod')
source=(
	https://ftp.debian.org/debian/pool/main/n/netkit-rwho/netkit-rwho_${pkgver}.orig.tar.gz
        https://ftp.debian.org/debian/pool/main/n/netkit-rwho/netkit-rwho_${pkgver}-${_debrev}.debian.tar.xz
        rwhod.conf 
	rwhod.service 
	rwhod-purge.cron
	rwhod-purge.service
	rwhod-purge.timer
	rwhod.sysusers
	rwhod.sysdir
)

sha256sums=(
	'0409e2ce4bfdb2dacb2c193d0fedfc49bb975cb057c5c6b0ffcca603a1188da7'
	'b5d47f5bf9eb68290881020ef0c6b38e8444e67c5eb1db9877f136495886b02d'
	'3ad57b0f1ec2f05084df0d2e33fd7605b8c1af5c4330e519b1defcd0ef334a3c'
	'dd73567ee4b9f44096fc3c763d8cbd6b454d05c05bfe50d9a2a966336f1197c1'
	'd4d9766dd6aeb9e362f9bf14dec2aaa2cd976918ba607eb6fcc969693c93ece9'
	'75577158b804b17b1aec4454d1f8e0818dc75ea7ee6b96cf6a8008acc5cba19d'
	'c1622fe4c88aebd4aa52aad247476388374a5f02ae1533023c9312505eef1600'
	'3508a6744e1fc2e0dbf907aef1834c20e22d080cfe505db4faa4905e349a090a'
	'fd7814093c9abae5eaaf3eeceb7331198436d7881cff4b909f6364f4877d83ae'
)

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
  install -m644 "$srcdir/rwhod-purge.service" "$pkgdir/usr/lib/systemd/system/rwhod-purge.service"
  install -m644 "$srcdir/rwhod-purge.timer" "$pkgdir/usr/lib/systemd/system/rwhod-purge.timer"
  install -D "$srcdir/rwhod-purge.cron" "$pkgdir/usr/share/$pkgname/rwhod-purge.cron"
  install -Dm644 "$srcdir/rwhod.sysusers" "$pkgdir/usr/lib/sysusers.d/rwhod.conf"
  install -Dm644 "$srcdir/rwhod.sysdir" "$pkgdir/usr/lib/tmpfiles.d/rwhod.conf"
}

