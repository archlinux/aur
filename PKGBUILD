# Maintainer: Matthias Klein <matthias.klein@linux.com>

pkgname=udhcpc
pkgver=1.31.1
pkgrel=1
pkgdesc="Udhcpc is a very small DHCP client program geared towards embedded systems"
arch=(any)
url="https://www.busybox.net"
license=('GPL')
makedepends=('ncurses')
validpgpkeys=('C9E9416F76E610DBD09D040F47B70C55ACC9965B')
source=("$url/downloads/busybox-$pkgver.tar.bz2"{,.sig}
        "config::local://config"
        "default.script::local://default.script")
sha256sums=('d0f940a72f648943c1f2211e0e3117387c31d765137d92bd8284a3fb9752a998'
            'SKIP'
            'SKIP'
            'SKIP')
b2sums=('95c2345bc715eb7a1f08816a40add9b7a6176ef509a84069343ec2caddec58d8d57a07676ca2b03c209734169321433e27ba963b4c8b98dbfda4e409dcc347b4'
        'SKIP'
        'SKIP'
        'SKIP')

build() {
  cd "$srcdir/busybox-$pkgver"

  cp "$srcdir"/config .config

# uncomment to edit config ...
#  make defconfig
#  make menuconfig ; return 1

  export KCONFIG_NOTIMESTAMP=1  # reproducible build
  make
}

package() {
  cd "$srcdir/busybox-$pkgver"

  install -Dm755 busybox "$pkgdir"/usr/bin/busybox-udhcpc
  ln -s /usr/bin/busybox-udhcpc "$pkgdir"/usr/bin/udhcpc
  ln -s /usr/bin/busybox-udhcpc "$pkgdir"/usr/bin/udhcpd

  install -dm755 "$pkgdir"/usr/share/udhcpc
  install -Dm755 examples/udhcp/simple.script "$pkgdir"/etc/udhcpc.d/50default

  install -dm755 "$pkgdir"/etc/udhcpc.d
  install -Dm755 "$srcdir"/default.script "$pkgdir"/usr/share/udhcpc/default.script
}

