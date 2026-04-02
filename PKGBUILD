# Maintainer: Pavel Olizko <contact@nolight.dev>
# Contributor: sleebu <contact@sleebu.dev>
pkgname=mf-cli
pkgver=0.2.3
pkgrel=1
pkgdesc="CLI tool and seamless kernel module for Arturia MiniFuse 1/2"
arch=('x86_64')
url="https://github.com/nolight132/mf-cli"
license=('MIT' 'GPL2')
depends=('glibc' 'gcc-libs' 'libusb' 'systemd-libs' 'dkms')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  # 1. Install userspace binaries, rules, and licenses
  install -Dm755 "target/release/mf-cli" "$pkgdir/usr/bin/mf-cli"
  install -Dm644 "99-minifuse.rules" "$pkgdir/usr/lib/udev/rules.d/99-minifuse.rules"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # 2. Install the DKMS kernel module source
  local dkms_dir="$pkgdir/usr/src/minifuse_mod-$pkgver"
  install -dm755 "$dkms_dir"

  install -Dm644 kmod/minifuse_mod.c "$dkms_dir/minifuse_mod.c"
  install -Dm644 kmod/Makefile "$dkms_dir/Makefile"
  install -Dm644 kmod/dkms.conf "$dkms_dir/dkms.conf"

  # 3. Automatically update the version in dkms.conf to match pkgver
  sed -i "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"$pkgver\"/" "$dkms_dir/dkms.conf"

  # 4. Install the modules-load.d entry for the DKMS module
  echo "minifuse_mod" | install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
}
