# Maintainer: yadieet <yadieet@gmail.com>

pkgname=sudx
ulmajver=2.28
ulminver=2
pkgver=$ulmajver.$ulminver
pkgrel=5
pkgdesc="Run bash shell as another user with D-Bus enabled, useful for running GUI/X applications that need D-Bus."
url="https://github.com/yadieet/sudx"
arch=('i686' 'x86_64')
depends=('bash' 'dbus' "util-linux=$ulmajver.$ulminver")
makedepends=('systemd' 'python')
license=('GPL2')
options=('strip')
gcid=319ac198ba5338b37fc5bb36a0c81ae214859c07

source=("https://www.kernel.org/pub/linux/utils/util-linux/v$ulmajver/util-linux-$ulmajver.$ulminver.tar.xz"
        "sudx-$pkgver-$pkgrel.c::https://raw.githubusercontent.com/yadieet/sudx/$gcid/sudx.c")
md5sums=('46a232a37bce45371a86d19300edc47a'
         '42b298d1fbb4218ce693a46db6bf48ee')

prepare() {
  cd "util-linux-$ulmajver.$ulminver"
  #patch -p0 -i ../sudx-$pkgver.patch
  cp ../sudx-$pkgver-$pkgrel.c login-utils/su.c
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

