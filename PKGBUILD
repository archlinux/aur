# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=routinator
pkgver=0.13.1
pkgrel=1
pkgdesc="RPKI validator written in Rust"
arch=('i686' 'x86_64')
url="https://nlnetlabs.nl/rpki"
license=('BSD-3-Clause')
depends=('rsync')
makedepends=('rust')
backup=('etc/routinator/routinator.conf')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/NLnetLabs/routinator/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bf88bf03c749ba98a653a45313008d4f88cc9920395662d789be2d0529dd7870')


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

  install -Dm644 "etc/routinator.conf.example" -t "$pkgdir/etc/routinator"
  install -Dm644 "etc/routinator.conf.system-service" "$pkgdir/etc/routinator/routinator.conf"
  install -Dm644 "pkg/common"/routinator{,-minimal}.routinator.service -t "$pkgdir/usr/lib/systemd/system"

  install -Dm644 "doc/routinator.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/routinator"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/routinator"
}
