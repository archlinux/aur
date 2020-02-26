# Maintainer: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=core-git
pkgver=r2075.177f2737
pkgrel=1
pkgdesc="Common Open Research Emulator"
arch=('any')
url="https://github.com/coreemu/core/"
license=('BSD')
depends=('bridge-utils' 'ebtables' 'ethtool' 'fabric' 'iproute2' 'libev'
  'openvswitch' 'procps-ng' 'python3' 'python-future' 'python-grpcio'
  'python-lxml' 'python-mako' 'python-netaddr' 'python-pillow' 'python-yaml'
  'tkimg' 'util-linux' 'xterm')
makedepends=('help2man' 'imagemagick' 'python-sphinx' 'python-grpcio-tools'
  'openvswitch' 'git')
optdepends=('openvswitch: Open vSwitch support')
backup=('etc/core/core.conf')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('core::git+https://github.com/coreemu/core#branch=develop')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# Git, no tags available
	# Sometimes develop and master are not synced.
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./bootstrap.sh
	./configure --prefix=/usr --with-startup=systemd
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
