# Maintainer: vaelixd <vaelixd@proton.me>
pkgname="flockosi-git"
pkgver=r6.ec69f14
pkgrel=1
pkgdesc="A flexible, configurable ISO builder inspired by mkosi"
arch=('x86_64')
url="https://codeberg.org/Songbird-Project/flockosi"
license=('BSD-3-Clause')
depends=(
  'mtools'
  'dosfstools'
  'squashfs-tools'
  'grub'
  'xorriso'
)
optdepends=(
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
source=("git+https://codeberg.org/Songbird-Project/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  zig build \
    -Doptimize=ReleaseFast \
    --prefix "$srcdir/${pkgname%-git}/install" \
    --cache-dir "$srcdir/${pkgname%-git}/.zig-cache" \
    --global-cache-dir "$srcdir/${pkgname%-git}/.zig-global-cache" \
    --summary all
}

package() {
  cd "$srcdir/${pkgname%-git}"

  install -Dm0755 "$srcdir/${pkgname%-git}/install/bin/flockosi" "$pkgdir/usr/bin/flockosi"

  install -d "$pkgdir/etc"
  cp -r "$srcdir/${pkgname%-git}/install/etc/flockosi" "$pkgdir/etc/flockosi"

  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
