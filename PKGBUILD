# $Id: PKGBUILD 198476 2013-10-30 15:05:50Z allan $
# Contributor: Sergej Pupykin
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=vde2-static
pkgver=2.3.2
pkgrel=7
pkgdesc="Virtual Distributed Ethernet for emulators like qemu"
url="http://sourceforge.net/projects/vde/"
license=("GPL" "LGPL" "CUSTOM")
arch=('i686' 'x86_64')
depends=('bash' 'libpcap' 'openssl')
makedepends=('python')
options=(!makeflags 'staticlibs' '!emptydirs')
source=(http://downloads.sourceforge.net/vde/vde2-$pkgver.tar.bz2
        vde_cryptcab-compile-against-openssl-1.1.0.patch)
sha256sums=('cbea9b7e03097f87a6b5e98b07890d2275848f1fe4b9fcda77b8994148bc9542'
            '110370a5f48f1e241d43f8bb5e3ea6d2ca7d2c1949e1cf672d03bfc897f2e11f')

prepare() {
  cd "$srcdir"/vde2-$pkgver
  patch -Np1 -i ../vde_cryptcab-compile-against-openssl-1.1.0.patch
}

build() {
  cd "$srcdir"/vde2-$pkgver
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --libexecdir=/usr/lib/vde2 \
             --enable-experimental
  make
}

package() {
  cd "$srcdir"/vde2-$pkgver
  make prefix=$pkgdir/usr sysconfdir=$pkgdir/etc sbindir=$pkgdir/usr/bin libexecdir=$pkgdir/usr/lib/vde2 install
  install -D -m 644 COPYING.slirpvde $pkgdir/usr/share/licenses/$pkgname/COPYING.slirpvde
  find $pkgdir -type f -or -type l | grep -vE '.a$' | while read a; do rm -f $a; done
}
