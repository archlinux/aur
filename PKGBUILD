# Maintainer: Joe Sedutto <joe@millyardlabs.com>

pkgname=rshim-git
pkgver=2.8.2.r6.gd4158f5
pkgrel=1
pkgdesc="User-space RSHIM driver for Mellanox BlueField SoC"
arch=('x86_64' 'aarch64')
url="https://github.com/Mellanox/rshim-user-space"
license=('GPL-2.0-only OR BSD-3-Clause')
depends=('fuse2' 'gcc-libs' 'glibc' 'libusb' 'pciutils' 'perl' 'python' 'systemd-libs')
makedepends=('git')
provides=('rshim')
conflicts=('rshim')
backup=('etc/rshim.conf')
source=("git+https://github.com/Mellanox/rshim-user-space.git")
sha256sums=('SKIP')

pkgver() {
  cd rshim-user-space
  git describe --long --tags --abbrev=7 | sed 's/^rshim-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd rshim-user-space
  ./bootstrap.sh
}

build() {
  cd rshim-user-space
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --with-systemdsystemunitdir=/usr/lib/systemd/system
  make
}

package() {
  cd rshim-user-space
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Arch installs sbin programs into /usr/bin
  sed -i 's|/usr/sbin/rshim|/usr/bin/rshim|' \
    "$pkgdir/usr/lib/systemd/system/rshim.service"

  # Package-provided .link files belong under /usr/lib
  install -d "$pkgdir/usr/lib/systemd/network"
  mv "$pkgdir/etc/systemd/network/10-tmfifo-net.link" \
    "$pkgdir/usr/lib/systemd/network/"
  rmdir -p --ignore-fail-on-non-empty "$pkgdir/etc/systemd/network"
}
