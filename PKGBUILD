# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=routinator
pkgver=0.12.2
pkgrel=1
pkgdesc="RPKI validator written in Rust"
arch=('i686' 'x86_64')
url="https://nlnetlabs.nl/rpki"
license=('BSD')
depends=('rsync')
makedepends=('rust')
backup=('etc/routinator/routinator.conf')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/NLnetLabs/routinator/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5cc9c4aa4524bcde205c97c373e941db812675dc73dc42807c15aeb8bfbde22b')


prepare() {
  cd "$pkgname-$pkgver"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

check() {
  cd "$pkgname-$pkgver"

  #cargo test \
  #  --frozen
}

package() {
  cd "$pkgname-$pkgver"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path "$srcdir/$pkgname-$pkgver"

  install -Dm755 "pkg/common/routinator-init" -t "$pkgdir/usr/bin"
  install -Dm644 "etc/routinator.conf.example" -t "$pkgdir/etc/routinator"
  install -Dm644 "etc/routinator.conf.system-service" "$pkgdir/etc/routinator/routinator.conf"
  install -Dm644 "pkg/common"/routinator{,-minimal}.routinator.service -t "$pkgdir/usr/lib/systemd/system"

  install -Dm644 "doc/routinator.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/routinator"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/routinator"
}
