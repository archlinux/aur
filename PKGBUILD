# Maintainer: yadieet <yadieet@gmail.com>

pkgname=sudx
ulmajver=2.29
ulver=$ulmajver.2
pkgver=$ulver
pkgrel=1
pkgdesc="Run bash shell as another user with D-Bus enabled, useful for running GUI/X applications that need D-Bus."
url="https://github.com/yadieet/sudx"
arch=('i686' 'x86_64')
depends=('bash' 'dbus' "util-linux=$ulver")
makedepends=('systemd' 'python')
license=('GPL2')
options=('strip')
gcid=7d82bc93255f9192760162ecc3d04ac6e79f91d1

source=("https://www.kernel.org/pub/linux/utils/util-linux/v$ulmajver/util-linux-$ulver.tar.xz"
        "sudx-$pkgver-$pkgrel.c::https://raw.githubusercontent.com/yadieet/sudx/$gcid/sudx.c")
md5sums=('63c40c2068fcbb7e1d5c1d281115d973'
         '7b1578ae9add076c5301acd4085c6f23')

prepare() {
  cd "util-linux-$ulver"
  cp ../sudx-$pkgver-$pkgrel.c login-utils/su.c
}

build() {
  cd "util-linux-$ulver"
  ./configure --prefix=/usr \
              --libdir=/usr/lib \
              --bindir=/usr/bin \
              --localstatedir=/run \
              --enable-fs-paths-extra=/usr/bin \
              --enable-raw \
              --enable-vipw \
              --enable-newgrp \
              --enable-chfn-chsh \
              --enable-write \
              --enable-mesg \
              --with-python=3
  make su
}

package() {
  cd "util-linux-$ulver"
  install -D -m4755 su ${pkgdir}/usr/bin/sudx
}

