# Maintainer: Tom Wambold <tom5760@gmail.com>
pkgname=core
pkgver=5.5.2
pkgrel=1
pkgdesc="Common Open Research Emulator"
arch=('i686' 'x86_64')
url="https://github.com/coreemu/core/"
license=('BSD')
depends=('bridge-utils' 'ebtables' 'ethtool' 'iproute2' 'libev' 'openvswitch'
  'procps-ng' 'python3' 'python-future' 'python-grpcio' 'python-lxml' 'tkimg'
  'util-linux' 'xterm')
makedepends=('help2man' 'imagemagick' 'python-sphinx' 'python-grpcio-tools'
  'openvswitch')
optdepends=('openvswitch: Open vSwitch support')
backup=('etc/core/core.conf')
source=("https://github.com/coreemu/core/archive/release-$pkgver.tar.gz"
        'python-lib-dir.patch'
        'systemd-service-dir.patch')
md5sums=('15414de3e9a43664c86894aca039a6a7'
         'e3ce4e27688f93a07a0388c93aab2a5a'
         '43189fc4c5eff0bfbf0464c407a15bec')

prepare() {
  cd "$srcdir/core-release-$pkgver"

  patch -p1 < "$srcdir/python-lib-dir.patch"
  patch -p1 < "$srcdir/systemd-service-dir.patch"
}

build() {
  cd "$srcdir/core-release-$pkgver"

  ./bootstrap.sh
  ./configure              \
    --prefix=/usr          \
    --with-startup=systemd \
    --enable-python3       \
    --enable-docs
  make
}

package() {
  cd "$srcdir/core-release-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
