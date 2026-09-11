# Maintainer: Doridian <archlinux at doridian dot net>

pkgname=rshim
pkgver=2.8.5
pkgrel=1
pkgdesc="User-space RSHIM driver for Mellanox BlueField SoC"
arch=('x86_64' 'aarch64')
url="https://github.com/Mellanox/rshim-user-space"
license=('GPL-2.0-only OR BSD-3-Clause')
depends=('fuse2' 'gcc-libs' 'glibc' 'libusb' 'pciutils' 'perl' 'python' 'systemd-libs')
conflicts=('rshim-git')
backup=('etc/rshim.conf')
source=(
  "https://github.com/Mellanox/rshim-user-space/releases/download/rshim-${pkgver}/rshim-src-${pkgver}.tar.gz"
  'fix-console-handling.patch::https://github.com/Mellanox/rshim-user-space/pull/363.patch'
)
sha256sums=(
  '527bac1e2e1b60e9d499b8963c955ec78c51c9c65eb5d257adecb0877a717c33'
  '189588932529e550f09934c7f4908b08f302ff180186488cd9aa092f727f0716'
)

prepare() {
  cd "${srcdir}"
  patch -p1 -i "${srcdir}/fix-console-handling.patch"
  ./bootstrap.sh
}

# Thanks to https://aur.archlinux.org/packages/rshim-git for these below steps

build() {
  cd "${srcdir}"
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --with-systemdsystemunitdir=/usr/lib/systemd/system
  make
}

package() {
  cd "${srcdir}"
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
