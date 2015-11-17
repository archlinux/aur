# $Id: PKGBUILD 135190 2015-06-11 12:46:45Z fyan $
# Maintainer: maz-1 <ohmygod19993 at gmail dot com>
# Contributor: Cedric Girard <girard.cedric@gmail.com>

pkgname=proxychains-ng-multilib
pkgver=4.10
pkgrel=1
pkgdesc="A hook preloader that allows to redirect TCP traffic of existing dynamically linked programs through one or more SOCKS or HTTP proxies. Multilib version."
arch=('x86_64')
url="https://github.com/rofl0r/proxychains"
license=('GPL')
provides=('proxychains' 'proxychains-ng')
replaces=('proxychains' 'proxychains-ng')
conflicts=('proxychains')
depends=('glibc' 'lib32-glibc')
makedepends=('gcc-multilib')
backup=('etc/proxychains.conf')
source=("http://downloads.sourceforge.net/project/$pkgname/proxychains-$pkgver.tar.bz2" "multilib.patch")
md5sums=('19442655ea290b18dcccf30fc4ae3e74' 'SKIP')

prepare() {
  cd $srcdir/proxychains-$pkgver
  #patch -p1 -i $srcdir/multilib.patch
  cp -r $srcdir/proxychains-$pkgver $srcdir/build-32
  cp -r $srcdir/proxychains-$pkgver $srcdir/build-64
}

build() {
  
  cd $srcdir/build-32
  CFLAGS="-m32" LDFLAGS="-m32" ./configure --prefix=/usr --sysconfdir=/etc
  make
  
  cd $srcdir/build-64
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $srcdir/build-64
  make DESTDIR="$pkgdir/" install
  make DESTDIR="$pkgdir/" install-config
  ln -s proxychains4 "$pkgdir/usr/bin/proxychains"
  cd $srcdir/build-32
  install -Dm755 libproxychains4.so "$pkgdir/usr/lib32/libproxychains4.so"
}

# vim:set ts=2 sw=2 et:
