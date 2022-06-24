# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=routinator-git
pkgver=0.11.2.r1.g3029722
pkgrel=1
pkgdesc="RPKI validator written in Rust"
arch=('i686' 'x86_64')
url="https://nlnetlabs.nl/rpki"
license=('BSD')
depends=('gcc-libs' 'rsync')
makedepends=('git' 'rust')
provides=("routinator=$pkgver")
conflicts=('routinator')
backup=('etc/routinator/routinator.conf')
source=("git+https://github.com/NLnetLabs/routinator.git")
sha256sums=('SKIP')


pkgver() {
  cd "routinator"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "routinator"

  cargo test \
    --release \
    --locked
}

package() {
  cd "routinator"

  cargo install \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path "$srcdir/routinator"

  install -Dm755 "pkg/common/routinator-init" -t "$pkgdir/usr/bin"
  install -Dm644 "etc/routinator.conf.example" -t "$pkgdir/etc/routinator"
  install -Dm644 "etc/routinator.conf.system-service" "$pkgdir/etc/routinator/routinator.conf"
  install -Dm644 "pkg/common"/routinator{,-minimal}.routinator.service -t "$pkgdir/usr/lib/systemd/system"

  install -Dm644 "doc/routinator.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/routinator"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/routinator"
}
