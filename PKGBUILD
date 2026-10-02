# Maintainer: debpalash <4178343+debpalash@users.noreply.github.com>
pkgname=zig-bypassdpi-git
_pkgname=zig-bypassdpi
pkgver=r2.4fad7f6
pkgrel=1
pkgdesc='Cross-platform userspace DPI-bypass SOCKS5/HTTP proxy written in Zig'
arch=('x86_64' 'aarch64')
url='https://github.com/debpalash/zig-bypassdpi'
license=('MIT')
makedepends=('git' 'zig>=0.16')
options=('!debug')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  zig build \
    --prefix "$srcdir/install" \
    --cache-dir "$srcdir/zig-cache" \
    --global-cache-dir "$srcdir/zig-global-cache" \
    -Doptimize=ReleaseSafe \
    -Dcpu=baseline
}

check() {
  cd "$_pkgname"
  zig build test \
    --cache-dir "$srcdir/zig-cache" \
    --global-cache-dir "$srcdir/zig-global-cache"
}

package() {
  install -Dm755 "$srcdir/install/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  cd "$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
