# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=netkit-bsd-finger-ipv6
pkgver=0.17+deb17
_pkgver=${pkgver%+*}
pkgrel=1
pkgdesc="bsd-finger ported to Linux, with IPv6 and other Debian patches"
arch=(i686 x86_64)
url="ftp://ftp.linux.org.uk/pub/linux/Networking/netkit/"
license=(BSD)
provides=(netkit-bsd-finger)
conflicts=(netkit-bsd-finger)
backup=(etc/xinetd.d/finger)
source=("http://ftp.de.debian.org/debian/pool/main/b/bsd-finger/bsd-finger_${_pkgver}.orig.tar.bz2"
        "http://ftp.de.debian.org/debian/pool/main/b/bsd-finger/bsd-finger_${pkgver/+deb/-}.debian.tar.xz"
        "finger.xinetd"
        "fingerd.socket"
        "fingerd@.service"
        "LICENSE"
        "fxputc-utf8.patch")
md5sums=('99ef35e79cad0d941d860a10498420fd'
         '1fb6da7103b1d59b9b5d408b7978c0db'
         'f6e07ede6acab481051f7bf51ce1fe8e'
         '03675e125705fe7ca1424d7d0514e8d8'
         '538dc00efa569de9fa36ca04a0880b62'
         '5fc568418a0379fc3a358ed1c2523b44'
         'ceb45b74b0a98a4b5dd2b143d69e88bc')
sha256sums=('28b34d605d23ea687d79e0fc48c035abe80f88d9c1547e7aa46796d1081c0363'
            '3d8cbc2127d99915e474137cebce08bda0f4bd13d57a4916d1a455dab10cce3c'
            'ce8e90ac9e149e6696fe67766adc19c6f8973515ecafe9f3432f6588c064980d'
            'e0d2febdfa1240893d88d7795f329cc8f3354a679c35e973c31d26970b9b095c'
            '2c3e0f45ecea483b129288be96e17f5f45199d24611e8027ca29e13758fd68d3'
            '3774a4bb6207edc124838915911bd139a78312336876a9fe59700216dfeb54b4'
            '218ea0000348149ef6a7a9577b7688a32169cb2f57f297fe8218aef042cae0e4')

prepare() {
  cd "bsd-finger-${_pkgver}"

  while read -r file; do
     patch -p1 < "../debian/patches/$file"
  done < "../debian/patches/series"

  patch -p1 < "../fxputc-utf8.patch"

  sed -i 's@include <sys/time.h>@include <time.h>@' finger/lprint.c
  sed -i 's@include <sys/time.h>@include <time.h>@' finger/sprint.c
}

build() {
  cd "bsd-finger-${_pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "bsd-finger-${_pkgver}"

  install -d "$pkgdir"/usr/{bin,share/man/{man1,man8}}
  make INSTALLROOT="$pkgdir" SBINDIR=/usr/bin MANDIR=/usr/share/man install

  cd "$srcdir"
  install -Dm0644 LICENSE          "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 fingerd.socket   "$pkgdir/usr/lib/systemd/system/fingerd.socket"
  install -Dm0644 fingerd@.service "$pkgdir/usr/lib/systemd/system/fingerd@.service"
  install -Dm0644 finger.xinetd    "$pkgdir/etc/xinetd.d/finger"
}

# vim: ft=sh:ts=2:sw=2:et
