# Maintainer: Francesco Minnocci <ad17fmin@uwcad.it>

pkgname=jellyfin-tui-git
pkgver=1.6.0
pkgrel=1
pkgdesc='Music streaming TUI client for Jellyfin'
arch=('x86_64')
url="https://github.com/dhonus/jellyfin-tui"
license=('GPL-3.0-only')
depends=('openssl' 'mpv' 'gcc-libs' 'glibc' 'sqlite')
makedepends=('cargo' 'pkgconf' 'sqlite' 'git')
provides=('jellyfin-tui')
conflicts=('jellyfin-tui')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')
options=('!lto')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 2>/dev/null |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf '0.0.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$pkgname"
  cargo fetch --locked
}

build() {
  cd "$pkgname"
  export CARGO_TARGET_DIR=target
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  export PKG_CONFIG_ALLOW_CROSS=1
  cargo build --release --locked --offline
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/jellyfin-tui "$pkgdir/usr/bin/jellyfin-tui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
# vim:set ts=2 sw=2 et:
