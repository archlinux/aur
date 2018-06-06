# Maintainer: Tom Wambold <tom5760@gmail.com>
pkgname=core
pkgver=5.1
pkgrel=1
pkgdesc="Common Open Research Emulator"
arch=('i686' 'x86_64')
url="https://github.com/coreemu/core/"
license=('BSD')
depends=('libev' 'ebtables' 'iproute2' 'python2' 'python2-enum34'
         'bridge-utils' 'tkimg' 'xterm')
makedepends=('help2man' 'imagemagick' 'python2-sphinx' 'openvswitch')
conflicts=('core-svn')
backup=('etc/core/core.conf' 'etc/core/perflogserver.conf')
source=("https://github.com/coreemu/core/archive/release-$pkgver.tar.gz"
        'sphinx-apidoc2.patch')
md5sums=('ff100baf762170d1e8f124b9493b98f5'
         'a636bfcf4865709855079f3053504dda')

build() {
  cd "$srcdir/core-release-$pkgver"

  patch -p1 < ../sphinx-apidoc2.patch

  ./bootstrap.sh
  ./configure CFLAGS=-fno-strict-aliasing PYTHON=/usr/bin/python2 --prefix=/usr
  make
}

package() {
  cd "$srcdir/core-release-$pkgver"
  make DESTDIR="$pkgdir/" install

  rm "$pkgdir/etc/init.d/core-daemon"
  rmdir "$pkgdir/etc/init.d"

  install -D "$srcdir/core-release-$pkgver/scripts/core-daemon.service" "$pkgdir/usr/lib/systemd/system/core-daemon.service"
}

# vim:set ts=2 sw=2 et:
