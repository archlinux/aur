# Maintainer: Helix128 <https://github.com/Helix128>
pkgname=lenovo-fanboost
pkgver=0.3.0
pkgrel=1
pkgdesc='Fan control and boost daemon for Lenovo laptops (DKMS)'
arch=('any')
url='https://github.com/Helix128/lenovo-fanboost'
license=('GPL-2.0-only')
depends=('python' 'dkms')
optdepends=(
  'clang: build module for clang-built kernels (CachyOS default)'
  'lld: needed with clang'
  'llvm: needed with clang'
  'gcc: build module for gcc-built kernels (Arch stock, LTS, Zen)'
  'linux-headers: headers for stock Arch kernel'
  'linux-lts-headers: headers for LTS kernel'
  'linux-zen-headers: headers for Zen kernel'
  'linux-cachyos-headers: headers for CachyOS kernel'
)
install=lenovo-fanboost.install
backup=('etc/lenovo-fanboost.toml')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c3f949c25fa443e09a786c55c83055e884ba188bbae4bf6aca1d3ac4955e65be')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "daemon/lenovo-fanboost"  "$pkgdir/usr/bin/lenovo-fanboost"
  install -Dm755 "daemon/lenovo-fanboostd" "$pkgdir/usr/lib/lenovo-fanboost/lenovo-fanboostd"
  install -Dm644 "systemd/lenovo-fanboost.service" \
    "$pkgdir/usr/lib/systemd/system/lenovo-fanboost.service"
  install -Dm644 "systemd/lenovo-fanboost.modules-load.conf" \
    "$pkgdir/usr/lib/modules-load.d/lenovo-fanboost.conf"
  install -Dm644 "systemd/lenovo-fanboost.toml" "$pkgdir/etc/lenovo-fanboost.toml"

  local d="$pkgdir/usr/src/$pkgname-$pkgver"
  install -Dm644 "kernel/lenovo_fanboost.c" "$d/lenovo_fanboost.c"
  install -Dm644 "kernel/dkms.conf"         "$d/dkms.conf"
  printf 'obj-m += lenovo_fanboost.o\n' > "$d/Makefile"
}
