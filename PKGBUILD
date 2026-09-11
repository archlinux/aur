# Maintainer: Joe Sedutto <joe@millyardlabs.com>
# Contributor: Doridian <archlinux@doridian.net>

pkgname=rshim-git
pkgver=2.8.2.r10.ga66ae2f
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
source=(
  "git+https://github.com/Mellanox/rshim-user-space.git"
  # Drop when https://github.com/Mellanox/rshim-user-space/pull/363 gets merged
  "fix-console-handling.patch::https://github.com/Mellanox/rshim-user-space/commit/28f4fb2781058fdc271986e91e0996fcce3aaaef.patch"
)
sha256sums=(
  'SKIP'
  '189588932529e550f09934c7f4908b08f302ff180186488cd9aa092f727f0716'
)

pkgver() {
  cd rshim-user-space
  git describe --long --tags --abbrev=7 | sed 's/^rshim-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd rshim-user-space
  patch -Np1 -i "$srcdir/fix-console-handling.patch"
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
