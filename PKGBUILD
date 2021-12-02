# Maintainer: Tom Wambold <tom5760@gmail.com>
# Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>
# Contributor: Markus Sommer <markus@splork.de>
pkgname=core
pkgver=7.5.2
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
            'tkimg: Thumbnail support in Tcl/Tk GUI'
            'emane: Support for heterogeneous network emulation')
backup=('etc/core/core.conf'
        'etc/core/logging.conf')
source=("https://github.com/coreemu/core/archive/release-$pkgver.tar.gz"
        'core-daemon.service')
sha512sums=('27ee22b7cb03411b5d9a2bc96d5dc28abc5b200756ae32a71ac725a34c822e5caa4c5656281b5959a0a7e7a399e3e55a677ce716b5ede3b39adbf50d212338b1'
            'e56f65a68804b0c7534d54fa116b53abe6922fb0aae13ee1073f76c0c7972b4832d12665d135159f7241d0f39d070ef510b4a7f05978118b6f00d737fda8dd46')

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

  install -D -m 0644 "data/core.conf" "$pkgdir/etc/core/core.conf"
  install -D -m 0644 "data/logging.conf" "$pkgdir/etc/core/logging.conf"
  install -D -m 0644 "$srcdir/core-daemon.service" "$pkgdir/usr/lib/systemd/system/core-daemon.service"
  install -D -m 0644 "$srcdir/core-release-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
