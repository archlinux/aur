# Maintainer: kpcyrd <git@rxv.cc>

pkgname=snail
pkgver=0.2.0
pkgrel=1
pkgdesc="Parasitic network manager"
url="https://github.com/kpcyrd/snail"
depends=('zeromq' 'libseccomp' 'dbus' 'dhcpcd')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('GPL3')
backup=('etc/snail/snail.conf')
source=("https://github.com/kpcyrd/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('fec3f804ebd09903d5469eacc5c8b4b8b0c395b615b812d0bddc5011e5a291dc1d24ca43cfa18afee52ce49253a43414a349997d7dc5efeb4b32cf95976ce8e6')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/snaild \
                 target/release/snailctl \
                 -t "$pkgdir/usr/bin"
  install -Dm644 scripts/* -t "$pkgdir/usr/lib/snaild/scripts"

  install -d "$pkgdir/etc/snail/scripts"
  install -Dm644 contrib/snail.conf -t "$pkgdir/etc/snail"
  install -Dm644 contrib/snail@.service -t "$pkgdir/usr/lib/systemd/system"

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 docs/snail.7 \
                 -t "$pkgdir/usr/share/man/man7"
  install -Dm644 docs/snaild.8 \
                 docs/snailctl.8 \
                 -t "$pkgdir/usr/share/man/man8"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
