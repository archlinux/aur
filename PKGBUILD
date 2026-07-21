pkgname=synchrogit
pkgver=26.7.5
pkgrel=1
pkgdesc='Daemon that keeps git repositories synced with their remotes'
arch=('x86_64' 'aarch64')
url='https://github.com/partanskiy/synchrogit'
license=('GPL-3.0-or-later')
depends=('git')
makedepends=('cargo' 'lowdown')
source=("$pkgname-$pkgver.tar.gz::https://github.com/partanskiy/synchrogit/archive/refs/tags/v26.7.5.tar.gz")
sha256sums=('178ad0276c8cdab1d13deeae067026e83e3a3ef29b007f295401e20b6e941875')

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
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 packaging/systemd/synchrogit.service "$pkgdir/usr/lib/systemd/user/synchrogit.service"
  install -Dm644 packaging/config.example.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
}
