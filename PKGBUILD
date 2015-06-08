# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=netkit-bsd-finger-ipv6
pkgver=0.17+deb15
_pkgver=${pkgver%+*}
pkgrel=1
pkgdesc="bsd-finger ported to Linux, with IPv6 and other Debian patches"
arch=(i686 x86_64)
url="ftp://ftp.linux.org.uk/pub/linux/Networking/netkit/"
license=(BSD)
provides=(netkit-bsd-finger)
conflicts=(netkit-bsd-finger)
backup=(etc/xinetd.d/finger)
source=("http://ftp.de.debian.org/debian/pool/main/b/bsd-finger/bsd-finger_${_pkgver}.orig.tar.gz"
        "http://ftp.de.debian.org/debian/pool/main/b/bsd-finger/bsd-finger_${pkgver/+deb/-}.debian.tar.bz2"
        "finger.xinetd"
        "fingerd.socket"
        "fingerd@.service"
        "LICENSE"
        "fxputc-utf8.patch")
sha256sums=('84885d668d117ef50e01c7034a45d8343d747cec6212e40e8d08151bc18e13fa'
            '8435a3a00a4066a0c7403596eec33df5e4e71eb35006dbb5a81ae7c952436777'
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
