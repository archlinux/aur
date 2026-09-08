pkgname=synchrogit
pkgver=26.9.3
pkgrel=1
pkgdesc='Daemon that keeps git repositories synced with their remotes'
arch=('x86_64' 'aarch64')
url='https://github.com/partanskiy/synchrogit'
license=('MIT')
depends=('git')
makedepends=('cargo' 'lowdown' 'perl')
# Rust enables its own LTO. GCC LTO objects from vendored C libraries cannot
# be linked by Rust's lld, so disable makepkg's additional cross-language LTO.
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/partanskiy/synchrogit/archive/refs/tags/v26.9.3.tar.gz")
sha256sums=('e49181124940b0c15fe5b94c0d495aad2c561b363a1e2c8c7de7ecc0efd199c2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --locked --release
  lowdown -s -Tman docs/synchrogit.1.md -o synchrogit.1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/synchrogit "$pkgdir/usr/bin/synchrogit"
  install -Dm644 synchrogit.1 "$pkgdir/usr/share/man/man1/synchrogit.1"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 THIRD_PARTY_LICENSES.html "$pkgdir/usr/share/doc/$pkgname/THIRD_PARTY_LICENSES.html"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 packaging/systemd/synchrogit.service "$pkgdir/usr/lib/systemd/user/synchrogit.service"
  install -Dm644 packaging/systemd/synchrogit@.service "$pkgdir/usr/lib/systemd/system/synchrogit@.service"
  install -Dm644 packaging/config.example.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
}
