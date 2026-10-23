# Maintainer: Rafael Escobar <rafael@paemuri.com>

pkgname=superhtml-git
pkgver=0.7.0.r17.gf0deee8
pkgrel=1
pkgdesc='HTML Language Server & Templating Language Library (git)'
arch=('x86_64' 'aarch64')
url='https://github.com/kristoff-it/superhtml'
license=('MIT')
provides=('superhtml')
conflicts=('superhtml' 'superhtml-bin')
makedepends=('git' 'zig')
# The release build is stripped by makepkg, so a debug package would be empty.
options=('!debug')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags --match '*.*.*' |
    sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  # Keeps Zig's package cache out of the home directory.
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-cache"
  # Zig fetches the packages pinned in build.zig.zon during the build.
  zig build -Doptimize=ReleaseFast -Dversion="$pkgver"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm0755 -s "zig-out/bin/superhtml" "$pkgdir/usr/bin/superhtml"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
