# Maintainer: caier <kosmoziemia at gmail dot com>
# Contributor: Tom Wambold <tom5760@gmail.com>
# Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>
# Contributor: Markus Sommer <markus@splork.de>

pkgname=core
pkgver=9.2.1
pkgrel=1
pkgdesc="Tool for building virtual network simulations"
arch=('i686' 'x86_64')
url="https://github.com/coreemu/core/"
license=('BSD-2-Clause')
depends=('ethtool' 'fabric' 'iproute2' 'nftables' 'procps' 'libev' 'python'
         'python-grpcio' 'python-invoke' 'python-lxml' 'python-mako'
         'python-netaddr' 'python-pillow' 'python-protobuf' 'python-pyproj'
         'python-yaml')
makedepends=('help2man' 'imagemagick' 'python-grpcio-tools' 'python-poetry' 'python-poetry-plugin-export'
             'python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'tk')
optdepends=('openvswitch: Open vSwitch SDN support'
            'tkimg: Thumbnail support in Tcl/Tk GUI'
            'emane: Support for heterogeneous network emulation'
            'mgen: Traffic generation')
backup=('opt/core/etc/core.conf'
        'opt/core/etc/logging.conf')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/coreemu/core/archive/release-$pkgver.tar.gz"
        'core-daemon.service')
sha512sums=('01a70444638b6f620cc6da1b484dbf21e6dce301e210517d02859baa0333975036f81b879d3663d0e817545f37c2722e737e3407b82c8b5ae6e68a5f6a3ac7e6'
            'e56f65a68804b0c7534d54fa116b53abe6922fb0aae13ee1073f76c0c7972b4832d12665d135159f7241d0f39d070ef510b4a7f05978118b6f00d737fda8dd46')

build() {
  cd "core-release-$pkgver"

  ./bootstrap.sh
  python -m venv --system-site-packages venv
  ./configure --prefix=/usr
  make

  cd daemon
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "core-release-$pkgver"
  make DESTDIR="$pkgdir/" install

  cd daemon
  python -m installer --destdir="$pkgdir" dist/*.whl

  cd ..
  mkdir -p "$pkgdir/opt/core"
  cp -a "package/share" "$pkgdir/opt/core"
  cp -a "package/etc" "$pkgdir/opt/core/"
  install -D -m 0644 "$srcdir/core-daemon.service" "$pkgdir/usr/lib/systemd/system/core-daemon.service"
  install -D -m 0644 "$srcdir/core-release-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
