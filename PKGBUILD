# Maintainer: yadieet <yadieet@gmail.com>

pkgname=sudx
ulmajver=2.30
ulver=$ulmajver.1
pkgver=$ulver
pkgrel=1
pkgdesc="Run bash shell as another user with D-Bus enabled, useful for running GUI/X applications that need D-Bus."
url="https://github.com/yadieet/sudx"
arch=('i686' 'x86_64')
depends=('bash' 'dbus' "util-linux=$ulver")
makedepends=('systemd' 'python')
license=('GPL2')
options=('strip')
gcid=eab6f8a1fea25fa2ffc4ecc601b0c1f6df24e9fe

source=("https://www.kernel.org/pub/linux/utils/util-linux/v$ulmajver/util-linux-$ulver.tar.xz"
        "sudx-$pkgver-$pkgrel.c::https://raw.githubusercontent.com/yadieet/sudx/$gcid/sudx.c")
md5sums=('5e5ec141e775efe36f640e62f3f8cd0d'
         'a30a28ae0a6dec9a9636573e5340df8c')

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

