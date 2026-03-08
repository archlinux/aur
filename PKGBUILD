# Maintainer: gluttony3 <kaminskijbogdan39 at gmail dot com>
pkgname=proton-vpn-daemon-openrc
pkgver=0.13.5
pkgrel=1
pkgdesc="Proton VPN Daemon (OpenRC init script, no systemd)"
arch=('x86_64')
url="https://github.com/ProtonVPN/proton-vpn-daemon"
license=('GPL-3.0-only')
depends=(
  'python'
  'dbus'
  'python-bcc'
  'python-dbus-fast'
  'python-psutil'
  'python-packaging'
  'wireguard-tools'
  'python-proton-vpn-api-core'
  'openrc'
)
makedepends=('python-setuptools')
provides=('proton-vpn-daemon')
conflicts=('proton-vpn-daemon')
install=proton-vpn-daemon-openrc.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/ProtonVPN/proton-vpn-daemon/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/proton-vpn-daemon-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/proton-vpn-daemon-$pkgver"
  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1 --skip-build

  install -Dm644 rpmbuild/SOURCES/dbus.conf \
    "$pkgdir/etc/dbus-1/system.d/me.proton.vpn.split_tunneling.conf"

  install -Dm644 rpmbuild/SOURCES/dbus.service \
    "$pkgdir/etc/dbus-1/system-services/me.proton.vpn.split_tunneling.service"

  install -Dm755 rpmbuild/SOURCES/proton-vpn-daemon.initd \
    "$pkgdir/etc/init.d/proton-vpn-daemon"
}
