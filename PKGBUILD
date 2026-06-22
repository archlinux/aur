# Maintainer: vaelixd <vaelixd@proton.me>
pkgname="flockosi-git"
pkgver=0.1.0
pkgrel=1
pkgdesc="A flexible, configurable ISO builder inspired by mkosi"
arch=('x86_64')
url="https://codeberg.org/Songbird-Project/flockosi"
license=('BSD-3-Clause')
depends=(
  'mtools'
  'dosfstools'
  'squashfstools'
  'grub'
  'xorriso'
)
optdepands=(
  'arch-install-scripts: For the Arch Linux preset'
  'debootstrap: For the Debian preset'
  'dnf: For the Fedora preset'
)
makedepends=(
  'zig'
  'git'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://codeberg.org/Songbird-Project/$pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long | sed 's/v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  zig build -Doptimize=ReleaseSafe
}

package() {
  cd "$srcdir/${pkgname%-git}"

  install -Dm0755 zig-out/bin/flockosi "$pkgdir/usr/bin/flockosi"
  cp -r zig-out/etc/flockosi "$pkdir/etc/flockosi"

  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
