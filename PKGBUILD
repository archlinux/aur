# Maintainer: yadieet <yadieet@gmail.com>

pkgname=sudx
pkgver=1.5
pkgrel=1
pkgdesc="Run bash shell as another user with D-Bus enabled, useful for running GUI/X applications that need D-Bus."
url="https://github.com/yadieet/sudx"
arch=('i686' 'x86_64')
ulmajver=2.28
ulminver=2
depends=('bash' 'dbus' "util-linux=$ulmajver.$ulminver")
makedepends=('systemd' 'python')
license=('GPL2')
options=('strip')
gcid=95c3f1d0ec5e83ee0e22bc8bd7304f88047f1661

source=("https://www.kernel.org/pub/linux/utils/util-linux/v$ulmajver/util-linux-$ulmajver.$ulminver.tar.xz"
        "sudx-$pkgver.c::https://raw.githubusercontent.com/yadieet/sudx/$gcid/sudx.c")
md5sums=('46a232a37bce45371a86d19300edc47a'
         '69d9d1566581a3acd9b14b360f843fae')

prepare() {
  cd "util-linux-$ulmajver.$ulminver"
  cp ../sudx-$pkgver.c login-utils/su.c
}

build() {
  cd "util-linux-$ulmajver.$ulminver"
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
              --enable-libmount-force-mountinfo \
              --with-python=3
  make su
}

package() {
  cd "util-linux-$ulmajver.$ulminver"
  install -D -m4755 su ${pkgdir}/usr/bin/sudx
}

