# Maintainer: Tom Wambold <tom5760@gmail.com>
# Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=core
pkgver=7.4.0
pkgrel=1
pkgdesc="Common Open Research Emulator"
arch=('i686' 'x86_64')
url="https://github.com/coreemu/core/"
license=('BSD')
depends=('ebtables' 'ethtool' 'fabric' 'iproute2' 'libev' 'python'
         'python-grpcio' 'python-invoke' 'python-lxml' 'python-mako'
         'python-netaddr' 'python-pillow' 'python-protobuf' 'python-pyproj'
         'python-yaml')
makedepends=('help2man' 'imagemagick' 'python-dephell' 'python-grpcio-tools'
             'python-setuptools')
optdepends=('openvswitch: Open vSwitch SDN support'
            'tkimg: Thumbnail support in Tcl/Tk GUI')
backup=('etc/core/core.conf')
source=("https://github.com/coreemu/core/archive/release-$pkgver.tar.gz"
        'core-daemon.service')
md5sums=('d1f787d4b4de529faa0ff42be0804fad'
         '91be51f861a0e166c643a885d1bf1eba')

prepare() {
  cd "$srcdir/core-release-$pkgver/daemon"

  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "$srcdir/core-release-$pkgver"

  ./bootstrap.sh
  ./configure --prefix=/usr
  make

  cd daemon
  python setup.py build
}

package() {
  cd "$srcdir/core-release-$pkgver"
  make DESTDIR="$pkgdir/" install

  cd daemon
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  mkdir -p "$pkgdir/usr/bin"
  cp -r scripts/* "$pkgdir/usr/bin"

  mkdir -p "$pkgdir/usr/share/core"
  cp -r examples "$pkgdir/usr/share/core"

  mkdir -p "$pkgdir/etc/core"
  cp data/core.conf data/logging.conf "$pkgdir/etc/core"

  mkdir -p "$pkgdir/usr/lib/systemd/system"
  cp "$srcdir/core-daemon.service" "$pkgdir/usr/lib/systemd/system"
}

# vim:set ts=2 sw=2 et:
