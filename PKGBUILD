# Maintainer: yadieet <yadieet@gmail.com>

pkgname=sudx
pkgver=1.1
pkgrel=2
pkgdesc="Run \`su --login <user>\` shell via dbus-run-session, useful for running GUI/X applications as another user."
url="https://github.com/yadieet/sudx"
arch=('i686' 'x86_64')
depends=('dbus' 'util-linux')
makedepends=('systemd' 'python')
license=('GPL2')
options=('strip')
ulmajver=2.28
ulminver=2
source=("https://www.kernel.org/pub/linux/utils/util-linux/v$ulmajver/util-linux-$ulmajver.$ulminver.tar."{xz,sign}
        "https://raw.githubusercontent.com/yadieet/sudx/d3f389c7daf33083fd113e6044abb2071864defe/sudx.patch")
md5sums=('46a232a37bce45371a86d19300edc47a'
         'SKIP'
         'e3498a9390d073a70b48781dcaf3a4b5')

prepare() {
  cd "util-linux-$ulmajver.$ulminver"
  patch -p1 -i ../sudx.patch
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

