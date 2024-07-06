# Contributor: Tom Wambold <tom5760@gmail.com>
# Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>
# Contributor: Markus Sommer <markus@splork.de>

pkgname=core
pkgver=9.1.0
pkgrel=1
pkgdesc="Common Open Research Emulator"
arch=('i686' 'x86_64')
url="https://github.com/coreemu/core/"
license=('BSD')
# 'python-certifi' should' be a dependency of 'python-pyproj',
# but the corresponding bug report seems to be orphaned
depends=('ebtables' 'ethtool' 'fabric' 'iproute2' 'nftables' 'libev' 'python'
         'python-grpcio' 'python-invoke' 'python-lxml' 'python-mako'
         'python-netaddr' 'python-pillow' 'python-protobuf' 'python-pyproj'
         'python-yaml' 'python-certifi' 'python-decorator' 'python-dulwich' 'python-keyring')
makedepends=('help2man' 'imagemagick' 'python-grpcio-tools' 'python-poetry' 'python-poetry-plugin-export'
             'python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'tk')
optdepends=('openvswitch: Open vSwitch SDN support'
            'tkimg: Thumbnail support in Tcl/Tk GUI'
            'emane: Support for heterogeneous network emulation'
            'mgen: Traffic generation')
backup=('etc/core/core.conf'
        'etc/core/logging.conf')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/coreemu/core/archive/release-$pkgver.tar.gz"
        'core-daemon.service')
sha512sums=('406951369820381692962b08a70c8c030a8ab4898d7a54e804e55f7f3f1da9ea2f17408d4601f6b9c3432cca86868ad2a45d1802baae68593f8ccda971247f0f'
            'e56f65a68804b0c7534d54fa116b53abe6922fb0aae13ee1073f76c0c7972b4832d12665d135159f7241d0f39d070ef510b4a7f05978118b6f00d737fda8dd46')

build() {
  cd "core-release-$pkgver"

  ./bootstrap.sh
  ./configure --prefix=/usr
  make

  cd daemon
  python -m build --wheel --no-isolation
}

package() {
  cd "core-release-$pkgver"
  make DESTDIR="$pkgdir/" install

  cd daemon
  python -m installer --destdir="$pkgdir" dist/*.whl

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
