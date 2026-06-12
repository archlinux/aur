# Maintainer: Luytan <luytan@khora.me>
# Please someone maintain this and make a better one, i do not use Arch!!!btw
_pkgname=cardwire
pkgname="${_pkgname}-git"
pkgver=r326.e6680c0
pkgrel=1
pkgdesc='GPU manager for Linux using eBPF LSM hooks'
arch=('x86_64')
url='https://github.com/OpenGamingCollective/cardwire'
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'dbus' 'hwdata')
makedepends=('git' 'cargo' 'clang' 'libbpf')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  cargo fetch --locked
}

build() {
  cd "$srcdir/$_pkgname"
  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release --workspace --bins
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 target/release/cardwire "$pkgdir/usr/bin/cardwire"
  install -Dm755 target/release/cardwired "$pkgdir/usr/bin/cardwired"

  install -Dm644 assets/cardwired.service \
    "$pkgdir/usr/lib/systemd/system/cardwired.service"
  install -Dm644 assets/com.github.opengamingcollective.cardwire.conf \
    "$pkgdir/usr/share/dbus-1/system.d/com.github.opengamingcollective.cardwire.conf"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
